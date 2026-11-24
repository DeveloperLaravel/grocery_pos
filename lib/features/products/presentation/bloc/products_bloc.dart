
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
// =============================================================
// Entities
// =============================================================

import '../../domain/entities/product.dart';

// =============================================================
// Products UseCases
// =============================================================

import '../../domain/usecases/barcodes/get_product_by_barcode_usecase.dart';
import '../../domain/usecases/products/get_all_products_usecase.dart';
import '../../domain/usecases/products/watch_all_products_usecase.dart';
import '../../domain/usecases/products/get_product_by_id_usecase.dart';
import '../../domain/usecases/products/search_products_usecase.dart';
import '../../domain/usecases/products/create_product_usecase.dart';
import '../../domain/usecases/products/update_product_usecase.dart';
import '../../domain/usecases/products/delete_product_usecase.dart';

// =============================================================
// Units UseCases
// =============================================================

import '../../domain/usecases/units/get_product_units_usecase.dart';
import '../../domain/usecases/units/add_product_unit_usecase.dart';
import '../../domain/usecases/units/update_product_unit_usecase.dart';
import '../../domain/usecases/units/delete_product_unit_usecase.dart';
import '../../domain/usecases/units/set_default_product_unit_usecase.dart';

// =============================================================
// Barcodes UseCases
// =============================================================

import '../../domain/usecases/barcodes/get_product_barcodes_usecase.dart';
import '../../domain/usecases/barcodes/get_barcode_usecase.dart';
import '../../domain/usecases/barcodes/add_product_barcode_usecase.dart';
import '../../domain/usecases/barcodes/delete_product_barcode_usecase.dart';
import '../../domain/usecases/barcodes/set_default_barcode_usecase.dart';

// =============================================================
// Images UseCases
// =============================================================

import '../../domain/usecases/images/get_product_images_usecase.dart';
import '../../domain/usecases/images/add_product_image_usecase.dart';
import '../../domain/usecases/images/delete_product_image_usecase.dart';
import '../../domain/usecases/images/set_primary_image_usecase.dart';

// =============================================================
// Bloc
// =============================================================

