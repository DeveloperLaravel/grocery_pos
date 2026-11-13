// HOTFIX: formatted sales page - 2026-08-16
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:grocery_pos/core/database/app_database.dart';
import 'package:grocery_pos/core/di/injection.dart';

import '../../pos/domain/repositories/pos_repository.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final AppDatabase db = getIt<AppDatabase>();
  List<SaleDb> sales = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    sales = await (db.select(db.sales)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'الفواتير',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Card(
              child: ListView.separated(
                itemCount: sales.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final sale = sales[index];

                  return ListTile(
                    title: Text(sale.invoiceNumber),
                    subtitle: Text(
                      DateFormat('yyyy-MM-dd HH:mm').format(sale.createdAt),
                    ),
                    trailing: Text('${sale.total.toStringAsFixed(2)} د.ل'),
                    onTap: () => details(sale),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> details(SaleDb sale) async {
    final items = await (db.select(db.saleItems)
          ..where((t) => t.saleId.equals(sale.id)))
        .get();

    if (!mounted) return;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  sale.invoiceNumber,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...items.map(
                  (item) => ListTile(
                    title: Text(item.productName),
                    subtitle: Text(
                      '${item.quantity} × ${item.unitPrice.toStringAsFixed(2)}',
                    ),
                    trailing: Text(item.total.toStringAsFixed(2)),
                    onLongPress: () => _return(sheetContext, sale, item),
                  ),
                ),
                const Divider(),
                Text('الإجمالي ${sale.total.toStringAsFixed(2)} د.ل'),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _return(
    BuildContext sheetContext,
    SaleDb sale,
    SaleItemDb item,
  ) async {
    Navigator.pop(sheetContext);

    final qty = await showDialog<double>(
      context: context,
      builder: (dialogContext) {
        final controller = TextEditingController(text: '1');

        return AlertDialog(
          title: Text('مرتجع ${item.productName}'),
          content: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'الكمية (حد أقصى ${item.quantity})',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(
                  dialogContext,
                  double.tryParse(controller.text.trim()),
                );
              },
              child: const Text('تنفيذ المرتجع'),
            ),
          ],
        );
      },
    );

    if (qty == null || qty <= 0 || qty > item.quantity) return;

    final refund = qty * item.unitPrice;
    final result = await getIt<PosRepository>()
        .returnSaleItem(
          saleId: sale.id,
          productId: item.productId,
          quantity: qty,
          refundAmount: refund,
        )
        .run();

    if (!mounted) return;

    final failure = result.fold<String?>(
      (error) => error.toString(),
      (_) => null,
    );

    if (failure != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل المرتجع: $failure')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تم المرتجع بقيمة ${refund.toStringAsFixed(2)} د.ل',
        ),
      ),
    );
    await load();
  }
}
