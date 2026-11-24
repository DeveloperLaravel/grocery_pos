import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../domain/entities/customer.dart';
import '../../domain/usecases/customers_usecases.dart';
import 'customers_event.dart';
import 'customers_state.dart';

@injectable
class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  final CustomersUseCases useCases;

  StreamSubscription<List<Customer>>? _customersSubscription;

  StreamSubscription<Customer?>? _customerSubscription;

  CustomersBloc(this.useCases) : super(const CustomersState()) {
    // ===================================================
    // LOAD CUSTOMERS
    // ===================================================

    on<CustomersLoadRequested>(
      _onLoadRequested,
      transformer: droppable(),
    );

    // ===================================================
    // SEARCH CUSTOMERS
    // ===================================================

    on<CustomersSearchRequested>(
      _onSearchRequested,
      transformer: restartable(),
    );

    // ===================================================
    // WATCH CUSTOMERS
    // ===================================================

    on<CustomersWatchRequested>(
      _onWatchRequested,
    );

    on<CustomersStreamUpdated>(
      _onStreamUpdated,
    );

    // ===================================================
    // GET CUSTOMER BY ID
    // ===================================================

    on<CustomersByIdRequested>(
      _onCustomerByIdRequested,
    );

    on<CustomersCustomerStreamUpdated>(
      _onCustomerStreamUpdated,
    );

    // ===================================================
    // GET CUSTOMER BY CODE
    // ===================================================

    on<CustomersByCodeRequested>(
      _onCustomerByCodeRequested,
    );

    // ===================================================
    // CHECK CUSTOMER CODE
    // ===================================================

    on<CustomersCheckCodeRequested>(
      _onCheckCodeRequested,
    );

    // ===================================================
    // CREATE CUSTOMER
    // ===================================================

    on<CustomersCreateRequested>(
      _onCreateRequested,
      transformer: droppable(),
    );

    // ===================================================
    // UPDATE CUSTOMER
    // ===================================================

    on<CustomersUpdateRequested>(
      _onUpdateRequested,
      transformer: droppable(),
    );

    // ===================================================
    // ACTIVATE CUSTOMER
    // ===================================================

    on<CustomersActivateRequested>(
      _onActivateRequested,
    );

    // ===================================================
    // DEACTIVATE CUSTOMER
    // ===================================================

    on<CustomersDeactivateRequested>(
      _onDeactivateRequested,
    );

    // ===================================================
    // DELETE CUSTOMER
    // ===================================================

    on<CustomersDeleteRequested>(
      _onDeleteRequested,
      transformer: droppable(),
    );

    // ===================================================
    // COUNTS
    // ===================================================

    on<CustomersCountsRequested>(
      _onCountsRequested,
    );

    // ===================================================
    // CLEAR MESSAGES
    // ===================================================

    on<CustomersClearMessagesRequested>(
      _onClearMessagesRequested,
    );
  }

  // =====================================================
  // LOAD CUSTOMERS
  // =====================================================

  Future<void> _onLoadRequested(
    CustomersLoadRequested event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CustomersStatus.loading,
        errorMessage: null,
        successMessage: null,
      ),
    );

    try {
      final customers = event.activeOnly
          ? await useCases.getActiveCustomers()
          : await useCases.getAllCustomers();

      final counts = await _getCounts();

      emit(
        state.copyWith(
          status: CustomersStatus.success,
          customers: customers,
          totalCustomers: counts.$1,
          activeCustomers: counts.$2,
          searchQuery: '',
          isWatching: false,
          errorMessage: null,
        ),
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // SEARCH CUSTOMERS
  // =====================================================

  Future<void> _onSearchRequested(
    CustomersSearchRequested event,
    Emitter<CustomersState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(state.copyWith(searchQuery: ''));
      add(const CustomersEvent.loadRequested());
      return;
    }

    emit(
      state.copyWith(
        status: CustomersStatus.loading,
        searchQuery: query,
        errorMessage: null,
      ),
    );

    try {
      final customers = await useCases.searchCustomers(query);

      emit(
        state.copyWith(
          status: CustomersStatus.success,
          customers: customers,
          searchQuery: query,
          errorMessage: null,
        ),
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // WATCH CUSTOMERS
  // =====================================================

  Future<void> _onWatchRequested(
    CustomersWatchRequested event,
    Emitter<CustomersState> emit,
  ) async {
    await _customersSubscription?.cancel();

    final query = event.query?.trim();

    try {
      final Stream<List<Customer>> stream;

      if (query != null && query.isNotEmpty) {
        stream = useCases.watchSearchCustomers(query);
      } else if (event.activeOnly) {
        stream = useCases.watchActiveCustomers();
      } else {
        stream = useCases.watchAllCustomers();
      }

      emit(
        state.copyWith(
          isWatching: true,
          searchQuery: query ?? '',
          errorMessage: null,
        ),
      );

      _customersSubscription = stream.listen(
        (customers) {
          if (!isClosed) {
            add(
              CustomersEvent.streamUpdated(customers),
            );
          }
        },
        onError: (Object error) {
          if (!isClosed) {
            addError(error);
          }
        },
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // STREAM UPDATED
  // =====================================================

  Future<void> _onStreamUpdated(
    CustomersStreamUpdated event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CustomersStatus.success,
        customers: event.customers,
        errorMessage: null,
      ),
    );

    await _refreshCounts(emit);
  }

  // =====================================================
  // GET CUSTOMER BY ID
  // =====================================================

  Future<void> _onCustomerByIdRequested(
    CustomersByIdRequested event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CustomersStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      final customer = await useCases.getCustomerById(event.id);

      emit(
        state.copyWith(
          status: CustomersStatus.success,
          selectedCustomer: customer,
          errorMessage: null,
        ),
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // WATCH CUSTOMER BY ID
  // =====================================================

  Future<void> watchCustomerById(int id) async {
    await _customerSubscription?.cancel();

    _customerSubscription = useCases.watchCustomerById(id).listen(
      (customer) {
        if (!isClosed) {
          add(
            CustomersEvent.customerStreamUpdated(customer),
          );
        }
      },
      onError: (Object error, StackTrace stackTrace) {
        if (!isClosed) {
          addError(error, stackTrace);
        }
      },
    );
  }

  Future<void> _onCustomerStreamUpdated(
    CustomersCustomerStreamUpdated event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedCustomer: event.customer,
        status: CustomersStatus.success,
      ),
    );
  }

  // =====================================================
  // GET CUSTOMER BY CODE
  // =====================================================

  Future<void> _onCustomerByCodeRequested(
    CustomersByCodeRequested event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CustomersStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      final customer = await useCases.getCustomerByCode(
        event.code.trim(),
      );

      emit(
        state.copyWith(
          status: CustomersStatus.success,
          selectedCustomer: customer,
          errorMessage: null,
        ),
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // CHECK CUSTOMER CODE
  // =====================================================

  Future<void> _onCheckCodeRequested(
    CustomersCheckCodeRequested event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        isCheckingCode: true,
        customerCodeExists: null,
        errorMessage: null,
      ),
    );

    try {
      final exists = await useCases.isCustomerCodeExists(
        event.code.trim(),
        excludedId: event.excludedId,
      );

      emit(
        state.copyWith(
          isCheckingCode: false,
          customerCodeExists: exists,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          isCheckingCode: false,
          errorMessage: _errorMessage(error),
        ),
      );
    }
  }

  // =====================================================
  // CREATE CUSTOMER
  // =====================================================

  Future<void> _onCreateRequested(
    CustomersCreateRequested event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CustomersStatus.submitting,
        errorMessage: null,
        successMessage: null,
      ),
    );

    try {
      final id = await useCases.insertCustomer(event.customer);

      final customer = await useCases.getCustomerById(id);

      final counts = await _getCounts();

      final customers = await _getCurrentCustomers();

      emit(
        state.copyWith(
          status: CustomersStatus.success,
          customers: customers,
          selectedCustomer: customer,
          totalCustomers: counts.$1,
          activeCustomers: counts.$2,
          successMessage: 'تمت إضافة العميل بنجاح',
          errorMessage: null,
        ),
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // UPDATE CUSTOMER
  // =====================================================

  Future<void> _onUpdateRequested(
    CustomersUpdateRequested event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CustomersStatus.submitting,
        errorMessage: null,
        successMessage: null,
      ),
    );

    try {
      await useCases.updateCustomer(
        event.id,
        event.customer,
      );

      final customer = await useCases.getCustomerById(event.id);

      final customers = await _getCurrentCustomers();

      emit(
        state.copyWith(
          status: CustomersStatus.success,
          customers: customers,
          selectedCustomer: customer,
          successMessage: 'تم تحديث بيانات العميل بنجاح',
          errorMessage: null,
        ),
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // ACTIVATE CUSTOMER
  // =====================================================

  Future<void> _onActivateRequested(
    CustomersActivateRequested event,
    Emitter<CustomersState> emit,
  ) async {
    try {
      await useCases.activateCustomer(event.id);

      await _refreshCustomers(emit);

      emit(
        state.copyWith(
          status: CustomersStatus.success,
          successMessage: 'تم تفعيل العميل بنجاح',
          errorMessage: null,
        ),
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // DEACTIVATE CUSTOMER
  // =====================================================

  Future<void> _onDeactivateRequested(
    CustomersDeactivateRequested event,
    Emitter<CustomersState> emit,
  ) async {
    try {
      await useCases.deactivateCustomer(event.id);

      await _refreshCustomers(emit);

      emit(
        state.copyWith(
          status: CustomersStatus.success,
          successMessage: 'تم إيقاف العميل بنجاح',
          errorMessage: null,
        ),
      );
    } catch (error) {
      _emitError(emit, error);
    }
  }

  // =====================================================
  // DELETE CUSTOMER
  // =====================================================

  Future<void> _onDeleteRequested(
    CustomersDeleteRequested event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CustomersStatus.submitting,
        errorMessage: null,
        successMessage: null,
      ),
    );

    try {
      await useCases.deleteCustomerPermanently(event.id);

      final customers = await _getCurrentCustomers();
      final counts = await _getCounts();

      emit(
        state.copyWith(
          status: CustomersStatus.success,
          customers: customers,
          selectedCustomer:
              state.selectedCustomer?.id == event.id
                  ? null
                  : state.selectedCustomer,
          totalCustomers: counts.$1,
          activeCustomers: counts.$2,
          successMessage: 'تم حذف العميل بنجاح',
          errorMessage: null,
        ),
      );
    } catch (error) {
      _emitError(
        emit,
        'تعذر حذف العميل. قد يكون مرتبطًا بفواتير أو سجلات أخرى. $error',
      );
    }
  }

  // =====================================================
  // COUNTS
  // =====================================================

  Future<void> _onCountsRequested(
    CustomersCountsRequested event,
    Emitter<CustomersState> emit,
  ) async {
    await _refreshCounts(emit);
  }

  // =====================================================
  // CLEAR MESSAGES
  // =====================================================

  void _onClearMessagesRequested(
    CustomersClearMessagesRequested event,
    Emitter<CustomersState> emit,
  ) {
    emit(
      state.copyWith(
        errorMessage: null,
        successMessage: null,
      ),
    );
  }

  // =====================================================
  // HELPERS
  // =====================================================

  Future<(int, int)> _getCounts() async {
    final total = await useCases.getCustomersCount();

    final active = await useCases.getActiveCustomersCount();

    return (total, active);
  }

  Future<void> _refreshCounts(
    Emitter<CustomersState> emit,
  ) async {
    try {
      final counts = await _getCounts();

      emit(
        state.copyWith(
          totalCustomers: counts.$1,
          activeCustomers: counts.$2,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          errorMessage: _errorMessage(error),
        ),
      );
    }
  }

  Future<void> _refreshCustomers(
    Emitter<CustomersState> emit,
  ) async {
    final customers = await _getCurrentCustomers();
    final counts = await _getCounts();

    emit(
      state.copyWith(
        customers: customers,
        totalCustomers: counts.$1,
        activeCustomers: counts.$2,
      ),
    );
  }

  Future<List<Customer>> _getCurrentCustomers() {
    final query = state.searchQuery.trim();

    if (query.isNotEmpty) {
      return useCases.searchCustomers(query);
    }

    return useCases.getAllCustomers();
  }

  void _emitError(
    Emitter<CustomersState> emit,
    Object error,
  ) {
    emit(
      state.copyWith(
        status: CustomersStatus.failure,
        errorMessage: _errorMessage(error),
      ),
    );
  }

  String _errorMessage(Object error) {
    return error.toString().replaceFirst('Exception: ', '');
  }

  // =====================================================
  // CLOSE
  // =====================================================

  @override
  Future<void> close() async {
    await _customersSubscription?.cancel();
    await _customerSubscription?.cancel();

    return super.close();
  }
}