import 'products_event.dart';
import 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  // ===========================================================
  // Products UseCases
  // ===========================================================

  final GetAllProductsUseCase getAllProductsUseCase;
  final WatchAllProductsUseCase watchAllProductsUseCase;
  final GetProductByIdUseCase getProductByIdUseCase;
  final GetProductByBarcodeUsecase getProductByBarcodeUseCase;
  final SearchProductsUseCase searchProductsUseCase;
  final CreateProductUseCase createProductUseCase;
  final UpdateProductUseCase updateProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;

  // ===========================================================
  // Units UseCases
  // ===========================================================

  final GetProductUnitsUseCase getProductUnitsUseCase;
  final AddProductUnitUseCase addProductUnitUseCase;
  final UpdateProductUnitUseCase updateProductUnitUseCase;
  final DeleteProductUnitUseCase deleteProductUnitUseCase;
  final SetDefaultProductUnitUseCase setDefaultProductUnitUseCase;

  // ===========================================================
  // Barcodes UseCases
  // ===========================================================

  final GetProductBarcodesUsecase getProductBarcodesUseCase;
  final GetBarcodeUsecase getBarcodeUseCase;
  final AddProductBarcodeUsecase addProductBarcodeUseCase;
  final DeleteProductBarcodeUseCase deleteProductBarcodeUseCase;
  final SetDefaultBarcodeUsecase setDefaultBarcodeUseCase;

  // ===========================================================
  // Images UseCases
  // ===========================================================

  final GetProductImagesUseCase getProductImagesUseCase;
  final AddProductImageUseCase addProductImageUseCase;
  final DeleteProductImageUseCase deleteProductImageUseCase;
  final SetPrimaryImageUseCase setPrimaryImageUseCase;

  // ===========================================================
  // Stream
  // ===========================================================

  StreamSubscription<List<Product>>? _productsSubscription;

  // ===========================================================
  // Constructor
  // ===========================================================

  ProductsBloc({
    required this.getAllProductsUseCase,
    required this.watchAllProductsUseCase,
    required this.getProductByIdUseCase,
    required this.getProductByBarcodeUseCase,
    required this.searchProductsUseCase,
    required this.createProductUseCase,
    required this.updateProductUseCase,
    required this.deleteProductUseCase,
    required this.getProductUnitsUseCase,
    required this.addProductUnitUseCase,
    required this.updateProductUnitUseCase,
    required this.deleteProductUnitUseCase,
    required this.setDefaultProductUnitUseCase,
    required this.getProductBarcodesUseCase,
    required this.getBarcodeUseCase,
    required this.addProductBarcodeUseCase,
    required this.deleteProductBarcodeUseCase,
    required this.setDefaultBarcodeUseCase,
    required this.getProductImagesUseCase,
    required this.addProductImageUseCase,
    required this.deleteProductImageUseCase,
    required this.setPrimaryImageUseCase,
  }) : super(const ProductsState()) {
    _registerEvents();
  }

  // ===========================================================
  // Register Events
  // ===========================================================

  void _registerEvents() {
    // Products
    on<ProductsStarted>(_onStarted);
    on<ProductsLoadAll>(_onLoadAll);
    on<ProductsWatchRequested>(_onWatchRequested);
    on<ProductsStopWatching>(_onStopWatching);
    on<ProductsChanged>(_onProductsChanged);
    on<ProductsStreamFailed>(_onStreamFailed);

    on<ProductsGetById>(_onGetById);
    on<ProductsGetByBarcode>(_onGetByBarcode);

    // Restartable prevents old search results replacing new ones.
 on<ProductsSearch>(
  _onSearch,
  transformer: restartable(),
);

    on<ProductsCreate>(_onCreate);
    on<ProductsUpdate>(_onUpdate);
    on<ProductsDelete>(_onDelete);
    on<ProductsClearSelection>(_onClearSelection);

    // Units
    on<ProductsLoadUnits>(_onLoadUnits);
    on<ProductsAddUnit>(_onAddUnit);
    on<ProductsUpdateUnit>(_onUpdateUnit);
    on<ProductsDeleteUnit>(_onDeleteUnit);
    on<ProductsSetDefaultUnit>(_onSetDefaultUnit);

    // Barcodes
    on<ProductsLoadBarcodes>(_onLoadBarcodes);
    on<ProductsGetBarcodeDetails>(_onGetBarcodeDetails);
    on<ProductsAddBarcode>(_onAddBarcode);
    on<ProductsDeleteBarcode>(_onDeleteBarcode);
    on<ProductsSetDefaultBarcode>(_onSetDefaultBarcode);

    // Images
    on<ProductsLoadImages>(_onLoadImages);
    on<ProductsAddImage>(_onAddImage);
    on<ProductsDeleteImage>(_onDeleteImage);
    on<ProductsSetPrimaryImage>(_onSetPrimaryImage);

    // Messages
    on<ProductsClearMessages>(_onClearMessages);
  }

  // ===========================================================
  // Common Helpers
  // ===========================================================

  Future<void> _run(
    Emitter<ProductsState> emit,
    Future<void> Function() action,
  ) async {
    emit(state.copyWith(
      errorMessage: null,
      successMessage: null,
    ));

    try {
      await action();
    } catch (error, stackTrace) {
      // يمكن ربط stackTrace لاحقاً مع Logger أو Crash Reporting.
      emit(state.copyWith(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> _reloadProducts(
    Emitter<ProductsState> emit,
  ) async {
    final allProducts = await getAllProductsUseCase();

    final query = state.searchQuery.trim();

    if (query.isEmpty) {
      emit(state.copyWith(
        allProducts: allProducts,
        products: allProducts,
      ));
      return;
    }

    final filteredProducts = await searchProductsUseCase(query);

    emit(state.copyWith(
      allProducts: allProducts,
      products: filteredProducts,
    ));
  }

  Future<void> _reloadUnits(
    Emitter<ProductsState> emit,
    int productId,
  ) async {
    final units = await getProductUnitsUseCase(productId);

    emit(state.copyWith(
      currentProductId: productId,
      units: units,
    ));
  }

  Future<void> _reloadBarcodes(
    Emitter<ProductsState> emit,
    int productId,
  ) async {
    final barcodes = await getProductBarcodesUseCase(productId);

    emit(state.copyWith(
      currentProductId: productId,
      barcodes: barcodes,
    ));
  }

  Future<void> _reloadImages(
    Emitter<ProductsState> emit,
    int productId,
  ) async {
    final images = await getProductImagesUseCase(productId);

    emit(state.copyWith(
      currentProductId: productId,
      images: images,
    ));
  }

  // ===========================================================
  // Products
  // ===========================================================

  Future<void> _onStarted(
    ProductsStarted event,
    Emitter<ProductsState> emit,
  ) async {
    add(const ProductsEvent.loadAll());
    add(const ProductsEvent.watchRequested());
  }

  Future<void> _onLoadAll(
    ProductsLoadAll event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isLoading: true));

      try {
        await _reloadProducts(emit);
      } finally {
        emit(state.copyWith(isLoading: false));
      }
    });
  }

  Future<void> _onWatchRequested(
    ProductsWatchRequested event,
    Emitter<ProductsState> emit,
  ) async {
    await _productsSubscription?.cancel();

    emit(state.copyWith(
      isWatching: true,
      errorMessage: null,
    ));

    _productsSubscription = watchAllProductsUseCase().listen(
      (products) {
        if (!isClosed) {
          add(ProductsEvent.productsChanged(products));
        }
      },
      onError: (Object error, StackTrace stackTrace) {
        if (!isClosed) {
          add(ProductsEvent.streamFailed(error.toString()));
        }
      },
      onDone: () {
        if (!isClosed) {
          add(const ProductsEvent.stopWatching());
        }
      },
    );
  }

  Future<void> _onStopWatching(
    ProductsStopWatching event,
    Emitter<ProductsState> emit,
  ) async {
    await _productsSubscription?.cancel();
    _productsSubscription = null;

    emit(state.copyWith(isWatching: false));
  }

  Future<void> _onProductsChanged(
    ProductsChanged event,
    Emitter<ProductsState> emit,
  ) async {
    final query = state.searchQuery.trim();

    if (query.isEmpty) {
      emit(state.copyWith(
        allProducts: event.products,
        products: event.products,
      ));
      return;
    }

    await _run(emit, () async {
      final filtered = await searchProductsUseCase(query);

      emit(state.copyWith(
        allProducts: event.products,
        products: filtered,
      ));
    });
  }

  void _onStreamFailed(
    ProductsStreamFailed event,
    Emitter<ProductsState> emit,
  ) {
    emit(state.copyWith(
      isWatching: false,
      errorMessage: event.message,
    ));
  }

  Future<void> _onGetById(
    ProductsGetById event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isLoadingProduct: true));

      try {
        final product = await getProductByIdUseCase(event.id);

        emit(state.copyWith(
          selectedProduct: product,
          currentProductId: product == null ? null : event.id,
        ));
      } finally {
        emit(state.copyWith(isLoadingProduct: false));
      }
    });
  }

  Future<void> _onGetByBarcode(
    ProductsGetByBarcode event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      final barcode = event.barcode.trim();

      if (barcode.isEmpty) {
        emit(state.copyWith(
          errorMessage: 'الرجاء إدخال الباركود',
        ));
        return;
      }

      emit(state.copyWith(isLoadingProduct: true));

      try {
        final product = await getProductByBarcodeUseCase(barcode);

        emit(state.copyWith(
          barcodeProduct: product,
          selectedProduct: product,
          currentProductId: product?.id,
          errorMessage: product == null ? 'المنتج غير موجود' : null,
        ));
      } finally {
        emit(state.copyWith(isLoadingProduct: false));
      }
    });
  }
