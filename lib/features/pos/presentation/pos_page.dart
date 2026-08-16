import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_pos/core/di/injection.dart';
import 'package:grocery_pos/features/pos/presentation/barcode_page.dart';
import 'package:grocery_pos/features/pos/presentation/bloc/pos_bloc.dart';
import 'package:grocery_pos/features/pos/presentation/bloc/pos_state.dart';
import 'package:grocery_pos/features/pos/presentation/receipt_page.dart';
import 'package:grocery_pos/features/pos/presentation/widgets/cart_panel.dart';
import 'package:grocery_pos/features/pos/presentation/widgets/checkout_dialog.dart';
import 'package:grocery_pos/features/pos/presentation/widgets/product_grid.dart';

class PosPage extends StatelessWidget {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PosBloc>()..add(LoadProducts()),
      child: const _PosView(),
    );
  }
}

class _PosView extends StatefulWidget {
  const _PosView();
  @override
  State<_PosView> createState() => _PosViewState();
}

class _PosViewState extends State<_PosView> {
  final search = TextEditingController();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PosBloc, PosState>(
      listenWhen: (a, b) => a.error != b.error || a.success != b.success || a.lastReceipt != b.lastReceipt,
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!)));
        }
        if (state.success != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.success!)));
        }
        if (state.lastReceipt != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ReceiptPage(receipt: state.lastReceipt!)));
        }
      },
      builder: (context, state) {
        return LayoutBuilder(builder: (context, constraints) {
          final wide = constraints.maxWidth >= 900;
          final products = _productsPanel(context, state);
          final cart = CartPanel(
            items: state.cart,
            subtotal: state.subtotal,
            discount: state.discount,
            total: state.total,
            busy: state.checkingOut,
            onChangeQty: (id, delta) => context.read<PosBloc>().add(ChangeQty(id, delta)),
            onRemove: (id) => context.read<PosBloc>().add(RemoveCartLine(id)),
            onDiscount: () => _editDiscount(context, state),
            onClear: () => context.read<PosBloc>().add(ClearCart()),
            onCheckout: () => _checkout(context, state),
          );
          return Padding(
            padding: const EdgeInsets.all(12),
            child: wide
                ? Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [Expanded(flex: 3, child: products), const SizedBox(width: 10), SizedBox(width: 430, child: cart)])
                : Column(children: [Expanded(flex: 3, child: products), const SizedBox(height: 8), Expanded(flex: 2, child: cart)]),
          );
        });
      },
    );
  }

  Widget _productsPanel(BuildContext context, PosState state) {
    return Card(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(children: [
            Expanded(
              child: TextField(
                controller: search,
                onChanged: (v) => context.read<PosBloc>().add(LoadProducts(v)),
                onSubmitted: (v) {
                  final code = v.trim();
                  if (code.isNotEmpty) context.read<PosBloc>().add(ScanBarcode(code));
                },
                decoration: const InputDecoration(prefixIcon: Icon(Icons.search), labelText: 'اسم المنتج أو الباركود', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(tooltip: 'مسح باركود بالكاميرا', onPressed: () => _scanCamera(context), icon: const Icon(Icons.qr_code_scanner)),
            IconButton(tooltip: 'تحديث', onPressed: state.loading ? null : () => context.read<PosBloc>().add(LoadProducts(search.text)), icon: const Icon(Icons.refresh)),
          ]),
        ),
        if (state.loading) const LinearProgressIndicator(minHeight: 2),
        Expanded(child: ProductGrid(products: state.products, onTap: (p) => context.read<PosBloc>().add(AddProductToCart(p)))),
      ]),
    );
  }

  Future<void> _scanCamera(BuildContext context) async {
    final code = await Navigator.push<String>(context, MaterialPageRoute(builder: (_) => const BarcodePage()));
    if (code != null && context.mounted) context.read<PosBloc>().add(ScanBarcode(code));
  }

  Future<void> _editDiscount(BuildContext context, PosState state) async {
    final controller = TextEditingController(text: state.discount.toStringAsFixed(2));
    final value = await showDialog<double>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('خصم على الفاتورة'),
        content: TextField(controller: controller, autofocus: true, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: InputDecoration(labelText: 'قيمة الخصم', helperText: 'الحد الأقصى ${state.subtotal.toStringAsFixed(2)} د.ل')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('إلغاء')),
          FilledButton(onPressed: () => Navigator.pop(dialogContext, double.tryParse(controller.text.replaceAll(',', '.')) ?? 0), child: const Text('تطبيق')),
        ],
      ),
    );
    controller.dispose();
    if (value != null && context.mounted) context.read<PosBloc>().add(SetDiscount(value));
  }

  Future<void> _checkout(BuildContext context, PosState state) async {
    final result = await showDialog<CheckoutResult>(context: context, builder: (_) => CheckoutDialog(total: state.total, initialMethod: state.paymentMethod));
    if (result == null || !context.mounted) return;
    context.read<PosBloc>().add(Checkout(result.paid, result.method));
  }
}
