import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product/product_image.dart';

part 'product_images_event.freezed.dart';

@freezed
sealed class ProductImagesEvent with _$ProductImagesEvent {
  const factory ProductImagesEvent.load({
    required int productId,
  }) = LoadProductImages;

  const factory ProductImagesEvent.watch({
    required int productId,
  }) = WatchProductImages;

  const factory ProductImagesEvent.imagesUpdated({
    required List<ProductImage> images,
  }) = ProductImagesUpdated;

  const factory ProductImagesEvent.insert({
    required ProductImage image,
  }) = InsertProductImage;

  const factory ProductImagesEvent.setPrimary({
    required int productId,
    required int imageId,
  }) = SetPrimaryProductImage;



  const factory ProductImagesEvent.delete({
    required int id,
  }) = DeleteProductImage;

  const factory ProductImagesEvent.clearMessages() =
      ClearProductImagesMessages;


      const factory ProductImagesEvent.streamError({
  required String message,
}) = ProductImagesStreamError;
}

