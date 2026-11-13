
import 'package:flutter/material.dart';

import 'package:grocery_pos/features/pos/domain/entities/cart_item.dart';

class CartPanel extends StatelessWidget {
  final List<CartItem> items;
  final double subtotal;
  final double discount;
  final double total;
  final bool busy;

  final void Function(int productId, double delta) onChangeQty;
  final void Function(int productId) onRemove;
  final VoidCallback onDiscount;
  final VoidCallback onClear;
  final VoidCallback onCheckout;

  const CartPanel({
    super.key,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.busy,
    required this.onChangeQty,
    required this.onRemove,
    required this.onDiscount,
    required this.onClear,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final veryCompact = width < 390;
        final compact = width < 700;
        final medium = width >= 700 && width < 1050;

        if (compact) {
          return Column(
            children: [
              Expanded(
                flex: veryCompact ? 7 : 6,
                child: _buildCart(
                  context,
                  compact: true,
                  veryCompact: veryCompact,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: veryCompact ? 5 : 4,
                child: _buildCheckoutPanel(
                  context,
                  compact: true,
                  veryCompact: veryCompact,
                ),
              ),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: medium ? 5 : 4,
              child: _buildCheckoutPanel(
                context,
                compact: false,
                veryCompact: false,
              ),
            ),
            SizedBox(width: medium ? 12 : 16),
            Expanded(
              flex: medium ? 7 : 8,
              child: _buildCart(
                context,
                compact: false,
                veryCompact: false,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCheckoutPanel(
    BuildContext context, {
    required bool compact,
    required bool veryCompact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(compact ? 18 : 22),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(
          veryCompact ? 11 : compact ? 13 : 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: compact ? 42 : 46,
                  height: compact ? 42 : 46,
                  decoration: BoxDecoration(
                    color: scheme.primaryContainer,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    Icons.payments_rounded,
                    color: scheme.onPrimaryContainer,
                    size: compact ? 22 : 25,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'إتمام البيع',
                        style: TextStyle(
                          fontSize: veryCompact ? 18 : compact ? 19 : 21,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (!veryCompact)
                        Text(
                          'راجع الفاتورة ثم أكمل الدفع',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: compact ? 11 : 12,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: compact ? 12 : 16),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(compact ? 12 : 14),
              decoration: BoxDecoration(
                color: scheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _summaryRow(
                    context,
                    title: 'المجموع',
                    value: '${subtotal.toStringAsFixed(2)} د.ل',
                    compact: compact,
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: busy ? null : onDiscount,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.discount_outlined,
                            size: compact ? 18 : 19,
                            color: scheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'الخصم',
                              style: TextStyle(
                                fontSize: compact ? 13 : 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${discount.toStringAsFixed(2)} د.ل',
                                style: TextStyle(
                                  fontSize: compact ? 13 : 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.edit_outlined, size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: compact ? 10 : 12),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: compact ? 12 : 14,
                vertical: compact ? 13 : 16,
              ),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Text(
                    'الإجمالي المطلوب',
                    style: TextStyle(
                      color: scheme.onPrimaryContainer,
                      fontSize: veryCompact ? 11 : 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${total.toStringAsFixed(2)} د.ل',
                      style: TextStyle(
                        color: scheme.onPrimaryContainer,
                        fontSize: veryCompact ? 28 : compact ? 31 : 34,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: compact ? 10 : 14),

            if (items.isEmpty)
              _statusBox(
                icon: Icons.info_outline_rounded,
                text: 'امسح باركود منتج لبدء البيع',
                background: scheme.surfaceContainerHigh,
                foreground: scheme.onSurfaceVariant,
              )
            else
              _statusBox(
                icon: Icons.check_circle_outline_rounded,
                text: '${items.length} عنصر جاهز للدفع',
                background: scheme.secondaryContainer,
                foreground: scheme.onSecondaryContainer,
              ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: veryCompact ? 52 : compact ? 54 : 58,
              child: FilledButton.icon(
                onPressed: items.isEmpty || busy ? null : onCheckout,
                icon: busy
                    ? const SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(
                        Icons.point_of_sale_rounded,
                        size: compact ? 22 : 24,
                      ),
                label: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    busy ? 'جارٍ إتمام البيع...' : 'إتمام البيع',
                    style: TextStyle(
                      fontSize: veryCompact ? 16 : compact ? 17 : 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCart(
    BuildContext context, {
    required bool compact,
    required bool veryCompact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(compact ? 18 : 22),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 11 : 14,
              vertical: compact ? 10 : 12,
            ),
            child: Row(
              children: [
                Container(
                  width: compact ? 40 : 44,
                  height: compact ? 40 : 44,
                  decoration: BoxDecoration(
                    color: scheme.primaryContainer,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    Icons.shopping_cart_checkout_rounded,
                    color: scheme.onPrimaryContainer,
                    size: compact ? 22 : 24,
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'السلة',
                        style: TextStyle(
                          fontSize: compact ? 18 : 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (!veryCompact)
                        Text(
                          'اضغط على رقم الكمية لإدخال قيمة',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: compact ? 10 : 11,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: compact ? 9 : 10,
                    vertical: compact ? 6 : 7,
                  ),
                  decoration: BoxDecoration(
                    color: scheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${items.length}',
                    style: TextStyle(
                      fontSize: compact ? 12 : 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                IconButton.filledTonal(
                  tooltip: 'تفريغ السلة',
                  onPressed: items.isEmpty || busy ? null : onClear,
                  icon: Icon(
                    Icons.delete_sweep_outlined,
                    size: compact ? 10 : 14,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          Expanded(
            child: items.isEmpty
                ? const _EmptyCart()
                : ListView.separated(
                    padding: EdgeInsets.all(compact ? 3 : 5),
                    itemCount: items.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: compact ? 2 : 4),
                    itemBuilder: (_, index) {
                      final item = items[index];

                      return _CartLine(
                        item: item,
                        busy: busy,
                        compact: compact,
                        veryCompact: veryCompact,
                        onMinus: () =>
                            onChangeQty(item.product.id, -1),
                        onPlus: () =>
                            onChangeQty(item.product.id, 1),
                        onRemove: () => onRemove(item.product.id),
                        onSetQuantity: () =>
                            _showQuantityDialog(context, item),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> _showQuantityDialog(
    BuildContext context,
    CartItem item,
  ) async {
    final controller = TextEditingController(
      text: _formatQty(item.quantity),
    );

    final value = await showDialog<double>(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          insetPadding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.edit_rounded),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'تعديل الكمية',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
IconButton(
  tooltip: 'إغلاق',
  onPressed: Navigator.of(dialogContext).canPop()
      ? () => Navigator.of(dialogContext).pop()
      : null,
  icon: const Icon(Icons.close_rounded),
),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: controller,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: InputDecoration(
                      labelText: 'الكمية',
                      hintText: 'أدخل الكمية',
                      prefixIcon: const Icon(Icons.numbers_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onSubmitted: (_) {
                      final parsed = double.tryParse(
                        controller.text.trim().replaceAll(',', '.'),
                      );
                      if (parsed != null && parsed > 0) {
                        Navigator.pop(dialogContext, parsed);
                      }
                    },
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton.icon(
                      onPressed: () {
                        final parsed = double.tryParse(
                          controller.text.trim().replaceAll(',', '.'),
                        );
                        if (parsed == null || parsed <= 0) return;
                        Navigator.pop(dialogContext, parsed);
                      },
                      icon: const Icon(Icons.check_rounded),
                      label: const Text(
                        'تطبيق الكمية',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    controller.dispose();

    if (value == null) return;

    final delta = value - item.quantity;
    if (delta == 0) return;

    onChangeQty(item.product.id, delta);
  }

  Widget _statusBox({
    required IconData icon,
    required String text,
    required Color background,
    required Color foreground,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: foreground, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: foreground,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    BuildContext context, {
    required String title,
    required String value,
    required bool compact,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: compact ? 13 : 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: TextStyle(
                fontSize: compact ? 13 : 14,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static String _formatQty(double value) {
    return value == value.truncateToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
  }
}

class _CartLine extends StatelessWidget {
  final CartItem item;
  final bool busy;
  final bool compact;
  final bool veryCompact;
  final VoidCallback onMinus;
  final VoidCallback onPlus;
  final VoidCallback onRemove;
  final VoidCallback onSetQuantity;

  const _CartLine({
    required this.item,
    required this.busy,
    required this.compact,
    required this.veryCompact,
    required this.onMinus,
    required this.onPlus,
    required this.onRemove,
    required this.onSetQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (veryCompact) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: scheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: Column(
          children: [
            Row(
              children: [
                _productIcon(scheme, 42),
                const SizedBox(width: 9),
                Expanded(child: _productInfo(context, compact: true)),
                IconButton(
                  tooltip: 'حذف',
                  onPressed: busy ? null : onRemove,
                  icon: const Icon(Icons.close_rounded, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _quantityControls(context, compact: true),
                const Spacer(),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${item.total.toStringAsFixed(2)} د.ل',
                      style: TextStyle(
                        color: scheme.primary,
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(compact ? 10 : 12),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        children: [
          _productIcon(scheme, compact ? 42 : 46),
          const SizedBox(width: 10),
          Expanded(child: _productInfo(context, compact: compact)),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${item.total.toStringAsFixed(2)} د.ل',
                style: TextStyle(
                  color: scheme.primary,
                  fontSize: compact ? 16 : 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _quantityControls(context, compact: compact),
                  const SizedBox(width: 5),
                  _MiniButton(
                    icon: Icons.close_rounded,
                    tooltip: 'حذف',
                    onPressed: busy ? null : onRemove,
                    tonal: false,
                    compact: compact,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _productIcon(ColorScheme scheme, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(
        Icons.inventory_2_outlined,
        color: scheme.primary,
        size: size * .52,
      ),
    );
  }

  Widget _productInfo(
    BuildContext context, {
    required bool compact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.product.name,
          maxLines: compact ? 2 : 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: compact ? 14 : 16,
            height: 1.2,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          '${item.product.salePrice.toStringAsFixed(2)} د.ل × ${_formatQty(item.quantity)}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: compact ? 11 : 13,
            color: scheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _quantityControls(
    BuildContext context, {
    required bool compact,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _MiniButton(
          icon: Icons.remove_rounded,
          tooltip: 'نقص 1',
          onPressed: busy ? null : onMinus,
          compact: compact,
        ),
        const SizedBox(width: 4),

        // Pressing the quantity itself opens numeric input.
        Material(
          color: scheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: busy ? null : onSetQuantity,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              constraints: BoxConstraints(
                minWidth: compact ? 44 : 50,
                minHeight: compact ? 31 : 34,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: compact ? 8 : 10,
                vertical: compact ? 6 : 7,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _formatQty(item.quantity),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: compact ? 12 : 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Icon(
                    Icons.edit_rounded,
                    size: compact ? 13 : 14,
                    color: scheme.onSecondaryContainer,
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 4),
        _MiniButton(
          icon: Icons.add_rounded,
          tooltip: 'زيادة 1',
          onPressed: busy ? null : onPlus,
          compact: compact,
        ),
      ],
    );
  }

  static String _formatQty(double value) {
    return value == value.truncateToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
  }
}

class _MiniButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final bool tonal;
  final bool compact;

  const _MiniButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.tonal = true,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = compact ? 31.0 : 34.0;

    return SizedBox(
      width: size,
      height: size,
      child: tonal
          ? IconButton.filledTonal(
              tooltip: tooltip,
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              icon: Icon(icon, size: compact ? 16 : 18),
            )
          : IconButton(
              tooltip: tooltip,
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              icon: Icon(icon, size: compact ? 16 : 18),
            ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.qr_code_scanner_rounded,
                size: 36,
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'امسح الباركود للبدء',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'ستظهر المنتجات الممسوحة هنا فقط',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: scheme.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
