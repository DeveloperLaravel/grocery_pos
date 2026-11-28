import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/accounting/accounts_table.dart';


part 'accounts_dao.g.dart';

@DriftAccessor(tables: [Accounts])
class AccountsDao extends DatabaseAccessor<AppDatabase>
    with _$AccountsDaoMixin {
  AccountsDao(super.db);

  // Insert
  Future<int> insertAccount(AccountsCompanion account) {
    return into(accounts).insert(account);
  }

  // Update
  Future<bool> updateAccount(
    int id,
    AccountsCompanion account,
  ) async {
    return (update(accounts)
          ..where((t) => t.id.equals(id)))
        .write(
      account.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    ).then((rows) => rows > 0);
  }

  // Get All
  Future<List<AccountDb>> getAllAccounts() {
    return (select(accounts)
          ..orderBy([
            (t) => OrderingTerm.asc(t.code),
          ]))
        .get();
  }

  // Watch All
  Stream<List<AccountDb>> watchAllAccounts() {
    return (select(accounts)
          ..orderBy([
            (t) => OrderingTerm.asc(t.code),
          ]))
        .watch();
  }

  // Get By ID
  Future<AccountDb?> getAccountById(int id) {
    return (select(accounts)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Get By Code
  Future<AccountDb?> getAccountByCode(String code) {
    return (select(accounts)
          ..where((t) => t.code.equals(code)))
        .getSingleOrNull();
  }

  // Get Child Accounts
  Future<List<AccountDb>> getChildAccounts(int parentId) {
    return (select(accounts)
          ..where((t) => t.parentId.equals(parentId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.code),
          ]))
        .get();
  }

  // Get Root Accounts
  Future<List<AccountDb>> getRootAccounts() {
    return (select(accounts)
          ..where((t) => t.parentId.isNull())
          ..orderBy([
            (t) => OrderingTerm.asc(t.code),
          ]))
        .get();
  }

  // Get Posting Accounts
  Future<List<AccountDb>> getPostingAccounts() {
    return (select(accounts)
          ..where(
            (t) =>
                t.isActive.equals(true) &
                t.allowPosting.equals(true) &
                t.isGroup.equals(false),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.code),
          ]))
        .get();
  }

  // Search
  Future<List<AccountDb>> searchAccounts(String query) {
    return (select(accounts)
          ..where(
            (t) =>
                t.name.contains(query) |
                t.code.contains(query),
          ))
        .get();
  }

  // Activate / Deactivate
  Future<int> setAccountActive(int id, bool active) {
    return (update(accounts)
          ..where((t) => t.id.equals(id)))
        .write(
      AccountsCompanion(
        isActive: Value(active),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // Delete
  Future<int> deleteAccount(int id) {
    return (delete(accounts)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}