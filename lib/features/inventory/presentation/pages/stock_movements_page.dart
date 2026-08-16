import 'package:flutter/material.dart';

import 'package:grocery_pos/core/di/injection.dart';
import 'package:grocery_pos/features/inventory/domain/entities/stock_movement_entity.dart';
import 'package:grocery_pos/features/inventory/domain/usecases/get_stock_movements.dart';
import 'package:grocery_pos/features/inventory/presentation/widgets/stock_movements_view.dart';

class StockMovementsPage extends StatefulWidget {
  final int? productId;
  final String? productName;

  const StockMovementsPage({
    super.key,
    this.productId,
    this.productName,
  });

  @override
  State<StockMovementsPage> createState() =>
      _StockMovementsPageState();
}

class _StockMovementsPageState extends State<StockMovementsPage> {
  bool loading = true;
  String? error;
  List<StockMovementEntity> items = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (mounted) {
      setState(() {
        loading = true;
        error = null;
      });
    }

    final result = await getIt<GetStockMovements>()(
      productId: widget.productId,
    ).run();

    if (!mounted) return;

    result.match(
      (failure) => setState(() {
        loading = false;
        error = failure.message;
      }),
      (data) => setState(() {
        loading = false;
        error = null;
        items = data;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StockMovementsView(
      productName: widget.productName,
      items: items,
      loading: loading,
      error: error,
      onRefresh: _load,
    );
  }
}
