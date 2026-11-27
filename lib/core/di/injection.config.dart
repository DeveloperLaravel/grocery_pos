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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
import '../../features/home/data/database/home_local_data_source.dart' as _i735;
import '../../features/home/data/database/home_local_data_source_impl.dart'
    as _i139;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/domain/usecases/get_home_dashboard_usecase.dart'
    as _i871;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i202;
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
import '../../features/master_data/customers/data/database/customer_local_data_source.dart'
    as _i442;
import '../../features/master_data/customers/data/database/customer_local_data_source_impl.dart'
    as _i882;
import '../../features/master_data/customers/data/repositories/customer_repository_impl.dart'
    as _i866;
import '../../features/master_data/customers/domain/repositories/customer_repository.dart'
    as _i874;
import '../../features/master_data/customers/domain/usecases/delete_customer_usecase.dart'
    as _i502;
import '../../features/master_data/customers/domain/usecases/get_customer_by_id_usecase.dart'
    as _i50;
import '../../features/master_data/customers/domain/usecases/get_customers_usecase.dart'
    as _i819;
import '../../features/master_data/customers/domain/usecases/insert_customer_usecase.dart'
    as _i925;
import '../../features/master_data/customers/domain/usecases/search_customers_usecase.dart'
    as _i684;
import '../../features/master_data/customers/domain/usecases/toggle_customer_status_usecase.dart'
    as _i503;
import '../../features/master_data/customers/domain/usecases/update_customer_usecase.dart'
    as _i445;
import '../../features/master_data/customers/domain/usecases/watch_customers_usecase.dart'
    as _i996;
import '../../features/master_data/customers/presentation/customer/customer_bloc.dart'
    as _i189;
import '../../features/master_data/suppliers/data/database/supplier_local_datasource_impl.dart'
    as _i838;
import '../../features/master_data/suppliers/data/database/suppliers_local_data_source.dart'
    as _i1021;
import '../../features/master_data/suppliers/data/mappers/supplier_mapper.dart'
    as _i541;
import '../../features/master_data/suppliers/data/repository/supplier_repository_impl.dart'
    as _i993;
import '../../features/master_data/suppliers/domain/repositories/supplier_repository.dart'
    as _i543;
import '../../features/master_data/suppliers/domain/usecases/supplier_crud_usecases.dart'
    as _i812;
import '../../features/master_data/suppliers/domain/usecases/supplier_filter_usecases.dart'
    as _i349;
import '../../features/master_data/suppliers/domain/usecases/supplier_financial_usecases.dart'
    as _i689;
import '../../features/master_data/suppliers/domain/usecases/supplier_pagination_usecases.dart'
    as _i935;
import '../../features/master_data/suppliers/domain/usecases/supplier_search_usecases.dart'
    as _i411;
import '../../features/master_data/suppliers/domain/usecases/supplier_statistics_usecases.dart'
    as _i581;
import '../../features/master_data/suppliers/domain/usecases/supplier_status_usecases.dart'
    as _i370;
import '../../features/master_data/suppliers/domain/usecases/supplier_usecases.dart'
    as _i534;
import '../../features/master_data/suppliers/domain/usecases/supplier_validation_usecases.dart'
    as _i50;
import '../../features/master_data/suppliers/domain/usecases/supplier_watch_usecases.dart'
    as _i620;
import '../../features/master_data/suppliers/presentation/bloc/supplier_bloc.dart'
    as _i880;
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
import '../../features/products/domain/usecases/barcodes/delete_product_barcode_usecase.dart'
    as _i547;
import '../../features/products/domain/usecases/barcodes/get_barcode_usecase.dart'
    as _i185;
import '../../features/products/domain/usecases/barcodes/get_product_barcodes_usecase.dart'
    as _i150;
import '../../features/products/domain/usecases/barcodes/get_product_by_barcode_usecase.dart'
    as _i825;
import '../../features/products/domain/usecases/barcodes/insert_product_barcode_usecase.dart'
    as _i227;
import '../../features/products/domain/usecases/barcodes/set_default_barcode_usecase.dart'
    as _i437;
import '../../features/products/domain/usecases/barcodes/watch_product_barcodes_usecase.dart'
    as _i104;
