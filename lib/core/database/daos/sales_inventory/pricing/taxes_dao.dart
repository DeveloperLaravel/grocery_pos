
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pricing/taxes_table.dart';


part 'taxes_dao.g.dart';

@DriftAccessor(tables: [Taxes])
class TaxesDao extends DatabaseAccessor<AppDatabase>
    with _$TaxesDaoMixin {
  TaxesDao(super.db);

  // Get all taxes
  Future<List<TaxDb>> getAllTaxes() {
    return (select(taxes)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // Watch all taxes
  Stream<List<TaxDb>> watchAllTaxes() {
    return (select(taxes)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // Get active taxes
  Future<List<TaxDb>> getActiveTaxes() {
    return (select(taxes)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Stream<List<TaxDb>> watchActiveTaxes() {
    return (select(taxes)
          ..where((t) => t.isActive.equals(true)))
        .watch();
  }

  // Get by ID
  Future<TaxDb?> getTaxById(int id) {
    return (select(taxes)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Get by code
  Future<TaxDb?> getTaxByCode(String code) {
    return (select(taxes)
          ..where((t) => t.code.equals(code)))
        .getSingleOrNull();
  }

  // Get default tax
  Future<TaxDb?> getDefaultTax() {
    return (select(taxes)
          ..where((t) =>
              t.isDefault.equals(true) &
              t.isActive.equals(true))
          ..limit(1))
        .getSingleOrNull();
  }

  // Search
  Future<List<TaxDb>> searchTaxes(String query) {
    final value = '%${query.trim()}%';

    return (select(taxes)
          ..where((t) =>
              t.name.like(value) |
              t.code.like(value))
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // Insert
  Future<int> insertTax(TaxesCompanion entry) async {
    _validateTax(entry);

    return transaction(() async {
      if (entry.isDefault.present && entry.isDefault.value) {
        await _clearDefaultTax();
      }

      return into(taxes).insert(entry);
    });
  }

  // Update
  Future<bool> updateTax(int id, TaxesCompanion entry) async {
    _validateTax(entry);

    return transaction(() async {
      if (entry.isDefault.present && entry.isDefault.value) {
        await _clearDefaultTax();
      }

      final affected = await (update(taxes)
            ..where((t) => t.id.equals(id)))
          .write(
        entry.copyWith(
          updatedAt: Value(DateTime.now()),
        ),
      );

      return affected > 0;
    });
  }

  // Activate / Deactivate
  Future<bool> setTaxActive(int id, bool active) async {
    final affected = await (update(taxes)
          ..where((t) => t.id.equals(id)))
        .write(
      TaxesCompanion(
        isActive: Value(active),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return affected > 0;
  }

  // Delete
  // Only allowed when no product or sale references exist.
  Future<int> deleteTax(int id) {
    return (delete(taxes)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Clear default tax
  Future<void> _clearDefaultTax() async {
    await (update(taxes)
          ..where((t) => t.isDefault.equals(true)))
        .write(
      TaxesCompanion(
        isDefault: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  void _validateTax(TaxesCompanion entry) {
    if (entry.rate.present && entry.rate.value < 0) {
      throw ArgumentError('Tax rate cannot be negative.');
    }

    if (entry.name.present &&
        entry.name.value.trim().isEmpty) {
      throw ArgumentError('Tax name is required.');
    }

    if (entry.taxType.present &&
        !['percentage', 'fixed'].contains(entry.taxType.value)) {
      throw ArgumentError('Invalid tax type.');
    }
  }
}
