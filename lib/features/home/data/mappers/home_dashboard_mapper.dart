
import '../../domain/entities/home_dashboard.dart';
import '../models/home_dashboard_model.dart';

import '../../../../core/database/app_database.dart';

class HomeDashboardMapper {
  const HomeDashboardMapper._();

  // SaleDb -> HomeSaleModel
  static HomeSaleModel saleToModel(SaleDb db) {
    return HomeSaleModel(
      id: db.id,
      invoiceNumber: db.invoiceNumber,
      total: db.total,
      paidAmount: db.paidAmount,
      paymentMethod: db.paymentMethod,
      createdAt: db.createdAt,
    );
  }

  // ProductDb -> HomeLowStockProductModel
  static HomeLowStockProductModel productToModel(
    ProductDb db,
  ) {
    return HomeLowStockProductModel(
      id: db.id,
      name: db.name,
      barcode: db.barcode,
      quantity: db.quantity,
      minStock: db.minStock,
      salePrice: db.salePrice,
    );
  }

  // HomeSaleModel -> HomeSale
  static HomeSale saleToEntity(HomeSaleModel model) {
    return HomeSale(
      id: model.id,
      invoiceNumber: model.invoiceNumber,
      total: model.total,
      paidAmount: model.paidAmount,
      paymentMethod: model.paymentMethod,
      createdAt: model.createdAt,
    );
  }

  // HomeLowStockProductModel -> HomeLowStockProduct
  static HomeLowStockProduct productToEntity(
    HomeLowStockProductModel model,
  ) {
    return HomeLowStockProduct(
      id: model.id,
      name: model.name,
      barcode: model.barcode,
      quantity: model.quantity,
      minStock: model.minStock,
      salePrice: model.salePrice,
    );
  }

  // Model -> Entity
  static HomeDashboard toEntity(
    HomeDashboardModel model,
  ) {
    return HomeDashboard(
      productsCount: model.productsCount,
      todaySalesCount: model.todaySalesCount,
      todaySalesTotal: model.todaySalesTotal,
      lowStockCount: model.lowStockCount,
      recentSales: model.recentSales
          .map(saleToEntity)
          .toList(),
      lowStockProducts: model.lowStockProducts
          .map(productToEntity)
          .toList(),
    );
  }
}
