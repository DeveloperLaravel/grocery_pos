
import 'package:drift/drift.dart';

import '../../../app_database.dart';

import '../../../tables/master_data/products/products_table.dart';
import '../../../tables/master_data/products/product_units_table.dart';

import '../../../tables/sales_inventory/sales/sales_table.dart';
import '../../../tables/sales_inventory/sales/sale_items_table.dart';
import '../../../tables/sales_inventory/sales/sale_payments_table.dart';

import '../../../tables/sales_inventory/inventory/stock_movements_table.dart';

part 'checkout_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    ProductUnits,
    Sales,
    SaleItems,
    SalePayments,
    StockMovements,
  ],
)
class CheckoutDao extends DatabaseAccessor<AppDatabase>
    with _$CheckoutDaoMixin {
  CheckoutDao(super.db);

  static const double _epsilon = 0.000001;

  // =========================================================
  // COMPLETE SALE
  // =========================================================

  Future<int> completeSale({
    required SalesCompanion sale,
    required List<SaleItemsCompanion> items,
    required List<SalePaymentsCompanion> payments,
  }) async {
    return attachedDatabase.transaction(() async {
      // 1. Validate checkout.
      _validateCheckout(
        sale: sale,
        items: items,
        payments: payments,
      );

      // 2. Calculate payments.
      final paidAmount = _normalizeMoney(
        payments.fold<double>(
          0,
          (sum, payment) => sum + payment.amount.value,
        ),
      );

      final totalAmount = sale.totalAmount.value;

      final remainingAmount = _normalizeMoney(
        totalAmount - paidAmount,
      );

      // 3. Calculate payment status.
      final paymentStatus = _getPaymentStatus(
        paidAmount: paidAmount,
        remainingAmount: remainingAmount,
      );

      final paymentMethod = _getPaymentMethod(
        payments: payments,
        remainingAmount: remainingAmount,
      );

      // 4. Validate products and units.
      final preparedItems = await _prepareItems(items);

      // 5. Group quantities by product.
      final requiredQuantities = <int, double>{};

      for (final item in preparedItems) {
        requiredQuantities.update(
          item.productId,
          (value) => value + item.baseQuantity,
          ifAbsent: () => item.baseQuantity,
        );
      }

      // 6. Load and validate products.
      final productBalances = <int, double>{};
      final productCosts = <int, double>{};

      for (final entry in requiredQuantities.entries) {
        final product = await (select(products)
              ..where((t) => t.id.equals(entry.key))
              ..where((t) => t.isActive.equals(true)))
            .getSingleOrNull();

        if (product == null) {
          throw StateError(
            'المنتج غير موجود أو غير نشط: ${entry.key}',
          );
        }

        if (product.quantity + _epsilon < entry.value) {
          throw StateError(
            'المخزون غير كافٍ للمنتج: ${product.name}. '
            'المتوفر: ${product.quantity}، '
            'المطلوب: ${entry.value}',
          );
        }

        productBalances[entry.key] = product.quantity;
        productCosts[entry.key] = product.costPrice;
      }

      final now = DateTime.now();

      // 7. Insert invoice.
      final saleId = await into(sales).insert(
        sale.copyWith(
          id: const Value.absent(),
          paidAmount: Value(paidAmount),
          remainingAmount: Value(remainingAmount),
          paymentStatus: Value(paymentStatus),
          paymentMethod: Value(paymentMethod),
          updatedAt: Value(now),
        ),
      );

      // 8. Insert sale items and keep their IDs.
      final insertedItems = <_PreparedSaleItem>[];

      for (final prepared in preparedItems) {
        final itemId = await into(saleItems).insert(
          prepared.item.copyWith(
            id: const Value.absent(),
            saleId: Value(saleId),
          ),
        );

        insertedItems.add(
          prepared.copyWith(insertedItemId: itemId),
        );
      }

      // 9. Insert payments.
      for (final payment in payments) {
        await into(salePayments).insert(
          payment.copyWith(
            id: const Value.absent(),
            saleId: Value(saleId),
          ),
        );
      }

      // 10. Update inventory and insert stock movements.
      final remainingBalances = Map<int, double>.from(
        productBalances,
      );

      for (final prepared in insertedItems) {
        final productId = prepared.productId;

        final previousQuantity = remainingBalances[productId]!;

        final newQuantity = _normalizeQuantity(
          previousQuantity - prepared.baseQuantity,
        );

        final unitCost = productCosts[productId]!;

        final totalCost = _normalizeMoney(
          prepared.baseQuantity * unitCost,
        );

        // Record stock movement.
        await into(stockMovements).insert(
          StockMovementsCompanion.insert(
            productId: productId,
            storeId: sale.storeId.value,
            movementType: 'sale',
            referenceType: 'sale',
            referenceId: saleId,
            referenceItemId: Value(
              prepared.insertedItemId,
            ),
            quantityIn: const Value(0),
            quantityOut: Value(
              prepared.baseQuantity,
            ),
            balanceAfter: newQuantity,
            unitCost: Value(unitCost),
            totalCost: Value(totalCost),
            notes: Value(
              'بيع فاتورة رقم ${sale.invoiceNumber.value}',
            ),
            createdBy: Value(
              sale.createdBy.present
                  ? sale.createdBy.value
                  : null,
            ),
            movementDate: sale.saleDate.present
                ? sale.saleDate.value
                : now,
          ),
        );

        remainingBalances[productId] = newQuantity;
      }

      // 11. Update each product once.
      for (final entry in remainingBalances.entries) {
        await (update(products)
              ..where((t) => t.id.equals(entry.key)))
            .write(
          ProductsCompanion(
            quantity: Value(entry.value),
            updatedAt: Value(now),
          ),
        );
      }

      return saleId;
    });
  }

  // =========================================================
  // VALIDATION
  // =========================================================

  void _validateCheckout({
    required SalesCompanion sale,
    required List<SaleItemsCompanion> items,
    required List<SalePaymentsCompanion> payments,
  }) {
    if (!sale.invoiceNumber.present ||
        sale.invoiceNumber.value.trim().isEmpty) {
      throw ArgumentError('رقم الفاتورة مطلوب');
    }

    if (!sale.storeId.present ||
        sale.storeId.value <= 0) {
      throw ArgumentError('المتجر مطلوب');
    }

    if (!sale.totalAmount.present ||
        sale.totalAmount.value <= 0) {
      throw ArgumentError('إجمالي الفاتورة غير صحيح');
    }

    if (!sale.subtotal.present ||
        sale.subtotal.value < 0) {
      throw ArgumentError('الإجمالي الفرعي غير صحيح');
    }

    if (!sale.discountAmount.present ||
        sale.discountAmount.value < 0) {
      throw ArgumentError('قيمة الخصم غير صحيحة');
    }

    if (!sale.taxAmount.present ||
        sale.taxAmount.value < 0) {
      throw ArgumentError('قيمة الضريبة غير صحيحة');
    }

    if (sale.discountAmount.value >
        sale.subtotal.value + _epsilon) {
      throw ArgumentError('الخصم أكبر من الإجمالي الفرعي');
    }

    if (items.isEmpty) {
      throw ArgumentError(
        'يجب إضافة منتج واحد على الأقل',
      );
    }

    final expectedTotal = _normalizeMoney(
      sale.subtotal.value -
          sale.discountAmount.value +
          sale.taxAmount.value,
    );

    if ((expectedTotal - sale.totalAmount.value).abs() >
        _epsilon) {
      throw ArgumentError(
        'إجماليات الفاتورة غير متطابقة',
      );
    }

    for (final item in items) {
      _validateSaleItem(item);
    }

    for (final payment in payments) {
      _validatePayment(payment);
    }

    final paidAmount = payments.fold<double>(
      0,
      (sum, payment) => sum + payment.amount.value,
    );

    if (paidAmount > sale.totalAmount.value + _epsilon) {
      throw ArgumentError(
        'مجموع الدفعات أكبر من إجمالي الفاتورة',
      );
    }
  }

  void _validateSaleItem(SaleItemsCompanion item) {
    if (!item.productId.present ||
        item.productId.value <= 0) {
      throw ArgumentError('المنتج غير صالح');
    }

    if (!item.productName.present ||
        item.productName.value.trim().isEmpty) {
      throw ArgumentError('اسم المنتج مطلوب');
    }

    if (!item.unitName.present ||
        item.unitName.value.trim().isEmpty) {
      throw ArgumentError('اسم وحدة البيع مطلوب');
    }

    if (!item.quantity.present ||
        !item.quantity.value.isFinite ||
        item.quantity.value <= 0) {
      throw ArgumentError(
        'كمية المنتج يجب أن تكون أكبر من صفر',
      );
    }

    if (!item.conversionFactor.present ||
        !item.conversionFactor.value.isFinite ||
        item.conversionFactor.value <= 0) {
      throw ArgumentError(
        'معامل تحويل الوحدة غير صحيح',
      );
    }

    if (!item.baseQuantity.present ||
        !item.baseQuantity.value.isFinite ||
        item.baseQuantity.value <= 0) {
      throw ArgumentError(
        'الكمية الأساسية غير صحيحة',
      );
    }

    if (!item.unitPrice.present ||
        !item.unitPrice.value.isFinite ||
        item.unitPrice.value < 0) {
      throw ArgumentError('سعر المنتج غير صحيح');
    }

    if (!item.totalAmount.present ||
        !item.totalAmount.value.isFinite ||
        item.totalAmount.value < 0) {
      throw ArgumentError(
        'إجمالي عنصر الفاتورة غير صحيح',
      );
    }

    if (item.discountAmount.present &&
        item.discountAmount.value < 0) {
      throw ArgumentError('خصم المنتج غير صحيح');
    }

    if (item.taxAmount.present &&
        item.taxAmount.value < 0) {
      throw ArgumentError('ضريبة المنتج غير صحيحة');
    }

    if (item.taxRate.present &&
        item.taxRate.value < 0) {
      throw ArgumentError('نسبة الضريبة غير صحيحة');
    }

    final expectedBaseQuantity =
        item.quantity.value * item.conversionFactor.value;

    if ((expectedBaseQuantity - item.baseQuantity.value)
            .abs() >
        _epsilon) {
      throw ArgumentError(
        'الكمية الأساسية لا تتوافق مع معامل التحويل',
      );
    }
  }

  void _validatePayment(SalePaymentsCompanion payment) {
    if (!payment.amount.present ||
        !payment.amount.value.isFinite ||
        payment.amount.value <= 0) {
      throw ArgumentError(
        'مبلغ الدفعة يجب أن يكون أكبر من صفر',
      );
    }

    if (!payment.paymentMethod.present) {
      throw ArgumentError('طريقة الدفع مطلوبة');
    }

    const allowedMethods = {
      'cash',
      'card',
      'bank_transfer',
      'mobile_wallet',
    };

    if (!allowedMethods.contains(
      payment.paymentMethod.value,
    )) {
      throw ArgumentError(
        'طريقة الدفع غير مدعومة',
      );
    }
  }

  // =========================================================
  // PREPARE ITEMS
  // =========================================================

  Future<List<_PreparedSaleItem>> _prepareItems(
    List<SaleItemsCompanion> items,
  ) async {
    final result = <_PreparedSaleItem>[];

    for (final item in items) {
      final productId = item.productId.value;

      final product = await (select(products)
            ..where((t) => t.id.equals(productId))
            ..where((t) => t.isActive.equals(true)))
          .getSingleOrNull();

      if (product == null) {
        throw StateError(
          'المنتج غير موجود أو غير نشط: $productId',
        );
      }

      final productUnitId = item.productUnitId.present
          ? item.productUnitId.value
          : null;

      if (productUnitId != null) {
        final unit = await (select(productUnits)
              ..where((t) => t.id.equals(productUnitId))
              ..where((t) => t.productId.equals(productId))
              ..where((t) => t.isActive.equals(true)))
            .getSingleOrNull();

        if (unit == null) {
          throw StateError(
            'وحدة البيع غير موجودة أو غير نشطة',
          );
        }

        if ((unit.conversionFactor -
                    item.conversionFactor.value)
                .abs() >
            _epsilon) {
          throw StateError(
            'معامل تحويل الوحدة تغير، يرجى تحديث السلة',
          );
        }

        // Correct database column name is name.
        if (unit.name != item.unitName.value) {
          throw StateError(
            'اسم وحدة البيع لا يتوافق مع الوحدة المحددة',
          );
        }
      } else {
        if ((item.conversionFactor.value - 1).abs() >
            _epsilon) {
          throw StateError(
            'معامل تحويل الوحدة الأساسية يجب أن يساوي 1',
          );
        }

        if (product.baseUnit != item.unitName.value) {
          throw StateError(
            'وحدة البيع الأساسية غير صحيحة',
          );
        }
      }

      result.add(
        _PreparedSaleItem(
          item: item,
          productId: productId,
          productUnitId: productUnitId,
          baseQuantity: item.baseQuantity.value,
        ),
      );
    }

    return result;
  }

  // =========================================================
  // PAYMENT STATUS
  // =========================================================

  String _getPaymentStatus({
    required double paidAmount,
    required double remainingAmount,
  }) {
    if (remainingAmount <= _epsilon) {
      return 'paid';
    }

    if (paidAmount > _epsilon) {
      return 'partially_paid';
    }

    return 'unpaid';
  }

  // =========================================================
  // PAYMENT METHOD
  // =========================================================

  String _getPaymentMethod({
    required List<SalePaymentsCompanion> payments,
    required double remainingAmount,
  }) {
    if (remainingAmount > _epsilon) {
      return 'credit';
    }

    if (payments.isEmpty) {
      return 'credit';
    }

    final methods = payments
        .map((payment) => payment.paymentMethod.value)
        .toSet();

    if (methods.length > 1) {
      return 'mixed';
    }

    return methods.first;
  }

  // =========================================================
  // HELPERS
  // =========================================================

  double _normalizeMoney(double value) {
    if (value.abs() < _epsilon) {
      return 0;
    }

    return double.parse(value.toStringAsFixed(2));
  }

  double _normalizeQuantity(double value) {
    if (value.abs() < _epsilon) {
      return 0;
    }

    return value;
  }
}

// =========================================================
// INTERNAL PREPARED ITEM
// =========================================================

class _PreparedSaleItem {
  final SaleItemsCompanion item;

  final int productId;

  final int? productUnitId;

  final double baseQuantity;

  final int? insertedItemId;

  const _PreparedSaleItem({
    required this.item,
    required this.productId,
    required this.productUnitId,
    required this.baseQuantity,
    this.insertedItemId,
  });

  _PreparedSaleItem copyWith({
    int? insertedItemId,
  }) {
    return _PreparedSaleItem(
      item: item,
      productId: productId,
      productUnitId: productUnitId,
      baseQuantity: baseQuantity,
      insertedItemId: insertedItemId ?? this.insertedItemId,
    );
  }
}
