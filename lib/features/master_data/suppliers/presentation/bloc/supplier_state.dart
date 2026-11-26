
import 'package:freezed_annotation/freezed_annotation.dart';


import '../../domain/entities/supplier.dart';
import '../../domain/usecases/supplier_usecases.dart';
import 'supplier_event.dart';

part 'supplier_state.freezed.dart';

@freezed
abstract class SupplierState with _$SupplierState {
  const factory SupplierState({
    // =========================================================
    // Suppliers
    // =========================================================

    @Default([]) List<Supplier> suppliers,

    Supplier? selectedSupplier,

    // =========================================================
    // Current Query
    // =========================================================

    SupplierListQuery? currentQuery,

    SupplierWatchQuery? currentWatchQuery,

    @Default('') String currentSearchQuery,

    // =========================================================
    // Loading States
    // =========================================================

    @Default(false) bool isLoading,

    @Default(false) bool isSubmitting,

    @Default(false) bool isDeleting,

    @Default(false) bool isSearching,

    @Default(false) bool isWatching,

    @Default(false) bool isLoadingDetails,

    @Default(false) bool isLoadingMore,

    // =========================================================
    // Financial States
    // =========================================================

    @Default(false) bool isUpdatingBalance,

    // =========================================================
    // Management States
    // =========================================================

    @Default(false) bool isUpdatingRating,

    @Default(false) bool isUpdatingStatus,

    @Default(false) bool isUpdatingPreferred,

    @Default(false) bool isUpdatingActivityDate,

    // =========================================================
    // Validation
    // =========================================================

    @Default(false) bool isValidatingCode,

    bool? supplierCodeExists,

    // =========================================================
    // Statistics
    // =========================================================

    SupplierStatistics? statistics,

    @Default(0) int totalSuppliers,

    @Default(0) int activeSuppliers,

    @Default(0.0) double totalBalance,

    // =========================================================
    // Pagination
    // =========================================================

    @Default(20) int pageSize,

    @Default(0) int currentOffset,

    @Default(false) bool hasMore,

    // =========================================================
    // Messages
    // =========================================================

    String? errorMessage,

    String? successMessage,
  }) = _SupplierState;
}
