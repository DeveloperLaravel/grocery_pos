
import 'package:freezed_annotation/freezed_annotation.dart';

import 'low_stock_product_model.dart';
import 'recent_sale_model.dart';

part 'home_dashboard_model.freezed.dart';

@freezed
abstract class HomeDashboardModel with _$HomeDashboardModel {
  const factory HomeDashboardModel({
    @Default(0) int productsCount,
    @Default(0) int todaySalesCount,
    @Default(0.0) double todaySalesTotal,
    @Default(0) int lowStockCount,
    @Default([]) List<RecentSaleModel> recentSales,
    @Default([]) List<LowStockProductModel> lowStockProducts,
  }) = _HomeDashboardModel;
}

