
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/sale.dart';
import '../../domain/entities/sale_item.dart';
import '../../domain/entities/sale_payment.dart';

part 'sales_event.freezed.dart';

@freezed
sealed class SalesEvent with _$SalesEvent {
  // مراقبة جميع الفواتير
  const factory SalesEvent.watchRequested() =
      SalesWatchRequested;

  // تحميل الفواتير مرة واحدة
  const factory SalesEvent.loadRequested() =
      SalesLoadRequested;

  // البحث
  const factory SalesEvent.searchRequested({
    required String query,
  }) = SalesSearchRequested;

  // تصفية حسب الفترة
  const factory SalesEvent.dateFilterRequested({
    required DateTime startDate,
    required DateTime endDate,
  }) = SalesDateFilterRequested;

  // الفواتير غير المدفوعة
  const factory SalesEvent.unpaidRequested() =
      SalesUnpaidRequested;

  // تصفية حسب حالة الدفع
  const factory SalesEvent.paymentStatusRequested({
    required String status,
  }) = SalesPaymentStatusRequested;

  // إحصائيات المبيعات
  const factory SalesEvent.statisticsRequested() =
      SalesStatisticsRequested;

  // إتمام البيع
  const factory SalesEvent.checkoutRequested({
    required Sale sale,
    required List<SaleItem> items,
    required List<SalePayment> payments,
  }) = SalesCheckoutRequested;

  // إعادة تحميل البيانات
  const factory SalesEvent.refreshRequested() =
      SalesRefreshRequested;
}
