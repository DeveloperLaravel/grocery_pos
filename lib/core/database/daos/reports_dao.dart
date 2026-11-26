
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../app_database.dart';
import '../tables/sales_table.dart';
import '../tables/sale_items_table.dart';
import '../tables/returns_table.dart';
import '../tables/master_data/products/products_table.dart';

part 'reports_dao.g.dart';

@DriftAccessor(
  tables: [
    Sales,
    SaleItems,
    Returns,
    Products,
  ],
)
@lazySingleton
class ReportsDao extends DatabaseAccessor<AppDatabase>
    with _$ReportsDaoMixin {
  ReportsDao(super.db);

  DateTime _startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  DateTime _endExclusive(DateTime date) =>
      _startOfDay(date).add(const Duration(days: 1));

  void _validateDates(DateTime start, DateTime end) {
    if (start.isAfter(end)) {
      throw ArgumentError(
        'تاريخ البداية يجب ألا يتجاوز تاريخ النهاية.',
      );
    }
  }

  // =========================================
  // Sales Summary
  // =========================================

  Future<Map<String, dynamic>> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    _validateDates(startDate, endDate);

    final start = _startOfDay(startDate);
    final end = _endExclusive(endDate);

    final query = customSelect(
      '''
      SELECT
        COUNT(*) AS sales_count,

        COALESCE(SUM(s.subtotal), 0)
          AS gross_sales,

        COALESCE(SUM(s.discount), 0)
          AS discounts,

        COALESCE(SUM(s.total), 0)
          AS sales_total,

        COALESCE(
          (
            SELECT SUM(r.total)
            FROM returns r
            WHERE r.created_at >= ?
              AND r.created_at < ?
          ), 0
        ) AS returns_total,

        COALESCE(
          (
            SELECT SUM(si.quantity * si.cost_price)
            FROM sale_items si
            INNER JOIN sales ss
              ON ss.id = si.sale_id
            WHERE ss.created_at >= ?
              AND ss.created_at < ?
          ), 0
        ) AS cost_of_goods_sold

      FROM sales s

      WHERE s.created_at >= ?
        AND s.created_at < ?
      ''',
      variables: [
        Variable<DateTime>(start),
        Variable<DateTime>(end),
        Variable<DateTime>(start),
        Variable<DateTime>(end),
        Variable<DateTime>(start),
        Variable<DateTime>(end),
      ],
      readsFrom: {
        sales,
        returns,
        saleItems,
      },
    );

    final row = await query.getSingle();

    double number(String key) =>
        (row.data[key] as num?)?.toDouble() ?? 0.0;

    int integer(String key) =>
        (row.data[key] as num?)?.toInt() ?? 0;

    final count = integer('sales_count');
    final grossSales = number('gross_sales');
    final discounts = number('discounts');
    final salesTotal = number('sales_total');
    final returnsTotal = number('returns_total');
    final cost = number('cost_of_goods_sold');

    // المبيعات بعد الخصومات والمرتجعات.
    final netSales = salesTotal - returnsTotal;

    // الربح بعد خصم تكلفة البضاعة.
    final netProfit = netSales - cost;

    return {
      'sales_count': count,
      'gross_sales': grossSales,
      'discounts': discounts,
      'sales_total': salesTotal,
      'returns_total': returnsTotal,
      'net_sales': netSales,
      'cost_of_goods_sold': cost,
      'net_profit': netProfit,
      'average_sale':
          count == 0 ? 0.0 : salesTotal / count,
    };
  }

  // =========================================
  // Top Products
  // =========================================

  Future<List<Map<String, dynamic>>> getTopProducts({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  }) async {
    _validateDates(startDate, endDate);

    if (limit <= 0) {
      throw ArgumentError('عدد النتائج غير صالح.');
    }

    final start = _startOfDay(startDate);
    final end = _endExclusive(endDate);

    final query = customSelect(
      '''
      SELECT
        si.product_id AS product_id,
        si.product_name AS product_name,

        COALESCE(SUM(si.quantity), 0)
          AS quantity_sold,

        COALESCE(SUM(si.total), 0)
          AS sales_total,

        COALESCE(
          SUM(si.quantity * si.cost_price), 0
        ) AS cost_total,

        COALESCE(
          SUM(si.total - (si.quantity * si.cost_price)), 0
        ) AS gross_profit

      FROM sale_items si

      INNER JOIN sales s
        ON s.id = si.sale_id

      WHERE s.created_at >= ?
        AND s.created_at < ?

      GROUP BY si.product_id, si.product_name

      ORDER BY quantity_sold DESC

      LIMIT ?
      ''',
      variables: [
        Variable<DateTime>(start),
        Variable<DateTime>(end),
        Variable<int>(limit),
      ],
      readsFrom: {
        sales,
        saleItems,
      },
    );

    final rows = await query.get();

    return rows.map((row) => row.data).toList();
  }

  // =========================================
  // Daily Sales
  // =========================================

 
Future<List<Map<String, dynamic>>> getDailySales({
  required DateTime startDate,
  required DateTime endDate,
}) async {
  _validateDates(startDate, endDate);

  final start = _startOfDay(startDate);
  final end = _endExclusive(endDate);

  final query = customSelect(
    '''
    SELECT
      date(
        created_at / 1000,
        'unixepoch',
        'localtime'
      ) AS sale_date,

      COUNT(*) AS sales_count,

      COALESCE(SUM(total), 0) AS total_sales

    FROM sales

    WHERE created_at >= ?
      AND created_at < ?

    GROUP BY date(
      created_at / 1000,
      'unixepoch',
      'localtime'
    )

    ORDER BY sale_date ASC
    ''',
    variables: [
      Variable<DateTime>(start),
      Variable<DateTime>(end),
    ],
    readsFrom: {sales},
  );

  final rows = await query.get();

  return rows
      .map((row) => row.data)
      .toList(growable: false);
}

}
