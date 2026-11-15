
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dashboard_model.freezed.dart';

@freezed
abstract class HomeDashboardModel with _$HomeDashboardModel {
  const factory HomeDashboardModel({
    @Default(0) int productsCount,
    @Default(0) int todaySalesCount,
    @Default(0.0) double todaySalesTotal,
    @Default(0) int lowStockCount,
    @Default([]) List<HomeSaleModel> recentSales,
    @Default([]) List<HomeLowStockProductModel> lowStockProducts,
  }) = _HomeDashboardModel;
}

@freezed
abstract class HomeSaleModel with _$HomeSaleModel {
  const factory HomeSaleModel({
    required int id,
    required String invoiceNumber,
    required double total,
    required double paidAmount,
    required String paymentMethod,
    required DateTime createdAt,
  }) = _HomeSaleModel;
}

@freezed
abstract class HomeLowStockProductModel
    with _$HomeLowStockProductModel {
  const factory HomeLowStockProductModel({
    required int id,
    required String name,
    required String barcode,
    required double quantity,
    required double minStock,
    required double salePrice,
  }) = _HomeLowStockProductModel;
}
