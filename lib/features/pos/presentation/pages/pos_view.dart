
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_navigation.dart';

import '../../../sales/presentation/dialogs/receipt_print_dialog.dart';
import '../bloc/pos_bloc.dart';
import '../bloc/pos_event.dart';
import '../bloc/pos_state.dart';

import '../cart/cart_panel.dart';
import '../layout/pos_responsive_layout.dart';

import '../widget/pos_header.dart';
import '../widget/pos_search_bar.dart';
import '../widget/pos_statistics.dart';
import '../widget/pos_product_grid.dart';
import '../widget/pos_mobile_cart_bar.dart';

class PosView extends StatelessWidget {
  const PosView({super.key});

  void _showMobileCart(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return FractionallySizedBox(
          heightFactor: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.zero,
            child: CartPanel(
              isMobile: true,
              onClose: () {
                Navigator.of(sheetContext).pop();
              },
            ),
          ),
        );
      },
    );
  }

  void _showReceiptPrinter(
    BuildContext context,
    PosState state,
  ) {
    final receipt = state.lastReceipt;

    if (receipt == null) return;

    ReceiptPrintDialog.show(
      context: context,
      receipt: receipt,
      onPreview: () {
        // salePrint يستقبل رقم الفاتورة وليس كائن الفاتورة.
        AppNavigation.salePrint(context, receipt.id);
      },
    ).then((_) {
      if (!context.mounted) return;

      context.read<PosBloc>().add(
        const PosEvent.receiptDismissed(),
      );
    });
  }

  void _showMessage(
    BuildContext context,
    PosState state,
  ) {
    final message = state.error ?? state.success;

    if (message == null || message.isEmpty) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: state.error != null
              ? Colors.red.shade700
              : Colors.green.shade700,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // الاستماع لفاتورة جديدة فقط.
        BlocListener<PosBloc, PosState>(
          listenWhen: (previous, current) {
            return previous.lastReceipt == null &&
                current.lastReceipt != null;
          },
          listener: (context, state) {
            _showReceiptPrinter(context, state);
          },
        ),

        // الاستماع لرسائل النجاح والأخطاء فقط.
        BlocListener<PosBloc, PosState>(
          listenWhen: (previous, current) {
            final hasNewError =
                previous.error != current.error &&
                current.error != null;

            final hasNewSuccess =
                previous.success != current.success &&
                current.success != null;

            return hasNewError || hasNewSuccess;
          },
          listener: (context, state) {
            _showMessage(context, state);
          },
        ),
      ],
      child: BlocBuilder<PosBloc, PosState>(
        builder: (context, state) {
          final bloc = context.read<PosBloc>();

          final header = const PosHeader(
            title: 'نقطة البيع',
            subtitle: 'إدارة عمليات البيع والفواتير',
          );

          final search = PosSearchBar(
            initialValue: state.searchQuery,
            onChanged: (query) {
              bloc.add(
                PosEvent.searchChanged(query: query),
              );
            },
            onSubmitted: (barcode) {
              bloc.add(
                PosEvent.barcodeScanned(barcode: barcode),
              );
            },
          );

          final statistics = PosStatistics(
            productsCount: state.productsCount,
            lowStockCount: state.lowStockCount,
            outOfStockCount: state.outOfStockCount,
          );

          final products = PosProductGrid(
            products: state.products,
            isLoading: state.loading,
            onAddProduct: (product) {
              bloc.add(
                PosEvent.cartProductAdded(
                  product: product,
                ),
              );
            },
          );

          const cart = CartPanel();

          final mobileCartBar = PosMobileCartBar(
            itemCount: state.cartProductsCount,
            totalItems: state.totalItems,
            total: state.total,
            onTap: () => _showMobileCart(context),
          );

          return PosResponsiveLayout(
            header: header,
            search: search,
            statistics: statistics,
            products: products,
            cart: cart,
            mobileCartBar: mobileCartBar,
          );
        },
      ),
    );
  }
}
