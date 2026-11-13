import 'package:injectable/injectable.dart';

import '../../features/sales/domain/repositories/sales_repository.dart';

import '../../features/sales/domain/usecases/create_sale_usecase.dart';
import '../../features/sales/domain/usecases/get_sales_usecase.dart';
import '../../features/sales/domain/usecases/get_sale_details_usecase.dart';
import '../../features/sales/domain/usecases/watch_sales_usecase.dart';

@module
abstract class SalesModule {
  @lazySingleton
  CreateSaleUseCase createSaleUseCase(
    SalesRepository repository,
  ) => CreateSaleUseCase(repository);

  @lazySingleton
  GetSalesUseCase getSalesUseCase(
    SalesRepository repository,
  ) => GetSalesUseCase(repository);

  @lazySingleton
  GetSaleDetailsUseCase getSaleDetailsUseCase(
    SalesRepository repository,
  ) => GetSaleDetailsUseCase(repository);

  @lazySingleton
  WatchSalesUseCase watchSalesUseCase(
    SalesRepository repository,
  ) => WatchSalesUseCase(repository);
}