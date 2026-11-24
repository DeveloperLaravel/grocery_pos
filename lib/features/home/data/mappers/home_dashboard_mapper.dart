
import '../../../../core/database/app_database.dart';
import '../../domain/entities/home_dashboard.dart';
import '../../domain/entities/recent_sale.dart';
import '../../domain/entities/low_stock_product.dart';

import '../models/home_dashboard_model.dart';
import '../models/recent_sale_model.dart';
import '../models/low_stock_product_model.dart';


class HomeDashboardMapper {
  const HomeDashboardMapper._();

  // --------------------------------------------------
  // Database Sale -> RecentSaleModel
  // --------------------------------------------------

  static RecentSaleModel saleToModel(SaleDb sale) {
    return RecentSaleModel(
      id: sale.id,
      invoiceNumber: sale.invoiceNumber,
      total: sale.totalAmount,
      paidAmount: sale.paidAmount,
      paymentMethod: sale.paymentMethod,
      createdAt: sale.createdAt,
    );
  }

  // --------------------------------------------------
  // Database Product -> LowStockProductModel
  // --------------------------------------------------

  static LowStockProductModel productToModel(ProductDb product) {
    return LowStockProductModel(
      id: product.id,
      name: product.name,
      barcode: product.barcode  ?? '',
      quantity: product.quantity,
      minStock: product.minStock,
      salePrice: product.salePrice,
    );
  }

  // --------------------------------------------------
  // HomeDashboardModel -> HomeDashboard Entity
  // --------------------------------------------------

  static HomeDashboard toEntity(HomeDashboardModel model) {
    return HomeDashboard(
      productsCount: model.productsCount,
      todaySalesCount: model.todaySalesCount,
      todaySalesTotal: model.todaySalesTotal,
      lowStockCount: model.lowStockCount,

      recentSales: model.recentSales
          .map(_recentSaleToEntity)
          .toList(growable: false),

      lowStockProducts: model.lowStockProducts
          .map(_lowStockProductToEntity)
          .toList(growable: false),
    );
  }

  // --------------------------------------------------
  // RecentSaleModel -> RecentSale Entity
  // --------------------------------------------------

  static RecentSale _recentSaleToEntity(
    RecentSaleModel model,
  ) {
    return RecentSale(
      id: model.id,
      invoiceNumber: model.invoiceNumber,
      total: model.total,
      paidAmount: model.paidAmount,
      paymentMethod: model.paymentMethod,
      createdAt: model.createdAt,
    );
  }

  // --------------------------------------------------
  // LowStockProductModel -> LowStockProduct Entity
  // --------------------------------------------------

  static LowStockProduct _lowStockProductToEntity(
    LowStockProductModel model,
  ) {
    return LowStockProduct(
      id: model.id,
      name: model.name,
      barcode: model.barcode,
      quantity: model.quantity,
      minStock: model.minStock,
      salePrice: model.salePrice,
    );
  }
}
