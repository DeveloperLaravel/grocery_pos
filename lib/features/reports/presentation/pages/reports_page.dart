
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/di/injection.dart';
import '../cubit/reports_cubit.dart';
import '../cubit/reports_state.dart';

import '../widgets/reports_header.dart';
import '../widgets/reports_date_filter.dart';
import '../widgets/reports_section_title.dart';
import '../widgets/reports_summary_grid.dart';
import '../widgets/daily_sales_chart.dart';
import '../widgets/top_products_list.dart';
import '../widgets/reports_error_view.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ReportsCubit>()..loadReports(),
      child: const _ReportsView(),
    );
  }
}

class _ReportsView extends StatelessWidget {
  const _ReportsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('التقارير والإحصائيات'),
        actions: [
          IconButton(
            tooltip: 'تحديث التقارير',
            onPressed: () {
              context.read<ReportsCubit>().refresh();
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<ReportsCubit, ReportsState>(
        builder: (context, state) {
          final isFirstLoading =
              state.status == ReportsStatus.initial ||
              (state.status == ReportsStatus.loading &&
                  state.salesReport == null);

          if (isFirstLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == ReportsStatus.failure &&
              state.salesReport == null) {
            return ReportsErrorView(
              message: state.errorMessage ?? 'تعذر تحميل التقارير',
              onRetry: () =>
                  context.read<ReportsCubit>().refresh(),
            );
          }

          return RefreshIndicator(
            onRefresh: () =>
                context.read<ReportsCubit>().refresh(),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
              children: [
                ReportsHeader(
                  startDate: state.startDate,
                  endDate: state.endDate,
                ),

                const SizedBox(height: 20),

                ReportsDateFilter(state: state),

                if (state.status == ReportsStatus.loading) ...[
                  const SizedBox(height: 12),
                  const LinearProgressIndicator(),
                ],

                if (state.status == ReportsStatus.failure) ...[
                  const SizedBox(height: 12),
                  _InlineError(
                    message: state.errorMessage ??
                        'تعذر تحديث البيانات',
                  ),
                ],

                if (state.salesReport != null) ...[
                  const SizedBox(height: 24),

                  const ReportsSectionTitle(
                    title: 'ملخص الأداء',
                    subtitle: 'نظرة سريعة على الوضع المالي لمتجرك',
                    icon: Icons.insights_rounded,
                  ),

                  const SizedBox(height: 14),

                  ReportsSummaryGrid(
                    report: state.salesReport!,
                  ),

                  const SizedBox(height: 28),

                  const ReportsSectionTitle(
                    title: 'تحليل المبيعات',
                    subtitle: 'قيمة المبيعات اليومية خلال الفترة',
                    icon: Icons.bar_chart_rounded,
                  ),

                  const SizedBox(height: 14),

                  DailySalesChart(
                    data: state.dailySales,
                  ),

                  const SizedBox(height: 28),

                  const ReportsSectionTitle(
                    title: 'المنتجات الأكثر مبيعاً',
                    subtitle: 'ترتيب المنتجات حسب الكمية المباعة',
                    icon: Icons.emoji_events_outlined,
                  ),

                  const SizedBox(height: 14),

                  TopProductsList(
                    products: state.topProducts,
                  ),
                ],

                const SizedBox(height: 28),

                Center(
                  child: Text(
                    'تقارير نقطة البيع • النواة التقنية',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _InlineError extends StatelessWidget {
  const _InlineError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(message)),
        ],
      ),
    );
  }
}
