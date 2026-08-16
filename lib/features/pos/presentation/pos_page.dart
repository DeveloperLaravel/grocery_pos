import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_pos/core/di/injection.dart';
import 'package:grocery_pos/features/backup/presentation/backup_page.dart';
import 'package:grocery_pos/features/pos/presentation/barcode_page.dart';
import 'package:grocery_pos/features/pos/presentation/bloc/pos_bloc.dart';
import 'package:grocery_pos/features/pos/presentation/bloc/pos_state.dart';
import 'package:grocery_pos/features/pos/presentation/receipt_page.dart';
import 'package:grocery_pos/features/pos/presentation/widgets/cart_panel.dart';
import 'package:grocery_pos/features/pos/presentation/widgets/checkout_dialog.dart';

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
      barcodeFocus.requestFocus();
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
    return BlocConsumer<PosBloc, PosState>(
      listenWhen: (previous, current) =>
          previous.error != current.error ||
          previous.success != current.success ||
          previous.lastReceipt != current.lastReceipt,
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: Colors.red,
            ),
          );

          _focusBarcode();
        }

        if (state.success != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.success!),
            ),
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
              .then((_) {
            _focusBarcode();
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _header(context),

                  const SizedBox(height: 12),

                  _barcodePanel(context, state),

                  const SizedBox(height: 12),

                  Expanded(
                    child: CartPanel(
                      items: state.cart,
                      subtotal: state.subtotal,
                      discount: state.discount,
                      total: state.total,
                      busy: state.checkingOut,
                      onChangeQty: (id, delta) {
                        context.read<PosBloc>().add(
                              ChangeQty(id, delta),
                            );

                        _focusBarcode();
                      },
                      onRemove: (id) {
                        context.read<PosBloc>().add(
                              RemoveCartLine(id),
                            );

                        _focusBarcode();
                      },
                      onDiscount: () =>
                          _editDiscount(context, state),
                      onClear: () {
                        context.read<PosBloc>().add(
                              ClearCart(),
                            );

                        _focusBarcode();
                      },
                      onCheckout: () =>
                          _checkout(context, state),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'نقطة البيع',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        OutlinedButton.icon(
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (_) => const BackupPage(),
              ),
            )
                .then((_) {
              _focusBarcode();
            });
          },
          icon: const Icon(Icons.cloud_upload_outlined),
          label: const Text('نسخة احتياطية'),
        ),
      ],
    );
  }

  Widget _barcodePanel(
    BuildContext context,
    PosState state,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.qr_code_scanner,
                  size: 30,
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    Platform.isWindows
                        ? 'مرر المنتج أمام قارئ الباركود'
                        : 'امسح باركود المنتج',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: barcodeController,
                    focusNode: barcodeFocus,
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      labelText: 'الباركود',
                      hintText: Platform.isWindows
                          ? 'استخدم قارئ USB'
                          : 'اكتب أو امسح الباركود',
                      prefixIcon:
                          const Icon(Icons.qr_code),
                      border:
                          const OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      _submitBarcode(context, value);
                    },
                  ),
                ),

                const SizedBox(width: 10),

                if (Platform.isAndroid)
                  SizedBox(
                    height: 56,
                    child: FilledButton.icon(
                      onPressed: () =>
                          _scanCamera(context),
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                      ),
                      label: const Text('الكاميرا'),
                    ),
                  ),

                if (Platform.isWindows)
                  SizedBox(
                    height: 56,
                    child: FilledButton.icon(
                      onPressed: _focusBarcode,
                      icon: const Icon(Icons.usb),
                      label: const Text('قارئ USB'),
                    ),
                  ),
              ],
            ),

            if (state.loading) ...[
              const SizedBox(height: 8),
              const LinearProgressIndicator(
                minHeight: 2,
              ),
            ],

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                Platform.isWindows
                    ? 'قارئ USB يرسل الباركود ثم Enter تلقائياً'
                    : 'يمكنك استخدام الكاميرا أو إدخال الباركود يدوياً',
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

    final code = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => const BarcodePage(),
      ),
    );

    if (!context.mounted) {
      return;
    }

    if (code != null && code.trim().isNotEmpty) {
      context.read<PosBloc>().add(
            ScanBarcode(code.trim()),
          );
    }

    barcodeController.clear();

    _focusBarcode();
  }

  void _focusBarcode() {
    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      barcodeFocus.requestFocus();
    });
  }

  Future<void> _editDiscount(
    BuildContext context,
    PosState state,
  ) async {
    final controller = TextEditingController(
      text: state.discount.toStringAsFixed(2),
    );

    final value = await showDialog<double>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('خصم على الفاتورة'),
          content: TextField(
            controller: controller,
            autofocus: true,
            keyboardType:
                const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: InputDecoration(
              labelText: 'قيمة الخصم',
              helperText:
                  'الحد الأقصى ${state.subtotal.toStringAsFixed(2)} د.ل',
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(
                  dialogContext,
                  double.tryParse(
                        controller.text.replaceAll(
                          ',',
                          '.',
                        ),
                      ) ??
                      0,
                );
              },
              child: const Text('تطبيق'),
            ),
          ],
        );
      },
    );

    controller.dispose();

    if (value != null && context.mounted) {
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('السلة فارغة'),
        ),
      );

      _focusBarcode();

      return;
    }

    final result = await showDialog<CheckoutResult>(
      context: context,
      builder: (_) => CheckoutDialog(
        total: state.total,
        initialMethod: state.paymentMethod,
      ),
    );

    if (result == null || !context.mounted) {
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
}