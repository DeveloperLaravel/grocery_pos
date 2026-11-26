
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/supplier.dart';

part 'supplier_event.freezed.dart';

// =============================================================
// List Filters
// =============================================================

enum SupplierListQuery {
  all,
  active,
  search,
  byCategory,
  byLevel,
  byType,
  preferred,
  withDebt,
  credit,
  paginated,
}

// =============================================================
// Stream Filters
// =============================================================

enum SupplierWatchQuery {
  all,
  active,
  search,
}

// =============================================================
// Events
// =============================================================

enum SupplierEventType {
  // Queries
  loadList,
  watchList,
  loadById,
  loadByCode,
  watchById,

  // CRUD
  insert,
  update,
  delete,
  archive,

  // Financial
  updateBalance,

  // Management
  updateRating,
  togglePreferred,
  toggleStatus,
  updateLastPurchase,
  updateLastPayment,

  // Statistics
  loadStatistics,

  // Validation
  validateCode,

  // Pagination
  loadNextPage,

  // Internal Stream Events
  streamUpdated,
  streamError,
  selectedSupplierUpdated,

  // UI
  clearError,
  clearMessages,
  clearSelection,
}

@freezed
abstract class SupplierEvent with _$SupplierEvent {
  const factory SupplierEvent({
    required SupplierEventType type,

    // Query
    SupplierListQuery? query,
    SupplierWatchQuery? watchQuery,

    // Supplier
    Supplier? supplier,
    List<Supplier>? suppliers,

    // IDs
    int? id,
    int? excludeId,

    // Pagination
    int? limit,
    int? offset,

    // Search / Filter / Code
    String? value,
    String? code,
    String? message,

    // Financial
    double? balance,

    // Rating
    double? rating,

    // Status
    bool? isPreferred,
    bool? isActive,

    // Dates
    DateTime? date,
  }) = _SupplierEvent;
}
