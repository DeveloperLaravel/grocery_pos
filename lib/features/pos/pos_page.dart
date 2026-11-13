
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_pos/core/di/injection.dart';
import 'package:grocery_pos/features/backup/presentation/backup_page.dart';
import 'package:grocery_pos/features/pos/domain/presentation/barcode_page.dart';
import 'package:grocery_pos/features/pos/domain/presentation/bloc/pos_bloc.dart';
import 'package:grocery_pos/features/pos/domain/presentation/bloc/pos_state.dart';
import 'package:grocery_pos/features/pos/domain/presentation/receipt_page.dart';
import 'package:grocery_pos/features/pos/domain/presentation/widgets/cart_panel.dart';
import 'package:grocery_pos/features/pos/domain/presentation/widgets/checkout_dialog.dart';

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
  final TextEditingController barcodeController =
      TextEditingController();

  final FocusNode barcodeFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusBarcode();
    });
  }

  @override
  void dispose() {
    barcodeController.dispose();
    barcodeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return BlocConsumer<PosBloc, PosState>(
      listenWhen: (previous, current) {
        return previous.error != current.error ||
            previous.success != current.success ||
            previous.lastReceipt != current.lastReceipt;
      },
      listener: (context, state) {
        if (state.error != null) {
          _showMessage(
            context,
            state.error!,
            error: true,
          );

          _focusBarcode();
        }

        if (state.success != null) {
          _showMessage(
            context,
            state.success!,
          );

          _focusBarcode();
        }

        if (state.lastReceipt != null) {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => ReceiptPage(
                    receipt: state.lastReceipt!,
                  ),
                ),
              )
              .then((_) => _focusBarcode());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: scheme.surfaceContainerLowest,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final compact = constraints.maxWidth < 720;

                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 1500,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        compact ? 10 : 18,
                      ),
                      child: Column(
                        children: [
                          _buildHeader(
                            context,
                            state,
                            compact,
                          ),

                          SizedBox(
                            height: compact ? 10 : 14,
                          ),

                          _buildBarcodePanel(
                            context,
                            state,
                            compact,
                          ),

                          SizedBox(
                            height: compact ? 10 : 14,
                          ),

                          Expanded(
                            child: CartPanel(
                              items: state.cart,
                              subtotal: state.subtotal,
                              discount: state.discount,
                              total: state.total,
                              busy: state.checkingOut,

                              onChangeQty: (productId, delta) {
                                context.read<PosBloc>().add(
                                      ChangeQty(
                                        productId,
                                        delta,
                                      ),
                                    );

                                _focusBarcode();
                              },

                              onRemove: (productId) {
                                context.read<PosBloc>().add(
                                      RemoveCartLine(
                                        productId,
                                      ),
                                    );

                                _focusBarcode();
                              },

                              onDiscount: () {
                                _editDiscount(
                                  context,
                                  state,
                                );
                              },

                              onClear: () {
                                context.read<PosBloc>().add(
                                      ClearCart(),
                                    );

                                _focusBarcode();
                              },

                              onCheckout: () {
                                _checkout(
                                  context,
                                  state,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(
    BuildContext context,
    PosState state,
    bool compact,
  ) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 13 : 17,
        vertical: compact ? 11 : 14,
      ),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: scheme.outlineVariant,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: compact ? 46 : 52,
            height: compact ? 46 : 52,
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.point_of_sale_rounded,
              color: scheme.onPrimaryContainer,
              size: compact ? 25 : 29,
            ),
          ),

          const SizedBox(width: 9),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'نقطة البيع',
                  style: TextStyle(
                    fontSize: compact ? 22 : 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                if (!compact) ...[
                  const SizedBox(height: 1),
                  Text(
                    'امسح الباركود ثم حدد الكمية وأكمل البيع',
                    style: TextStyle(
                      color: scheme.onSurfaceVariant,
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            ),
          ),

          if (!compact) ...[
            _HeaderInfo(
              icon: Icons.shopping_cart_outlined,
              title: 'العناصر',
              value: '${state.cart.length}',
            ),

            const SizedBox(width: 8),

            _HeaderInfo(
              icon: Icons.payments_outlined,
              title: 'الإجمالي',
              value: '${state.total.toStringAsFixed(2)} د.ل',
            ),

            const SizedBox(width: 10),
          ],

          compact
              ? IconButton.filledTonal(
                  tooltip: 'نسخة احتياطية',
                  onPressed: () {
                    _openBackup(context);
                  },
                  icon: const Icon(
                    Icons.cloud_upload_outlined,
                  ),
                )
              : FilledButton.tonalIcon(
                  onPressed: () {
                    _openBackup(context);
                  },
                  icon: const Icon(
                    Icons.cloud_upload_outlined,
                  ),
                  label: const Text(
                    'نسخة احتياطية',
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildBarcodePanel(
    BuildContext context,
    PosState state,
    bool compact,
  ) {
    final scheme = Theme.of(context).colorScheme;

    final barcodeField = TextField(
      controller: barcodeController,
      focusNode: barcodeFocus,
      autofocus: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onSubmitted: (value) {
        _submitBarcode(
          context,
          value,
        );
      },
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        letterSpacing: 1,
      ),
      decoration: InputDecoration(
        labelText: 'الباركود',
        hintText: Platform.isWindows
            ? 'مرر المنتج أمام قارئ USB'
            : 'اكتب أو امسح الباركود',
        prefixIcon: const Icon(
          Icons.qr_code_2_rounded,
        ),
        filled: true,
        fillColor: scheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: scheme.primary,
            width: 2,
          ),
        ),
      ),
    );

    final actionButton = SizedBox(
      height: 56,
      child: FilledButton.icon(
        onPressed: Platform.isAndroid
            ? () {
                _scanCamera(context);
              }
            : _focusBarcode,
        icon: Icon(
          Platform.isAndroid
              ? Icons.camera_alt_outlined
              : Icons.usb_rounded,
        ),
        label: Text(
          Platform.isAndroid
              ? 'فتح الكاميرا'
              : 'قارئ USB',
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        compact ? 14 : 18,
      ),
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  Icons.qr_code_scanner_rounded,
                  color: scheme.primary,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مسح المنتج',
                      style: TextStyle(
                        color: scheme.onPrimaryContainer,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    Text(
                      'المنتج سيظهر في السلة مباشرة',
                      style: TextStyle(
                        color: scheme.onPrimaryContainer,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          if (compact) ...[
            barcodeField,

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: actionButton,
            ),
          ] else
            Row(
              children: [
                Expanded(
                  child: barcodeField,
                ),

                const SizedBox(width: 10),

                actionButton,
              ],
            ),

          if (state.loading) ...[
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const LinearProgressIndicator(
                minHeight: 3,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _openBackup(
    BuildContext context,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const BackupPage(),
      ),
    );

    _focusBarcode();
  }

  void _submitBarcode(
    BuildContext context,
    String value,
  ) {
    final code = value.trim();

    if (code.isEmpty) {
      _focusBarcode();
      return;
    }

    context.read<PosBloc>().add(
          ScanBarcode(code),
        );

    barcodeController.clear();

    _focusBarcode();
  }

  Future<void> _scanCamera(
    BuildContext context,
  ) async {
    if (!Platform.isAndroid) {
      _focusBarcode();
      return;
    }

    final code =
        await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => const BarcodePage(),
      ),
    );

    if (!context.mounted) {
      return;
    }

    if (code != null &&
        code.trim().isNotEmpty) {
      context.read<PosBloc>().add(
            ScanBarcode(
              code.trim(),
            ),
          );
    }

    barcodeController.clear();

    _focusBarcode();
  }

  void _focusBarcode() {
    if (!mounted) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        barcodeFocus.requestFocus();
      }
    });
  }

  Future<void> _editDiscount(
    BuildContext context,
    PosState state,
  ) async {
    final controller =
        TextEditingController(
      text: state.discount.toStringAsFixed(2),
    );

    final value =
        await showDialog<double>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'خصم على الفاتورة',
          ),
          content: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 420,
            ),
            child: TextField(
              controller: controller,
              autofocus: true,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: 'قيمة الخصم',
                suffixText: 'د.ل',
                helperText:
                    'الحد الأقصى ${state.subtotal.toStringAsFixed(2)} د.ل',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'إلغاء',
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(
                  dialogContext,
                  double.tryParse(
                        controller.text.replaceAll(',', '.'),
                      ) ??
                      0,
                );
              },
              child: const Text(
                'تطبيق',
              ),
            ),
          ],
        );
      },
    );

    controller.dispose();

    if (value != null &&
        context.mounted) {
      context.read<PosBloc>().add(
            SetDiscount(value),
          );
    }

    _focusBarcode();
  }

  Future<void> _checkout(
    BuildContext context,
    PosState state,
  ) async {
    if (state.cart.isEmpty) {
      _showMessage(
        context,
        'السلة فارغة',
        error: true,
      );

      _focusBarcode();
      return;
    }

    final result =
        await showDialog<CheckoutResult>(
      context: context,
      barrierDismissible: false,
      builder: (_) => CheckoutDialog(
        total: state.total,
        initialMethod: state.paymentMethod,
      ),
    );

    if (result == null ||
        !context.mounted) {
      _focusBarcode();
      return;
    }

    context.read<PosBloc>().add(
          Checkout(
            result.paid,
            result.method,
          ),
        );

    _focusBarcode();
  }

  void _showMessage(
    BuildContext context,
    String message, {
    bool error = false,
  }) {
    final scheme =
        Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor:
              error ? scheme.error : scheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          content: Row(
            children: [
              Icon(
                error
                    ? Icons.error_outline_rounded
                    : Icons.check_circle_outline_rounded,
                color: error
                    ? scheme.onError
                    : scheme.onPrimary,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class _HeaderInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _HeaderInfo({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final scheme =
        Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 19,
            color: scheme.primary,
          ),

          const SizedBox(width: 7),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: scheme.onSurfaceVariant,
                ),
              ),

              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
