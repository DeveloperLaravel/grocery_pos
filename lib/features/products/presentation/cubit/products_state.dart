
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'products_state.freezed.dart';

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default([]) List<Product> products,

    @Default(false) bool isLoading,

    @Default(false) bool isSaving,

    @Default('') String searchQuery,

    String? errorMessage,

    String? successMessage,
  }) = _ProductsState;
}
