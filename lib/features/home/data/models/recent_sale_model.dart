
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_sale_model.freezed.dart';

@freezed
abstract class RecentSaleModel with _$RecentSaleModel {
  const factory RecentSaleModel({
    required int id,
    required String invoiceNumber,
    required double total,
    required double paidAmount,
    required String paymentMethod,
    required DateTime createdAt,
  }) = _RecentSaleModel;
}
