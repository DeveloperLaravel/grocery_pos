
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_payment.freezed.dart';

@freezed
abstract class SalePayment with _$SalePayment {
  const factory SalePayment({
    required int id,
    required int saleId,

    required double amount,
    required String paymentMethod,

    String? transactionReference,
    String? notes,

    required DateTime paymentDate,
    required DateTime createdAt,
  }) = _SalePayment;
}
