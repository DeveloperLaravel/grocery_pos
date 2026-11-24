
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// GetIt
import '../../../../core/database/di/injection.dart';

// Entity
import '../../domain/entities/category.dart';

// Bloc
import '../bloc/category_bloc.dart';
import '../bloc/category_event.dart';
import '../bloc/category_state.dart';

// Widgets
import '../widgets/category_header.dart';
import '../widgets/category_search_field.dart';
import '../widgets/category_grid.dart';
import '../widgets/category_empty_state.dart';
import '../widgets/category_error_state.dart';

/// الصفحة الرئيسية للتصنيفات.
///
/// تتولى إنشاء CategoryBloc وحقنه باستخدام GetIt.
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryBloc>(
      create: (_) => getIt<CategoryBloc>()
        ..add(const CategoryWatchRequested()),
      child: const _CategoriesView(),
    );
  }
}

class _CategoriesView extends StatefulWidget {
  const _CategoriesView();

  @override
  State<_CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<_CategoriesView> {
  final TextEditingController _searchController =
      TextEditingController();

  bool _activeOnly = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // =========================================================
  // Search
  // =========================================================

  void _search(String value) {
    final query = value.trim();

    if (query.isEmpty) {
      context.read<CategoryBloc>().add(
            const CategoryLoadRequested(),
          );
      return;
    }

    context.read<CategoryBloc>().add(
          CategorySearchRequested(query),
        );
  }

  void _clearSearch() {
    _searchController.clear();

    setState(() {});

    context.read<CategoryBloc>().add(
          const CategoryLoadRequested(),
        );
  }

  // =========================================================
  // Navigation
  // =========================================================

  void _openAdd() {
    context.push('/categories/add');
  }

  void _openEdit(Category category) {
    context.push(
      '/categories/${category.id}/edit',
      extra: category,
    );
  }

  // =========================================================
  // Delete
  // =========================================================

  Future<void> _confirmDelete(Category category) async {
    if (category.id == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(
            Icons.delete_outline_rounded,
            color: Colors.red,
            size: 34,
          ),
          title: const Text('حذف التصنيف'),
          content: Text(
            'هل أنت متأكد من حذف تصنيف "${category.name}"؟\n\n'
            'قد يتعذر الحذف إذا كان التصنيف مرتبطًا بمنتجات أو تصنيفات فرعية.',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('إلغاء'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: const Text('حذف التصنيف'),
            ),
          ],
        );
      },
    );

    if (!mounted || confirmed != true) return;

    context.read<CategoryBloc>().add(
          CategoryDeleteRequested(category.id!),
        );
  }

  // =========================================================
  // Toggle Status
  // =========================================================

  void _toggleStatus(Category category) {
    context.read<CategoryBloc>().add(
          CategoryToggleStatusRequested(category),
        );
  }

  // =========================================================
  // Refresh
  // =========================================================

  Future<void> _refresh() async {
    context.read<CategoryBloc>().add(
          const CategoryLoadRequested(),
        );
  }

  // =========================================================
  // Build
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CategoryBloc, CategoryState>(
          listenWhen: (previous, current) {
            return previous.successMessage != current.successMessage ||
                previous.errorMessage != current.errorMessage;
          },
          listener: (context, state) {
            final successMessage = state.successMessage;
            final errorMessage = state.errorMessage;

            final message = successMessage ?? errorMessage;

            if (message == null || message.isEmpty) return;

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(message),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: successMessage != null
                      ? Colors.green.shade700
                      : Colors.red.shade700,
                ),
              );
          },
          builder: (context, state) {
            final isLoading = state.status.name == 'loading';
            final hasSearch = _searchController.text.trim().isNotEmpty;

            final List<Category> categories;

            if (hasSearch) {
              categories = state.searchResults;
            } else if (_activeOnly) {
              categories = state.activeCategories;
            } else {
              categories = state.categories;
            }

            final hasError = state.status.name == 'failure';

            return RefreshIndicator(
              onRefresh: _refresh,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // Header
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                      22,
                      24,
                      22,
                      18,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: CategoryHeader(
                        onAdd: _openAdd,
                      ),
                    ),
                  ),

                  // Search
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: CategorySearchField(
                        onChanged: (value) {
                          setState(() {});
                          _search(value);
                        },
                        onClear: _clearSearch,
                      ),
                    ),
                  ),

                  // Section title and filters
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                      22,
                      24,
                      22,
                      14,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'قائمة التصنيفات',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${categories.length} تصنيف',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .hintColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          _FilterChip(
                            label: 'الكل',
                            selected: !_activeOnly,
                            onTap: () {
                              setState(() {
                                _activeOnly = false;
                              });

                              if (!hasSearch) {
                                context.read<CategoryBloc>().add(
                                      const CategoryLoadRequested(),
                                    );
                              }
                            },
                          ),
                          const SizedBox(width: 8),
                          _FilterChip(
                            label: 'النشطة',
                            selected: _activeOnly,
                            onTap: () {
                              setState(() {
                                _activeOnly = true;
                              });

                              if (!hasSearch) {
                                context.read<CategoryBloc>().add(
                                      const CategoryActiveRequested(),
                                    );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Loading
                  if (isLoading && categories.isEmpty)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )

                  // Error
                  else if (hasError && categories.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: CategoryErrorState(
                        message: state.errorMessage ??
                            'حدث خطأ أثناء تحميل التصنيفات',
                        onRetry: _refresh,
                      ),
                    )

                  // Empty
                  else if (categories.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: CategoryEmptyState(
                        onAdd: _openAdd,
                        isSearching: hasSearch,
                      ),
                    )

                  // Categories
                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                        22,
                        4,
                        22,
                        30,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: CategoryGrid(
                          categories: categories,
                          onEdit: _openEdit,
                          onDelete: _confirmDelete,
                          onToggleStatus: _toggleStatus,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// =============================================================
// Filter Chip
// =============================================================

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      showCheckmark: false,
      onSelected: (_) => onTap(),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: selected
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface,
      ),
      selectedColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.surface,
      side: BorderSide(
        color: Theme.of(context).dividerColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
