
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dashboard.freezed.dart';

@freezed
abstract class HomeDashboard with _$HomeDashboard {
  const factory HomeDashboard({
    @Default(0) int productsCount,
    @Default(0) int todaySalesCount,
    @Default(0.0) double todaySalesTotal,
    @Default(0) int lowStockCount,
    @Default([]) List<HomeSale> recentSales,
    @Default([]) List<HomeLowStockProduct> lowStockProducts,
  }) = _HomeDashboard;
}

@freezed
abstract class HomeSale with _$HomeSale {
  const factory HomeSale({
    required int id,
    required String invoiceNumber,
    required double total,
    required double paidAmount,
    required String paymentMethod,
    required DateTime createdAt,
  }) = _HomeSale;
}

@freezed
abstract class HomeLowStockProduct
    with _$HomeLowStockProduct {
  const factory HomeLowStockProduct({
    required int id,
    required String name,
    required String barcode,
    required double quantity,
    required double minStock,
    required double salePrice,
  }) = _HomeLowStockProduct;
}
