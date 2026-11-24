
import '../../domain/entities/sale_details.dart';
import '../models/sale_details_model.dart';

import 'sale_mapper.dart';
import 'sale_item_mapper.dart';
import 'sale_payment_mapper.dart';

extension SaleDetailsModelMapper on SaleDetailsModel {
  SaleDetails toEntity() {
    return SaleDetails(
      sale: sale.toEntity(),
      items: items.map((e) => e.toEntity()).toList(),
      payments: payments.map((e) => e.toEntity()).toList(),
    );
  }
}
