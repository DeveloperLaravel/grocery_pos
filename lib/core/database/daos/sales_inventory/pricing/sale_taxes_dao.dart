
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pricing/sale_taxes_table.dart';


part 'sale_taxes_dao.g.dart';

@DriftAccessor(tables: [SaleTaxes])
class SaleTaxesDao extends DatabaseAccessor<AppDatabase>
    with _$SaleTaxesDaoMixin {
  SaleTaxesDao(super.db);

  Future<List<SaleTaxDb>> getBySale(int saleId) {
    return (select(saleTaxes)
          ..where((t) => t.saleId.equals(saleId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  Stream<List<SaleTaxDb>> watchBySale(int saleId) {
    return (select(saleTaxes)
          ..where((t) => t.saleId.equals(saleId)))
        .watch();
  }

  Future<List<SaleTaxDb>> getByProduct(int productId) {
    return (select(saleTaxes)
          ..where((t) => t.productId.equals(productId)))
        .get();
  }

  Future<SaleTaxDb?> getById(int id) {
    return (select(saleTaxes)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<double> getTotalTax(int saleId) async {
    final rows = await getBySale(saleId);

    return rows.fold<double>(
      0,
      (sum, item) => sum + item.taxAmount,
    );
  }

  Future<int> insertTax(SaleTaxesCompanion entry) async {
    _validate(entry);
    return into(saleTaxes).insert(entry);
  }

  Future<void> insertMany(
    List<SaleTaxesCompanion> entries,
  ) async {
    for (final entry in entries) {
      _validate(entry);
    }

    await batch((batch) {
      batch.insertAll(saleTaxes, entries);
    });
  }

  Future<void> replaceSaleTaxes({
    required int saleId,
    required List<SaleTaxesCompanion> entries,
  }) async {
    for (final entry in entries) {
      _validate(entry);

      if (!entry.saleId.present ||
          entry.saleId.value != saleId) {
        throw ArgumentError(
          'All tax entries must belong to the specified sale.',
        );
      }
    }

    await attachedDatabase.transaction(() async {
      await (delete(saleTaxes)
            ..where((t) => t.saleId.equals(saleId)))
          .go();

      await batch((batch) {
        if (entries.isNotEmpty) {
          batch.insertAll(saleTaxes, entries);
        }
      });
    });
  }

  // Sale tax records are historical snapshots.
  // Prefer retaining them when cancelling or reversing a sale.
  Future<int> deleteBySale(int saleId) {
    return (delete(saleTaxes)
          ..where((t) => t.saleId.equals(saleId)))
        .go();
  }

  void _validate(SaleTaxesCompanion entry) {
    if (entry.taxableAmount.present &&
        entry.taxableAmount.value < 0) {
      throw ArgumentError('Taxable amount cannot be negative.');
    }

    if (entry.taxAmount.present &&
        entry.taxAmount.value < 0) {
      throw ArgumentError('Tax amount cannot be negative.');
    }

    if (entry.taxRate.present &&
        entry.taxRate.value < 0) {
      throw ArgumentError('Tax rate cannot be negative.');
    }
  }
}
