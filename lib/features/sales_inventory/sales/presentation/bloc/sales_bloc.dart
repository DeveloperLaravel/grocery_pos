
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';



import '../../domain/usecases/checkout/complete_sale_usecase.dart';
import '../../domain/usecases/sales_usecases.dart' hide CompleteSaleUseCase;
import 'sales_event.dart';
import 'sales_state.dart';

@injectable
class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final SalesUseCases _salesUseCases;
  final SalesStatisticsUseCase _statisticsUseCase;
  final CompleteSaleUseCase _completeSaleUseCase;

  StreamSubscription? _salesSubscription;

  SalesBloc(
    this._salesUseCases,
    this._statisticsUseCase,
    this._completeSaleUseCase,
  ) : super(const SalesState()) {

    on<SalesWatchRequested>(_onWatchRequested);
    on<SalesLoadRequested>(_onLoadRequested);
    on<SalesSearchRequested>(_onSearchRequested);
    on<SalesDateFilterRequested>(_onDateFilterRequested);
    on<SalesUnpaidRequested>(_onUnpaidRequested);
    on<SalesPaymentStatusRequested>(
      _onPaymentStatusRequested,
    );
    on<SalesStatisticsRequested>(_onStatisticsRequested);
    on<SalesCheckoutRequested>(_onCheckoutRequested);
    on<SalesRefreshRequested>(_onRefreshRequested);
  }

  // =====================================================
  // Watch All Sales
  // =====================================================

  Future<void> _onWatchRequested(
    SalesWatchRequested event,
    Emitter<SalesState> emit,
  ) async {
    await _salesSubscription?.cancel();

    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    _salesSubscription = _salesUseCases.watchAll().listen(
      (sales) {
        add(const SalesEvent.loadRequested());

        // لا تستخدم loadRequested هنا لتحديث القائمة،
        // لأن ذلك سيجلب البيانات مرة أخرى.
      },
      onError: (error) {
        add(const SalesEvent.refreshRequested());
      },
    );

    // تحديث القائمة من نتائج Stream مباشرة
    // يتم استخدام listener منفصل في النسخة المصححة أدناه.
  }

  // =====================================================
  // Load Sales
  // =====================================================

  Future<void> _onLoadRequested(
    SalesLoadRequested event,
    Emitter<SalesState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    try {
      final sales = await _salesUseCases.getAll();

      emit(state.copyWith(
        sales: sales,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =====================================================
  // Search
  // =====================================================

  Future<void> _onSearchRequested(
    SalesSearchRequested event,
    Emitter<SalesState> emit,
  ) async {
    emit(state.copyWith(
      isSearching: true,
      searchQuery: event.query,
      errorMessage: null,
    ));

    try {
      final sales = event.query.trim().isEmpty
          ? await _salesUseCases.getAll()
          : await _salesUseCases.search(event.query.trim());

      emit(state.copyWith(
        sales: sales,
        isSearching: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isSearching: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =====================================================
  // Date Filter
  // =====================================================

  Future<void> _onDateFilterRequested(
    SalesDateFilterRequested event,
    Emitter<SalesState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    try {
      final sales = await _salesUseCases.getBetween(
        event.startDate,
        event.endDate,
      );

      emit(state.copyWith(
        sales: sales,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =====================================================
  // Unpaid Sales
  // =====================================================

  Future<void> _onUnpaidRequested(
    SalesUnpaidRequested event,
    Emitter<SalesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final sales = await _salesUseCases.getUnpaid();

      emit(state.copyWith(
        sales: sales,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =====================================================
  // Payment Status
  // =====================================================

  Future<void> _onPaymentStatusRequested(
    SalesPaymentStatusRequested event,
    Emitter<SalesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final sales = await _salesUseCases.getByPaymentStatus(
        event.status,
      );

      emit(state.copyWith(
        sales: sales,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =====================================================
  // Statistics
  // =====================================================

  Future<void> _onStatisticsRequested(
    SalesStatisticsRequested event,
    Emitter<SalesState> emit,
  ) async {
    emit(state.copyWith(
      isLoadingStatistics: true,
    ));

    try {
      final results = await Future.wait([
        _statisticsUseCase.getCount(),
        _statisticsUseCase.getTotalSales(),
        _statisticsUseCase.getTotalPaid(),
        _statisticsUseCase.getTotalRemaining(),
      ]);

      emit(state.copyWith(
        salesCount: results[0] as int,
        totalSales: results[1] as double,
        totalPaid: results[2] as double,
        totalRemaining: results[3] as double,
        isLoadingStatistics: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingStatistics: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =====================================================
  // Checkout
  // =====================================================

  Future<void> _onCheckoutRequested(
    SalesCheckoutRequested event,
    Emitter<SalesState> emit,
  ) async {
    emit(state.copyWith(
      isCheckingOut: true,
      errorMessage: null,
      successMessage: null,
      lastCreatedSaleId: null,
    ));

    try {
      final saleId = await _completeSaleUseCase(
        sale: event.sale,
        items: event.items,
        payments: event.payments,
      );

      emit(state.copyWith(
        isCheckingOut: false,
        lastCreatedSaleId: saleId,
        successMessage: 'تم إتمام عملية البيع بنجاح',
      ));

      add(const SalesEvent.statisticsRequested());
    } catch (e) {
      emit(state.copyWith(
        isCheckingOut: false,
        errorMessage: e.toString(),
      ));
    }
  }

  // =====================================================
  // Refresh
  // =====================================================

  Future<void> _onRefreshRequested(
    SalesRefreshRequested event,
    Emitter<SalesState> emit,
  ) async {
    add(const SalesEvent.loadRequested());
    add(const SalesEvent.statisticsRequested());
  }

  @override
  Future<void> close() async {
    await _salesSubscription?.cancel();
    return super.close();
  }
}
