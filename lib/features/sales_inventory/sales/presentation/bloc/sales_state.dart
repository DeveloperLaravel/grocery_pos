
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/sale.dart';


part 'sales_state.freezed.dart';

@freezed
abstract class SalesState with _$SalesState {
  const factory SalesState({
    @Default([]) List<Sale> sales,

    @Default(false) bool isLoading,

    @Default(false) bool isSearching,

    @Default(false) bool isCheckingOut,

    @Default(false) bool isLoadingStatistics,

    @Default(0) int salesCount,

    @Default(0.0) double totalSales,

    @Default(0.0) double totalPaid,

    @Default(0.0) double totalRemaining,

    int? lastCreatedSaleId,

    String? searchQuery,

    String? errorMessage,

    String? successMessage,
  }) = _SalesState;

  const SalesState._();
}
