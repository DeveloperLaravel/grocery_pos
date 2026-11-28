
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_barcode_model.freezed.dart';
part 'product_barcode_model.g.dart';

@freezed
abstract class ProductBarcodeModel with _$ProductBarcodeModel {
  const factory ProductBarcodeModel({
    required int id,
    required int productId,
    int? productUnitId,
    required String barcode,
    required String barcodeType,
    String? source,
    required bool isDefault,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductBarcodeModel;

  factory ProductBarcodeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductBarcodeModelFromJson(json);
}
