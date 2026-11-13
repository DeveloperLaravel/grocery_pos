
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';

import '../../domain/entities/cart_item.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/sale_receipt.dart';
import '../../domain/repositories/pos_repository.dart';


import '../database/pos_local_data_source.dart';
import '../models/checkout_item_model.dart';

import '../mappers/product_mapper.dart';
import '../mappers/sale_mapper.dart';

@LazySingleton(as: PosRepository)
class PosRepositoryImpl implements PosRepository {
  final PosLocalDataSource _localDataSource;

  PosRepositoryImpl(this._localDataSource);

  // ==================================================
  // Products
  // ==================================================

  @override
  TaskEither<Failure, List<ProductEntity>> getProducts({
    String query = '',
  }) {
    return _guard(() async {
      final products = await _localDataSource.getProducts(
        query: query,
      );

      return products
          .map((product) => product.toEntity())
          .toList();
    });
  }

  @override
  TaskEither<Failure, ProductEntity?> getProductByBarcode(
    String barcode,
  ) {
    return _guard(() async {
      final product =
          await _localDataSource.getProductByBarcode(barcode);

      return product?.toEntity();
    });
  }

  @override
  TaskEither<Failure, ProductEntity?> getProductById(int id) {
    return _guard(() async {
      final product =
          await _localDataSource.getProductById(id);

      return product?.toEntity();
    });
  }

  @override
  TaskEither<Failure, ProductEntity> addProduct(
    ProductEntity product,
  ) {
    return _guard(() async {
      final productId = await _localDataSource.addProduct(
        product.toCompanion(),
      );

      final savedProduct =
          await _localDataSource.getProductById(productId);

      if (savedProduct == null) {
        throw StateError(
          'تعذر جلب المنتج بعد إضافته',
        );
      }

      return savedProduct.toEntity();
    });
  }

  @override
  TaskEither<Failure, ProductEntity> updateProduct({
    required int id,
    required ProductEntity product,
  }) {
    return _guard(() async {
      if (id <= 0) {
        throw ArgumentError('معرف المنتج غير صالح');
      }

      if (product.id != null && product.id != id) {
        throw ArgumentError(
          'معرف المنتج لا يطابق معرف التحديث',
        );
      }

      final updated = await _localDataSource.updateProduct(
        id: id,
        product: product.toCompanion(),
      );

      if (!updated) {
        throw StateError('المنتج غير موجود');
      }

      final savedProduct =
          await _localDataSource.getProductById(id);

      if (savedProduct == null) {
        throw StateError(
          'تعذر جلب المنتج بعد التحديث',
        );
      }

      return savedProduct.toEntity();
    });
  }

  @override
  TaskEither<Failure, Unit> deleteProduct(int id) {
    return _guard(() async {
      final deleted = await _localDataSource.deleteProduct(id);

      if (!deleted) {
        throw StateError('المنتج غير موجود');
      }

      return unit;
    });
  }

  // ==================================================
  // Stock
  // ==================================================

  @override
  TaskEither<Failure, Unit> adjustStock({
    required int productId,
    required double delta,
    required String note,
  }) {
    return _guard(() async {
      await _localDataSource.adjustStock(
        productId: productId,
        delta: delta,
        note: note,
      );

      return unit;
    });
  }

  // ==================================================
  // Checkout
  // ==================================================

  @override
  TaskEither<Failure, SaleReceipt> checkout({
    required List<CartItem> items,
    required double discount,
    required double paid,
    required String paymentMethod,
  }) {
    return _guard(() async {
      if (items.isEmpty) {
        throw StateError('السلة فارغة');
      }

      // تحويل عناصر السلة إلى CheckoutItemModel.
      final checkoutItems = items.map((item) {
        final productId = item.product.id;

        if (productId == null || productId <= 0) {
          throw StateError(
            'أحد المنتجات لا يحتوي على معرف صالح',
          );
        }

        return CheckoutItemModel(
          productId: productId,
          quantity: item.quantity,
        );
      }).toList();

      // تنفيذ البيع داخل قاعدة البيانات.
      final saleId = await _localDataSource.checkout(
        items: checkoutItems,
        discount: discount,
        paid: paid,
        paymentMethod: paymentMethod,
      );

      // جلب الفاتورة بعد حفظها.
      final sale = await _localDataSource.getSaleById(saleId);

      if (sale == null) {
        throw StateError(
          'تعذر جلب الفاتورة بعد إتمام البيع',
        );
      }

      // جلب تفاصيل الفاتورة.
      final saleItems =
          await _localDataSource.getSaleItems(saleId);

      // تحويل SaleDb + SaleItemDb إلى SaleReceipt.
      return sale.toReceipt(
        items: saleItems,
      );
    });
  }

  // ==================================================
  // Returns
  // ==================================================

  @override
  TaskEither<Failure, Unit> returnSaleItem({
    required int saleId,
    required int productId,
    required double quantity,
    required double refundAmount,
  }) {
    return _guard(() async {
      await _localDataSource.returnSaleItem(
        saleId: saleId,
        productId: productId,
        quantity: quantity,
        refundAmount: refundAmount,
      );

      return unit;
    });
  }

  // ==================================================
  // Error Handling
  // ==================================================

  TaskEither<Failure, T> _guard<T>(
    Future<T> Function() action,
  ) {
    return TaskEither.tryCatch(
      action,
      (error, stackTrace) {
        if (error is ArgumentError) {
          return ValidationFailure(
            error.toString(),
          );
        }

        if (error is StateError) {
          return ValidationFailure(
            error.message.toString(),
          );
        }

        return UnknownFailure(
          error.toString(),
        );
      },
    );
  }
}
