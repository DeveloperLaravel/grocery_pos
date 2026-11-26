
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/customer.dart';

part 'customer_state.freezed.dart';

@freezed
abstract class CustomerState with _$CustomerState {
  const factory CustomerState({
    @Default([]) List<Customer> customers,
    Customer? selectedCustomer,

    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isDeleting,

    @Default('') String searchQuery,

    String? errorMessage,
    String? successMessage,
  }) = _CustomerState;
}
