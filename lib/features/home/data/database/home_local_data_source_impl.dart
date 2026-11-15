
import 'package:injectable/injectable.dart';

import '../../../../core/database/daos/home_dao.dart';

import '../mappers/home_dashboard_mapper.dart';
import '../models/home_dashboard_model.dart';
import 'home_local_data_source.dart';

@LazySingleton(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final HomeDao _homeDao;

  HomeLocalDataSourceImpl(this._homeDao);

  @override
  Future<HomeDashboardModel> getDashboard() async {
    // قراءة البيانات من قاعدة البيانات
    final results = await Future.wait([
      _homeDao.getProductsCount(),
      _homeDao.getTodaySalesCount(),
      _homeDao.getTodaySalesTotal(),
      _homeDao.getLowStockCount(),
      _homeDao.getRecentSales(),
      _homeDao.getLowStockProducts(),
    ]);

    final productsCount = results[0] as int;
    final todaySalesCount = results[1] as int;
    final todaySalesTotal = results[2] as double;
    final lowStockCount = results[3] as int;

    final recentSales = results[4] as List;
    final lowStockProducts = results[5] as List;

    return HomeDashboardModel(
      productsCount: productsCount,
      todaySalesCount: todaySalesCount,
      todaySalesTotal: todaySalesTotal,
      lowStockCount: lowStockCount,

      recentSales: recentSales
          .map(
            (sale) => HomeDashboardMapper.saleToModel(sale),
          )
          .toList(),

      lowStockProducts: lowStockProducts
          .map(
            (product) =>
                HomeDashboardMapper.productToModel(product),
          )
          .toList(),
    );
  }
}
