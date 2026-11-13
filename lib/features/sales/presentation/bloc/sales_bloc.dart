
import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/sale.dart';
import '../../domain/usecases/get_sales_usecase.dart';
import '../../domain/usecases/watch_sales_usecase.dart';
import '../../domain/usecases/get_sale_details_usecase.dart';
import '../../domain/usecases/cancel_sale_usecase.dart';

import 'sales_event.dart';
import 'sales_state.dart';

@injectable
class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final GetSalesUseCase _getSalesUseCase;
  final WatchSalesUseCase _watchSalesUseCase;
  final GetSaleDetailsUseCase _getSaleDetailsUseCase;
  final CancelSaleUseCase _cancelSaleUseCase;

  StreamSubscription<List<Sale>>? _salesSubscription;

  SalesBloc(
    this._getSalesUseCase,
    this._watchSalesUseCase,
    this._getSaleDetailsUseCase,
    this._cancelSaleUseCase,
  ) : super(const SalesState()) {
    on<SalesEvent>(_onEvent);
  }

  // استقبال جميع أحداث Freezed
  Future<void> _onEvent(
    SalesEvent event,
    Emitter<SalesState> emit,
  ) async {
    switch (event) {
      case SalesLoadRequested():
        await _onLoadRequested(emit);

      case SalesWatchRequested():
        await _onWatchRequested(emit);

      case SalesWatchUpdated(:final sales):
        _onWatchUpdated(sales, emit);

      case SalesWatchFailed(:final message):
        _onWatchFailed(message, emit);

      case SalesSearchChanged(:final query):
        _onSearchChanged(query, emit);

      case SalesLimitChanged(:final limit):
        await _onLimitChanged(limit, emit);

      case SalesDetailsRequested(:final saleId):
        await _onDetailsRequested(saleId, emit);

      case SalesDetailsCleared():
        _onDetailsCleared(emit);

      case SalesCancelRequested(:final saleId):
        await _onCancelRequested(saleId, emit);

      case SalesMessagesCleared():
        _onMessagesCleared(emit);
    }
  }

  // تحميل المبيعات
  Future<void> _onLoadRequested(
    Emitter<SalesState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
      ),
    );

    try {
      final result = await _getSalesUseCase(
        limit: state.limit,
      ).run();

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: failure.toString(),
            ),
          );
        },
        (sales) {
          emit(
            state.copyWith(
              sales: sales,
              isLoading: false,
              errorMessage: null,
            ),
          );
        },
      );
    } catch (error) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // مراقبة المبيعات بشكل مباشر
  Future<void> _onWatchRequested(
    Emitter<SalesState> emit,
  ) async {
    await _salesSubscription?.cancel();

    emit(
      state.copyWith(
        isWatching: true,
        errorMessage: null,
      ),
    );

    _salesSubscription = _watchSalesUseCase(
      limit: state.limit,
    ).listen(
      (sales) {
        if (!isClosed) {
          add(SalesEvent.watchUpdated(sales));
        }
      },
      onError: (Object error) {
        if (!isClosed) {
          add(
            SalesEvent.watchFailed(error.toString()),
          );
        }
      },
    );
  }

  // تحديث القائمة عند تغير قاعدة البيانات
  void _onWatchUpdated(
    List<Sale> sales,
    Emitter<SalesState> emit,
  ) {
    emit(
      state.copyWith(
        sales: sales,
        isWatching: true,
        errorMessage: null,
      ),
    );
  }

  // خطأ المراقبة
  void _onWatchFailed(
    String message,
    Emitter<SalesState> emit,
  ) {
    emit(
      state.copyWith(
        isWatching: false,
        errorMessage: message,
      ),
    );
  }

  // البحث
  void _onSearchChanged(
    String query,
    Emitter<SalesState> emit,
  ) {
    emit(
      state.copyWith(
        searchQuery: query,
      ),
    );
  }

  // تغيير عدد النتائج
  Future<void> _onLimitChanged(
    int limit,
    Emitter<SalesState> emit,
  ) async {
    if (limit <= 0 || limit == state.limit) return;

    emit(
      state.copyWith(
        limit: limit,
      ),
    );

    await _onLoadRequested(emit);
    await _onWatchRequested(emit);
  }

  // جلب تفاصيل الفاتورة
  Future<void> _onDetailsRequested(
    int saleId,
    Emitter<SalesState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoadingDetails: true,
        selectedSale: null,
        errorMessage: null,
      ),
    );

    try {
      final result = await _getSaleDetailsUseCase(
        saleId,
      ).run();

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoadingDetails: false,
              errorMessage: failure.toString(),
            ),
          );
        },
        (sale) {
          emit(
            state.copyWith(
              selectedSale: sale,
              isLoadingDetails: false,
              errorMessage: null,
            ),
          );
        },
      );
    } catch (error) {
      emit(
        state.copyWith(
          isLoadingDetails: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // إغلاق التفاصيل
  void _onDetailsCleared(
    Emitter<SalesState> emit,
  ) {
    emit(
      state.clearSelectedSale(),
    );
  }

  // إلغاء الفاتورة
  Future<void> _onCancelRequested(
    int saleId,
    Emitter<SalesState> emit,
  ) async {
    emit(
      state.copyWith(
        isCancelling: true,
        errorMessage: null,
        successMessage: null,
      ),
    );

    try {
      final result = await _cancelSaleUseCase(
        saleId,
      ).run();

      await result.fold(
        (failure) async {
          emit(
            state.copyWith(
              isCancelling: false,
              errorMessage: failure.toString(),
            ),
          );
        },
        (success) async {
          if (!success) {
            emit(
              state.copyWith(
                isCancelling: false,
                errorMessage: 'تعذر إلغاء الفاتورة',
              ),
            );
            return;
          }

          emit(
            state.copyWith(
              isCancelling: false,
              successMessage: 'تم إلغاء الفاتورة بنجاح',
            ),
          );

          await _onLoadRequested(emit);
        },
      );
    } catch (error) {
      emit(
        state.copyWith(
          isCancelling: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  // مسح رسائل الحالة
  void _onMessagesCleared(
    Emitter<SalesState> emit,
  ) {
    emit(
      state.copyWith(
        errorMessage: null,
        successMessage: null,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _salesSubscription?.cancel();
    return super.close();
  }
}
