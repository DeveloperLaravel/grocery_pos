
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/brand.dart';

part 'brand_state.freezed.dart';

enum BrandStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
abstract class BrandState with _$BrandState {
  const factory BrandState({
    // Main data
    @Default([]) List<Brand> brands,
    @Default([]) List<Brand> filteredBrands,
    Brand? selectedBrand,

    // Main status
    @Default(BrandStatus.initial) BrandStatus status,

    // Operation loading
    @Default(false) bool isCreating,
    @Default(false) bool isUpdating,
    @Default(false) bool isDeleting,
    @Default(false) bool isTogglingStatus,
    @Default(false) bool isSearching,
    @Default(false) bool isCheckingName,
    @Default(false) bool isLoadingStatistics,

    // Statistics
    @Default(0) int totalBrands,
    @Default(0) int activeBrands,

    // Search
    @Default('') String searchQuery,

    // Name validation
    bool? nameExists,

    // Messages
    String? errorMessage,
    String? successMessage,
  }) = _BrandState;
}
