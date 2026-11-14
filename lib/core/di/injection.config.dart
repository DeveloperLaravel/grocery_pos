// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/backup/data/datasources/google_auth_datasource.dart'
    as _i85;
import '../../features/backup/data/datasources/google_drive_datasource.dart'
    as _i958;
import '../../features/backup/data/datasources/local_backup_datasource.dart'
    as _i44;
import '../../features/backup/data/repositories/backup_repository_impl.dart'
    as _i143;
import '../../features/backup/domain/repositories/backup_repository.dart'
    as _i979;
import '../../features/backup/domain/usecases/backup_usecases.dart' as _i105;
import '../../features/backup/presentation/bloc/backup_bloc.dart' as _i894;
import '../../features/inventory/data/database/inventory_local_data_source.dart'
    as _i814;
import '../../features/inventory/data/database/inventory_local_data_source_impl.dart'
    as _i1039;
import '../../features/inventory/data/repositories/inventory_repository_impl.dart'
    as _i572;
import '../../features/inventory/domain/repositories/inventory_repository.dart'
    as _i422;
import '../../features/inventory/domain/usecases/adjust_stock_usecase.dart'
    as _i101;
import '../../features/inventory/domain/usecases/get_inventory_summary_usecase.dart'
    as _i308;
import '../../features/inventory/domain/usecases/get_inventory_usecases.dart'
    as _i48;
import '../../features/inventory/domain/usecases/get_low_stock_products_usecase.dart'
    as _i72;
import '../../features/inventory/domain/usecases/get_stock_movements_usecase.dart'
    as _i848;
import '../../features/inventory/domain/usecases/watch_inventory_summary_usecase.dart'
    as _i330;
import '../../features/inventory/domain/usecases/watch_inventory_usecase.dart'
    as _i486;
import '../../features/inventory/domain/usecases/watch_low_stock_products_usecase.dart'
    as _i196;
import '../../features/inventory/domain/usecases/watch_stock_movements_usecase.dart'
    as _i72;
import '../../features/inventory/presentation/bloc/inventory_bloc.dart'
    as _i690;
import '../../features/pos/data/database/pos_local_data_source.dart' as _i740;
import '../../features/pos/data/database/pos_local_data_source_impl.dart'
    as _i679;
import '../../features/pos/data/repositories/pos_repository_impl.dart' as _i84;
import '../../features/pos/domain/repositories/pos_repository.dart' as _i511;
import '../../features/pos/domain/usecases/add_product_usecase.dart' as _i391;
import '../../features/pos/domain/usecases/adjust_stock_usecase.dart' as _i702;
import '../../features/pos/domain/usecases/checkout_usecase.dart' as _i42;
import '../../features/pos/domain/usecases/delete_product_usecase.dart' as _i6;
import '../../features/pos/domain/usecases/get_product_by_barcode_usecase.dart'
    as _i669;
import '../../features/pos/domain/usecases/get_product_by_id_usecase.dart'
    as _i1055;
import '../../features/pos/domain/usecases/get_products_usecase.dart' as _i880;
import '../../features/pos/domain/usecases/return_sale_item_usecase.dart'
    as _i2;
import '../../features/pos/domain/usecases/update_product_usecase.dart'
    as _i444;
import '../../features/pos/presentation/bloc/pos_bloc.dart' as _i853;
import '../../features/products/data/database/product_local_data_source.dart'
    as _i351;
import '../../features/products/data/database/product_local_data_source_impl.dart'
    as _i878;
import '../../features/products/data/repositories/product_repository_impl.dart'
    as _i764;
import '../../features/products/domain/repositories/product_repository.dart'
    as _i963;
import '../../features/products/domain/usecases/add_product_use_case.dart'
    as _i363;
import '../../features/products/domain/usecases/delete_product_use_case.dart'
    as _i290;
import '../../features/products/domain/usecases/get_all_products_use_case.dart'
    as _i401;
import '../../features/products/domain/usecases/get_product_by_barcode_use_case.dart'
    as _i580;
import '../../features/products/domain/usecases/get_product_by_id_use_case.dart'
    as _i32;
import '../../features/products/domain/usecases/update_product_use_case.dart'
    as _i796;
import '../../features/products/domain/usecases/watch_all_products_use_case.dart'
    as _i215;
import '../../features/products/presentation/cubit/products_cubit.dart'
    as _i911;
