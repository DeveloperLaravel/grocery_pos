import 'package:injectable/injectable.dart';

import '../../../../core/database/daos/sales_dao.dart';

import '../../domain/entities/cart_item.dart';

import '../mappers/sale_item_mapper.dart';
import '../mappers/sale_mapper.dart';

import '../models/sale_model.dart';

import 'sales_local_data_source.dart';

@LazySingleton(as: SalesLocalDataSource)
class SalesLocalDataSourceImpl
    implements SalesLocalDataSource {
  final SalesDao _salesDao;

  SalesLocalDataSourceImpl(this._salesDao);

  String _generateInvoiceNumber() {
    final now = DateTime.now();

    return 'INV-${now.microsecondsSinceEpoch}';
  }

  /// إنشاء فاتورة.
  @override
  Future<SaleModel> createSale({
    required List<CartItem> items,
    required double discount,
    required double paidAmount,
    required String paymentMethod,
  }) async {
    if (items.isEmpty) {
      throw ArgumentError('أضف منتجاً واحداً على الأقل.');
    }

    // تجميع الكميات إذا تكرر المنتج في السلة.
    final quantities = <int, double>{};

    for (final item in items) {
      if (item.productId <= 0 || item.quantity <= 0) {
        throw ArgumentError('بيانات المنتج أو الكمية غير صالحة.');
      }

      quantities.update(
        item.productId,
        (oldQuantity) => oldQuantity + item.quantity,
        ifAbsent: () => item.quantity,
      );
    }

    final invoiceNumber = _generateInvoiceNumber();

    final saleId = await _salesDao.createSale(
      invoiceNumber: invoiceNumber,
      quantities: quantities,
      discount: discount,
      paidAmount: paidAmount,
      paymentMethod: paymentMethod,
    );

    final sale = await getSaleDetails(saleId);

    if (sale == null) {
      throw StateError('تم إنشاء الفاتورة ولكن تعذر استرجاعها.');
    }

    return sale;
  }
@override
Future<bool> cancelSale(int saleId) {
  return _salesDao.cancelSale(saleId);
}
  /// جلب الفواتير.
  @override
  Future<List<SaleModel>> getSales({
    int limit = 100,
  }) async {
    final sales = await _salesDao.getAllSales(limit: limit);

    final result = <SaleModel>[];

    for (final saleDb in sales) {
      final itemRows = await _salesDao.getSaleItems(saleDb.id);

      final itemModels = itemRows
          .map(SaleItemMapper.fromDb)
          .toList();

      result.add(
        SaleMapper.fromDb(
          saleDb,
          items: itemModels,
        ),
      );
    }

    return result;
  }

  /// جلب تفاصيل فاتورة واحدة.
  @override
  Future<SaleModel?> getSaleDetails(int saleId) async {
    if (saleId <= 0) return null;

    final saleDb = await _salesDao.getSaleById(saleId);

    if (saleDb == null) return null;

    final itemRows = await _salesDao.getSaleItems(saleId);

    final itemModels = itemRows
        .map(SaleItemMapper.fromDb)
        .toList();

    return SaleMapper.fromDb(
      saleDb,
      items: itemModels,
    );
  }

  /// مراقبة الفواتير.
  @override
  Stream<List<SaleModel>> watchSales({
    int limit = 100,
  }) {
    return _salesDao.watchSales(limit: limit).asyncMap(
      (sales) async {
        final result = <SaleModel>[];

        for (final saleDb in sales) {
          final itemRows = await _salesDao.getSaleItems(saleDb.id);

          final itemModels = itemRows
              .map(SaleItemMapper.fromDb)
              .toList();

          result.add(
            SaleMapper.fromDb(
              saleDb,
              items: itemModels,
            ),
          );
        }

        return result;
      },
    );
  }
}