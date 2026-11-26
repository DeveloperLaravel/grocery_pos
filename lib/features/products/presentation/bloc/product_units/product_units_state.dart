import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product/product_unit.dart';

part 'product_units_state.freezed.dart';

@freezed
abstract class ProductUnitsState with _$ProductUnitsState {
  const factory ProductUnitsState({
    @Default([]) List<ProductUnit> units,

    ProductUnit? selectedUnit,

    @Default(false) bool isLoading,

    @Default(false) bool isSaving,

    @Default(false) bool isDeleting,

    @Default(false) bool isSettingBase,

    @Default(false) bool isSettingDefault,

    @Default(false) bool isWatching,

    String? errorMessage,

    String? successMessage,
  }) = _ProductUnitsState;
}