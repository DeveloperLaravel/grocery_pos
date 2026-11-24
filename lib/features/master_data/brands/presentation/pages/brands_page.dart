
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/database/di/injection.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../domain/entities/brand.dart';
import '../bloc/brand_bloc.dart';
import '../bloc/brand_event.dart';
import '../bloc/brand_state.dart';
import 'brand_form_page.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BrandBloc>()
        ..add(const BrandEvent.watchBrandsRequested()),
      child: const _BrandsView(),
    );
  }
}

class _BrandsView extends StatefulWidget {
  const _BrandsView();

  @override
  State<_BrandsView> createState() => _BrandsViewState();
}

class _BrandsViewState extends State<_BrandsView> {
  final TextEditingController _searchController =
      TextEditingController();

  bool _activeOnly = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _changeFilter(bool activeOnly) {
    setState(() => _activeOnly = activeOnly);

    context.read<BrandBloc>().add(
      BrandEvent.watchBrandsRequested(
        activeOnly: activeOnly,
      ),
    );
  }

  void _openForm({Brand? brand}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<BrandBloc>(),
          child: BrandFormPage(brand: brand),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(Brand brand) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(
          Icons.delete_outline_rounded,
          color: AppColors.error,
          size: 34,
        ),
        title: const Text('حذف العلامة التجارية'),
        content: Text(
          'هل أنت متأكد من حذف "${brand.name}"؟\n'
          'لن يتم حذف المنتجات المرتبطة بها، وفق إعداد العلاقة بقاعدة البيانات.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('إلغاء'),
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            onPressed: () => Navigator.pop(dialogContext, true),
            icon: const Icon(Icons.delete_outline),
            label: const Text('حذف'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      context.read<BrandBloc>().add(
        BrandEvent.deleteBrandRequested(id: brand.id!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocListener<BrandBloc, BrandState>(
      listenWhen: (previous, current) =>
          previous.successMessage != current.successMessage ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        final message = state.successMessage ?? state.errorMessage;

        if (message == null || message.isEmpty) return;

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: state.errorMessage != null
                  ? AppColors.error
                  : AppColors.success,
            ),
          );

        context.read<BrandBloc>().add(
          const BrandEvent.clearBrandMessagesRequested(),
        );
      },
      child: Scaffold(
        backgroundColor: colors.surfaceContainerLowest,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1500),
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isWide ? 32 : 18,
                          vertical: 24,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            _buildHeader(context, isWide),
                            const SizedBox(height: 24),
                            _buildStatistics(context),
                            const SizedBox(height: 24),
                            _buildSearchAndFilters(context),
                            const SizedBox(height: 18),
                            _buildSectionHeader(context),
                            const SizedBox(height: 14),
                          ]),
                        ),
                      ),
                      _buildBrandsContent(context, constraints.maxWidth),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 32),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _openForm(),
          icon: const Icon(Icons.add_rounded),
          label: const Text('إضافة علامة تجارية'),
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // Header
  // -----------------------------------------------------

  Widget _buildHeader(BuildContext context, bool isWide) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Icon(
            Icons.branding_watermark_rounded,
            color: colors.primary,
            size: 28,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'العلامات التجارية',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'إدارة العلامات التجارية وتنظيم منتجات المتجر',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        if (isWide)
          OutlinedButton.icon(
            onPressed: () {
              context.read<BrandBloc>().add(
                BrandEvent.loadBrandsRequested(
                  activeOnly: _activeOnly,
                ),
              );
            },
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('تحديث'),
          ),
      ],
    );
  }

  // -----------------------------------------------------
  // Statistics
  // -----------------------------------------------------

  Widget _buildStatistics(BuildContext context) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        final inactive = (state.totalBrands - state.activeBrands)
            .clamp(0, state.totalBrands);

        return LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 850
                ? 3
                : constraints.maxWidth >= 500
                    ? 3
                    : 1;

            final cards = [
              _StatisticCard(
                title: 'إجمالي العلامات',
                value: state.totalBrands.toString(),
                icon: Icons.sell_outlined,
                color: AppColors.primary,
              ),
              _StatisticCard(
                title: 'العلامات النشطة',
                value: state.activeBrands.toString(),
                icon: Icons.check_circle_outline_rounded,
                color: AppColors.success,
              ),
              _StatisticCard(
                title: 'غير النشطة',
                value: inactive.toString(),
                icon: Icons.pause_circle_outline_rounded,
                color: AppColors.warning,
              ),
            ];

            if (columns == 1) {
              return Column(
                children: [
                  for (final card in cards) ...[
                    card,
                    const SizedBox(height: 10),
                  ],
                ],
              );
            }

            return Row(
              children: [
                for (int i = 0; i < cards.length; i++) ...[
                  Expanded(child: cards[i]),
                  if (i != cards.length - 1)
                    const SizedBox(width: 12),
                ],
              ],
            );
          },
        );
      },
    );
  }

  // -----------------------------------------------------
  // Search and filters
  // -----------------------------------------------------

  Widget _buildSearchAndFilters(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _searchController,
          onChanged: (value) {
            context.read<BrandBloc>().add(
              BrandEvent.searchBrandsRequested(query: value),
            );
          },
          decoration: InputDecoration(
            hintText: 'ابحث عن علامة تجارية...',
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: _searchController.text.isEmpty
                ? null
                : IconButton(
                    tooltip: 'مسح البحث',
                    onPressed: () {
                      _searchController.clear();
                      context.read<BrandBloc>().add(
                        const BrandEvent.clearBrandSearchRequested(),
                      );
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _FilterChip(
              label: 'كل العلامات',
              selected: !_activeOnly,
              onTap: () => _changeFilter(false),
            ),
            _FilterChip(
              label: 'النشطة فقط',
              selected: _activeOnly,
              onTap: () => _changeFilter(true),
            ),
          ],
        ),
      ],
    );
  }

  // -----------------------------------------------------
  // Section header
  // -----------------------------------------------------

  Widget _buildSectionHeader(BuildContext context) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Text(
                'قائمة العلامات التجارية',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '${state.filteredBrands.length} علامة',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        );
      },
    );
  }

  // -----------------------------------------------------
  // Content
  // -----------------------------------------------------

  Widget _buildBrandsContent(
    BuildContext context,
    double width,
  ) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        if (state.status == BrandStatus.loading &&
            state.brands.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state.status == BrandStatus.failure &&
            state.brands.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: _EmptyState(
              icon: Icons.cloud_off_outlined,
              title: 'تعذر تحميل العلامات التجارية',
              subtitle: state.errorMessage ?? 'حدث خطأ غير متوقع',
              actionLabel: 'إعادة المحاولة',
              onAction: () {
                context.read<BrandBloc>().add(
                  BrandEvent.watchBrandsRequested(
                    activeOnly: _activeOnly,
                  ),
                );
              },
            ),
          );
        }

        if (state.filteredBrands.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: _EmptyState(
              icon: state.searchQuery.isNotEmpty
                  ? Icons.search_off_rounded
                  : Icons.sell_outlined,
              title: state.searchQuery.isNotEmpty
                  ? 'لا توجد نتائج مطابقة'
                  : 'لا توجد علامات تجارية',
              subtitle: state.searchQuery.isNotEmpty
                  ? 'جرّب البحث بكلمات أخرى'
                  : 'ابدأ بإضافة أول علامة تجارية للمتجر',
              actionLabel: state.searchQuery.isNotEmpty
                  ? 'مسح البحث'
                  : 'إضافة علامة تجارية',
              onAction: () {
                if (state.searchQuery.isNotEmpty) {
                  _searchController.clear();
                  context.read<BrandBloc>().add(
                    const BrandEvent.clearBrandSearchRequested(),
                  );
                } else {
                  _openForm();
                }
              },
            ),
          );
        }

        final columns = width >= 1150
            ? 3
            : width >= 650
                ? 2
                : 1;

        return SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: width >= 900 ? 32 : 18,
          ),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              mainAxisExtent: 190,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final brand = state.filteredBrands[index];

                return _BrandCard(
                  brand: brand,
                  onEdit: () => _openForm(brand: brand),
                  onDelete: () => _confirmDelete(brand),
                  onToggle: () {
                    context.read<BrandBloc>().add(
                      BrandEvent.toggleBrandStatusRequested(
                        id: brand.id!,
                      ),
                    );
                  },
                );
              },
              childCount: state.filteredBrands.length,
            ),
          ),
        );
      },
    );
  }
}

