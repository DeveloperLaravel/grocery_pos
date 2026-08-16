import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery_pos/features/inventory/domain/usecases/adjust_stock.dart';
import 'package:grocery_pos/features/inventory/domain/usecases/get_inventory.dart';
import 'package:grocery_pos/features/inventory/domain/usecases/get_inventory_summary.dart';
import 'package:grocery_pos/features/inventory/domain/usecases/set_stock.dart';
import 'package:grocery_pos/features/inventory/domain/usecases/update_min_stock.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';

@injectable
class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final GetInventory getInventory;
  final GetInventorySummary getSummary;
  final AdjustStock adjustStock;
  final SetStock setStock;
  final UpdateMinStock updateMinStock;

  InventoryBloc(
    this.getInventory,
    this.getSummary,
    this.adjustStock,
    this.setStock,
    this.updateMinStock,
  ) : super(const InventoryState()) {
    on<InventoryStarted>((event, emit) => _load(emit));
    on<InventoryRefreshed>((event, emit) => _load(emit));
    on<InventorySearchChanged>((event, emit) async {
      emit(state.copyWith(query: event.query));
      await _load(emit);
    });
    on<InventoryLowStockToggled>((event, emit) {
      emit(state.copyWith(lowStockOnly: !state.lowStockOnly));
    });
    on<InventoryAdjusted>((event, emit) async {
      emit(state.copyWith(loading: true, error: null, message: null));
      final result = await adjustStock(
        productId: event.productId,
        delta: event.delta,
        note: event.note,
      ).run();
      await result.match(
        (f) async => emit(state.copyWith(loading: false, error: f.message)),
        (_) async {
          emit(state.copyWith(message: 'تم تحديث المخزون'));
          await _load(emit);
        },
      );
    });
    on<InventoryStockSet>((event, emit) async {
      emit(state.copyWith(loading: true, error: null, message: null));
      final result = await setStock(
        productId: event.productId,
        newQuantity: event.quantity,
        note: event.note,
      ).run();
      await result.match(
        (f) async => emit(state.copyWith(loading: false, error: f.message)),
        (_) async {
          emit(state.copyWith(message: 'تم حفظ الجرد الفعلي'));
          await _load(emit);
        },
      );
    });
    on<InventoryMinStockChanged>((event, emit) async {
      final result = await updateMinStock(productId: event.productId, minStock: event.minStock).run();
      await result.match(
        (f) async => emit(state.copyWith(error: f.message)),
        (_) async => _load(emit),
      );
    });
  }

  Future<void> _load(Emitter<InventoryState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    final inventoryResult = await getInventory(query: state.query).run();
    final summaryResult = await getSummary().run();

    inventoryResult.match(
      (f) => emit(state.copyWith(loading: false, error: f.message)),
      (items) {
        final summary = summaryResult.match((_) => state.summary, (s) => s);
        emit(state.copyWith(loading: false, items: items, summary: summary));
      },
    );
  }
}