import '../../features/products/domain/usecases/brands/delete_brand_usecase.dart'
    as _i653;
import '../../features/products/domain/usecases/brands/get_all_brands_usecase.dart'
    as _i775;
import '../../features/products/domain/usecases/brands/insert_brand_usecase.dart'
    as _i792;
import '../../features/products/domain/usecases/brands/update_brand_usecase.dart'
    as _i735;
import '../../features/products/domain/usecases/brands/watch_all_brands_usecase.dart'
    as _i987;
import '../../features/products/domain/usecases/categories/create_category_usecase.dart'
    as _i461;
import '../../features/products/domain/usecases/categories/delete_category_usecase.dart'
    as _i796;
import '../../features/products/domain/usecases/categories/get_all_categories_usecase.dart'
    as _i280;
import '../../features/products/domain/usecases/categories/get_child_categories_usecase.dart'
    as _i558;
import '../../features/products/domain/usecases/categories/get_root_categories_usecase.dart'
    as _i2;
import '../../features/products/domain/usecases/categories/update_category_usecase.dart'
    as _i593;
import '../../features/products/domain/usecases/categories/watch_all_categories_usecase.dart'
    as _i1025;
import '../../features/products/domain/usecases/create_product_usecase.dart'
    as _i460;
import '../../features/products/domain/usecases/delete_product_use_case.dart'
    as _i290;
import '../../features/products/domain/usecases/get_all_products_use_case.dart'
    as _i401;
import '../../features/products/domain/usecases/get_product_by_id_use_case.dart'
    as _i32;
import '../../features/products/domain/usecases/images/delete_product_image_usecase.dart'
    as _i87;
import '../../features/products/domain/usecases/images/get_product_images_usecase.dart'
    as _i832;
import '../../features/products/domain/usecases/images/insert_product_image_usecase.dart'
    as _i1011;
import '../../features/products/domain/usecases/images/set_primary_product_image_usecase.dart'
    as _i456;
import '../../features/products/domain/usecases/images/watch_product_images_usecase.dart'
    as _i372;
import '../../features/products/domain/usecases/product_units/delete_product_unit_usecase.dart'
    as _i186;
import '../../features/products/domain/usecases/product_units/get_product_units_usecase.dart'
    as _i121;
import '../../features/products/domain/usecases/product_units/get_unit_by_id_usecase.dart'
    as _i670;
import '../../features/products/domain/usecases/product_units/insert_product_unit_usecase.dart'
    as _i195;
import '../../features/products/domain/usecases/product_units/set_base_unit_usecase.dart'
    as _i1051;
import '../../features/products/domain/usecases/product_units/set_default_unit_usecase.dart'
    as _i833;
import '../../features/products/domain/usecases/product_units/update_product_unit_usecase.dart'
    as _i758;
import '../../features/products/domain/usecases/product_units/watch_product_units_usecase.dart'
    as _i745;
import '../../features/products/domain/usecases/products/search_products_usecase.dart'
    as _i113;
import '../../features/products/domain/usecases/products/watch_product_by_id_usecase.dart'
    as _i33;
import '../../features/products/domain/usecases/products/watch_products_by_brand_usecase.dart'
    as _i128;
import '../../features/products/domain/usecases/products/watch_products_by_category_usecase.dart'
    as _i858;
import '../../features/products/domain/usecases/update_product_use_case.dart'
    as _i796;
import '../../features/products/domain/usecases/watch_all_products_use_case.dart'
    as _i215;
import '../../features/products/presentation/bloc/barcodes/barcodes_bloc.dart'
    as _i578;
import '../../features/products/presentation/bloc/brands/brands_bloc.dart'
    as _i840;
import '../../features/products/presentation/bloc/categories/categories_bloc.dart'
    as _i1005;
import '../../features/products/presentation/bloc/product_images/product_images_bloc.dart'
    as _i596;
import '../../features/products/presentation/bloc/product_units/product_units_bloc.dart'
    as _i357;
import '../../features/products/presentation/bloc/products_bloc.dart' as _i975;
import '../../features/reports/data/database/reports_local_data_source.dart'
    as _i637;
import '../../features/reports/data/database/reports_local_data_source_impl.dart'
    as _i430;
import '../../features/reports/data/repositories/reports_repository_impl.dart'
    as _i227;