Future<void> _onSearch(
  ProductsSearch event,
  Emitter<ProductsState> emit,
) async {
  final query = event.query.trim();

  // إلغاء البحث وإظهار جميع المنتجات.
  if (query.isEmpty) {
    emit(state.copyWith(
      searchQuery: '',
      isSearching: false,
      errorMessage: null,
      successMessage: null,
    ));

    add(const ProductsEvent.loadAll());
    return;
  }

  emit(state.copyWith(
    isSearching: true,
    searchQuery: query,
    errorMessage: null,
    successMessage: null,
  ));

  try {
    final result = await searchProductsUseCase(query);

    if (emit.isDone) return;

    emit(state.copyWith(
      products: result,
      allProducts: result,
      searchQuery: query,
      isSearching: false,
      errorMessage: null,
    ));
  } catch (error) {
    if (emit.isDone) return;

    emit(state.copyWith(
      isSearching: false,
      errorMessage: 'فشل البحث عن المنتجات: $error',
    ));
  }
}
  Future<void> _onCreate(
    ProductsCreate event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isSaving: true));

      try {
        final id = await createProductUseCase(event.product);

        await _reloadProducts(emit);

        emit(state.copyWith(
          lastCreatedProductId: id,
          successMessage: 'تمت إضافة المنتج بنجاح',
        ));
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });
  }

  Future<void> _onUpdate(
    ProductsUpdate event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isSaving: true));

      try {
        final success = await updateProductUseCase(event.product);

        if (!success) {
          emit(state.copyWith(
            errorMessage: 'لم يتم تحديث المنتج',
          ));
          return;
        }

        await _reloadProducts(emit);

        emit(state.copyWith(
          selectedProduct: event.product,
          successMessage: 'تم تحديث المنتج بنجاح',
        ));
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });
  }

  Future<void> _onDelete(
    ProductsDelete event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isDeleting: true));

      try {
        final success = await deleteProductUseCase(event.id);

        if (!success) {
          emit(state.copyWith(
            errorMessage: 'لم يتم العثور على المنتج أو حذفه',
          ));
          return;
        }

        await _reloadProducts(emit);

        if (state.selectedProduct?.id == event.id) {
          emit(state.copyWith(
            selectedProduct: null,
            currentProductId: null,
            units: [],
            barcodes: [],
            images: [],
          ));
        }

        emit(state.copyWith(
          successMessage: 'تم حذف المنتج بنجاح',
        ));
      } finally {
        emit(state.copyWith(isDeleting: false));
      }
    });
  }

  void _onClearSelection(
    ProductsClearSelection event,
    Emitter<ProductsState> emit,
  ) {
    emit(state.copyWith(
      selectedProduct: null,
      barcodeProduct: null,
      selectedBarcode: null,
      currentProductId: null,
      units: [],
      barcodes: [],
      images: [],
    ));
  }

  // ===========================================================
  // Product Units
  // ===========================================================

  Future<void> _onLoadUnits(
    ProductsLoadUnits event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isLoadingUnits: true));

      try {
        await _reloadUnits(emit, event.productId);
      } finally {
        emit(state.copyWith(isLoadingUnits: false));
      }
    });
  }

  Future<void> _onAddUnit(
    ProductsAddUnit event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isSaving: true));

      try {
        final id = await addProductUnitUseCase(event.unit);

        await _reloadUnits(emit, event.unit.productId);

        emit(state.copyWith(
          lastCreatedUnitId: id,
          successMessage: 'تمت إضافة الوحدة بنجاح',
        ));
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });
  }

  Future<void> _onUpdateUnit(
    ProductsUpdateUnit event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isSaving: true));

      try {
        final success = await updateProductUnitUseCase(event.unit);

        if (!success) {
          emit(state.copyWith(
            errorMessage: 'لم يتم تحديث الوحدة',
          ));
          return;
        }

        await _reloadUnits(emit, event.unit.productId);

        emit(state.copyWith(
          successMessage: 'تم تحديث الوحدة بنجاح',
        ));
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });
  }

  Future<void> _onDeleteUnit(
    ProductsDeleteUnit event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isDeleting: true));

      try {
        final success = await deleteProductUnitUseCase(event.id);

        if (!success) {
          emit(state.copyWith(
            errorMessage: 'لم يتم حذف الوحدة',
          ));
          return;
        }

        await _reloadUnits(emit, event.productId);

        emit(state.copyWith(
          successMessage: 'تم حذف الوحدة بنجاح',
        ));
      } finally {
        emit(state.copyWith(isDeleting: false));
      }
    });
  }

  Future<void> _onSetDefaultUnit(
    ProductsSetDefaultUnit event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      await setDefaultProductUnitUseCase(
        productId: event.productId,
        unitId: event.unitId,
      );

      await _reloadUnits(emit, event.productId);

      emit(state.copyWith(
        successMessage: 'تم تحديد الوحدة الافتراضية',
      ));
    });
  }

  // ===========================================================
  // Product Barcodes
  // ===========================================================

  Future<void> _onLoadBarcodes(
    ProductsLoadBarcodes event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isLoadingBarcodes: true));

      try {
        await _reloadBarcodes(emit, event.productId);
      } finally {
        emit(state.copyWith(isLoadingBarcodes: false));
      }
    });
  }

  Future<void> _onGetBarcodeDetails(
    ProductsGetBarcodeDetails event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      final value = event.barcode.trim();

      if (value.isEmpty) {
        emit(state.copyWith(
          errorMessage: 'الرجاء إدخال الباركود',
        ));
        return;
      }

      final barcode = await getBarcodeUseCase(value);

      emit(state.copyWith(
        selectedBarcode: barcode,
        errorMessage: barcode == null ? 'الباركود غير موجود' : null,
      ));
    });
  }

  Future<void> _onAddBarcode(
    ProductsAddBarcode event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isSaving: true));

      try {
        final id = await addProductBarcodeUseCase(event.barcode);

        await _reloadBarcodes(emit, event.barcode.productId);

        emit(state.copyWith(
          lastCreatedBarcodeId: id,
          successMessage: 'تمت إضافة الباركود بنجاح',
        ));
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });
  }

