import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/supplier.dart';

part 'supplier_model.freezed.dart';

@freezed
abstract class SupplierModel with _$SupplierModel {
  const SupplierModel._();

  const factory SupplierModel({
    required Supplier supplier,
  }) = _SupplierModel;

  factory SupplierModel.fromEntity(Supplier entity) {
    return SupplierModel(supplier: entity);
  }

  Supplier toEntity() => supplier;
}