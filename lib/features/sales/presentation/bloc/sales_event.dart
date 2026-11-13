
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/sale.dart';

part 'sales_event.freezed.dart';

@freezed
sealed class SalesEvent with _$SalesEvent {
  // تحميل قائمة المبيعات
  const factory SalesEvent.loadRequested() = SalesLoadRequested;

  // بدء مراقبة المبيعات
  const factory SalesEvent.watchRequested() = SalesWatchRequested;

  // وصول تحديث من قاعدة البيانات
  const factory SalesEvent.watchUpdated(
    List<Sale> sales,
  ) = SalesWatchUpdated;

  // فشل مراقبة المبيعات
  const factory SalesEvent.watchFailed(
    String message,
  ) = SalesWatchFailed;

  // البحث
  const factory SalesEvent.searchChanged(
    String query,
  ) = SalesSearchChanged;

  // تغيير عدد النتائج
  const factory SalesEvent.limitChanged(
    int limit,
  ) = SalesLimitChanged;

  // طلب تفاصيل فاتورة
  const factory SalesEvent.detailsRequested(
    int saleId,
  ) = SalesDetailsRequested;

  // إغلاق التفاصيل
  const factory SalesEvent.detailsCleared() = SalesDetailsCleared;

  // إلغاء فاتورة
  const factory SalesEvent.cancelRequested(
    int saleId,
  ) = SalesCancelRequested;

  // مسح رسائل النجاح والخطأ
  const factory SalesEvent.messagesCleared() = SalesMessagesCleared;
}
