import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/parties/brand.dart';

part 'brands_state.freezed.dart';

@freezed
abstract class BrandsState with _$BrandsState {
  const factory BrandsState({
    @Default([]) List<Brand> brands,

    @Default(false) bool isLoading,

    @Default(false) bool isOperationInProgress,

    @Default(false) bool isWatching,

    String? errorMessage,

    String? successMessage,
  }) = _BrandsState;

  const BrandsState._();

  bool get hasBrands => brands.isNotEmpty;

  bool get isEmpty => brands.isEmpty;

  int get totalBrands => brands.length;

  int get activeBrands =>
      brands.where((brand) => brand.isActive).length;

  int get inactiveBrands =>
      brands.where((brand) => !brand.isActive).length;
}