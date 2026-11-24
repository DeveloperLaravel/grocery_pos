
import 'package:freezed_annotation/freezed_annotation.dart';

import 'sale_model.dart';
import 'sale_item_model.dart';
import 'sale_payment_model.dart';

part 'sale_details_model.freezed.dart';

@freezed
abstract class SaleDetailsModel with _$SaleDetailsModel {
  const factory SaleDetailsModel({
    required SaleModel sale,
    required List<SaleItemModel> items,
    required List<SalePaymentModel> payments,
  }) = _SaleDetailsModel;
}
