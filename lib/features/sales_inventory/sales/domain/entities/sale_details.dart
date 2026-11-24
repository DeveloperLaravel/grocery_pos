
import 'package:freezed_annotation/freezed_annotation.dart';

import 'sale.dart';
import 'sale_item.dart';
import 'sale_payment.dart';

part 'sale_details.freezed.dart';

@freezed
abstract class SaleDetails with _$SaleDetails {
  const factory SaleDetails({
    required Sale sale,
    @Default([]) List<SaleItem> items,
    @Default([]) List<SalePayment> payments,
  }) = _SaleDetails;
}
