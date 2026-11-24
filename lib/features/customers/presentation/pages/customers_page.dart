
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/customer.dart';
import '../bloc/customers_bloc.dart';
import '../bloc/customers_event.dart';
import '../bloc/customers_state.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CustomersView();
  }
}

class _CustomersView extends StatefulWidget {
  const _CustomersView();

  @override
  State<_CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<_CustomersView> {
  final TextEditingController _searchController =
      TextEditingController();

  Timer? _searchTimer;

  @override
  void initState() {
    super.initState();

    // الاستماع للتغييرات المباشرة من قاعدة البيانات.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<CustomersBloc>().add(
            const CustomersEvent.watchRequested(),
          );

      context.read<CustomersBloc>().add(
            const CustomersEvent.countsRequested(),
          );
    });
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _searchTimer?.cancel();

    _searchTimer = Timer(
      const Duration(milliseconds: 350),
      () {
        if (!mounted) return;

        context.read<CustomersBloc>().add(
              CustomersEvent.watchRequested(
                query: value.trim().isEmpty ? null : value.trim(),
              ),
            );
      },
    );
  }

  Future<void> _openAddCustomer() async {
    await context.pushNamed('customerAdd');

    if (!mounted) return;

    context.read<CustomersBloc>().add(
          const CustomersEvent.watchRequested(),
        );
  }

  Future<void> _openEditCustomer(Customer customer) async {
    await context.pushNamed(
      'customerEdit',
      pathParameters: {
        'id': customer.id.toString(),
      },
      extra: customer,
    );

    if (!mounted) return;

    context.read<CustomersBloc>().add(
          const CustomersEvent.watchRequested(),
        );
  }

  Future<void> _confirmDelete(Customer customer) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(
            Icons.delete_outline_rounded,
            color: Colors.red,
            size: 34,
          ),
          title: const Text('حذف العميل'),
          content: Text(
            'هل أنت متأكد من حذف العميل "${customer.name}" نهائياً؟\n'
            'لا يمكن التراجع عن هذه العملية.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('حذف نهائياً'),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) return;

    context.read<CustomersBloc>().add(
          CustomersEvent.deleteRequested(customer.id!),
        );
  }

  Future<void> _toggleCustomer(Customer customer) async {
    if (customer.id == null) return;

    final bloc = context.read<CustomersBloc>();

    if (customer.isActive) {
      bloc.add(
        CustomersEvent.deactivateRequested(customer.id!),
      );
    } else {
      bloc.add(
        CustomersEvent.activateRequested(customer.id!),
      );
    }
  }

  void _showCustomerDetails(Customer customer) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final colors = Theme.of(dialogContext).colorScheme;

        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _CustomerAvatar(customer: customer, size: 54),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              customer.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              customer.customerCode ?? 'بدون كود',
                              style: TextStyle(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            Navigator.pop(dialogContext),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  _DetailLine(
                    icon: Icons.phone_outlined,
                    title: 'رقم الهاتف',
                    value: customer.phone ?? 'غير محدد',
                  ),
                  _DetailLine(
                    icon: Icons.email_outlined,
                    title: 'البريد الإلكتروني',
                    value: customer.email ?? 'غير محدد',
                  ),
                  _DetailLine(
                    icon: Icons.location_on_outlined,
                    title: 'العنوان',
                    value: customer.address ?? 'غير محدد',
                  ),
                  _DetailLine(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'الرصيد الافتتاحي',
                    value: customer.openingBalance.toStringAsFixed(2),
                  ),
                  _DetailLine(
                    icon: Icons.credit_card_outlined,
                    title: 'حد الائتمان',
                    value: customer.creditLimit.toStringAsFixed(2),
                  ),
                  _DetailLine(
                    icon: Icons.person_outline_rounded,
                    title: 'نوع العميل',
                    value: _customerTypeLabel(customer.customerType),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        _openEditCustomer(customer);
                      },
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text('تعديل بيانات العميل'),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocConsumer<CustomersBloc, CustomersState>(
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
                  ? colors.error
                  : colors.primary,
            ),
          );

        context.read<CustomersBloc>().add(
              const CustomersEvent.clearMessages(),
            );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colors.surface,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 700;
                final horizontalPadding = isMobile ? 16.0 : 28.0;

                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<CustomersBloc>().add(
                          const CustomersEvent.watchRequested(),
                        );
                    context.read<CustomersBloc>().add(
                          const CustomersEvent.countsRequested(),
                        );
                    await Future<void>.delayed(
                      const Duration(milliseconds: 400),
                    );
                  },
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          24,
                          horizontalPadding,
                          12,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: _PageHeader(
                            isMobile: isMobile,
                            onAdd: _openAddCustomer,
                          ),
                        ),
                      ),

                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: 12,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: _StatisticsSection(state: state),
                        ),
                      ),

                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          8,
                          horizontalPadding,
                          12,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: _SearchSection(
                            controller: _searchController,
                            onChanged: _onSearchChanged,
                            onClear: () {
                              _searchController.clear();
                              _onSearchChanged('');
                            },
                          ),
                        ),
                      ),

                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          8,
                          horizontalPadding,
                          28,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: _CustomersContent(
                            state: state,
                            isMobile: isMobile,
                            onDetails: _showCustomerDetails,
                            onEdit: _openEditCustomer,
                            onDelete: _confirmDelete,
                            onToggle: _toggleCustomer,
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
      },
    );
  }
}

