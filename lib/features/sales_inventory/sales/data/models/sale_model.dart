
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_model.freezed.dart';

@freezed
abstract class SaleModel with _$SaleModel {
  const factory SaleModel({
    required int id,
    required String invoiceNumber,
    int? customerId,
    required double subtotal,
    required double discountAmount,
    required double taxAmount,
    required double totalAmount,
    required double paidAmount,
    required double remainingAmount,
    required String saleType,
    required String paymentMethod,
    required String paymentStatus,
    required String status,
    String? notes,
    int? createdBy,
    required DateTime saleDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SaleModel;
}
