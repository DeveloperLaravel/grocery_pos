import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/customer.dart';

part 'customers_state.freezed.dart';

enum CustomersStatus {
  initial,
  loading,
  submitting,
  success,
  failure,
}

@freezed
abstract class CustomersState with _$CustomersState {
  const factory CustomersState({
    // =================================================
    // General
    // =================================================

    @Default(CustomersStatus.initial)
    CustomersStatus status,

    // =================================================
    // Customers
    // =================================================

    @Default([])
    List<Customer> customers,

    Customer? selectedCustomer,

    // =================================================
    // Search
    // =================================================

    @Default('')
    String searchQuery,

    // =================================================
    // Customer Code
    // =================================================

    @Default(false)
    bool isCheckingCode,

    bool? customerCodeExists,

    // =================================================
    // Statistics
    // =================================================

    @Default(0)
    int totalCustomers,

    @Default(0)
    int activeCustomers,

    // =================================================
    // Messages
    // =================================================

    String? errorMessage,

    String? successMessage,

    // =================================================
    // Stream
    // =================================================

    @Default(false)
    bool isWatching,

  }) = _CustomersState;

  const CustomersState._();

  // =====================================================
  // Helpers
  // =====================================================

  bool get isLoading => status == CustomersStatus.loading;

  bool get isSubmitting => status == CustomersStatus.submitting;

  bool get hasError => errorMessage != null;

  bool get hasCustomers => customers.isNotEmpty;

  bool get isEmpty => customers.isEmpty;

  int get inactiveCustomers =>
      totalCustomers - activeCustomers;
}