// =======================================================
// Page Header
// =======================================================

class _PageHeader extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onAdd;

  const _PageHeader({
    required this.isMobile,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 16,
      spacing: 16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إدارة العملاء',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: colors.onSurface,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'إدارة بيانات العملاء ومتابعة حساباتهم بسهولة',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          ],
        ),
        FilledButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add_rounded),
          label: Text(isMobile ? 'إضافة عميل' : 'إضافة عميل جديد'),
        ),
      ],
    );
  }
}

// =======================================================
// Statistics
// =======================================================

class _StatisticsSection extends StatelessWidget {
  final CustomersState state;

  const _StatisticsSection({required this.state});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth < 500
            ? 1
            : constraints.maxWidth < 900
                ? 2
                : 3;

        final items = [
          _StatData(
            title: 'إجمالي العملاء',
            value: state.totalCustomers,
            icon: Icons.groups_rounded,
            color: const Color(0xFF087F5B),
            description: 'جميع العملاء المسجلين',
          ),
          _StatData(
            title: 'العملاء النشطون',
            value: state.activeCustomers,
            icon: Icons.verified_user_rounded,
            color: const Color(0xFF159B68),
            description: 'العملاء القابلون للتعامل',
          ),
          _StatData(
            title: 'العملاء غير النشطين',
            value: state.inactiveCustomers < 0
                ? 0
                : state.inactiveCustomers,
            icon: Icons.person_off_rounded,
            color: const Color(0xFFE5A43B),
            description: 'العملاء الموقوفون',
          ),
        ];

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            mainAxisExtent: 112,
          ),
          itemBuilder: (context, index) {
            return _StatCard(data: items[index]);
          },
        );
      },
    );
  }
}

class _StatData {
  final String title;
  final int value;
  final IconData icon;
  final Color color;
  final String description;

  const _StatData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.description,
  });
}

class _StatCard extends StatelessWidget {
  final _StatData data;

