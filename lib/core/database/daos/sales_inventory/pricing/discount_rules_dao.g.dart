// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_rules_dao.dart';

// ignore_for_file: type=lint
mixin _$DiscountRulesDaoMixin on DatabaseAccessor<AppDatabase> {
  $DiscountRulesTable get discountRules => attachedDatabase.discountRules;
  DiscountRulesDaoManager get managers => DiscountRulesDaoManager(this);
}

class DiscountRulesDaoManager {
  final _$DiscountRulesDaoMixin _db;
  DiscountRulesDaoManager(this._db);
  $$DiscountRulesTableTableManager get discountRules =>
      $$DiscountRulesTableTableManager(_db.attachedDatabase, _db.discountRules);
}
