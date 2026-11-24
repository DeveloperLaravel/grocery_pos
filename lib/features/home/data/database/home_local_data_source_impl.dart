
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';
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
    // تنفيذ استعلامات لوحة التحكم بالتوازي.
    final results = await Future.wait<dynamic>([
      _homeDao.getProductsCount(),
      _homeDao.getTodaySalesCount(),
      _homeDao.getTodaySalesTotal(),
      _homeDao.getLowStockCount(),
      _homeDao.getRecentSales(),
      _homeDao.getLowStockProducts(),
    ]);

    // استخراج النتائج بالأنواع الصحيحة.
    final productsCount = results[0] as int;
    final todaySalesCount = results[1] as int;
    final todaySalesTotal = results[2] as double;
    final lowStockCount = results[3] as int;

    final sales = results[4] as List<SaleDb>;
    final products = results[5] as List<ProductDb>;

    // تحويل بيانات قاعدة البيانات إلى Models.
    final recentSales = sales
        .map(HomeDashboardMapper.saleToModel)
        .toList(growable: false);

    final lowStockProducts = products
        .map(HomeDashboardMapper.productToModel)
        .toList(growable: false);

    // إنشاء نموذج لوحة التحكم.
    return HomeDashboardModel(
      productsCount: productsCount,
      todaySalesCount: todaySalesCount,
      todaySalesTotal: todaySalesTotal,
      lowStockCount: lowStockCount,
      recentSales: recentSales,
      lowStockProducts: lowStockProducts,
    );
  }
}
