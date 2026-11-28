import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product/product_unit.dart';


part 'product_units_event.freezed.dart';

@freezed
sealed class ProductUnitsEvent with _$ProductUnitsEvent {
  // جلب الوحدات
  const factory ProductUnitsEvent.load({
    required int productId,
  }) = LoadProductUnits;

  // مراقبة الوحدات
  const factory ProductUnitsEvent.watch({
    required int productId,
  }) = WatchProductUnits;

  // استقبال التحديثات من Stream
  const factory ProductUnitsEvent.unitsChanged({
    required List<ProductUnit> units,
  }) = ProductUnitsChanged;

  // جلب وحدة بواسطة ID
  const factory ProductUnitsEvent.getById({
    required int id,
  }) = GetProductUnitById;

  // إضافة وحدة
  const factory ProductUnitsEvent.create({
    required ProductUnit unit,
  }) = CreateProductUnit;

  // تعديل وحدة
  const factory ProductUnitsEvent.update({
    required int id,
    required ProductUnit unit,
  }) = UpdateProductUnit;

  // تعيين وحدة الأساس
  const factory ProductUnitsEvent.setBase({
    required int productId,
    required int unitId,
  }) = SetBaseProductUnit;

  // تعيين الوحدة الافتراضية
  const factory ProductUnitsEvent.setDefault({
    required int productId,
    required int unitId,
  }) = SetDefaultProductUnit;

  // حذف وحدة
  const factory ProductUnitsEvent.delete({
    required int id,
  }) = DeleteProductUnit;

  // مسح رسائل الحالة
  const factory ProductUnitsEvent.clearMessages() = ClearProductUnitMessages;
}