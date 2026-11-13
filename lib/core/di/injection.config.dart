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
import '../../features/inventory/data/repositories/inventory_repository_impl.dart'
    as _i572;
import '../../features/inventory/domain/repositories/inventory_repository.dart'
    as _i422;
import '../../features/inventory/domain/usecases/adjust_stock.dart' as _i503;
import '../../features/inventory/domain/usecases/get_inventory.dart' as _i313;
import '../../features/inventory/domain/usecases/get_inventory_summary.dart'
    as _i358;
import '../../features/inventory/domain/usecases/get_stock_movements.dart'
    as _i530;
import '../../features/inventory/domain/usecases/set_stock.dart' as _i213;
import '../../features/inventory/domain/usecases/update_min_stock.dart' as _i53;
import '../../features/inventory/presentation/bloc/inventory_bloc.dart'
    as _i690;
import '../../features/pos/data/database/pos_local_data_source.dart' as _i740;
import '../../features/pos/data/database/pos_repository_impl.dart' as _i659;
import '../../features/pos/data/repositories/pos_repository_impl.dart' as _i84;
import '../../features/pos/domain/repositories/pos_repository.dart' as _i511;
import '../../features/pos/domain/usecases/checkout_sale.dart' as _i544;
import '../../features/pos/domain/usecases/find_product_by_barcode.dart'
    as _i77;
import '../../features/pos/domain/usecases/get_pos_products.dart' as _i144;
import '../../features/pos/presentation/bloc/pos_bloc.dart' as _i853;
import '../../features/products/data/datasources/product_local_data_source.dart'
    as _i823;
import '../../features/products/data/datasources/product_local_data_source_impl.dart'
    as _i27;
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
import '../database/app_database.dart' as _i982;
import '../database/daos/products_dao.dart' as _i839;
import '../printer/printer_service.dart' as _i907;

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
    gh.lazySingleton<_i982.AppDatabase>(() => _i982.AppDatabase());
    gh.lazySingleton<_i85.GoogleAuthDataSource>(
        () => _i85.GoogleAuthDataSource());
    gh.lazySingleton<_i44.LocalBackupDataSource>(
        () => _i44.LocalBackupDataSource());
    gh.lazySingleton<_i659.PosRepositoryImpl>(
        () => _i659.PosRepositoryImpl(gh<InvalidType>()));
    gh.lazySingleton<_i422.InventoryRepository>(
        () => _i572.InventoryRepositoryImpl(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i907.PrinterGateway>(() => _i907.PrinterService());
    gh.lazySingleton<_i958.GoogleDriveDataSource>(
        () => _i958.GoogleDriveDataSource(gh<_i85.GoogleAuthDataSource>()));
    gh.factory<_i503.AdjustStock>(
        () => _i503.AdjustStock(gh<_i422.InventoryRepository>()));
    gh.factory<_i313.GetInventory>(
        () => _i313.GetInventory(gh<_i422.InventoryRepository>()));
    gh.factory<_i358.GetInventorySummary>(
        () => _i358.GetInventorySummary(gh<_i422.InventoryRepository>()));
    gh.factory<_i530.GetStockMovements>(
        () => _i530.GetStockMovements(gh<_i422.InventoryRepository>()));
    gh.factory<_i213.SetStock>(
        () => _i213.SetStock(gh<_i422.InventoryRepository>()));
    gh.factory<_i53.UpdateMinStock>(
        () => _i53.UpdateMinStock(gh<_i422.InventoryRepository>()));
    gh.factory<_i544.CheckoutSale>(() => _i544.CheckoutSale(gh<InvalidType>()));
    gh.factory<_i77.FindProductByBarcode>(
        () => _i77.FindProductByBarcode(gh<InvalidType>()));
    gh.factory<_i144.GetPosProducts>(
        () => _i144.GetPosProducts(gh<InvalidType>()));
    gh.lazySingleton<_i979.BackupRepository>(() => _i143.BackupRepositoryImpl(
          gh<_i85.GoogleAuthDataSource>(),
          gh<_i958.GoogleDriveDataSource>(),
          gh<_i44.LocalBackupDataSource>(),
          gh<_i982.AppDatabase>(),
        ));
    gh.lazySingleton<_i511.PosRepository>(
        () => _i84.PosRepositoryImpl(gh<_i740.PosLocalDataSource>()));
    gh.factory<_i690.InventoryBloc>(() => _i690.InventoryBloc(
          gh<_i313.GetInventory>(),
          gh<_i358.GetInventorySummary>(),
          gh<_i503.AdjustStock>(),
          gh<_i213.SetStock>(),
          gh<_i53.UpdateMinStock>(),
        ));
    gh.lazySingleton<_i823.ProductLocalDataSource>(
        () => _i27.ProductLocalDataSourceImpl(gh<_i839.ProductsDao>()));
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
    gh.factory<_i853.PosBloc>(() => _i853.PosBloc(
          gh<_i144.GetPosProducts>(),
          gh<_i77.FindProductByBarcode>(),
          gh<_i544.CheckoutSale>(),
        ));
    gh.lazySingleton<_i963.ProductRepository>(
        () => _i764.ProductRepositoryImpl(gh<_i823.ProductLocalDataSource>()));
    gh.factory<_i894.BackupBloc>(() => _i894.BackupBloc(
          gh<_i105.ConnectGoogleDrive>(),
          gh<_i105.DisconnectGoogleDrive>(),
          gh<_i105.IsGoogleDriveConnected>(),
          gh<_i105.GetBackups>(),
          gh<_i105.CreateBackup>(),
          gh<_i105.RestoreBackup>(),
          gh<_i105.DeleteBackup>(),
        ));
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
    gh.factory<_i911.ProductsCubit>(() => _i911.ProductsCubit(
          gh<_i401.GetAllProductsUseCase>(),
          gh<_i215.WatchAllProductsUseCase>(),
          gh<_i363.AddProductUseCase>(),
          gh<_i796.UpdateProductUseCase>(),
          gh<_i290.DeleteProductUseCase>(),
        ));
    return this;
  }
}