import '../../features/reports/domain/repositories/reports_repository.dart'
    as _i808;
import '../../features/reports/domain/usecases/get_daily_sales_usecase.dart'
    as _i207;
import '../../features/reports/domain/usecases/get_sales_report_usecase.dart'
    as _i505;
import '../../features/reports/domain/usecases/get_top_products_usecase.dart'
    as _i61;
import '../../features/reports/presentation/cubit/reports_cubit.dart' as _i671;
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
import '../database/daos/home_dao.dart' as _i450;
import '../database/daos/master_data/parties/suppliers_dao.dart' as _i934;
import '../database/daos/master_data/products/products_dao.dart' as _i1036;
import '../database/daos/reports_dao.dart' as _i534;
import '../settings/app_settings_controller.dart' as _i131;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i982.AppDatabase>(() => appModule.appDatabase);
    gh.lazySingleton<_i85.GoogleAuthDataSource>(
        () => _i85.GoogleAuthDataSource());
    gh.lazySingleton<_i44.LocalBackupDataSource>(
        () => _i44.LocalBackupDataSource());
    gh.lazySingleton<_i1021.SupplierLocalDataSource>(
        () => _i838.SupplierLocalDataSourceImpl(
              gh<_i934.SuppliersDao>(),
              gh<_i541.SupplierMapper>(),
            ));
    gh.lazySingleton<_i351.ProductsLocalDataSource>(
        () => _i878.ProductsLocalDataSourceImpl(gh<_i1036.ProductsDao>()));
    gh.lazySingleton<_i879.DatabaseMaintenanceDao>(
        () => _i879.DatabaseMaintenanceDao(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i450.HomeDao>(
        () => _i450.HomeDao(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i534.ReportsDao>(
        () => _i534.ReportsDao(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i963.ProductsRepository>(
        () => _i764.ProductRepositoryImpl(gh<_i351.ProductsLocalDataSource>()));
    gh.lazySingleton<_i543.SupplierRepository>(() =>
        _i993.SupplierRepositoryImpl(gh<_i1021.SupplierLocalDataSource>()));
    gh.singleton<_i131.AppSettingsController>(
        () => _i131.AppSettingsController(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i958.GoogleDriveDataSource>(
        () => _i958.GoogleDriveDataSource(gh<_i85.GoogleAuthDataSource>()));
    gh.lazySingleton<_i735.HomeLocalDataSource>(
        () => _i139.HomeLocalDataSourceImpl(gh<_i450.HomeDao>()));
    gh.lazySingleton<_i0.HomeRepository>(
        () => _i76.HomeRepositoryImpl(gh<_i735.HomeLocalDataSource>()));
    gh.lazySingleton<_i442.CustomerLocalDataSource>(
        () => _i882.CustomerLocalDataSourceImpl(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i871.GetHomeDashboardUseCase>(
        () => _i871.GetHomeDashboardUseCase(gh<_i0.HomeRepository>()));
    gh.lazySingleton<_i814.InventoryLocalDataSource>(
        () => _i1039.InventoryLocalDataSourceImpl(
              gh<_i982.AppDatabase>(),
              gh<_i1036.ProductsDao>(),
              gh<InvalidType>(),
            ));
    gh.lazySingleton<_i349.SupplierFilterUseCases>(
        () => _i349.SupplierFilterUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i689.SupplierFinancialUseCases>(
        () => _i689.SupplierFinancialUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i935.SupplierPaginationUseCases>(
        () => _i935.SupplierPaginationUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i581.SupplierStatisticsUseCases>(
        () => _i581.SupplierStatisticsUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i370.SupplierStatusUseCases>(
        () => _i370.SupplierStatusUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i50.SupplierValidationUseCases>(
        () => _i50.SupplierValidationUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i620.SupplierWatchUseCases>(
        () => _i620.SupplierWatchUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i979.BackupRepository>(() => _i143.BackupRepositoryImpl(
          gh<_i85.GoogleAuthDataSource>(),
          gh<_i958.GoogleDriveDataSource>(),
          gh<_i44.LocalBackupDataSource>(),
          gh<_i982.AppDatabase>(),
        ));
    gh.factory<_i202.HomeBloc>(
        () => _i202.HomeBloc(gh<_i871.GetHomeDashboardUseCase>()));
    gh.lazySingleton<_i547.DeleteProductBarcodeUseCase>(() =>
        _i547.DeleteProductBarcodeUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i185.GetBarcodeUseCase>(
        () => _i185.GetBarcodeUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i150.GetProductBarcodesUseCase>(
        () => _i150.GetProductBarcodesUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i825.GetProductByBarcodeUseCase>(
        () => _i825.GetProductByBarcodeUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i227.InsertProductBarcodeUseCase>(() =>
        _i227.InsertProductBarcodeUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i437.SetDefaultBarcodeUseCase>(
        () => _i437.SetDefaultBarcodeUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i104.WatchProductBarcodesUseCase>(() =>
        _i104.WatchProductBarcodesUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i653.DeleteBrandUseCase>(
        () => _i653.DeleteBrandUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i775.GetAllBrandsUseCase>(
        () => _i775.GetAllBrandsUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i792.InsertBrandUseCase>(
        () => _i792.InsertBrandUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i735.UpdateBrandUseCase>(
        () => _i735.UpdateBrandUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i987.WatchAllBrandsUseCase>(
        () => _i987.WatchAllBrandsUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i461.CreateCategoryUseCase>(
        () => _i461.CreateCategoryUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i796.DeleteCategoryUseCase>(
        () => _i796.DeleteCategoryUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i280.GetAllCategoriesUseCase>(
        () => _i280.GetAllCategoriesUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i558.GetChildCategoriesUseCase>(
        () => _i558.GetChildCategoriesUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i2.GetRootCategoriesUseCase>(
        () => _i2.GetRootCategoriesUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i593.UpdateCategoryUseCase>(
        () => _i593.UpdateCategoryUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i1025.WatchAllCategoriesUseCase>(
        () => _i1025.WatchAllCategoriesUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i460.CreateProductUseCase>(
        () => _i460.CreateProductUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i290.DeleteProductUseCase>(
        () => _i290.DeleteProductUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i401.GetAllProductsUseCase>(
        () => _i401.GetAllProductsUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i32.GetProductByIdUseCase>(
        () => _i32.GetProductByIdUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i87.DeleteProductImageUseCase>(
        () => _i87.DeleteProductImageUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i832.GetProductImagesUseCase>(
        () => _i832.GetProductImagesUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i1011.InsertProductImageUseCase>(
        () => _i1011.InsertProductImageUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i456.SetPrimaryProductImageUseCase>(() =>
        _i456.SetPrimaryProductImageUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i372.WatchProductImagesUseCase>(
        () => _i372.WatchProductImagesUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i186.DeleteProductUnitUseCase>(
        () => _i186.DeleteProductUnitUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i121.GetProductUnitsUseCase>(
        () => _i121.GetProductUnitsUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i670.GetUnitByIdUseCase>(
        () => _i670.GetUnitByIdUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i195.InsertProductUnitUseCase>(
        () => _i195.InsertProductUnitUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i1051.SetBaseUnitUseCase>(
        () => _i1051.SetBaseUnitUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i833.SetDefaultUnitUseCase>(
        () => _i833.SetDefaultUnitUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i758.UpdateProductUnitUseCase>(
        () => _i758.UpdateProductUnitUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i745.WatchProductUnitsUseCase>(
        () => _i745.WatchProductUnitsUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i113.SearchProductsUseCase>(
        () => _i113.SearchProductsUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i33.WatchProductByIdUseCase>(
        () => _i33.WatchProductByIdUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i128.WatchProductsByBrandUseCase>(() =>
        _i128.WatchProductsByBrandUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i858.WatchProductsByCategoryUseCase>(() =>
        _i858.WatchProductsByCategoryUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i796.UpdateProductUsecase>(
        () => _i796.UpdateProductUsecase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i215.WatchAllProductsUseCase>(
        () => _i215.WatchAllProductsUseCase(gh<_i963.ProductsRepository>()));
    gh.lazySingleton<_i637.ReportsLocalDataSource>(
        () => _i430.ReportsLocalDataSourceImpl(gh<_i534.ReportsDao>()));
    gh.factory<_i596.ProductImagesBloc>(() => _i596.ProductImagesBloc(
          getProductImages: gh<_i832.GetProductImagesUseCase>(),
          watchProductImages: gh<_i372.WatchProductImagesUseCase>(),
          insertProductImage: gh<_i1011.InsertProductImageUseCase>(),
          setPrimaryProductImage: gh<_i456.SetPrimaryProductImageUseCase>(),
          deleteProductImage: gh<_i87.DeleteProductImageUseCase>(),
        ));
    gh.lazySingleton<_i740.PosLocalDataSource>(
        () => _i679.PosLocalDataSourceImpl(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i1035.SalesLocalDataSource>(
        () => _i1012.SalesLocalDataSourceImpl(gh<InvalidType>()));
    gh.lazySingleton<_i812.SupplierCrudUseCases>(
        () => _i812.SupplierCrudUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i411.SupplierSearchUseCases>(
        () => _i411.SupplierSearchUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i534.SupplierCrudUseCases>(
        () => _i534.SupplierCrudUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i534.SupplierQueryUseCases>(
        () => _i534.SupplierQueryUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i534.SupplierSearchUseCases>(
        () => _i534.SupplierSearchUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i534.SupplierClassificationUseCases>(() =>
        _i534.SupplierClassificationUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i534.SupplierFinancialUseCases>(
        () => _i534.SupplierFinancialUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i534.SupplierManagementUseCases>(
        () => _i534.SupplierManagementUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i534.SupplierStatisticsUseCases>(
        () => _i534.SupplierStatisticsUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i534.SupplierValidationUseCases>(
        () => _i534.SupplierValidationUseCases(gh<_i543.SupplierRepository>()));
    gh.lazySingleton<_i434.SalesRepository>(
        () => _i779.SalesRepositoryImpl(gh<_i1035.SalesLocalDataSource>()));
    gh.lazySingleton<_i808.ReportsRepository>(
        () => _i227.ReportsRepositoryImpl(gh<_i637.ReportsLocalDataSource>()));
    gh.factory<_i578.BarcodesBloc>(() => _i578.BarcodesBloc(
          gh<_i150.GetProductBarcodesUseCase>(),
          gh<_i104.WatchProductBarcodesUseCase>(),
          gh<_i185.GetBarcodeUseCase>(),
          gh<_i825.GetProductByBarcodeUseCase>(),
          gh<_i227.InsertProductBarcodeUseCase>(),
          gh<_i437.SetDefaultBarcodeUseCase>(),
          gh<_i547.DeleteProductBarcodeUseCase>(),
        ));
    gh.lazySingleton<_i207.GetDailySalesUseCase>(
        () => _i207.GetDailySalesUseCase(gh<_i808.ReportsRepository>()));
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
    gh.lazySingleton<_i874.CustomerRepository>(() =>
        _i866.CustomersRepositoryImpl(gh<_i442.CustomerLocalDataSource>()));
    gh.lazySingleton<_i422.InventoryRepository>(() =>
        _i572.InventoryRepositoryImpl(gh<_i814.InventoryLocalDataSource>()));
    gh.factory<_i671.ReportsCubit>(() => _i671.ReportsCubit(
          gh<_i505.GetSalesReportUseCase>(),
          gh<_i61.GetTopProductsUseCase>(),
          gh<_i207.GetDailySalesUseCase>(),
        ));
    gh.lazySingleton<_i502.DeleteCustomerUseCase>(
        () => _i502.DeleteCustomerUseCase(gh<_i874.CustomerRepository>()));
    gh.lazySingleton<_i50.GetCustomerByIdUseCase>(
        () => _i50.GetCustomerByIdUseCase(gh<_i874.CustomerRepository>()));
    gh.lazySingleton<_i925.InsertCustomerUseCase>(
        () => _i925.InsertCustomerUseCase(gh<_i874.CustomerRepository>()));
    gh.lazySingleton<_i684.SearchCustomersUseCase>(
        () => _i684.SearchCustomersUseCase(gh<_i874.CustomerRepository>()));
    gh.lazySingleton<_i503.ToggleCustomerStatusUseCase>(() =>
        _i503.ToggleCustomerStatusUseCase(gh<_i874.CustomerRepository>()));
    gh.lazySingleton<_i445.UpdateCustomerUseCase>(
        () => _i445.UpdateCustomerUseCase(gh<_i874.CustomerRepository>()));
    gh.lazySingleton<_i996.WatchCustomersUseCase>(
        () => _i996.WatchCustomersUseCase(gh<_i874.CustomerRepository>()));
    gh.factory<_i840.BrandsBloc>(() => _i840.BrandsBloc(
          gh<_i775.GetAllBrandsUseCase>(),
          gh<_i987.WatchAllBrandsUseCase>(),
          gh<_i792.InsertBrandUseCase>(),
          gh<_i735.UpdateBrandUseCase>(),
          gh<_i653.DeleteBrandUseCase>(),
        ));
    gh.factory<_i357.ProductUnitsBloc>(() => _i357.ProductUnitsBloc(
          getProductUnits: gh<_i121.GetProductUnitsUseCase>(),
          watchProductUnits: gh<_i745.WatchProductUnitsUseCase>(),
          getUnitById: gh<_i670.GetUnitByIdUseCase>(),
          insertProductUnit: gh<_i195.InsertProductUnitUseCase>(),
          updateProductUnit: gh<_i758.UpdateProductUnitUseCase>(),
          setBaseUnit: gh<_i1051.SetBaseUnitUseCase>(),
          setDefaultUnit: gh<_i833.SetDefaultUnitUseCase>(),
          deleteProductUnit: gh<_i186.DeleteProductUnitUseCase>(),
        ));
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
    gh.factory<_i975.ProductsBloc>(() => _i975.ProductsBloc(
          gh<_i401.GetAllProductsUseCase>(),
          gh<_i215.WatchAllProductsUseCase>(),
          gh<_i113.SearchProductsUseCase>(),
          gh<_i858.WatchProductsByCategoryUseCase>(),
          gh<_i128.WatchProductsByBrandUseCase>(),
          gh<_i460.CreateProductUseCase>(),
          gh<_i796.UpdateProductUsecase>(),
          gh<_i290.DeleteProductUseCase>(),
        ));
    gh.lazySingleton<_i819.GetCustomersUseCase>(
        () => _i819.GetCustomersUseCase(gh<_i874.CustomerRepository>()));
    gh.factory<_i894.BackupBloc>(() => _i894.BackupBloc(
          gh<_i105.ConnectGoogleDrive>(),
          gh<_i105.DisconnectGoogleDrive>(),
          gh<_i105.IsGoogleDriveConnected>(),
          gh<_i105.GetBackups>(),
          gh<_i105.CreateBackup>(),
          gh<_i105.RestoreBackup>(),
          gh<_i105.DeleteBackup>(),
        ));
    gh.factory<_i880.SupplierBloc>(() => _i880.SupplierBloc(
          gh<_i812.SupplierCrudUseCases>(),
          gh<_i534.SupplierQueryUseCases>(),
          gh<_i411.SupplierSearchUseCases>(),
          gh<_i534.SupplierClassificationUseCases>(),
          gh<_i534.SupplierFinancialUseCases>(),
          gh<_i534.SupplierManagementUseCases>(),
          gh<_i534.SupplierStatisticsUseCases>(),
          gh<_i534.SupplierValidationUseCases>(),
        ));
    gh.factory<_i1005.CategoriesBloc>(() => _i1005.CategoriesBloc(
          gh<_i280.GetAllCategoriesUseCase>(),
          gh<_i1025.WatchAllCategoriesUseCase>(),
          gh<_i2.GetRootCategoriesUseCase>(),
          gh<_i558.GetChildCategoriesUseCase>(),
          gh<_i461.CreateCategoryUseCase>(),
          gh<_i593.UpdateCategoryUseCase>(),
          gh<_i796.DeleteCategoryUseCase>(),
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
    gh.factory<_i189.CustomerBloc>(() => _i189.CustomerBloc(
          gh<_i819.GetCustomersUseCase>(),
          gh<_i996.WatchCustomersUseCase>(),
          gh<_i50.GetCustomerByIdUseCase>(),
          gh<_i684.SearchCustomersUseCase>(),
          gh<_i925.InsertCustomerUseCase>(),
          gh<_i445.UpdateCustomerUseCase>(),
          gh<_i502.DeleteCustomerUseCase>(),
          gh<_i503.ToggleCustomerStatusUseCase>(),
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
