// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_dao.dart';

// ignore_for_file: type=lint
mixin _$CheckoutDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductsTable get products => attachedDatabase.products;
  $ProductUnitsTable get productUnits => attachedDatabase.productUnits;
  $SalesTable get sales => attachedDatabase.sales;
  $SaleItemsTable get saleItems => attachedDatabase.saleItems;
  $SalePaymentsTable get salePayments => attachedDatabase.salePayments;
  $StockMovementsTable get stockMovements => attachedDatabase.stockMovements;
  CheckoutDaoManager get managers => CheckoutDaoManager(this);
}

class CheckoutDaoManager {
  final _$CheckoutDaoMixin _db;
  CheckoutDaoManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$ProductUnitsTableTableManager get productUnits =>
      $$ProductUnitsTableTableManager(_db.attachedDatabase, _db.productUnits);
  $$SalesTableTableManager get sales =>
      $$SalesTableTableManager(_db.attachedDatabase, _db.sales);
  $$SaleItemsTableTableManager get saleItems =>
      $$SaleItemsTableTableManager(_db.attachedDatabase, _db.saleItems);
  $$SalePaymentsTableTableManager get salePayments =>
      $$SalePaymentsTableTableManager(_db.attachedDatabase, _db.salePayments);
  $$StockMovementsTableTableManager get stockMovements =>
      $$StockMovementsTableTableManager(
          _db.attachedDatabase, _db.stockMovements);
}
