
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/sale.dart';

part 'sales_state.freezed.dart';

@freezed
abstract class SalesState with _$SalesState {
  const SalesState._();

  const factory SalesState({
    @Default([]) List<Sale> sales,

    Sale? selectedSale,

    @Default('') String searchQuery,

    @Default(100) int limit,

    @Default(false) bool isLoading,

    @Default(false) bool isWatching,

    @Default(false) bool isLoadingDetails,

    @Default(false) bool isCancelling,

    String? errorMessage,

    String? successMessage,
  }) = _SalesState;

  // نتائج البحث
  List<Sale> get filteredSales {
    final query = searchQuery.trim().toLowerCase();

    if (query.isEmpty) {
      return sales;
    }

    return sales.where((sale) {
      return sale.invoiceNumber
          .toString()
          .toLowerCase()
          .contains(query);
    }).toList();
  }

  // عدد الفواتير
  int get totalSales => filteredSales.length;

  // إجمالي المبيعات
  double get totalAmount {
    return filteredSales.fold(
      0.0,
      (sum, sale) => sum + sale.total,
    );
  }

  // إجمالي المبالغ المدفوعة
  double get totalPaid {
    return filteredSales.fold(
      0.0,
      (sum, sale) => sum + sale.paidAmount,
    );
  }

  // إجمالي المتبقي
  double get totalRemaining {
    return filteredSales.fold(
      0.0,
      (sum, sale) {
        final remaining = sale.total - sale.paidAmount;
        return sum + (remaining > 0 ? remaining : 0);
      },
    );
  }

  // مسح الفاتورة المحددة
  SalesState clearSelectedSale() {
    return copyWith(selectedSale: null);
  }
}