// =======================================================
// Statistic Card
// =======================================================

class _StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatisticCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// Filter Chip
// =======================================================

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
    final colors = Theme.of(context).colorScheme;

    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: colors.primaryContainer,
      labelStyle: TextStyle(
        color: selected
            ? colors.onPrimaryContainer
            : colors.onSurfaceVariant,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
      side: BorderSide(
        color: selected ? colors.primary : colors.outlineVariant,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

// =======================================================
// Brand Card
// =======================================================

class _BrandCard extends StatelessWidget {
  final Brand brand;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const _BrandCard({
    required this.brand,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final active = brand.isActive;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _BrandAvatar(brand: brand),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      brand.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    _StatusBadge(active: active),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                tooltip: 'خيارات العلامة التجارية',
                onSelected: (value) {
                  switch (value) {
                    case 'edit':
                      onEdit();
                      break;
                    case 'toggle':
                      onToggle();
                      break;
                    case 'delete':
                      onDelete();
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      dense: true,
                      leading: Icon(Icons.edit_outlined),
                      title: Text('تعديل'),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'toggle',
                    child: ListTile(
                      dense: true,
                      leading: Icon(
                        active
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                      ),
                      title: Text(active ? 'تعطيل' : 'تفعيل'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.delete_outline,
                        color: AppColors.error,
                      ),
                      title: Text(
                        'حذف',
                        style: TextStyle(color: AppColors.error),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              (brand.description?.trim().isNotEmpty ?? false)
                  ? brand.description!
                  : 'لا يوجد وصف لهذه العلامة التجارية',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Divider(color: colors.outlineVariant, height: 1),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 14,
                color: colors.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'تاريخ الإضافة: ${_formatDate(brand.createdAt)}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ),
              TextButton(
                onPressed: onEdit,
                child: const Text('عرض وتعديل'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    return '$d/$m/${date.year}';
  }
}

// =======================================================
// Brand Avatar
// =======================================================

class _BrandAvatar extends StatelessWidget {
  final Brand brand;

  const _BrandAvatar({required this.brand});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: Text(
        brand.name.trim().isEmpty
            ? '?'
            : brand.name.trim().characters.first.toUpperCase(),
        style: TextStyle(
          color: colors.primary,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// =======================================================
// Status Badge
// =======================================================

class _StatusBadge extends StatelessWidget {
  final bool active;

  const _StatusBadge({required this.active});

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.success : AppColors.warning;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.11),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            active ? Icons.check_circle : Icons.pause_circle,
            size: 13,
            color: color,
          ),
          const SizedBox(width: 5),
          Text(
            active ? 'نشطة' : 'غير نشطة',
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// Empty State
// =======================================================

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onAction;

  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 38,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: onAction,
              icon: const Icon(Icons.arrow_back_rounded),
              label: Text(actionLabel),
            ),
          ],
        ),
      ),
    );
  }
}
