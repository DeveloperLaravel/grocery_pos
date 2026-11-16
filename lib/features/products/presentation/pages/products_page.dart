
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../domain/entities/product.dart';

import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';


import '../widgets/product_form_dialog.dart';
import '../widgets/products_header.dart';
import '../widgets/products_statistics.dart';
import '../widgets/products_search_field.dart';
import '../widgets/products_content.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..initialize(),
      child: const _ProductsView(),
    );
  }
}

class _ProductsView extends StatefulWidget {
  const _ProductsView();

  @override
  State<_ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<_ProductsView> {
  final TextEditingController _searchController =
      TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showMessage(
    String message, {
    bool error = false,
  }) {
    final scheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: error
              ? scheme.error
              : scheme.primary,
          content: Row(
            children: [
              Icon(
                error
                    ? Icons.error_outline_rounded
                    : Icons.check_circle_outline_rounded,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(message),
              ),
            ],
          ),
        ),
      );
  }

  // =========================================
  // Add / Edit Product
  // =========================================

  Future<void> _openForm([
    Product? product,
  ]) async {
    final cubit = context.read<ProductsCubit>();

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return BlocProvider.value(
          value: cubit,
          child: ProductFormDialog(
            product: product,
          ),
        );
      },
    );

    if (!mounted) return;

    final state = cubit.state;

    if (state.successMessage != null) {
      _showMessage(state.successMessage!);
      cubit.clearMessages();
    } else if (state.errorMessage != null) {
      _showMessage(
        state.errorMessage!,
        error: true,
      );
      cubit.clearMessages();
    }
  }

  // =========================================
  // Delete Product
  // =========================================

  Future<void> _deleteProduct(Product product) async {
    if (product.id == null) return;

    final scheme = Theme.of(context).colorScheme;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: Icon(
            Icons.delete_outline_rounded,
            color: scheme.error,
            size: 38,
          ),
          title: const Text('حذف المنتج'),
          content: Text(
            'هل تريد حذف "${product.name}"؟\n'
            'لا يمكن التراجع عن هذه العملية.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('إلغاء'),
            ),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: scheme.error,
                foregroundColor: scheme.onError,
              ),
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) return;

    final success = await context
        .read<ProductsCubit>()
        .deleteProduct(product.id!);

    if (!mounted) return;

    final state = context.read<ProductsCubit>().state;

    if (success) {
      _showMessage('تم حذف المنتج بنجاح');
    } else {
      _showMessage(
        state.errorMessage ?? 'تعذر حذف المنتج',
        error: true,
      );
    }
  }

  // =========================================
  // Build
  // =========================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surfaceContainerLowest,

        body: SafeArea(
          child: BlocConsumer<ProductsCubit, ProductsState>(
            listenWhen: (previous, current) =>
                previous.errorMessage != current.errorMessage &&
                current.errorMessage != null,

            listener: (context, state) {
              _showMessage(
                state.errorMessage!,
                error: true,
              );

              context.read<ProductsCubit>().clearMessages();
            },

            builder: (context, state) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;

                  final compact = width < 700;
                  final veryCompact = width < 380;

                  final cubit = context.read<ProductsCubit>();

                  return Padding(
                    padding: EdgeInsets.all(
                      veryCompact
                          ? 10
                          : compact
                              ? 14
                              : 24,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header
                        ProductsHeader(
                          compact: compact,
                          veryCompact: veryCompact,
                          onAdd: () => _openForm(),
                          onRefresh: cubit.loadProducts,
                        ),

                        const SizedBox(height: 22),

                        // Statistics
                        ProductsStatistics(
                          total: cubit.totalProducts,
                          lowStock: cubit.lowStockCount,
                          available: cubit.availableProducts,
                          compact: compact,
                          veryCompact: veryCompact,
                        ),

                        const SizedBox(height: 22),

                        // Search
                        ProductsSearchField(
                          controller: _searchController,
                          onChanged: cubit.searchProducts,
                        ),

                        const SizedBox(height: 16),

                        // Products
                        Expanded(
                          child: ProductsContent(
                            state: state,
                            products: cubit.filteredProducts,
                            compact: compact,
                            veryCompact: veryCompact,
                            onEdit: _openForm,
                            onDelete: _deleteProduct,
                            onAdd: () => _openForm(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