Future<void> _onDeleteBarcode(
  ProductsDeleteBarcode event,
  Emitter<ProductsState> emit,
) async {
  emit(state.copyWith(
    isDeleting: true,
    errorMessage: null,
    successMessage: null,
  ));

  try {
    await deleteProductBarcodeUseCase(event.id);

    await _reloadBarcodes(emit, event.productId);

    emit(state.copyWith(
      selectedBarcode: null,
      successMessage: 'تم حذف الباركود بنجاح',
    ));
  } catch (error) {
    emit(state.copyWith(
      errorMessage: 'حدث خطأ أثناء حذف الباركود: $error',
    ));
  } finally {
    emit(state.copyWith(isDeleting: false));
  }
}
  Future<void> _onSetDefaultBarcode(
    ProductsSetDefaultBarcode event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      await setDefaultBarcodeUseCase(event.id);

      await _reloadBarcodes(emit, event.productId);

      emit(state.copyWith(
        successMessage: 'تم تحديد الباركود الافتراضي',
      ));
    });
  }

  // ===========================================================
  // Product Images
  // ===========================================================

  Future<void> _onLoadImages(
    ProductsLoadImages event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isLoadingImages: true));

      try {
        await _reloadImages(emit, event.productId);
      } finally {
        emit(state.copyWith(isLoadingImages: false));
      }
    });
  }

  Future<void> _onAddImage(
    ProductsAddImage event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isSaving: true));

      try {
        final id = await addProductImageUseCase(event.image);

        await _reloadImages(emit, event.image.productId);

        emit(state.copyWith(
          lastCreatedImageId: id,
          successMessage: 'تمت إضافة الصورة بنجاح',
        ));
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });
  }

  Future<void> _onDeleteImage(
    ProductsDeleteImage event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      emit(state.copyWith(isDeleting: true));

      try {
        final success = await deleteProductImageUseCase(event.id);

        if (!success) {
          emit(state.copyWith(
            errorMessage: 'لم يتم حذف الصورة',
          ));
          return;
        }

        await _reloadImages(emit, event.productId);

        emit(state.copyWith(
          successMessage: 'تم حذف الصورة بنجاح',
        ));
      } finally {
        emit(state.copyWith(isDeleting: false));
      }
    });
  }

  Future<void> _onSetPrimaryImage(
    ProductsSetPrimaryImage event,
    Emitter<ProductsState> emit,
  ) async {
    await _run(emit, () async {
      await setPrimaryImageUseCase(event.id);

      await _reloadImages(emit, event.productId);

      emit(state.copyWith(
        successMessage: 'تم تحديد الصورة الرئيسية',
      ));
    });
  }

  // ===========================================================
  // Messages
  // ===========================================================

  void _onClearMessages(
    ProductsClearMessages event,
    Emitter<ProductsState> emit,
  ) {
    emit(state.copyWith(
      errorMessage: null,
      successMessage: null,
    ));
  }

  // ===========================================================
  // Dispose
  // ===========================================================

  @override
  Future<void> close() async {
    await _productsSubscription?.cancel();
    _productsSubscription = null;

    return super.close();
  }
}