  const _StatCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.55),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: data.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(data.icon, color: data.color, size: 24),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.value.toString(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Text(
                  data.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colors.onSurfaceVariant,
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
// Search
// =======================================================

class _SearchSection extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const _SearchSection({
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'ابحث عن عميل بالاسم أو الهاتف أو الكود...',
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, child) {
            if (value.text.isEmpty) {
              return const SizedBox.shrink();
            }

            return IconButton(
              tooltip: 'مسح البحث',
              onPressed: onClear,
              icon: const Icon(Icons.close_rounded),
            );
          },
        ),
        filled: true,
        fillColor: colors.surfaceContainerLow,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: colors.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: colors.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

// =======================================================
// Customers Content
// =======================================================

class _CustomersContent extends StatelessWidget {
  final CustomersState state;
  final bool isMobile;
  final ValueChanged<Customer> onDetails;
  final ValueChanged<Customer> onEdit;
  final ValueChanged<Customer> onDelete;
  final ValueChanged<Customer> onToggle;

  const _CustomersContent({
    required this.state,
    required this.isMobile,
    required this.onDetails,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (state.status == CustomersStatus.loading &&
        state.customers.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(60),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.errorMessage != null && state.customers.isEmpty) {
      return _EmptyState(
        icon: Icons.cloud_off_rounded,
        title: 'تعذر تحميل العملاء',
        description: state.errorMessage!,
        actionLabel: 'إعادة المحاولة',
        onAction: () {
          context.read<CustomersBloc>().add(
                const CustomersEvent.watchRequested(),
              );
        },
      );
    }

    if (state.customers.isEmpty) {
      return _EmptyState(
        icon: Icons.people_outline_rounded,
        title: state.searchQuery.isEmpty
            ? 'لا يوجد عملاء حتى الآن'
            : 'لم يتم العثور على نتائج',
        description: state.searchQuery.isEmpty
            ? 'ابدأ بإضافة أول عميل إلى قاعدة بياناتك'
            : 'جرّب البحث باستخدام اسم أو رقم هاتف آخر',
        actionLabel: state.searchQuery.isEmpty
            ? 'إضافة عميل'
            : 'عرض جميع العملاء',
        onAction: () {
          if (state.searchQuery.isEmpty) {
            context.pushNamed('customerAdd');
          } else {
            context.read<CustomersBloc>().add(
                  const CustomersEvent.watchRequested(),
                );
          }
        },
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'قائمة العملاء',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Text(
                  '${state.customers.length} عميل',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                ),
                if (state.status == CustomersStatus.loading) ...[
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ],
              ],
            ),
          ),
          Divider(
            height: 1,
            color: colors.outlineVariant.withValues(alpha: 0.6),
          ),
          if (isMobile)
            ...state.customers.map(
              (customer) => _CustomerCard(
                customer: customer,
                onDetails: () => onDetails(customer),
                onEdit: () => onEdit(customer),
                onDelete: () => onDelete(customer),
                onToggle: () => onToggle(customer),
              ),
            )
          else
            _CustomersTable(
              customers: state.customers,
              onDetails: onDetails,
              onEdit: onEdit,
              onDelete: onDelete,
              onToggle: onToggle,
            ),
        ],
      ),
    );
  }
}

// =======================================================
// Mobile Customer Card
// =======================================================

