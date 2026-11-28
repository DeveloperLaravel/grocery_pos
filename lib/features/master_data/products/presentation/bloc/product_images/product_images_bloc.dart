import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/product/product_image.dart';


import '../../../domain/usecases/images/delete_product_image_usecase.dart';
import '../../../domain/usecases/images/get_product_images_usecase.dart';
import '../../../domain/usecases/images/insert_product_image_usecase.dart';
import '../../../domain/usecases/images/set_primary_product_image_usecase.dart';
import '../../../domain/usecases/images/watch_product_images_usecase.dart';
import 'product_images_event.dart';
import 'product_images_state.dart';

@injectable
class ProductImagesBloc
    extends Bloc<ProductImagesEvent, ProductImagesState> {
  final GetProductImagesUseCase _getProductImages;
  final WatchProductImagesUseCase _watchProductImages;
  final InsertProductImageUseCase _insertProductImage;
  final SetPrimaryProductImageUseCase _setPrimaryProductImage;
  final DeleteProductImageUseCase _deleteProductImage;

  StreamSubscription<List<ProductImage>>? _imagesSubscription;

  ProductImagesBloc({
    required GetProductImagesUseCase getProductImages,
    required WatchProductImagesUseCase watchProductImages,
    required InsertProductImageUseCase insertProductImage,
    required SetPrimaryProductImageUseCase setPrimaryProductImage,
    required DeleteProductImageUseCase deleteProductImage,
  })  : _getProductImages = getProductImages,
        _watchProductImages = watchProductImages,
        _insertProductImage = insertProductImage,
        _setPrimaryProductImage = setPrimaryProductImage,
        _deleteProductImage = deleteProductImage,
        super(const ProductImagesState()) {
    on<LoadProductImages>(_onLoad);
    on<WatchProductImages>(_onWatch);
    on<ProductImagesUpdated>(_onImagesUpdated);
    on<InsertProductImage>(_onInsert);
    on<SetPrimaryProductImage>(_onSetPrimary);
    on<DeleteProductImage>(_onDelete);
    on<ClearProductImagesMessages>(_onClearMessages);
    on<ProductImagesStreamError>(_onStreamError);
  }

  // =========================================================
  // LOAD PRODUCT IMAGES
  // =========================================================

  Future<void> _onLoad(
    LoadProductImages event,
    Emitter<ProductImagesState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
      currentProductId: event.productId,
    ));

    final result = await _getProductImages(event.productId).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.toString(),
        ));
      },
      (images) {
        emit(state.copyWith(
          isLoading: false,
          images: images,
          currentProductId: event.productId,
          errorMessage: null,
        ));
      },
    );
  }

  // =========================================================
  // WATCH PRODUCT IMAGES
  // =========================================================

  Future<void> _onWatch(
    WatchProductImages event,
    Emitter<ProductImagesState> emit,
  ) async {
    await _imagesSubscription?.cancel();

    emit(state.copyWith(
      currentProductId: event.productId,
      isWatching: true,
      errorMessage: null,
    ));

    _imagesSubscription = _watchProductImages(event.productId).listen(
      (images) {
        if (!isClosed) {
          add(ProductImagesEvent.imagesUpdated(images: images));
        }
      },
      onError: (error) {
        if (!isClosed) {
          emitError(error);
        }
      },
    );
  }

  void emitError(Object error) {
    if (!isClosed) {
      add(const ProductImagesEvent.clearMessages());
    }
  }

  // =========================================================
  // IMAGES UPDATED
  // =========================================================

  void _onImagesUpdated(
    ProductImagesUpdated event,
    Emitter<ProductImagesState> emit,
  ) {
    emit(state.copyWith(
      images: event.images,
      isLoading: false,
      errorMessage: null,
    ));
  }

  // =========================================================
  // INSERT PRODUCT IMAGE
  // =========================================================

  Future<void> _onInsert(
    InsertProductImage event,
    Emitter<ProductImagesState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await _insertProductImage(event.image).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isOperationInProgress: false,
          errorMessage: failure.toString(),
        ));
      },
      (imageId) {
        emit(state.copyWith(
          isOperationInProgress: false,
          successMessage: 'تمت إضافة الصورة بنجاح',
          errorMessage: null,
        ));
      },
    );

    // إذا لم يكن Stream مفعلاً، نعيد تحميل الصور.
    if (state.currentProductId != null && !state.isWatching) {
      add(ProductImagesEvent.load(
        productId: state.currentProductId!,
      ));
    }
  }

  // =========================================================
  // SET PRIMARY IMAGE
  // =========================================================

  Future<void> _onSetPrimary(
    SetPrimaryProductImage event,
    Emitter<ProductImagesState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await _setPrimaryProductImage(
      productId: event.productId,
      imageId: event.imageId,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isOperationInProgress: false,
          errorMessage: failure.toString(),
        ));
      },
      (_) {
        emit(state.copyWith(
          isOperationInProgress: false,
          successMessage: 'تم تحديد الصورة الرئيسية بنجاح',
          errorMessage: null,
        ));
      },
    );

    if (!state.isWatching) {
      add(ProductImagesEvent.load(
        productId: event.productId,
      ));
    }
  }


void _onStreamError(
  ProductImagesStreamError event,
  Emitter<ProductImagesState> emit,
) {
  emit(state.copyWith(
    isWatching: false,
    errorMessage: event.message,
  ));
}
  // =========================================================
  // DELETE PRODUCT IMAGE
  // =========================================================

  Future<void> _onDelete(
    DeleteProductImage event,
    Emitter<ProductImagesState> emit,
  ) async {
    emit(state.copyWith(
      isOperationInProgress: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await _deleteProductImage(event.id).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isOperationInProgress: false,
          errorMessage: failure.toString(),
        ));
      },
      (deletedRows) {
        emit(state.copyWith(
          isOperationInProgress: false,
          successMessage: 'تم حذف الصورة بنجاح',
          errorMessage: null,
        ));
      },
    );

    if (state.currentProductId != null && !state.isWatching) {
      add(ProductImagesEvent.load(
        productId: state.currentProductId!,
      ));
    }
  }

  // =========================================================
  // CLEAR MESSAGES
  // =========================================================

  void _onClearMessages(
    ClearProductImagesMessages event,
    Emitter<ProductImagesState> emit,
  ) {
    emit(state.copyWith(
      errorMessage: null,
      successMessage: null,
    ));
  }

  // =========================================================
  // CLOSE
  // =========================================================

  @override
  Future<void> close() async {
    await _imagesSubscription?.cancel();
    return super.close();
  }
}