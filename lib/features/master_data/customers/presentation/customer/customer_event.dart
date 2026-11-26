
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/customer.dart';

part 'customer_event.freezed.dart';

@freezed
sealed class CustomerEvent with _$CustomerEvent {
  // تحميل جميع العملاء
  const factory CustomerEvent.loadCustomers() = LoadCustomers;

  // مراقبة العملاء لحظياً
  const factory CustomerEvent.watchCustomers() = WatchCustomers;

  // جلب عميل بواسطة ID
  const factory CustomerEvent.getCustomerById(int id) = GetCustomerById;

  // البحث
  const factory CustomerEvent.searchCustomers(String query) =
      SearchCustomers;

  // إضافة عميل
  const factory CustomerEvent.insertCustomer(Customer customer) =
      InsertCustomer;

  // تعديل عميل
  const factory CustomerEvent.updateCustomer(Customer customer) =
      UpdateCustomer;

  // حذف عميل
  const factory CustomerEvent.deleteCustomer(int id) = DeleteCustomer;

  // تفعيل أو تعطيل عميل
  const factory CustomerEvent.toggleCustomerStatus({
    required int id,
    required bool isActive,
  }) = ToggleCustomerStatus;

  // تحديث القائمة عند وصول بيانات جديدة من Stream
  const factory CustomerEvent.customersUpdated(
    List<Customer> customers,
  ) = CustomersUpdated;

  // معالجة أخطاء Stream
  const factory CustomerEvent.watchError(String message) = WatchError;
}
