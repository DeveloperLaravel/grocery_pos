
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale.freezed.dart';

@freezed
abstract class Sale with _$Sale {
  const factory Sale({
    required int id,
    required String invoiceNumber,
    int? customerId,

    @Default(0) double subtotal,
    @Default(0) double discountAmount,
    @Default(0) double taxAmount,
    @Default(0) double totalAmount,

    @Default(0) double paidAmount,
    @Default(0) double remainingAmount,

    @Default('retail') String saleType,
    @Default('cash') String paymentMethod,
    @Default('unpaid') String paymentStatus,
    @Default('completed') String status,

    String? notes,
    int? createdBy,

    required DateTime saleDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Sale;
}
