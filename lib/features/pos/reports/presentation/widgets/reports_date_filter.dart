
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/app_colors.dart';
import '../cubit/reports_cubit.dart';
import '../cubit/reports_state.dart';

class ReportsDateFilter extends StatelessWidget {
  const ReportsDateFilter({
    super.key,
    required this.state,
  });

  final ReportsState state;

  bool _sameDay(DateTime a, DateTime b) {
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }

  String _selectedFilter() {
    final now = DateTime.now();

    if (_sameDay(state.startDate, now) &&
        _sameDay(state.endDate, now)) {
      return 'today';
    }

    final sevenDaysStart = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(days: 6));

    if (_sameDay(state.startDate, sevenDaysStart) &&
        _sameDay(state.endDate, now)) {
      return 'week';
    }

    if (state.startDate.year == now.year &&
        state.startDate.month == now.month &&
        state.startDate.day == 1 &&
        _sameDay(state.endDate, now)) {
      return 'month';
    }

    return 'custom';
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportsCubit>();
    final selected = _selectedFilter();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الفترة الزمنية',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _FilterButton(
                label: 'اليوم',
                icon: Icons.today_rounded,
                selected: selected == 'today',
                onTap: cubit.today,
              ),
              const SizedBox(width: 8),
              _FilterButton(
                label: 'آخر 7 أيام',
                icon: Icons.date_range_rounded,
                selected: selected == 'week',
                onTap: cubit.lastSevenDays,
              ),
              const SizedBox(width: 8),
              _FilterButton(
                label: 'هذا الشهر',
                icon: Icons.calendar_month_rounded,
                selected: selected == 'month',
                onTap: cubit.thisMonth,
              ),
              const SizedBox(width: 8),
              _FilterButton(
                label: 'مخصص',
                icon: Icons.tune_rounded,
                selected: selected == 'custom',
                onTap: () => _selectRange(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _selectRange(BuildContext context) async {
    final now = DateTime.now();

    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(now.year, now.month, now.day),
      initialDateRange: DateTimeRange(
        start: state.startDate,
        end: state.endDate,
      ),
      locale: const Locale('ar'),
      helpText: 'اختر فترة التقرير',
      confirmText: 'تطبيق',
      cancelText: 'إلغاء',
    );

    if (range == null || !context.mounted) return;

    await context.read<ReportsCubit>().setDateRange(
      startDate: range.start,
      endDate: range.end,
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: selected
          ? AppColors.primary
          : theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 11,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? AppColors.primary
                  // ignore: deprecated_member_use
                  : theme.colorScheme.outline.withOpacity(0.35),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 17,
                color: selected
                    ? Colors.white
                    : theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : theme.colorScheme.onSurface,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
