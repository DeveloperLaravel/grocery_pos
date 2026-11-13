
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/inventory_item.dart';
import '../../domain/entities/inventory_summary.dart';
import '../../domain/entities/stock_movement_entity.dart';

import '../../domain/usecases/adjust_stock_usecase.dart';
import '../../domain/usecases/get_inventory_summary_usecase.dart';
import '../../domain/usecases/get_inventory_usecases.dart';
import '../../domain/usecases/get_low_stock_products_usecase.dart';
import '../../domain/usecases/get_stock_movements_usecase.dart';

import '../../domain/usecases/watch_inventory_summary_usecase.dart';
import '../../domain/usecases/watch_inventory_usecase.dart';
import '../../domain/usecases/watch_low_stock_products_usecase.dart';
import '../../domain/usecases/watch_stock_movements_usecase.dart';

import 'inventory_event.dart';
import 'inventory_state.dart';

@injectable
class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final GetInventoryUseCase _getInventory;
  final WatchInventoryUseCase _watchInventory;

  final GetInventorySummaryUseCase _getSummary;
  final WatchInventorySummaryUseCase _watchSummary;

  final GetLowStockProductsUseCase _getLowStock;
  final WatchLowStockProductsUseCase _watchLowStock;

  final GetStockMovementsUseCase _getMovements;
  final WatchStockMovementsUseCase _watchMovements;

  final AdjustStockUseCase _adjustStock;

  StreamSubscription<List<InventoryItem>>? _inventorySub;
  StreamSubscription<InventorySummary>? _summarySub;
  StreamSubscription<List<InventoryItem>>? _lowStockSub;
  StreamSubscription<List<StockMovement>>? _movementsSub;

  InventoryBloc(
    this._getInventory,
    this._watchInventory,
    this._getSummary,
    this._watchSummary,
    this._getLowStock,
    this._watchLowStock,
    this._getMovements,
    this._watchMovements,
    this._adjustStock,
  ) : super(InventoryState.initial()) {
    on<InventoryStarted>(_onStarted);
    on<InventoryRefreshRequested>(_onRefresh);

    on<InventorySearchChanged>(_onSearchChanged);
    on<InventoryLowStockToggled>(_onLowStockToggled);

    on<StockMovementsFilterChanged>(_onMovementsFilterChanged);
    on<StockAdjustmentSubmitted>(_onStockAdjustment);

    on<InventoryChanged>(_onInventoryChanged);
    on<InventorySummaryChanged>(_onSummaryChanged);
    on<LowStockChanged>(_onLowStockChanged);
    on<StockMovementsChanged>(_onMovementsChanged);
    on<InventoryStreamFailed>(_onStreamFailed);
  }

  // ------------------------------------------------------------
  // Start
  // ------------------------------------------------------------

  Future<void> _onStarted(
    InventoryStarted event,
    Emitter<InventoryState> emit,
  ) async {
    await _cancelSubscriptions();

    _subscribeInventory();
    _subscribeSummary();
    _subscribeLowStock();

    await _subscribeMovements(
      productId: state.selectedProductId,
      limit: state.movementsLimit,
    );

    await _loadAll(emit);
  }

  // ------------------------------------------------------------
  // Load all data
  // ------------------------------------------------------------

  Future<void> _onRefresh(
    InventoryRefreshRequested event,
    Emitter<InventoryState> emit,
  ) async {
    await _loadAll(emit);
  }

  Future<void> _loadAll(
    Emitter<InventoryState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final inventoryResult = await _getInventory().run();
      if (isClosed) return;

      inventoryResult.fold(
        (failure) => emit(state.copyWith(
          errorMessage: failure.message,
        )),
        (items) => emit(state.copyWith(
          inventory: items,
        )),
      );

      final summaryResult = await _getSummary().run();
      if (isClosed) return;

      summaryResult.fold(
        (failure) => emit(state.copyWith(
          errorMessage: failure.message,
        )),
        (summary) => emit(state.copyWith(
          summary: summary,
        )),
      );

      final lowStockResult = await _getLowStock().run();
      if (isClosed) return;

      lowStockResult.fold(
        (failure) => emit(state.copyWith(
          errorMessage: failure.message,
        )),
        (items) => emit(state.copyWith(
          lowStockProducts: items,
        )),
      );

      final movementsResult = await _getMovements(
        productId: state.selectedProductId,
        limit: state.movementsLimit,
      ).run();

      if (isClosed) return;

      movementsResult.fold(
        (failure) => emit(state.copyWith(
          errorMessage: failure.message,
        )),
        (items) => emit(state.copyWith(
          movements: items,
        )),
      );
    } catch (error) {
      if (!isClosed) {
        emit(state.copyWith(
          errorMessage: 'حدث خطأ أثناء تحميل المخزون: $error',
        ));
      }
    } finally {
      if (!isClosed) {
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  // ------------------------------------------------------------
  // Inventory streams
  // ------------------------------------------------------------

  void _subscribeInventory() {
    _inventorySub = _watchInventory().listen(
      (items) {
        if (!isClosed) {
          add(InventoryEvent.inventoryChanged(items));
        }
      },
      onError: (Object error) {
        if (!isClosed) {
          add(InventoryEvent.streamFailed(
            'فشل تحديث المنتجات: $error',
          ));
        }
      },
    );
  }

  void _subscribeSummary() {
    _summarySub = _watchSummary().listen(
      (summary) {
        if (!isClosed) {
          add(InventoryEvent.summaryChanged(summary));
        }
      },
      onError: (Object error) {
        if (!isClosed) {
          add(InventoryEvent.streamFailed(
            'فشل تحديث ملخص المخزون: $error',
          ));
        }
      },
    );
  }

  void _subscribeLowStock() {
    _lowStockSub = _watchLowStock().listen(
      (items) {
        if (!isClosed) {
          add(InventoryEvent.lowStockChanged(items));
        }
      },
      onError: (Object error) {
        if (!isClosed) {
          add(InventoryEvent.streamFailed(
            'فشل تحديث المنتجات منخفضة المخزون: $error',
          ));
        }
      },
    );
  }

  // ------------------------------------------------------------
  // Movements stream
  // ------------------------------------------------------------

  Future<void> _subscribeMovements({
    int? productId,
    required int limit,
  }) async {
    await _movementsSub?.cancel();

    if (isClosed) return;

    _movementsSub = _watchMovements(
      productId: productId,
      limit: limit,
    ).listen(
      (items) {
        if (!isClosed) {
          add(InventoryEvent.movementsChanged(items));
        }
      },
      onError: (Object error) {
        if (!isClosed) {
          add(InventoryEvent.streamFailed(
            'فشل تحديث حركات المخزون: $error',
          ));
        }
      },
    );
  }

  Future<void> _onMovementsFilterChanged(
    StockMovementsFilterChanged event,
    Emitter<InventoryState> emit,
  ) async {
    if (event.limit < 1 || event.limit > 500) {
      emit(state.copyWith(
        errorMessage: 'عدد الحركات يجب أن يكون بين 1 و500',
      ));
      return;
    }

    if (event.productId != null && event.productId! <= 0) {
      emit(state.copyWith(
        errorMessage: 'معرّف المنتج غير صحيح',
      ));
      return;
    }

    emit(state.copyWith(
      isLoading: true,
      selectedProductId: event.productId,
      movementsLimit: event.limit,
      movements: [],
      errorMessage: null,
    ));

    try {
      await _subscribeMovements(
        productId: event.productId,
        limit: event.limit,
      );

      final result = await _getMovements(
        productId: event.productId,
        limit: event.limit,
      ).run();

      if (isClosed) return;

      result.fold(
        (failure) => emit(state.copyWith(
          errorMessage: failure.message,
        )),
        (items) => emit(state.copyWith(
          movements: items,
        )),
      );
    } catch (error) {
      if (!isClosed) {
        emit(state.copyWith(
          errorMessage: 'فشل تحميل الحركات: $error',
        ));
      }
    } finally {
      if (!isClosed) {
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  // ------------------------------------------------------------
  // Search and filters
  // ------------------------------------------------------------

  void _onSearchChanged(
    InventorySearchChanged event,
    Emitter<InventoryState> emit,
  ) {
    emit(state.copyWith(query: event.query.trim()));
  }

  void _onLowStockToggled(
    InventoryLowStockToggled event,
    Emitter<InventoryState> emit,
  ) {
    emit(state.copyWith(
      lowStockOnly: !state.lowStockOnly,
    ));
  }

  // ------------------------------------------------------------
  // Stock adjustment
  // ------------------------------------------------------------

  Future<void> _onStockAdjustment(
    StockAdjustmentSubmitted event,
    Emitter<InventoryState> emit,
  ) async {
    if (event.productId <= 0 || event.quantity <= 0) {
      emit(state.copyWith(
        errorMessage: 'المنتج والكمية غير صحيحين',
      ));
      return;
    }

    const allowedTypes = {'in', 'out', 'sale', 'return'};

    if (!allowedTypes.contains(event.type)) {
      emit(state.copyWith(
        errorMessage: 'نوع حركة المخزون غير صحيح',
      ));
      return;
    }

    emit(state.copyWith(
      isAdjusting: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final result = await _adjustStock(
        productId: event.productId,
        quantity: event.quantity,
        type: event.type,
        reference: event.reference,
        note: event.note,
      ).run();

      if (isClosed) return;

      await result.fold(
        (failure) async {
          emit(state.copyWith(
            errorMessage: failure.message,
          ));
        },
        (_) async {
          emit(state.copyWith(
            successMessage: 'تم تعديل المخزون بنجاح',
          ));

          await _loadAll(emit);
        },
      );
    } catch (error) {
      if (!isClosed) {
        emit(state.copyWith(
          errorMessage: 'فشل تعديل المخزون: $error',
        ));
      }
    } finally {
      if (!isClosed) {
        emit(state.copyWith(isAdjusting: false));
      }
    }
  }

  // ------------------------------------------------------------
  // Stream events
  // ------------------------------------------------------------

  void _onInventoryChanged(
    InventoryChanged event,
    Emitter<InventoryState> emit,
  ) {
    emit(state.copyWith(inventory: event.inventory));
  }

  void _onSummaryChanged(
    InventorySummaryChanged event,
    Emitter<InventoryState> emit,
  ) {
    emit(state.copyWith(summary: event.summary));
  }

  void _onLowStockChanged(
    LowStockChanged event,
    Emitter<InventoryState> emit,
  ) {
    emit(state.copyWith(lowStockProducts: event.products));
  }

  void _onMovementsChanged(
    StockMovementsChanged event,
    Emitter<InventoryState> emit,
  ) {
    emit(state.copyWith(movements: event.movements));
  }

  void _onStreamFailed(
    InventoryStreamFailed event,
    Emitter<InventoryState> emit,
  ) {
    emit(state.copyWith(errorMessage: event.message));
  }

  // ------------------------------------------------------------
  // Cleanup
  // ------------------------------------------------------------

  Future<void> _cancelSubscriptions() async {
    await _inventorySub?.cancel();
    await _summarySub?.cancel();
    await _lowStockSub?.cancel();
    await _movementsSub?.cancel();

    _inventorySub = null;
    _summarySub = null;
    _lowStockSub = null;
    _movementsSub = null;
  }

  @override
  Future<void> close() async {
    await _cancelSubscriptions();
    return super.close();
  }
}
