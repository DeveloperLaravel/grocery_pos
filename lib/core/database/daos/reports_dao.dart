
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../app_database.dart';

import '../tables/sales_table.dart';
import '../tables/sale_items_table.dart';
import '../tables/returns_table.dart';
import '../tables/return_items_table.dart';

part 'reports_dao.g.dart';

@DriftAccessor(
  tables: [
    Sales,
    SaleItems,
    Returns,
    ReturnItems,
  ],
)
@lazySingleton
class ReportsDao extends DatabaseAccessor<AppDatabase>
    with _$ReportsDaoMixin {
  ReportsDao(super.db);

  DateTime _endExclusive(DateTime date) {
    return DateTime(
      date.year,
      date.month,
      date.day + 1,
    );
  }

  // تقرير المبيعات والأرباح لفترة محددة.
  Future<Map<String, dynamic>> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final endExclusive = _endExclusive(endDate);

    final query = customSelect(
      '''
      SELECT
        (
          SELECT COUNT(*)
          FROM sales s
          WHERE s.created_at >= ?
            AND s.created_at < ?
        ) AS sales_count,

        (
          SELECT COALESCE(SUM(s.subtotal), 0)
          FROM sales s
          WHERE s.created_at >= ?
            AND s.created_at < ?
        ) AS gross_sales,

        (
          SELECT COALESCE(SUM(s.discount), 0)
          FROM sales s
          WHERE s.created_at >= ?
            AND s.created_at < ?
        ) AS discounts,

        (
          SELECT COALESCE(SUM(s.total), 0)
          FROM sales s
          WHERE s.created_at >= ?
            AND s.created_at < ?
        ) AS net_sales,

        (
          SELECT COALESCE(SUM(r.total), 0)
          FROM returns r
          WHERE r.created_at >= ?
            AND r.created_at < ?
        ) AS returns_total,

        (
          SELECT COALESCE(
            SUM(si.quantity * si.cost_price),
            0
          )
          FROM sale_items si
          INNER JOIN sales s
            ON s.id = si.sale_id
          WHERE s.created_at >= ?
            AND s.created_at < ?
        ) AS cost_of_goods_sold
      ''',
      variables: [
        Variable<DateTime>(startDate),
        Variable<DateTime>(endExclusive),

        Variable<DateTime>(startDate),
        Variable<DateTime>(endExclusive),

        Variable<DateTime>(startDate),
        Variable<DateTime>(endExclusive),

        Variable<DateTime>(startDate),
        Variable<DateTime>(endExclusive),

        Variable<DateTime>(startDate),
        Variable<DateTime>(endExclusive),

        Variable<DateTime>(startDate),
        Variable<DateTime>(endExclusive),
      ],
      readsFrom: {
        sales,
        saleItems,
        returns,
      },
    );

    final row = await query.getSingle();

    final salesCount = row.read<int>('sales_count');
    final grossSales = row.read<double>('gross_sales');
    final discounts = row.read<double>('discounts');
    final netSales = row.read<double>('net_sales');
    final returnsTotal = row.read<double>('returns_total');
    final cost = row.read<double>('cost_of_goods_sold');

    return {
      'sales_count': salesCount,
      'gross_sales': grossSales,
      'discounts': discounts,
      'net_sales': netSales,
      'returns_total': returnsTotal,
      'cost_of_goods_sold': cost,
      'gross_profit': netSales - cost,
      'net_profit': netSales - returnsTotal - cost,
      'average_sale':
          salesCount == 0 ? 0.0 : netSales / salesCount,
    };
  }

  // أكثر المنتجات مبيعاً خلال فترة محددة.
  Future<List<Map<String, dynamic>>> getTopProducts({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  }) async {
    if (limit <= 0) {
      throw ArgumentError('عدد المنتجات يجب أن يكون أكبر من صفر');
    }

    final endExclusive = _endExclusive(endDate);

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
          SUM(si.quantity * si.cost_price),
          0
        ) AS cost_total,

        COALESCE(
          SUM(si.total - (si.quantity * si.cost_price)),
          0
        ) AS profit

      FROM sale_items si

      INNER JOIN sales s
        ON s.id = si.sale_id

      WHERE s.created_at >= ?
        AND s.created_at < ?

      GROUP BY
        si.product_id,
        si.product_name

      ORDER BY
        quantity_sold DESC,
        sales_total DESC

      LIMIT ?
      ''',
      variables: [
        Variable<DateTime>(startDate),
        Variable<DateTime>(endExclusive),
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
}
