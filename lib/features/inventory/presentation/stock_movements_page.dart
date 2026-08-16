import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:grocery_pos/core/di/injection.dart';
import 'package:grocery_pos/features/inventory/domain/entities/stock_movement_entity.dart';
import 'package:grocery_pos/features/inventory/domain/usecases/get_stock_movements.dart';

class StockMovementsPage extends StatefulWidget {
  final int? productId;
  final String? productName;
  const StockMovementsPage({super.key, this.productId, this.productName});

  @override
  State<StockMovementsPage> createState() => _StockMovementsPageState();
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
    setState(() => loading = true);
    final result = await getIt<GetStockMovements>()(productId: widget.productId).run();
    if (!mounted) return;
    result.match(
      (f) => setState(() { loading = false; error = f.message; }),
      (data) => setState(() { loading = false; items = data; error = null; }),
    );
  }

  String _typeLabel(String type) => switch (type) {
    'sale' => 'بيع',
    'return' => 'مرتجع',
    'purchase' => 'توريد',
    'count' => 'جرد',
    _ => 'تسوية',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.productName == null ? 'حركات المخزون' : 'حركات ${widget.productName}')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : RefreshIndicator(
                  onRefresh: _load,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final m = items[index];
                      final positive = m.quantity >= 0;
                      return ListTile(
                        leading: CircleAvatar(child: Icon(positive ? Icons.add : Icons.remove)),
                        title: Text('${m.productName} • ${_typeLabel(m.type)}'),
                        subtitle: Text([
                          DateFormat('yyyy/MM/dd HH:mm').format(m.createdAt),
                          if ((m.note ?? '').isNotEmpty) m.note!,
                          if ((m.reference ?? '').isNotEmpty) 'مرجع: ${m.reference}',
                        ].join('\n')),
                        trailing: Text('${positive ? '+' : ''}${m.quantity.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
    );
  }
}
