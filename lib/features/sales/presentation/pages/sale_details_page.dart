
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/database/app_database.dart';
import '../../../../app/di/injection.dart';
import 'receipt_print_preview_page.dart';

class SaleDetailsPage extends StatefulWidget {
  final int saleId;

  const SaleDetailsPage({
    super.key,
    required this.saleId,
  });

  @override
  State<SaleDetailsPage> createState() => _SaleDetailsPageState();
}

class _SaleDetailsPageState extends State<SaleDetailsPage> {
  final AppDatabase _db = getIt<AppDatabase>();

  SaleDb? _sale;
  List<SaleItemDb> _items = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSale();
  }

  Future<void> _loadSale() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final sale = await (_db.select(_db.sales)
            ..where((t) => t.id.equals(widget.saleId)))
          .getSingleOrNull();

      if (sale == null) {
        throw Exception('الفاتورة غير موجودة');
      }

      final items = await (_db.select(_db.saleItems)
            ..where((t) => t.saleId.equals(widget.saleId)))
          .get();

      if (!mounted) return;

      setState(() {
        _sale = sale;
        _items = items;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  String _money(num value) => '${value.toStringAsFixed(2)} د.ل';

  String _date(DateTime value) {
    return DateFormat('yyyy/MM/dd - hh:mm a').format(value);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الفاتورة'),
        centerTitle: true,
        actions: [
          if (_sale != null)
            IconButton(
              tooltip: 'طباعة الفاتورة',
              onPressed: _openPrintPreview,
              icon: const Icon(Icons.print_outlined),
            ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? _buildError(colors)
              : _sale == null
                  ? const Center(child: Text('الفاتورة غير موجودة'))
                  : _buildContent(colors),
    );
  }

  Widget _buildError(ColorScheme colors) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: colors.error,
            ),
            const SizedBox(height: 12),
            Text(
              _error ?? 'حدث خطأ أثناء تحميل الفاتورة',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _loadSale,
              icon: const Icon(Icons.refresh),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(ColorScheme colors) {
    final sale = _sale!;

    return RefreshIndicator(
      onRefresh: _loadSale,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildInvoiceHeader(colors, sale),
          const SizedBox(height: 16),
          _buildItemsCard(colors),
          const SizedBox(height: 16),
          _buildTotalCard(colors, sale),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _openPrintPreview,
            icon: const Icon(Icons.print_outlined),
            label: const Text('معاينة وطباعة الفاتورة'),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildInvoiceHeader(ColorScheme colors, SaleDb sale) {
    return Card(
      elevation: 0,
      color: colors.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: colors.primary,
              child: Icon(
                Icons.receipt_long,
                color: colors.onPrimary,
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'فاتورة مبيعات',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colors.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              sale.invoiceNumber,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: colors.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
 Divider(
  color: colors.onPrimaryContainer.withValues(alpha: 0.2),
),
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 18,
                  color: colors.onPrimaryContainer,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _date(sale.createdAt),
                    style: TextStyle(color: colors.onPrimaryContainer),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsCard(ColorScheme colors) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: colors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(Icons.shopping_bag_outlined, color: colors.primary),
                const SizedBox(width: 8),
                Text(
                  'المنتجات',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Text(
                  '${_items.length} منتج',
                  style: TextStyle(color: colors.onSurfaceVariant),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            if (_items.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'لا توجد منتجات في هذه الفاتورة',
                  textAlign: TextAlign.center,
                ),
              )
            else
              ..._items.map(_buildItem),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(SaleItemDb item) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: colors.surfaceContainerHighest,
            child: Icon(
              Icons.inventory_2_outlined,
              color: colors.primary,
              size: 19,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  '${item.quantity} × ${_money(item.unitPrice)}',
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _money(item.total),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCard(ColorScheme colors, SaleDb sale) {
    return Card(
      elevation: 0,
      color: colors.surfaceContainerHighest,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                const Text('عدد المنتجات'),
                const Spacer(),
                Text('${_items.length}'),
              ],
            ),
            const SizedBox(height: 14),
            Divider(color: colors.outlineVariant),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'الإجمالي النهائي',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Text(
                  _money(sale.total),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openPrintPreview() {
    if (_sale == null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ReceiptPrintPreviewPage(
          saleId: _sale!.id,
        ),
      ),
    );
  }
}
