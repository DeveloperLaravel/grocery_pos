
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/finance/payment_methods_table.dart';


part 'payment_methods_dao.g.dart';

@DriftAccessor(tables: [PaymentMethods])
class PaymentMethodsDao extends DatabaseAccessor<AppDatabase>
    with _$PaymentMethodsDaoMixin {
  PaymentMethodsDao(super.db);

  // =====================================================
  // CREATE
  // =====================================================

  Future<int> insertPaymentMethod(
    PaymentMethodsCompanion entry,
  ) {
    return into(paymentMethods).insert(entry);
  }

  // =====================================================
  // UPDATE
  // =====================================================

  Future<bool> updatePaymentMethod(
    PaymentMethodsCompanion entry,
  ) async {
    if (!entry.id.present) {
      throw ArgumentError('Payment method ID is required.');
    }

    final updated = entry.copyWith(
      updatedAt: Value(DateTime.now()),
    );

    return update(paymentMethods).replace(updated);
  }

  // =====================================================
  // READ
  // =====================================================

  Future<PaymentMethodDb?> getPaymentMethodById(int id) {
    return (select(paymentMethods)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<PaymentMethodDb>> getAllPaymentMethods() {
    return (select(paymentMethods)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  Future<List<PaymentMethodDb>> getActivePaymentMethods() {
    return (select(paymentMethods)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // WATCH
  // =====================================================

  Stream<List<PaymentMethodDb>> watchAllPaymentMethods() {
    return (select(paymentMethods)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  Stream<List<PaymentMethodDb>> watchActivePaymentMethods() {
    return (select(paymentMethods)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.asc(t.sortOrder),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  // =====================================================
  // SEARCH
  // =====================================================

  Future<List<PaymentMethodDb>> searchPaymentMethods(
    String query,
  ) {
    final keyword = '%${query.trim()}%';

    return (select(paymentMethods)
          ..where(
            (t) =>
                t.name.like(keyword) |
                t.code.like(keyword),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  // =====================================================
  // DEFAULT PAYMENT METHOD
  // =====================================================

  Future<PaymentMethodDb?> getDefaultPaymentMethod() {
    return (select(paymentMethods)
          ..where(
            (t) =>
                t.isDefault.equals(true) &
                t.isActive.equals(true),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  Future<void> setDefaultPaymentMethod(int id) async {
    await transaction(() async {
      final method = await getPaymentMethodById(id);

      if (method == null || !method.isActive) {
        throw StateError(
          'Payment method does not exist or is inactive.',
        );
      }

      await (update(paymentMethods)
            ..where((t) => t.isDefault.equals(true)))
          .write(
        const PaymentMethodsCompanion(
          isDefault: Value(false),
        ),
      );

      await (update(paymentMethods)
            ..where((t) => t.id.equals(id)))
          .write(
        PaymentMethodsCompanion(
          isDefault: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =====================================================
  // VALIDATION
  // =====================================================

  Future<bool> isCodeExists(
    String code, {
    int? excludeId,
  }) async {
    final query = select(paymentMethods)
      ..where((t) => t.code.equals(code));

    if (excludeId != null) {
      query.where((t) => t.id.equals(excludeId).not());
    }

    return (await query.getSingleOrNull()) != null;
  }

  // =====================================================
  // ACTIVATE / DEACTIVATE
  // =====================================================

  Future<int> activatePaymentMethod(int id) {
    return (update(paymentMethods)
          ..where((t) => t.id.equals(id)))
        .write(
      PaymentMethodsCompanion(
        isActive: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> deactivatePaymentMethod(int id) async {
    final method = await getPaymentMethodById(id);

    if (method == null) return 0;

    if (method.isDefault) {
      throw StateError(
        'Cannot deactivate the default payment method.',
      );
    }

    return (update(paymentMethods)
          ..where((t) => t.id.equals(id)))
        .write(
      PaymentMethodsCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // DELETE
  // =====================================================

  Future<int> deletePaymentMethod(int id) {
    return (delete(paymentMethods)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =====================================================
  // COUNT
  // =====================================================

  Future<int> countPaymentMethods() async {
    final count = paymentMethods.id.count();

    final query = selectOnly(paymentMethods)
      ..addColumns([count]);

    return await query.map((row) => row.read(count) ?? 0)
        .getSingle();
  }
}
