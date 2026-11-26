import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product/product_image.dart';

part 'product_images_state.freezed.dart';

@freezed
abstract class ProductImagesState with _$ProductImagesState {
  const factory ProductImagesState({
    @Default([]) List<ProductImage> images,

    @Default(false) bool isLoading,

    @Default(false) bool isOperationInProgress,

    @Default(false) bool isWatching,

    String? errorMessage,

    String? successMessage,

    int? currentProductId,
  }) = _ProductImagesState;
}