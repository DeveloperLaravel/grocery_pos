
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_navigation.dart';
import '../../../../core/theme/app_colors.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

import 'header/dashboard_header.dart';
import 'sections/welcome_section.dart';
import 'sections/section_header.dart';
import 'cards/stat_card.dart';
import 'cards/quick_action_card.dart';

import 'recent_sales.dart';
import 'low_stock_section.dart';

class DashboardView extends StatelessWidget {
  final dynamic dashboard;

  const DashboardView({
    super.key,
    required this.dashboard,
  });

  int _getGridColumns(double width) {
     if (width >= 1800) return 4;
    if (width >= 850) return 4;
    if (width >= 600) return 2;
    return 2;
  }

  double _getHorizontalPadding(double width) {
    if (width >= 1400) return 18;
    if (width >= 1100) return 26;
    if (width >= 800) return 22;
    if (width >= 600) return 18;
    return 14;
  }

  double _getSectionSpacing(double width) {
    if (width >= 1000) return 32;
    if (width >= 600) return 26;
    return 22;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final horizontalPadding = _getHorizontalPadding(width);
        final sectionSpacing = _getSectionSpacing(width);
        final columns = _getGridColumns(width);

        final statCards = [
          StatCard(
            title: 'مبيعات اليوم',
            value: dashboard.todaySalesTotal.toStringAsFixed(2),
            subtitle: 'إجمالي المبيعات',
            icon: Icons.account_balance_wallet_rounded,
            color: AppColors.revenue,
            currency: 'د.ل',
            badgeText: 'اليوم',
          ),
          StatCard(
            title: 'فواتير اليوم',
            value: '${dashboard.todaySalesCount}',
            subtitle: 'عمليات البيع',
            icon: Icons.receipt_long_rounded,
            color: AppColors.info,
            badgeText: 'اليوم',
          ),
          StatCard(
            title: 'المنتجات',
            value: '${dashboard.productsCount}',
            subtitle: 'إجمالي الأصناف',
            icon: Icons.inventory_2_rounded,
            color: const Color(0xFF8B65BE),
            badgeText: 'المخزون',
          ),
          StatCard(
            title: 'مخزون منخفض',
            value: '${dashboard.lowStockCount}',
            subtitle: 'تحتاج إلى متابعة',
            icon: Icons.warning_amber_rounded,
            color: AppColors.warning,
            badgeText: 'تنبيه',
          ),
        ];

        final quickActions = [
          QuickActionCard(
            title: 'عملية بيع جديدة',
            icon: Icons.point_of_sale_rounded,
            color: colors.primary,
            onTap: () => AppNavigation.pos(context),
          ),
          QuickActionCard(
            title: 'إدارة المنتجات',
            icon: Icons.inventory_2_rounded,
            color: AppColors.info,
            onTap: () => AppNavigation.products(context),
          ),
          QuickActionCard(
            title: 'إدارة المخزون',
            icon: Icons.warehouse_rounded,
            color: AppColors.warning,
            onTap: () => AppNavigation.inventory(context),
          ),
          QuickActionCard(
            title: 'التقارير',
            icon: Icons.bar_chart_rounded,
            color: AppColors.secondary,
            onTap: () => AppNavigation.reports(context),
          ),
        ];

        return RefreshIndicator(
          color: colors.primary,
          backgroundColor: colors.surface,
          onRefresh: () async {
            context.read<HomeBloc>().add(
                  const HomeEvent.refresh(),
                );
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              width >= 900 ? 24 : 16,
              horizontalPadding,
              30,
            ),
            children: [
              const DashboardHeader(),

              SizedBox(height: sectionSpacing),

              const WelcomeSection(),

              SizedBox(height: sectionSpacing),

              const SectionHeader(
                title: 'نظرة عامة',
                subtitle: 'ملخص نشاط المتجر',
                icon: Icons.analytics_outlined,
              ),

              const SizedBox(height: 16),

              _ResponsiveGrid(
                columns: columns,
                width: width,
                children: statCards,
                aspectRatio: width >= 1400
                    ? 1.05
                    : width >= 600
                        ? 1.12
                        : 1.02,
                spacing: width >= 600 ? 14 : 10,
              ),

              SizedBox(height: sectionSpacing),

              const SectionHeader(
                title: 'الوصول السريع',
                subtitle: 'اختصارات المهام اليومية',
                icon: Icons.bolt_rounded,
              ),

              const SizedBox(height: 16),

              _ResponsiveGrid(
                columns: columns,
                width: width,
                children: quickActions,
                aspectRatio: width >= 1100
                    ? 1.25
                    : width >= 600
                        ? 1.15
                        : 1.08,
                spacing: width >= 600 ? 14 : 10,
              ),

              SizedBox(height: sectionSpacing),

              SectionHeader(
                title: 'آخر المبيعات',
                subtitle: 'أحدث عمليات البيع في المتجر',
                icon: Icons.receipt_long_rounded,
                actionText: 'عرض الكل',
                onAction: () => AppNavigation.sales(context),
              ),

              const SizedBox(height: 14),

              RecentSales(
                sales: dashboard.recentSales,
              ),

              SizedBox(height: sectionSpacing),

              SectionHeader(
                title: 'تنبيهات المخزون',
                subtitle: 'المنتجات التي تحتاج إلى إعادة طلب',
                icon: Icons.notifications_active_rounded,
                actionText: 'عرض الكل',
                onAction: () => AppNavigation.inventory(context),
              ),

              const SizedBox(height: 14),

              LowStockSection(
                products: dashboard.lowStockProducts,
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

class _ResponsiveGrid extends StatelessWidget {
  final int columns;
  final double width;
  final double aspectRatio;
  final double spacing;
  final List<Widget> children;

  const _ResponsiveGrid({
    required this.columns,
    required this.width,
    required this.aspectRatio,
    required this.spacing,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: children.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) => children[index],
    );
  }
}
