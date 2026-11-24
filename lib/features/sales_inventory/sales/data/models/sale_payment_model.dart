
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_payment_model.freezed.dart';

@freezed
abstract class SalePaymentModel with _$SalePaymentModel {
  const factory SalePaymentModel({
    required int id,
    required int saleId,
    required double amount,
    required String paymentMethod,
    String? transactionReference,
    String? notes,
    required DateTime paymentDate,
    required DateTime createdAt,
  }) = _SalePaymentModel;
}