class _CustomerCard extends StatelessWidget {
  final Customer customer;
  final VoidCallback onDetails;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const _CustomerCard({
    required this.customer,
    required this.onDetails,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onDetails,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _CustomerAvatar(customer: customer),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        customer.customerCode ?? 'بدون كود',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
                _StatusChip(isActive: customer.isActive),
                _CustomerMenu(
                  onDetails: onDetails,
                  onEdit: onEdit,
                  onToggle: onToggle,
                  onDelete: onDelete,
                  isActive: customer.isActive,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _SmallInfo(
                    icon: Icons.phone_outlined,
                    value: customer.phone ?? 'لا يوجد هاتف',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _SmallInfo(
                    icon: Icons.person_outline_rounded,
                    value: _customerTypeLabel(customer.customerType),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 16,
                  color: colors.onSurfaceVariant,
                ),
                const SizedBox(width: 7),
                Text(
                  'الرصيد الافتتاحي',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                ),
                const Spacer(),
                Text(
                  customer.openingBalance.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
}

// =======================================================
// Desktop Table
// =======================================================

class _CustomersTable extends StatelessWidget {
  final List<Customer> customers;
  final ValueChanged<Customer> onDetails;
  final ValueChanged<Customer> onEdit;
  final ValueChanged<Customer> onDelete;
  final ValueChanged<Customer> onToggle;

  const _CustomersTable({
    required this.customers,
    required this.onDetails,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 850),
        child: DataTable(
          headingRowColor: WidgetStatePropertyAll(
            colors.surfaceContainerLow,
          ),
          columnSpacing: 24,
          horizontalMargin: 20,
          dataRowMinHeight: 68,
          dataRowMaxHeight: 76,
          columns: const [
            DataColumn(label: Text('العميل')),
            DataColumn(label: Text('رقم الهاتف')),
            DataColumn(label: Text('نوع العميل')),
            DataColumn(label: Text('الرصيد الافتتاحي')),
            DataColumn(label: Text('الحالة')),
            DataColumn(label: Text('الإجراءات')),
          ],
          rows: customers.map((customer) {
            return DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: 190,
                    child: Row(
                      children: [
                        _CustomerAvatar(
                          customer: customer,
                          size: 38,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                customer.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                customer.customerCode ?? 'بدون كود',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: colors.onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => onDetails(customer),
                ),
                DataCell(
                  Text(customer.phone ?? '—'),
                ),
                DataCell(
                  Text(_customerTypeLabel(customer.customerType)),
                ),
                DataCell(
                  Text(customer.openingBalance.toStringAsFixed(2)),
                ),
                DataCell(
                  _StatusChip(isActive: customer.isActive),
                ),
                DataCell(
                  _CustomerMenu(
                    onDetails: () => onDetails(customer),
                    onEdit: () => onEdit(customer),
                    onDelete: () => onDelete(customer),
                    onToggle: () => onToggle(customer),
                    isActive: customer.isActive,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

// =======================================================
// Avatar
// =======================================================

class _CustomerAvatar extends StatelessWidget {
  final Customer customer;
  final double size;

  const _CustomerAvatar({
    required this.customer,
    this.size = 46,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final imagePath = customer.imagePath;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.antiAlias,
      child: imagePath != null && imagePath.isNotEmpty
          ? Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _fallback(colors),
            )
          : _fallback(colors),
    );
  }

  Widget _fallback(ColorScheme colors) {
    return Center(
      child: Text(
        customer.name.trim().isEmpty
            ? '?'
            : customer.name.trim().characters.first,
        style: TextStyle(
          color: colors.primary,
          fontSize: size * 0.42,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// =======================================================
// Status
// =======================================================

class _StatusChip extends StatelessWidget {
  final bool isActive;

  const _StatusChip({required this.isActive});

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? const Color(0xFF159B68)
        : const Color(0xFFE5A43B);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.11),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        isActive ? 'نشط' : 'غير نشط',
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// =======================================================
// Customer Actions
// =======================================================

class _CustomerMenu extends StatelessWidget {
  final VoidCallback onDetails;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggle;
  final bool isActive;

  const _CustomerMenu({
    required this.onDetails,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'إجراءات العميل',
      icon: const Icon(Icons.more_vert_rounded),
      onSelected: (value) {
        switch (value) {
          case 'details':
            onDetails();
            break;
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
          value: 'details',
          child: _MenuLabel(
            icon: Icons.visibility_outlined,
            label: 'عرض التفاصيل',
          ),
        ),
        const PopupMenuItem(
          value: 'edit',
          child: _MenuLabel(
            icon: Icons.edit_outlined,
            label: 'تعديل',
          ),
        ),
        PopupMenuItem(
          value: 'toggle',
          child: _MenuLabel(
            icon: Icons.toggle_on_outlined,
            label: isActive ? 'تعطيل العميل' : 'تفعيل العميل',
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'delete',
          child: _MenuLabel(
            icon: Icons.delete_outline_rounded,
            label: 'حذف نهائياً',
            isDestructive: true,
          ),
        ),
      ],
    );
  }
}

class _MenuLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isDestructive;

  const _MenuLabel({
    required this.icon,
    required this.label,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 19,
          color: isDestructive
              ? Theme.of(context).colorScheme.error
              : null,
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: isDestructive
              ? TextStyle(color: Theme.of(context).colorScheme.error)
              : null,
        ),
      ],
    );
  }
}

// =======================================================
// Small Info
// =======================================================

class _SmallInfo extends StatelessWidget {
  final IconData icon;
  final String value;

  const _SmallInfo({
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: colors.onSurfaceVariant,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
        ),
      ],
    );
  }
}

// =======================================================
// Details Line
// =======================================================

class _DetailLine extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DetailLine({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Icon(icon, size: 19, color: colors.primary),
          const SizedBox(width: 12),
          SizedBox(
            width: 125,
            child: Text(
              title,
              style: TextStyle(color: colors.onSurfaceVariant),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w600),
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
  final String description;
  final String actionLabel;
  final VoidCallback onAction;

  const _EmptyState({
    required this.icon,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 48,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              icon,
              size: 36,
              color: colors.primary,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: onAction,
            icon: const Icon(Icons.arrow_forward_rounded),
            label: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// Helpers
// =======================================================

String _customerTypeLabel(String type) {
  switch (type) {
    case 'individual':
      return 'فرد';
    case 'company':
      return 'شركة';
    case 'wholesale':
      return 'جملة';
    default:
      return type;
  }
}
