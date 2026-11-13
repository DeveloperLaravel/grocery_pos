import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';

import '../../domain/entities/cart_item.dart';
import '../../domain/entities/sale.dart';

import '../../domain/repositories/sales_repository.dart';

import '../database/sales_local_data_source.dart';
import '../mappers/sale_mapper.dart';

@LazySingleton(as: SalesRepository)
class SalesRepositoryImpl implements SalesRepository {
  final SalesLocalDataSource _localDataSource;

  SalesRepositoryImpl(this._localDataSource);

  Failure _mapFailure(
    Object error,
    StackTrace stackTrace,
  ) {
    if (error is ArgumentError || error is StateError) {
      return ValidationFailure(
        error.toString(),
        error,
        stackTrace,
      );
    }

    if (error is Failure) {
      return error;
    }

    return DatabaseFailure(
      'حدث خطأ أثناء التعامل مع بيانات المبيعات.',
      error,
      stackTrace,
    );
  }

  @override
  TaskEither<Failure, Sale> createSale({
    required List<CartItem> items,
    required double discount,
    required double paidAmount,
    required String paymentMethod,
  }) {
    return TaskEither.tryCatch(
      () async {
        final model = await _localDataSource.createSale(
          items: items,
          discount: discount,
          paidAmount: paidAmount,
          paymentMethod: paymentMethod,
        );

        return SaleMapper.toEntity(model);
      },
      _mapFailure,
    );
  }
  @override
  TaskEither<Failure, bool> cancelSale(int saleId) {
    return TaskEither(() async {
      try {
        if (saleId <= 0) {
          return Left<Failure, bool>(
            const ValidationFailure(
              'رقم الفاتورة غير صالح.',
            ),
          );
        }

        final cancelled = await _localDataSource.cancelSale(
          saleId,
        );

        return Right<Failure, bool>(cancelled);
      } catch (error, stackTrace) {
        return Left<Failure, bool>(
          _mapFailure(error, stackTrace),
        );
      }
    });
  }
  @override
  TaskEither<Failure, List<Sale>> getSales({
    int limit = 100,
  }) {
    return TaskEither.tryCatch(
      () async {
        final models = await _localDataSource.getSales(
          limit: limit,
        );

        return models
            .map(SaleMapper.toEntity)
            .toList();
      },
      _mapFailure,
    );
  }

  @override
  TaskEither<Failure, Sale> getSaleDetails(int saleId) {
    return TaskEither.tryCatch(
      () async {
        final model = await _localDataSource.getSaleDetails(
          saleId,
        );

        if (model == null) {
          throw StateError('الفاتورة غير موجودة.');
        }

        return SaleMapper.toEntity(model);
      },
      _mapFailure,
    );
  }

  @override
  Stream<List<Sale>> watchSales({
    int limit = 100,
  }) {
    return _localDataSource.watchSales(limit: limit).map(
      (models) {
        return models
            .map(SaleMapper.toEntity)
            .toList();
      },
    );
  }
}