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

import '../../features/backup/data/datasources/google_drive_datasource.dart'
    as _i958;
import '../../features/backup/data/datasources/local_backup_datasource.dart'
    as _i44;
import '../../features/backup/data/repositories/backup_repository_impl.dart'
    as _i143;
import '../../features/backup/domain/repositories/backup_repository.dart'
    as _i979;
import '../../features/backup/domain/usecases/create_backup.dart' as _i535;
import '../../features/backup/domain/usecases/delete_backup.dart' as _i261;
import '../../features/backup/domain/usecases/get_backups.dart' as _i709;
import '../../features/backup/domain/usecases/restore_backup.dart' as _i204;
import '../../features/backup/domain/usecases/sign_in_google_drive.dart'
    as _i668;
import '../../features/backup/domain/usecases/sign_out_google_drive.dart'
    as _i309;
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
import '../../features/pos/data/pos_repository_impl.dart' as _i667;
import '../../features/pos/domain/pos_repository.dart' as _i902;
import '../../features/pos/domain/usecases/checkout_sale.dart' as _i544;
import '../../features/pos/domain/usecases/find_product_by_barcode.dart'
    as _i77;
import '../../features/pos/domain/usecases/get_pos_products.dart' as _i144;
import '../../features/pos/presentation/bloc/pos_bloc.dart' as _i853;
import '../database/app_database.dart' as _i982;
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
    gh.lazySingleton<_i958.GoogleDriveDataSource>(
        () => _i958.GoogleDriveDataSource());
    gh.lazySingleton<_i44.LocalBackupDataSource>(
        () => _i44.LocalBackupDataSource());
    gh.lazySingleton<_i422.InventoryRepository>(
        () => _i572.InventoryRepositoryImpl(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i907.PrinterGateway>(() => _i907.PrinterService());
    gh.lazySingleton<_i902.PosRepository>(
        () => _i667.PosRepositoryImpl(gh<_i982.AppDatabase>()));
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
    gh.factory<_i690.InventoryBloc>(() => _i690.InventoryBloc(
          gh<_i313.GetInventory>(),
          gh<_i358.GetInventorySummary>(),
          gh<_i503.AdjustStock>(),
          gh<_i213.SetStock>(),
          gh<_i53.UpdateMinStock>(),
        ));
    gh.lazySingleton<_i979.BackupRepository>(() => _i143.BackupRepositoryImpl(
          gh<_i958.GoogleDriveDataSource>(),
          gh<_i44.LocalBackupDataSource>(),
          gh<_i982.AppDatabase>(),
        ));
    gh.factory<_i535.CreateBackup>(
        () => _i535.CreateBackup(gh<_i979.BackupRepository>()));
    gh.factory<_i261.DeleteBackup>(
        () => _i261.DeleteBackup(gh<_i979.BackupRepository>()));
    gh.factory<_i709.GetBackups>(
        () => _i709.GetBackups(gh<_i979.BackupRepository>()));
    gh.factory<_i204.RestoreBackup>(
        () => _i204.RestoreBackup(gh<_i979.BackupRepository>()));
    gh.factory<_i668.SignInGoogleDrive>(
        () => _i668.SignInGoogleDrive(gh<_i979.BackupRepository>()));
    gh.factory<_i309.SignOutGoogleDrive>(
        () => _i309.SignOutGoogleDrive(gh<_i979.BackupRepository>()));
    gh.factory<_i894.BackupBloc>(() => _i894.BackupBloc(
          gh<_i668.SignInGoogleDrive>(),
          gh<_i309.SignOutGoogleDrive>(),
          gh<_i709.GetBackups>(),
          gh<_i535.CreateBackup>(),
          gh<_i204.RestoreBackup>(),
          gh<_i261.DeleteBackup>(),
        ));
    gh.factory<_i544.CheckoutSale>(
        () => _i544.CheckoutSale(gh<_i902.PosRepository>()));
    gh.factory<_i77.FindProductByBarcode>(
        () => _i77.FindProductByBarcode(gh<_i902.PosRepository>()));
    gh.factory<_i144.GetPosProducts>(
        () => _i144.GetPosProducts(gh<_i902.PosRepository>()));
    gh.factory<_i853.PosBloc>(() => _i853.PosBloc(
          gh<_i144.GetPosProducts>(),
          gh<_i77.FindProductByBarcode>(),
          gh<_i544.CheckoutSale>(),
        ));
    return this;
  }
}