import '../../features/reports/data/database/reports_local_data_source.dart'
    as _i637;
import '../../features/reports/data/database/reports_local_data_source_impl.dart'
    as _i430;
import '../../features/reports/data/repositories/reports_repository_impl.dart'
    as _i227;
import '../../features/reports/domain/repositories/reports_repository.dart'
    as _i808;
import '../../features/reports/domain/usecases/get_sales_report_usecase.dart'
    as _i505;
import '../../features/reports/domain/usecases/get_top_products_usecase.dart'
    as _i61;
import '../../features/sales/data/database/sales_local_data_source.dart'
    as _i1035;
import '../../features/sales/data/database/sales_local_data_source_impl.dart'
    as _i1012;
import '../../features/sales/data/repositories/sales_repository_impl.dart'
    as _i779;
import '../../features/sales/domain/repositories/sales_repository.dart'
    as _i434;
import '../../features/sales/domain/usecases/cancel_sale_usecase.dart' as _i184;
import '../../features/sales/domain/usecases/create_sale_usecase.dart' as _i625;
import '../../features/sales/domain/usecases/get_sale_details_usecase.dart'
    as _i30;
import '../../features/sales/domain/usecases/get_sales_usecase.dart' as _i283;
import '../../features/sales/domain/usecases/watch_sales_usecase.dart' as _i209;
import '../../features/sales/presentation/bloc/sales_bloc.dart' as _i249;
import '../database/app_database.dart' as _i982;
import '../database/daos/database_maintenance_dao.dart' as _i879;
import '../database/daos/products_dao.dart' as _i839;
import '../database/daos/reports_dao.dart' as _i534;
import '../database/daos/sales_dao.dart' as _i340;
import '../database/daos/stock_dao.dart' as _i671;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i982.AppDatabase>(() => appModule.appDatabase);
    gh.lazySingleton<_i85.GoogleAuthDataSource>(
        () => _i85.GoogleAuthDataSource());
    gh.lazySingleton<_i44.LocalBackupDataSource>(
        () => _i44.LocalBackupDataSource());
    gh.lazySingleton<_i879.DatabaseMaintenanceDao>(
        () => _i879.DatabaseMaintenanceDao(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i839.ProductsDao>(
        () => _i839.ProductsDao(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i534.ReportsDao>(
        () => _i534.ReportsDao(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i340.SalesDao>(
        () => _i340.SalesDao(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i671.StockDao>(
        () => _i671.StockDao(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i1035.SalesLocalDataSource>(
        () => _i1012.SalesLocalDataSourceImpl(gh<_i340.SalesDao>()));
    gh.lazySingleton<_i958.GoogleDriveDataSource>(
        () => _i958.GoogleDriveDataSource(gh<_i85.GoogleAuthDataSource>()));
    gh.lazySingleton<_i351.ProductLocalDataSource>(
        () => _i878.ProductLocalDataSourceImpl(gh<_i839.ProductsDao>()));
    gh.lazySingleton<_i814.InventoryLocalDataSource>(
        () => _i1039.InventoryLocalDataSourceImpl(
              gh<_i982.AppDatabase>(),
              gh<_i839.ProductsDao>(),
              gh<_i671.StockDao>(),
            ));
    gh.lazySingleton<_i979.BackupRepository>(() => _i143.BackupRepositoryImpl(
          gh<_i85.GoogleAuthDataSource>(),
          gh<_i958.GoogleDriveDataSource>(),
          gh<_i44.LocalBackupDataSource>(),
          gh<_i982.AppDatabase>(),
        ));
    gh.lazySingleton<_i637.ReportsLocalDataSource>(
        () => _i430.ReportsLocalDataSourceImpl(gh<_i534.ReportsDao>()));
    gh.lazySingleton<_i740.PosLocalDataSource>(
        () => _i679.PosLocalDataSourceImpl(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i434.SalesRepository>(
        () => _i779.SalesRepositoryImpl(gh<_i1035.SalesLocalDataSource>()));
    gh.lazySingleton<_i808.ReportsRepository>(
        () => _i227.ReportsRepositoryImpl(gh<_i637.ReportsLocalDataSource>()));
    gh.lazySingleton<_i963.ProductRepository>(
        () => _i764.ProductRepositoryImpl(gh<_i351.ProductLocalDataSource>()));
    gh.lazySingleton<_i505.GetSalesReportUseCase>(
        () => _i505.GetSalesReportUseCase(gh<_i808.ReportsRepository>()));
    gh.lazySingleton<_i61.GetTopProductsUseCase>(
        () => _i61.GetTopProductsUseCase(gh<_i808.ReportsRepository>()));
    gh.factory<_i105.ConnectGoogleDrive>(
        () => _i105.ConnectGoogleDrive(gh<_i979.BackupRepository>()));
    gh.factory<_i105.DisconnectGoogleDrive>(
        () => _i105.DisconnectGoogleDrive(gh<_i979.BackupRepository>()));
    gh.factory<_i105.IsGoogleDriveConnected>(
        () => _i105.IsGoogleDriveConnected(gh<_i979.BackupRepository>()));
    gh.factory<_i105.GetBackups>(
        () => _i105.GetBackups(gh<_i979.BackupRepository>()));
    gh.factory<_i105.CreateBackup>(
        () => _i105.CreateBackup(gh<_i979.BackupRepository>()));
    gh.factory<_i105.RestoreBackup>(
        () => _i105.RestoreBackup(gh<_i979.BackupRepository>()));
    gh.factory<_i105.DeleteBackup>(
        () => _i105.DeleteBackup(gh<_i979.BackupRepository>()));
    gh.lazySingleton<_i422.InventoryRepository>(() =>
        _i572.InventoryRepositoryImpl(gh<_i814.InventoryLocalDataSource>()));
    gh.lazySingleton<_i363.AddProductUseCase>(
        () => _i363.AddProductUseCase(gh<_i963.ProductRepository>()));
    gh.lazySingleton<_i290.DeleteProductUseCase>(
        () => _i290.DeleteProductUseCase(gh<_i963.ProductRepository>()));
    gh.lazySingleton<_i401.GetAllProductsUseCase>(
        () => _i401.GetAllProductsUseCase(gh<_i963.ProductRepository>()));
    gh.lazySingleton<_i580.GetProductByBarcodeUseCase>(
        () => _i580.GetProductByBarcodeUseCase(gh<_i963.ProductRepository>()));
    gh.lazySingleton<_i32.GetProductByIdUseCase>(
        () => _i32.GetProductByIdUseCase(gh<_i963.ProductRepository>()));
    gh.lazySingleton<_i796.UpdateProductUseCase>(
        () => _i796.UpdateProductUseCase(gh<_i963.ProductRepository>()));
    gh.lazySingleton<_i215.WatchAllProductsUseCase>(
        () => _i215.WatchAllProductsUseCase(gh<_i963.ProductRepository>()));
    gh.lazySingleton<_i101.AdjustStockUseCase>(
        () => _i101.AdjustStockUseCase(gh<_i422.InventoryRepository>()));
    gh.lazySingleton<_i308.GetInventorySummaryUseCase>(() =>
        _i308.GetInventorySummaryUseCase(gh<_i422.InventoryRepository>()));
    gh.lazySingleton<_i48.GetInventoryUseCase>(
        () => _i48.GetInventoryUseCase(gh<_i422.InventoryRepository>()));
    gh.lazySingleton<_i72.GetLowStockProductsUseCase>(
        () => _i72.GetLowStockProductsUseCase(gh<_i422.InventoryRepository>()));
    gh.lazySingleton<_i848.GetStockMovementsUseCase>(
        () => _i848.GetStockMovementsUseCase(gh<_i422.InventoryRepository>()));
    gh.lazySingleton<_i330.WatchInventorySummaryUseCase>(() =>
        _i330.WatchInventorySummaryUseCase(gh<_i422.InventoryRepository>()));
    gh.lazySingleton<_i486.WatchInventoryUseCase>(
        () => _i486.WatchInventoryUseCase(gh<_i422.InventoryRepository>()));
    gh.lazySingleton<_i196.WatchLowStockProductsUseCase>(() =>
        _i196.WatchLowStockProductsUseCase(gh<_i422.InventoryRepository>()));
    gh.lazySingleton<_i72.WatchStockMovementsUseCase>(
        () => _i72.WatchStockMovementsUseCase(gh<_i422.InventoryRepository>()));
    gh.factory<_i911.ProductsCubit>(() => _i911.ProductsCubit(
          gh<_i401.GetAllProductsUseCase>(),
          gh<_i215.WatchAllProductsUseCase>(),
          gh<_i363.AddProductUseCase>(),
          gh<_i796.UpdateProductUseCase>(),
          gh<_i290.DeleteProductUseCase>(),
        ));
    gh.factory<_i894.BackupBloc>(() => _i894.BackupBloc(
          gh<_i105.ConnectGoogleDrive>(),
          gh<_i105.DisconnectGoogleDrive>(),
          gh<_i105.IsGoogleDriveConnected>(),
          gh<_i105.GetBackups>(),
          gh<_i105.CreateBackup>(),
          gh<_i105.RestoreBackup>(),
          gh<_i105.DeleteBackup>(),
        ));
    gh.lazySingleton<_i511.PosRepository>(
        () => _i84.PosRepositoryImpl(gh<_i740.PosLocalDataSource>()));
    gh.lazySingleton<_i184.CancelSaleUseCase>(
        () => _i184.CancelSaleUseCase(gh<_i434.SalesRepository>()));
    gh.lazySingleton<_i625.CreateSaleUseCase>(
        () => _i625.CreateSaleUseCase(gh<_i434.SalesRepository>()));
    gh.lazySingleton<_i30.GetSaleDetailsUseCase>(
        () => _i30.GetSaleDetailsUseCase(gh<_i434.SalesRepository>()));
    gh.lazySingleton<_i283.GetSalesUseCase>(
        () => _i283.GetSalesUseCase(gh<_i434.SalesRepository>()));
    gh.lazySingleton<_i209.WatchSalesUseCase>(
        () => _i209.WatchSalesUseCase(gh<_i434.SalesRepository>()));
    gh.lazySingleton<_i391.AddProductUseCase>(
        () => _i391.AddProductUseCase(gh<_i511.PosRepository>()));
    gh.lazySingleton<_i702.AdjustStockUseCase>(
        () => _i702.AdjustStockUseCase(gh<_i511.PosRepository>()));
    gh.lazySingleton<_i42.CheckoutUseCase>(
        () => _i42.CheckoutUseCase(gh<_i511.PosRepository>()));
    gh.lazySingleton<_i6.DeleteProductUseCase>(
        () => _i6.DeleteProductUseCase(gh<_i511.PosRepository>()));
    gh.lazySingleton<_i669.GetProductByBarcodeUseCase>(
        () => _i669.GetProductByBarcodeUseCase(gh<_i511.PosRepository>()));
    gh.lazySingleton<_i1055.GetProductByIdUseCase>(
        () => _i1055.GetProductByIdUseCase(gh<_i511.PosRepository>()));
    gh.lazySingleton<_i880.GetProductsUseCase>(
        () => _i880.GetProductsUseCase(gh<_i511.PosRepository>()));
    gh.lazySingleton<_i2.ReturnSaleItemUseCase>(
        () => _i2.ReturnSaleItemUseCase(gh<_i511.PosRepository>()));
    gh.lazySingleton<_i444.UpdateProductUseCase>(
        () => _i444.UpdateProductUseCase(gh<_i511.PosRepository>()));
    gh.factory<_i690.InventoryBloc>(() => _i690.InventoryBloc(
          gh<_i48.GetInventoryUseCase>(),
          gh<_i486.WatchInventoryUseCase>(),
          gh<_i308.GetInventorySummaryUseCase>(),
          gh<_i330.WatchInventorySummaryUseCase>(),
          gh<_i72.GetLowStockProductsUseCase>(),
          gh<_i196.WatchLowStockProductsUseCase>(),
          gh<_i848.GetStockMovementsUseCase>(),
          gh<_i72.WatchStockMovementsUseCase>(),
          gh<_i101.AdjustStockUseCase>(),
        ));
    gh.factory<_i249.SalesBloc>(() => _i249.SalesBloc(
          gh<_i283.GetSalesUseCase>(),
          gh<_i209.WatchSalesUseCase>(),
          gh<_i30.GetSaleDetailsUseCase>(),
          gh<_i184.CancelSaleUseCase>(),
        ));
    gh.factory<_i853.PosBloc>(() => _i853.PosBloc(
          gh<_i880.GetProductsUseCase>(),
          gh<_i669.GetProductByBarcodeUseCase>(),
          gh<_i391.AddProductUseCase>(),
          gh<_i444.UpdateProductUseCase>(),
          gh<_i6.DeleteProductUseCase>(),
          gh<_i702.AdjustStockUseCase>(),
          gh<_i42.CheckoutUseCase>(),
          gh<_i2.ReturnSaleItemUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
