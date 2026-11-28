import 'package:flutter/material.dart';

import '../../../../core/database/app_database.dart';
import '../../../../app/di/injection.dart';

class StockTransfersPage extends StatefulWidget {
  const StockTransfersPage({super.key});

  @override
  State<StockTransfersPage> createState() => _StockTransfersPageState();
}

class _StockTransfersPageState extends State<StockTransfersPage> {
  final _database = getIt<AppDatabase>();

  List<StockTransferDb> _transfers = [];
  List<StockTransferItemDb> _items = [];
  List<StoreDb> _stores = [];
  List<ProductDb> _products = [];
  bool _isLoading = true;
  String? _loadError;
  int? _busyTransferId;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _loadError = null;
    });

    try {
      final transfers = await _database.stockTransfersDao.getAllTransfers();
      final stores = await _database.storesDao.getAllStores();
      final products = (await _database.productsDao.getAllProducts())
          .where((product) => product.isActive)
          .toList();
      final items = <StockTransferItemDb>[];

      for (final transfer in transfers) {
        items.addAll(
          await _database.stockTransfersDao.getTransferItems(transfer.id),
        );
      }

      if (!mounted) return;
      setState(() {
        _transfers = transfers;
        _stores = stores;
        _products = products;
        _items = items;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() => _loadError = error.toString());
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحويلات المخزون'),
        actions: [
          IconButton(
            tooltip: 'تحديث',
            onPressed: _isLoading ? null : _load,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isLoading || _stores.length < 2 ? null : _createTransfer,
        icon: const Icon(Icons.add_rounded),
        label: const Text('تحويل جديد'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading && _transfers.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_loadError != null && _transfers.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline_rounded, size: 40),
              const SizedBox(height: 12),
              Text(_loadError!, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: _load,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('إعادة المحاولة'),
              ),
            ],
          ),
        ),
      );
    }

    if (_transfers.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.swap_horiz_rounded, size: 48),
              const SizedBox(height: 12),
              const Text('لا توجد تحويلات مخزون بعد'),
              const SizedBox(height: 12),
              if (_stores.length < 2)
                const Text('أضف مخزنين نشطين على الأقل لإنشاء تحويل.')
              else
                FilledButton.icon(
                  onPressed: _createTransfer,
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('إنشاء تحويل'),
                ),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: _load,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
            itemCount: _transfers.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final transfer = _transfers[index];
              return _buildTransferCard(transfer);
            },
          ),
        ),
        if (_isLoading)
          const Align(
            alignment: Alignment.topCenter,
            child: LinearProgressIndicator(),
          ),
      ],
    );
  }

  Widget _buildTransferCard(StockTransferDb transfer) {
    final transferItems =
        _items.where((item) => item.transferId == transfer.id).toList();
    final fromStore = _storeName(transfer.fromStoreId);
    final toStore = _storeName(transfer.toStoreId);
    final isBusy = _busyTransferId == transfer.id;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    transfer.transferNumber,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                _TransferStatus(status: transfer.status),
              ],
            ),
            const SizedBox(height: 8),
            Text('$fromStore  ←  $toStore'),
            Text(
              'التاريخ: ${transfer.transferDate.toLocal().toString().substring(0, 16)}',
            ),
            const Divider(height: 24),
            if (transferItems.isEmpty)
              const Text('لا توجد أصناف في التحويل.')
            else
              ...transferItems.map(_buildTransferItem),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                if (transfer.status == 'draft') ...[
                  TextButton.icon(
                    onPressed: isBusy ? null : () => _addItem(transfer),
                    icon: const Icon(Icons.add_box_outlined),
                    label: const Text('إضافة صنف'),
                  ),
                  TextButton.icon(
                    onPressed: isBusy || transferItems.isEmpty
                        ? null
                        : () => _runAction(
                              transfer.id,
                              () => _database.stockTransfersDao
                                  .approveTransfer(transferId: transfer.id),
                            ),
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('اعتماد'),
                  ),
                  TextButton.icon(
                    onPressed: isBusy
                        ? null
                        : () => _runAction(
                              transfer.id,
                              () => _database.stockTransfersDao
                                  .cancelTransfer(transfer.id),
                            ),
                    icon: const Icon(Icons.cancel_outlined),
                    label: const Text('إلغاء'),
                  ),
                ],
                if (transfer.status == 'approved') ...[
                  FilledButton.tonalIcon(
                    onPressed: isBusy
                        ? null
                        : () => _runAction(
                              transfer.id,
                              () => _database.stockTransfersDao
                                  .shipTransfer(transferId: transfer.id),
                            ),
                    icon: const Icon(Icons.local_shipping_outlined),
                    label: const Text('شحن'),
                  ),
                  TextButton.icon(
                    onPressed: isBusy
                        ? null
                        : () => _runAction(
                              transfer.id,
                              () => _database.stockTransfersDao
                                  .cancelTransfer(transfer.id),
                            ),
                    icon: const Icon(Icons.cancel_outlined),
                    label: const Text('إلغاء'),
                  ),
                ],
              ],
            ),
            if (isBusy) const LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferItem(StockTransferItemDb item) {
    final product = _productById(item.productId);
    final remainingBase = item.shippedQuantity - item.receivedQuantity;
    final baseUnit = product?.baseUnit ?? item.unitName;
    final canReceive = remainingBase > 0 &&
        _transfers.any((transfer) =>
            transfer.id == item.transferId &&
            ['shipped', 'partially_received'].contains(transfer.status));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.inventory_2_outlined, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product?.name ?? 'منتج #${item.productId}'),
                Text(
                  'مشحون ${item.shippedQuantity} $baseUnit، '
                  'مستلم ${item.receivedQuantity} $baseUnit',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          if (canReceive)
            TextButton(
              onPressed: _busyTransferId == item.transferId
                  ? null
                  : () => _receiveItem(item),
              child: const Text('استلام'),
            ),
        ],
      ),
    );
  }

  Future<void> _createTransfer() async {
    final activeStores = _stores.where((store) => store.isActive).toList();
    if (activeStores.length < 2) {
      _showMessage('يلزم وجود مخزنين نشطين على الأقل.');
      return;
    }

    final draft = await _showCreateTransferDialog(activeStores);
    if (draft == null || !mounted) return;

    await _runAction(
      null,
      () => _database.stockTransfersDao.createTransfer(
        transferNumber: draft.number,
        fromStoreId: draft.fromStoreId,
        toStoreId: draft.toStoreId,
        transferDate: DateTime.now(),
      ),
    );
  }

  Future<_TransferDraft?> _showCreateTransferDialog(
    List<StoreDb> stores,
  ) async {
    final formKey = GlobalKey<FormState>();
    final numberController = TextEditingController(
      text: 'TRF-${DateTime.now().microsecondsSinceEpoch}',
    );
    int fromStoreId = stores.first.id;
    int toStoreId = stores
        .firstWhere(
          (store) => store.id != fromStoreId,
        )
        .id;

    final result = await showDialog<_TransferDraft>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('تحويل مخزون جديد'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: 'رقم التحويل'),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'رقم التحويل مطلوب'
                      : null,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  initialValue: fromStoreId,
                  decoration: const InputDecoration(labelText: 'من مخزن'),
                  items: stores
                      .map(
                        (store) => DropdownMenuItem(
                          value: store.id,
                          child: Text(store.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setDialogState(() {
                      fromStoreId = value;
                      if (toStoreId == value) {
                        toStoreId =
                            stores.firstWhere((store) => store.id != value).id;
                      }
                    });
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  initialValue: toStoreId,
                  decoration: const InputDecoration(labelText: 'إلى مخزن'),
                  items: stores
                      .where((store) => store.id != fromStoreId)
                      .map(
                        (store) => DropdownMenuItem(
                          value: store.id,
                          child: Text(store.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => toStoreId = value);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;
                Navigator.pop(
                  dialogContext,
                  _TransferDraft(
                    number: numberController.text.trim(),
                    fromStoreId: fromStoreId,
                    toStoreId: toStoreId,
                  ),
                );
              },
              child: const Text('إنشاء'),
            ),
          ],
        ),
      ),
    );

    numberController.dispose();
    return result;
  }

  Future<void> _addItem(StockTransferDb transfer) async {
    if (_products.isEmpty) {
      _showMessage('لا توجد منتجات نشطة لإضافتها.');
      return;
    }

    final draft = await _showAddItemDialog();
    if (draft == null || !mounted) return;

    await _runAction(
      transfer.id,
      () => _database.stockTransfersDao.addTransferItem(
        transferId: transfer.id,
        productId: draft.product.id,
        unitName: draft.product.baseUnit,
        enteredQuantity: draft.quantity,
        unitCost: draft.unitCost,
        note: draft.note,
      ),
    );
  }

  Future<_TransferItemDraft?> _showAddItemDialog() async {
    final formKey = GlobalKey<FormState>();
    final quantityController = TextEditingController();
    int selectedProductId = _products.first.id;
    final costController = TextEditingController(
      text: _products.first.costPrice.toString(),
    );
    String? note;

    final result = await showDialog<_TransferItemDraft>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('إضافة صنف للتحويل'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<int>(
                    initialValue: selectedProductId,
                    isExpanded: true,
                    decoration: const InputDecoration(labelText: 'المنتج'),
                    items: _products
                        .map(
                          (product) => DropdownMenuItem(
                            value: product.id,
                            child: Text(
                              '${product.name} (${product.baseUnit})',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setDialogState(() {
                        selectedProductId = value;
                        costController.text =
                            _productById(value)?.costPrice.toString() ?? '0';
                      });
                    },
                  ),
                  TextFormField(
                    controller: quantityController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: 'الكمية'),
                    validator: (value) {
                      final quantity = double.tryParse(value ?? '');
                      return quantity == null ||
                              !quantity.isFinite ||
                              quantity <= 0
                          ? 'أدخل كمية موجبة'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: costController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      labelText: 'تكلفة الوحدة',
                    ),
                    validator: (value) {
                      final cost = double.tryParse(value ?? '');
                      return cost == null || !cost.isFinite || cost < 0
                          ? 'أدخل تكلفة صحيحة'
                          : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'ملاحظة'),
                    onChanged: (value) => note = value,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;
                final product = _productById(selectedProductId);
                if (product == null) return;
                Navigator.pop(
                  dialogContext,
                  _TransferItemDraft(
                    product: product,
                    quantity: double.parse(quantityController.text),
                    unitCost: double.parse(costController.text),
                    note: note,
                  ),
                );
              },
              child: const Text('إضافة'),
            ),
          ],
        ),
      ),
    );

    quantityController.dispose();
    costController.dispose();
    return result;
  }

  Future<void> _receiveItem(StockTransferItemDb item) async {
    final remainingEntered =
        (item.shippedQuantity - item.receivedQuantity) / item.conversionFactor;
    final controller = TextEditingController(
      text: remainingEntered.toString(),
    );
    final formKey = GlobalKey<FormState>();

    final quantity = await showDialog<double>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('استلام صنف التحويل'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'الكمية المستلمة (${item.unitName})',
            ),
            validator: (value) {
              final entered = double.tryParse(value ?? '');
              return entered == null ||
                      !entered.isFinite ||
                      entered <= 0 ||
                      entered - remainingEntered > _epsilon
                  ? 'أدخل كمية موجبة لا تتجاوز المتبقي'
                  : null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(dialogContext, double.parse(controller.text));
              }
            },
            child: const Text('تأكيد الاستلام'),
          ),
        ],
      ),
    );

    controller.dispose();
    if (quantity == null || !mounted) return;
    await _runAction(
      item.transferId,
      () => _database.stockTransfersDao.receiveTransferItem(
        itemId: item.id,
        receivedEnteredQuantity: quantity,
      ),
    );
  }

  Future<void> _runAction<T>(
    int? transferId,
    Future<T> Function() action,
  ) async {
    setState(() => _busyTransferId = transferId);
    try {
      await action();
      await _load();
      if (mounted) _showMessage('تم تحديث تحويل المخزون.');
    } catch (error) {
      if (mounted) _showMessage(error.toString());
    } finally {
      if (mounted) setState(() => _busyTransferId = null);
    }
  }

  StoreDb? _storeById(int id) {
    for (final store in _stores) {
      if (store.id == id) return store;
    }
    return null;
  }

  ProductDb? _productById(int id) {
    for (final product in _products) {
      if (product.id == id) return product;
    }
    return null;
  }

  String _storeName(int id) => _storeById(id)?.name ?? 'مخزن #$id';

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}

const double _epsilon = 0.000001;

class _TransferStatus extends StatelessWidget {
  const _TransferStatus({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    const labels = {
      'draft': 'مسودة',
      'approved': 'معتمد',
      'shipped': 'تم الشحن',
      'partially_received': 'استلام جزئي',
      'received': 'مستلم',
      'cancelled': 'ملغي',
    };

    return Chip(
      label: Text(labels[status] ?? status),
      visualDensity: VisualDensity.compact,
    );
  }
}

class _TransferDraft {
  const _TransferDraft({
    required this.number,
    required this.fromStoreId,
    required this.toStoreId,
  });

  final String number;
  final int fromStoreId;
  final int toStoreId;
}

class _TransferItemDraft {
  const _TransferItemDraft({
    required this.product,
    required this.quantity,
    required this.unitCost,
    this.note,
  });

  final ProductDb product;
  final double quantity;
  final double unitCost;
  final String? note;
}
