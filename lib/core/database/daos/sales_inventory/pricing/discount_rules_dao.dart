
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pricing/discount_rules_table.dart';


part 'discount_rules_dao.g.dart';

@DriftAccessor(tables: [DiscountRules])
class DiscountRulesDao extends DatabaseAccessor<AppDatabase>
    with _$DiscountRulesDaoMixin {
  DiscountRulesDao(super.db);

  Future<List<DiscountRuleDb>> getAll() {
    return (select(discountRules)
          ..orderBy([
            (t) => OrderingTerm.desc(t.priority),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Stream<List<DiscountRuleDb>> watchAll() {
    return (select(discountRules)
          ..orderBy([
            (t) => OrderingTerm.desc(t.priority),
          ]))
        .watch();
  }

  Future<DiscountRuleDb?> getById(int id) {
    return (select(discountRules)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<DiscountRuleDb?> getByCode(String code) {
    return (select(discountRules)
          ..where((t) => t.code.equals(code)))
        .getSingleOrNull();
  }

  Future<List<DiscountRuleDb>> getActiveRules() {
    final now = DateTime.now();

    return (select(discountRules)
          ..where((t) =>
              t.isActive.equals(true) &
              (t.startsAt.isNull() |
                  t.startsAt.isSmallerOrEqualValue(now)) &
              (t.endsAt.isNull() |
                  t.endsAt.isBiggerOrEqualValue(now)))
          ..orderBy([
            (t) => OrderingTerm.desc(t.priority),
          ]))
        .get();
  }

  Stream<List<DiscountRuleDb>> watchActiveRules() {
    final now = DateTime.now();

    return (select(discountRules)
          ..where((t) =>
              t.isActive.equals(true) &
              (t.startsAt.isNull() |
                  t.startsAt.isSmallerOrEqualValue(now)) &
              (t.endsAt.isNull() |
                  t.endsAt.isBiggerOrEqualValue(now)))
          ..orderBy([
            (t) => OrderingTerm.desc(t.priority),
          ]))
        .watch();
  }

  Future<List<DiscountRuleDb>> getByProduct(int productId) {
    return (select(discountRules)
          ..where((t) =>
              t.productId.equals(productId) &
              t.appliesTo.equals('product') &
              t.isActive.equals(true)))
        .get();
  }

  Future<List<DiscountRuleDb>> search(String query) {
    final value = '%${query.trim()}%';

    return (select(discountRules)
          ..where((t) =>
              t.name.like(value) |
              t.code.like(value)))
        .get();
  }

  Future<int> insertRule(
    DiscountRulesCompanion entry,
  ) async {
    _validate(entry);

    return into(discountRules).insert(entry);
  }

  Future<bool> updateRule(
    int id,
    DiscountRulesCompanion entry,
  ) async {
    _validate(entry);

    final affected = await (update(discountRules)
          ..where((t) => t.id.equals(id)))
        .write(
      entry.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return affected > 0;
  }

  Future<bool> setActive(int id, bool active) async {
    final affected = await (update(discountRules)
          ..where((t) => t.id.equals(id)))
        .write(
      DiscountRulesCompanion(
        isActive: Value(active),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return affected > 0;
  }

  Future<int> deleteRule(int id) {
    return (delete(discountRules)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  void _validate(DiscountRulesCompanion entry) {
    if (entry.discountValue.present &&
        entry.discountValue.value < 0) {
      throw ArgumentError('Discount value cannot be negative.');
    }

    if (entry.discountType.present &&
        !['percentage', 'fixed']
            .contains(entry.discountType.value)) {
      throw ArgumentError('Invalid discount type.');
    }

    if (entry.appliesTo.present &&
        !['invoice', 'product', 'category']
            .contains(entry.appliesTo.value)) {
      throw ArgumentError('Invalid discount target.');
    }

    if (entry.discountType.present &&
        entry.discountType.value == 'percentage' &&
        entry.discountValue.present &&
        entry.discountValue.value > 100) {
      throw ArgumentError(
        'Percentage discount cannot exceed 100%.',
      );
    }
  }
}
