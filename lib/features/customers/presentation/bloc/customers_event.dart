import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/customer.dart';


part 'customers_event.freezed.dart';

@freezed
abstract class CustomersEvent with _$CustomersEvent {
  // =====================================================
  // LOAD
  // =====================================================

  const factory CustomersEvent.loadRequested({
    @Default(false) bool activeOnly,
  }) = CustomersLoadRequested;

  // =====================================================
  // SEARCH
  // =====================================================

  const factory CustomersEvent.searchRequested(
    String query,
  ) = CustomersSearchRequested;

  // =====================================================
  // WATCH LIST
  // =====================================================

  const factory CustomersEvent.watchRequested({
    String? query,
    @Default(false) bool activeOnly,
  }) = CustomersWatchRequested;

  const factory CustomersEvent.streamUpdated(
    List<Customer> customers,
  ) = CustomersStreamUpdated;

  // =====================================================
  // GET CUSTOMER
  // =====================================================

  const factory CustomersEvent.customerByIdRequested(
    int id,
  ) = CustomersByIdRequested;

  const factory CustomersEvent.customerStreamUpdated(
    Customer? customer,
  ) = CustomersCustomerStreamUpdated;

  // =====================================================
  // GET CUSTOMER BY CODE
  // =====================================================

  const factory CustomersEvent.customerByCodeRequested(
    String code,
  ) = CustomersByCodeRequested;

  // =====================================================
  // CHECK CODE
  // =====================================================

  const factory CustomersEvent.checkCodeRequested({
    required String code,
    int? excludedId,
  }) = CustomersCheckCodeRequested;

  // =====================================================
  // CREATE
  // =====================================================

  const factory CustomersEvent.createRequested(
    Customer customer,
  ) = CustomersCreateRequested;

  // =====================================================
  // UPDATE
  // =====================================================

  const factory CustomersEvent.updateRequested({
    required int id,
    required Customer customer,
  }) = CustomersUpdateRequested;

  // =====================================================
  // ACTIVATE
  // =====================================================

  const factory CustomersEvent.activateRequested(
    int id,
  ) = CustomersActivateRequested;

  // =====================================================
  // DEACTIVATE
  // =====================================================

  const factory CustomersEvent.deactivateRequested(
    int id,
  ) = CustomersDeactivateRequested;

  // =====================================================
  // DELETE
  // =====================================================

  const factory CustomersEvent.deleteRequested(
    int id,
  ) = CustomersDeleteRequested;

  // =====================================================
  // COUNTS
  // =====================================================

  const factory CustomersEvent.countsRequested() =
      CustomersCountsRequested;

  // =====================================================
  // MESSAGES
  // =====================================================

  const factory CustomersEvent.clearMessages() =
      CustomersClearMessagesRequested;
}