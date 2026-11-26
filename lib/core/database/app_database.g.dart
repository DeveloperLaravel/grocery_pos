// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        parentId,
        imagePath,
        isActive,
        sortOrder,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class CategoryDb extends DataClass implements Insertable<CategoryDb> {
  final int id;
  final String name;
  final String? description;
  final int? parentId;
  final String? imagePath;
  final bool isActive;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CategoryDb(
      {required this.id,
      required this.name,
      this.description,
      this.parentId,
      this.imagePath,
      required this.isActive,
      required this.sortOrder,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      isActive: Value(isActive),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CategoryDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryDb(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'parentId': serializer.toJson<int?>(parentId),
      'imagePath': serializer.toJson<String?>(imagePath),
      'isActive': serializer.toJson<bool>(isActive),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CategoryDb copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<int?> parentId = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          bool? isActive,
          int? sortOrder,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CategoryDb(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        parentId: parentId.present ? parentId.value : this.parentId,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        isActive: isActive ?? this.isActive,
        sortOrder: sortOrder ?? this.sortOrder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CategoryDb copyWithCompanion(CategoriesCompanion data) {
    return CategoryDb(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryDb(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('parentId: $parentId, ')
          ..write('imagePath: $imagePath, ')
          ..write('isActive: $isActive, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, parentId, imagePath,
      isActive, sortOrder, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryDb &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.parentId == this.parentId &&
          other.imagePath == this.imagePath &&
          other.isActive == this.isActive &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoriesCompanion extends UpdateCompanion<CategoryDb> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int?> parentId;
  final Value<String?> imagePath;
  final Value<bool> isActive;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.parentId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isActive = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.parentId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isActive = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CategoryDb> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? parentId,
    Expression<String>? imagePath,
    Expression<bool>? isActive,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (parentId != null) 'parent_id': parentId,
      if (imagePath != null) 'image_path': imagePath,
      if (isActive != null) 'is_active': isActive,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<int?>? parentId,
      Value<String?>? imagePath,
      Value<bool>? isActive,
      Value<int>? sortOrder,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      parentId: parentId ?? this.parentId,
      imagePath: imagePath ?? this.imagePath,
      isActive: isActive ?? this.isActive,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('parentId: $parentId, ')
          ..write('imagePath: $imagePath, ')
          ..write('isActive: $isActive, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BrandsTable extends Brands with TableInfo<$BrandsTable, BrandDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BrandsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, imagePath, isActive, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'brands';
  @override
  VerificationContext validateIntegrity(Insertable<BrandDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name},
      ];
  @override
  BrandDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BrandDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BrandsTable createAlias(String alias) {
    return $BrandsTable(attachedDatabase, alias);
  }
}

class BrandDb extends DataClass implements Insertable<BrandDb> {
  final int id;
  final String name;
  final String? description;
  final String? imagePath;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BrandDb(
      {required this.id,
      required this.name,
      this.description,
      this.imagePath,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BrandsCompanion toCompanion(bool nullToAbsent) {
    return BrandsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BrandDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BrandDb(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'imagePath': serializer.toJson<String?>(imagePath),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BrandDb copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BrandDb(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BrandDb copyWithCompanion(BrandsCompanion data) {
    return BrandDb(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BrandDb(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, description, imagePath, isActive, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BrandDb &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.imagePath == this.imagePath &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BrandsCompanion extends UpdateCompanion<BrandDb> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> imagePath;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BrandsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BrandsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<BrandDb> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? imagePath,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (imagePath != null) 'image_path': imagePath,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BrandsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? imagePath,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return BrandsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BrandsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _brandIdMeta =
      const VerificationMeta('brandId');
  @override
  late final GeneratedColumn<int> brandId = GeneratedColumn<int>(
      'brand_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _productTypeMeta =
      const VerificationMeta('productType');
  @override
  late final GeneratedColumn<String> productType = GeneratedColumn<String>(
      'product_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('piece'));
  static const VerificationMeta _baseUnitMeta =
      const VerificationMeta('baseUnit');
  @override
  late final GeneratedColumn<String> baseUnit = GeneratedColumn<String>(
      'base_unit', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('piece'));
  static const VerificationMeta _allowDecimalQuantityMeta =
      const VerificationMeta('allowDecimalQuantity');
  @override
  late final GeneratedColumn<bool> allowDecimalQuantity = GeneratedColumn<bool>(
      'allow_decimal_quantity', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("allow_decimal_quantity" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _costPriceMeta =
      const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
      'cost_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _salePriceMeta =
      const VerificationMeta('salePrice');
  @override
  late final GeneratedColumn<double> salePrice = GeneratedColumn<double>(
      'sale_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _minStockMeta =
      const VerificationMeta('minStock');
  @override
  late final GeneratedColumn<double> minStock = GeneratedColumn<double>(
      'min_stock', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(5.0));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        categoryId,
        brandId,
        productType,
        baseUnit,
        allowDecimalQuantity,
        costPrice,
        salePrice,
        quantity,
        minStock,
        isActive,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('brand_id')) {
      context.handle(_brandIdMeta,
          brandId.isAcceptableOrUnknown(data['brand_id']!, _brandIdMeta));
    }
    if (data.containsKey('product_type')) {
      context.handle(
          _productTypeMeta,
          productType.isAcceptableOrUnknown(
              data['product_type']!, _productTypeMeta));
    }
    if (data.containsKey('base_unit')) {
      context.handle(_baseUnitMeta,
          baseUnit.isAcceptableOrUnknown(data['base_unit']!, _baseUnitMeta));
    }
    if (data.containsKey('allow_decimal_quantity')) {
      context.handle(
          _allowDecimalQuantityMeta,
          allowDecimalQuantity.isAcceptableOrUnknown(
              data['allow_decimal_quantity']!, _allowDecimalQuantityMeta));
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    }
    if (data.containsKey('sale_price')) {
      context.handle(_salePriceMeta,
          salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('min_stock')) {
      context.handle(_minStockMeta,
          minStock.isAcceptableOrUnknown(data['min_stock']!, _minStockMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      brandId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}brand_id']),
      productType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_type'])!,
      baseUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_unit'])!,
      allowDecimalQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}allow_decimal_quantity'])!,
      costPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost_price'])!,
      salePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sale_price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      minStock: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_stock'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductDb extends DataClass implements Insertable<ProductDb> {
  final int id;
  final String name;
  final String? description;
  final int? categoryId;
  final int? brandId;
  final String productType;
  final String baseUnit;
  final bool allowDecimalQuantity;
  final double costPrice;
  final double salePrice;
  final double quantity;
  final double minStock;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ProductDb(
      {required this.id,
      required this.name,
      this.description,
      this.categoryId,
      this.brandId,
      required this.productType,
      required this.baseUnit,
      required this.allowDecimalQuantity,
      required this.costPrice,
      required this.salePrice,
      required this.quantity,
      required this.minStock,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || brandId != null) {
      map['brand_id'] = Variable<int>(brandId);
    }
    map['product_type'] = Variable<String>(productType);
    map['base_unit'] = Variable<String>(baseUnit);
    map['allow_decimal_quantity'] = Variable<bool>(allowDecimalQuantity);
    map['cost_price'] = Variable<double>(costPrice);
    map['sale_price'] = Variable<double>(salePrice);
    map['quantity'] = Variable<double>(quantity);
    map['min_stock'] = Variable<double>(minStock);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      brandId: brandId == null && nullToAbsent
          ? const Value.absent()
          : Value(brandId),
      productType: Value(productType),
      baseUnit: Value(baseUnit),
      allowDecimalQuantity: Value(allowDecimalQuantity),
      costPrice: Value(costPrice),
      salePrice: Value(salePrice),
      quantity: Value(quantity),
      minStock: Value(minStock),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProductDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductDb(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      brandId: serializer.fromJson<int?>(json['brandId']),
      productType: serializer.fromJson<String>(json['productType']),
      baseUnit: serializer.fromJson<String>(json['baseUnit']),
      allowDecimalQuantity:
          serializer.fromJson<bool>(json['allowDecimalQuantity']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      salePrice: serializer.fromJson<double>(json['salePrice']),
      quantity: serializer.fromJson<double>(json['quantity']),
      minStock: serializer.fromJson<double>(json['minStock']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'categoryId': serializer.toJson<int?>(categoryId),
      'brandId': serializer.toJson<int?>(brandId),
      'productType': serializer.toJson<String>(productType),
      'baseUnit': serializer.toJson<String>(baseUnit),
      'allowDecimalQuantity': serializer.toJson<bool>(allowDecimalQuantity),
      'costPrice': serializer.toJson<double>(costPrice),
      'salePrice': serializer.toJson<double>(salePrice),
      'quantity': serializer.toJson<double>(quantity),
      'minStock': serializer.toJson<double>(minStock),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProductDb copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<int?> categoryId = const Value.absent(),
          Value<int?> brandId = const Value.absent(),
          String? productType,
          String? baseUnit,
          bool? allowDecimalQuantity,
          double? costPrice,
          double? salePrice,
          double? quantity,
          double? minStock,
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ProductDb(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        brandId: brandId.present ? brandId.value : this.brandId,
        productType: productType ?? this.productType,
        baseUnit: baseUnit ?? this.baseUnit,
        allowDecimalQuantity: allowDecimalQuantity ?? this.allowDecimalQuantity,
        costPrice: costPrice ?? this.costPrice,
        salePrice: salePrice ?? this.salePrice,
        quantity: quantity ?? this.quantity,
        minStock: minStock ?? this.minStock,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ProductDb copyWithCompanion(ProductsCompanion data) {
    return ProductDb(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      productType:
          data.productType.present ? data.productType.value : this.productType,
      baseUnit: data.baseUnit.present ? data.baseUnit.value : this.baseUnit,
      allowDecimalQuantity: data.allowDecimalQuantity.present
          ? data.allowDecimalQuantity.value
          : this.allowDecimalQuantity,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      minStock: data.minStock.present ? data.minStock.value : this.minStock,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductDb(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('categoryId: $categoryId, ')
          ..write('brandId: $brandId, ')
          ..write('productType: $productType, ')
          ..write('baseUnit: $baseUnit, ')
          ..write('allowDecimalQuantity: $allowDecimalQuantity, ')
          ..write('costPrice: $costPrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('quantity: $quantity, ')
          ..write('minStock: $minStock, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      categoryId,
      brandId,
      productType,
      baseUnit,
      allowDecimalQuantity,
      costPrice,
      salePrice,
      quantity,
      minStock,
      isActive,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductDb &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.categoryId == this.categoryId &&
          other.brandId == this.brandId &&
          other.productType == this.productType &&
          other.baseUnit == this.baseUnit &&
          other.allowDecimalQuantity == this.allowDecimalQuantity &&
          other.costPrice == this.costPrice &&
          other.salePrice == this.salePrice &&
          other.quantity == this.quantity &&
          other.minStock == this.minStock &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductsCompanion extends UpdateCompanion<ProductDb> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int?> categoryId;
  final Value<int?> brandId;
  final Value<String> productType;
  final Value<String> baseUnit;
  final Value<bool> allowDecimalQuantity;
  final Value<double> costPrice;
  final Value<double> salePrice;
  final Value<double> quantity;
  final Value<double> minStock;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.brandId = const Value.absent(),
    this.productType = const Value.absent(),
    this.baseUnit = const Value.absent(),
    this.allowDecimalQuantity = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.minStock = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.brandId = const Value.absent(),
    this.productType = const Value.absent(),
    this.baseUnit = const Value.absent(),
    this.allowDecimalQuantity = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.minStock = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ProductDb> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? categoryId,
    Expression<int>? brandId,
    Expression<String>? productType,
    Expression<String>? baseUnit,
    Expression<bool>? allowDecimalQuantity,
    Expression<double>? costPrice,
    Expression<double>? salePrice,
    Expression<double>? quantity,
    Expression<double>? minStock,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (categoryId != null) 'category_id': categoryId,
      if (brandId != null) 'brand_id': brandId,
      if (productType != null) 'product_type': productType,
      if (baseUnit != null) 'base_unit': baseUnit,
      if (allowDecimalQuantity != null)
        'allow_decimal_quantity': allowDecimalQuantity,
      if (costPrice != null) 'cost_price': costPrice,
      if (salePrice != null) 'sale_price': salePrice,
      if (quantity != null) 'quantity': quantity,
      if (minStock != null) 'min_stock': minStock,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<int?>? categoryId,
      Value<int?>? brandId,
      Value<String>? productType,
      Value<String>? baseUnit,
      Value<bool>? allowDecimalQuantity,
      Value<double>? costPrice,
      Value<double>? salePrice,
      Value<double>? quantity,
      Value<double>? minStock,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      productType: productType ?? this.productType,
      baseUnit: baseUnit ?? this.baseUnit,
      allowDecimalQuantity: allowDecimalQuantity ?? this.allowDecimalQuantity,
      costPrice: costPrice ?? this.costPrice,
      salePrice: salePrice ?? this.salePrice,
      quantity: quantity ?? this.quantity,
      minStock: minStock ?? this.minStock,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (brandId.present) {
      map['brand_id'] = Variable<int>(brandId.value);
    }
    if (productType.present) {
      map['product_type'] = Variable<String>(productType.value);
    }
    if (baseUnit.present) {
      map['base_unit'] = Variable<String>(baseUnit.value);
    }
    if (allowDecimalQuantity.present) {
      map['allow_decimal_quantity'] =
          Variable<bool>(allowDecimalQuantity.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<double>(salePrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (minStock.present) {
      map['min_stock'] = Variable<double>(minStock.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('categoryId: $categoryId, ')
          ..write('brandId: $brandId, ')
          ..write('productType: $productType, ')
          ..write('baseUnit: $baseUnit, ')
          ..write('allowDecimalQuantity: $allowDecimalQuantity, ')
          ..write('costPrice: $costPrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('quantity: $quantity, ')
          ..write('minStock: $minStock, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductUnitsTable extends ProductUnits
    with TableInfo<$ProductUnitsTable, ProductUnitDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductUnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitNameMeta =
      const VerificationMeta('unitName');
  @override
  late final GeneratedColumn<String> unitName = GeneratedColumn<String>(
      'unit_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _conversionFactorMeta =
      const VerificationMeta('conversionFactor');
  @override
  late final GeneratedColumn<double> conversionFactor = GeneratedColumn<double>(
      'conversion_factor', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(1.0));
  static const VerificationMeta _costPriceMeta =
      const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
      'cost_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _salePriceMeta =
      const VerificationMeta('salePrice');
  @override
  late final GeneratedColumn<double> salePrice = GeneratedColumn<double>(
      'sale_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _isBaseUnitMeta =
      const VerificationMeta('isBaseUnit');
  @override
  late final GeneratedColumn<bool> isBaseUnit = GeneratedColumn<bool>(
      'is_base_unit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_base_unit" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_default" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        unitName,
        conversionFactor,
        costPrice,
        salePrice,
        isBaseUnit,
        isDefault,
        isActive,
        sortOrder,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_units';
  @override
  VerificationContext validateIntegrity(Insertable<ProductUnitDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('unit_name')) {
      context.handle(_unitNameMeta,
          unitName.isAcceptableOrUnknown(data['unit_name']!, _unitNameMeta));
    } else if (isInserting) {
      context.missing(_unitNameMeta);
    }
    if (data.containsKey('conversion_factor')) {
      context.handle(
          _conversionFactorMeta,
          conversionFactor.isAcceptableOrUnknown(
              data['conversion_factor']!, _conversionFactorMeta));
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    }
    if (data.containsKey('sale_price')) {
      context.handle(_salePriceMeta,
          salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta));
    }
    if (data.containsKey('is_base_unit')) {
      context.handle(
          _isBaseUnitMeta,
          isBaseUnit.isAcceptableOrUnknown(
              data['is_base_unit']!, _isBaseUnitMeta));
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {productId, unitName},
      ];
  @override
  ProductUnitDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductUnitDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      unitName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit_name'])!,
      conversionFactor: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}conversion_factor'])!,
      costPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost_price'])!,
      salePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sale_price'])!,
      isBaseUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_base_unit'])!,
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ProductUnitsTable createAlias(String alias) {
    return $ProductUnitsTable(attachedDatabase, alias);
  }
}

class ProductUnitDb extends DataClass implements Insertable<ProductUnitDb> {
  final int id;
  final int productId;
  final String unitName;
  final double conversionFactor;
  final double costPrice;
  final double salePrice;
  final bool isBaseUnit;
  final bool isDefault;
  final bool isActive;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ProductUnitDb(
      {required this.id,
      required this.productId,
      required this.unitName,
      required this.conversionFactor,
      required this.costPrice,
      required this.salePrice,
      required this.isBaseUnit,
      required this.isDefault,
      required this.isActive,
      required this.sortOrder,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['unit_name'] = Variable<String>(unitName);
    map['conversion_factor'] = Variable<double>(conversionFactor);
    map['cost_price'] = Variable<double>(costPrice);
    map['sale_price'] = Variable<double>(salePrice);
    map['is_base_unit'] = Variable<bool>(isBaseUnit);
    map['is_default'] = Variable<bool>(isDefault);
    map['is_active'] = Variable<bool>(isActive);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProductUnitsCompanion toCompanion(bool nullToAbsent) {
    return ProductUnitsCompanion(
      id: Value(id),
      productId: Value(productId),
      unitName: Value(unitName),
      conversionFactor: Value(conversionFactor),
      costPrice: Value(costPrice),
      salePrice: Value(salePrice),
      isBaseUnit: Value(isBaseUnit),
      isDefault: Value(isDefault),
      isActive: Value(isActive),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProductUnitDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductUnitDb(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      unitName: serializer.fromJson<String>(json['unitName']),
      conversionFactor: serializer.fromJson<double>(json['conversionFactor']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      salePrice: serializer.fromJson<double>(json['salePrice']),
      isBaseUnit: serializer.fromJson<bool>(json['isBaseUnit']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'unitName': serializer.toJson<String>(unitName),
      'conversionFactor': serializer.toJson<double>(conversionFactor),
      'costPrice': serializer.toJson<double>(costPrice),
      'salePrice': serializer.toJson<double>(salePrice),
      'isBaseUnit': serializer.toJson<bool>(isBaseUnit),
      'isDefault': serializer.toJson<bool>(isDefault),
      'isActive': serializer.toJson<bool>(isActive),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProductUnitDb copyWith(
          {int? id,
          int? productId,
          String? unitName,
          double? conversionFactor,
          double? costPrice,
          double? salePrice,
          bool? isBaseUnit,
          bool? isDefault,
          bool? isActive,
          int? sortOrder,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ProductUnitDb(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        unitName: unitName ?? this.unitName,
        conversionFactor: conversionFactor ?? this.conversionFactor,
        costPrice: costPrice ?? this.costPrice,
        salePrice: salePrice ?? this.salePrice,
        isBaseUnit: isBaseUnit ?? this.isBaseUnit,
        isDefault: isDefault ?? this.isDefault,
        isActive: isActive ?? this.isActive,
        sortOrder: sortOrder ?? this.sortOrder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ProductUnitDb copyWithCompanion(ProductUnitsCompanion data) {
    return ProductUnitDb(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      unitName: data.unitName.present ? data.unitName.value : this.unitName,
      conversionFactor: data.conversionFactor.present
          ? data.conversionFactor.value
          : this.conversionFactor,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      isBaseUnit:
          data.isBaseUnit.present ? data.isBaseUnit.value : this.isBaseUnit,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductUnitDb(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('unitName: $unitName, ')
          ..write('conversionFactor: $conversionFactor, ')
          ..write('costPrice: $costPrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('isBaseUnit: $isBaseUnit, ')
          ..write('isDefault: $isDefault, ')
          ..write('isActive: $isActive, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      productId,
      unitName,
      conversionFactor,
      costPrice,
      salePrice,
      isBaseUnit,
      isDefault,
      isActive,
      sortOrder,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductUnitDb &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.unitName == this.unitName &&
          other.conversionFactor == this.conversionFactor &&
          other.costPrice == this.costPrice &&
          other.salePrice == this.salePrice &&
          other.isBaseUnit == this.isBaseUnit &&
          other.isDefault == this.isDefault &&
          other.isActive == this.isActive &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductUnitsCompanion extends UpdateCompanion<ProductUnitDb> {
  final Value<int> id;
  final Value<int> productId;
  final Value<String> unitName;
  final Value<double> conversionFactor;
  final Value<double> costPrice;
  final Value<double> salePrice;
  final Value<bool> isBaseUnit;
  final Value<bool> isDefault;
  final Value<bool> isActive;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ProductUnitsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.unitName = const Value.absent(),
    this.conversionFactor = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.isBaseUnit = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isActive = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProductUnitsCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required String unitName,
    this.conversionFactor = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.isBaseUnit = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isActive = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : productId = Value(productId),
        unitName = Value(unitName);
  static Insertable<ProductUnitDb> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<String>? unitName,
    Expression<double>? conversionFactor,
    Expression<double>? costPrice,
    Expression<double>? salePrice,
    Expression<bool>? isBaseUnit,
    Expression<bool>? isDefault,
    Expression<bool>? isActive,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (unitName != null) 'unit_name': unitName,
      if (conversionFactor != null) 'conversion_factor': conversionFactor,
      if (costPrice != null) 'cost_price': costPrice,
      if (salePrice != null) 'sale_price': salePrice,
      if (isBaseUnit != null) 'is_base_unit': isBaseUnit,
      if (isDefault != null) 'is_default': isDefault,
      if (isActive != null) 'is_active': isActive,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProductUnitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<String>? unitName,
      Value<double>? conversionFactor,
      Value<double>? costPrice,
      Value<double>? salePrice,
      Value<bool>? isBaseUnit,
      Value<bool>? isDefault,
      Value<bool>? isActive,
      Value<int>? sortOrder,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ProductUnitsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      unitName: unitName ?? this.unitName,
      conversionFactor: conversionFactor ?? this.conversionFactor,
      costPrice: costPrice ?? this.costPrice,
      salePrice: salePrice ?? this.salePrice,
      isBaseUnit: isBaseUnit ?? this.isBaseUnit,
      isDefault: isDefault ?? this.isDefault,
      isActive: isActive ?? this.isActive,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (unitName.present) {
      map['unit_name'] = Variable<String>(unitName.value);
    }
    if (conversionFactor.present) {
      map['conversion_factor'] = Variable<double>(conversionFactor.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<double>(salePrice.value);
    }
    if (isBaseUnit.present) {
      map['is_base_unit'] = Variable<bool>(isBaseUnit.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductUnitsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('unitName: $unitName, ')
          ..write('conversionFactor: $conversionFactor, ')
          ..write('costPrice: $costPrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('isBaseUnit: $isBaseUnit, ')
          ..write('isDefault: $isDefault, ')
          ..write('isActive: $isActive, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductBarcodesTable extends ProductBarcodes
    with TableInfo<$ProductBarcodesTable, ProductBarcodeDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductBarcodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productUnitIdMeta =
      const VerificationMeta('productUnitId');
  @override
  late final GeneratedColumn<int> productUnitId = GeneratedColumn<int>(
      'product_unit_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _barcodeTypeMeta =
      const VerificationMeta('barcodeType');
  @override
  late final GeneratedColumn<String> barcodeType = GeneratedColumn<String>(
      'barcode_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('internal'));
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_default" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        productUnitId,
        barcode,
        barcodeType,
        source,
        isDefault,
        isActive,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_barcodes';
  @override
  VerificationContext validateIntegrity(Insertable<ProductBarcodeDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_unit_id')) {
      context.handle(
          _productUnitIdMeta,
          productUnitId.isAcceptableOrUnknown(
              data['product_unit_id']!, _productUnitIdMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('barcode_type')) {
      context.handle(
          _barcodeTypeMeta,
          barcodeType.isAcceptableOrUnknown(
              data['barcode_type']!, _barcodeTypeMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductBarcodeDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductBarcodeDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      productUnitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_unit_id']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode'])!,
      barcodeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode_type'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source']),
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ProductBarcodesTable createAlias(String alias) {
    return $ProductBarcodesTable(attachedDatabase, alias);
  }
}

class ProductBarcodeDb extends DataClass
    implements Insertable<ProductBarcodeDb> {
  final int id;
  final int productId;
  final int? productUnitId;
  final String barcode;
  final String barcodeType;
  final String? source;
  final bool isDefault;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ProductBarcodeDb(
      {required this.id,
      required this.productId,
      this.productUnitId,
      required this.barcode,
      required this.barcodeType,
      this.source,
      required this.isDefault,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    if (!nullToAbsent || productUnitId != null) {
      map['product_unit_id'] = Variable<int>(productUnitId);
    }
    map['barcode'] = Variable<String>(barcode);
    map['barcode_type'] = Variable<String>(barcodeType);
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    map['is_default'] = Variable<bool>(isDefault);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProductBarcodesCompanion toCompanion(bool nullToAbsent) {
    return ProductBarcodesCompanion(
      id: Value(id),
      productId: Value(productId),
      productUnitId: productUnitId == null && nullToAbsent
          ? const Value.absent()
          : Value(productUnitId),
      barcode: Value(barcode),
      barcodeType: Value(barcodeType),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      isDefault: Value(isDefault),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProductBarcodeDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductBarcodeDb(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      productUnitId: serializer.fromJson<int?>(json['productUnitId']),
      barcode: serializer.fromJson<String>(json['barcode']),
      barcodeType: serializer.fromJson<String>(json['barcodeType']),
      source: serializer.fromJson<String?>(json['source']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'productUnitId': serializer.toJson<int?>(productUnitId),
      'barcode': serializer.toJson<String>(barcode),
      'barcodeType': serializer.toJson<String>(barcodeType),
      'source': serializer.toJson<String?>(source),
      'isDefault': serializer.toJson<bool>(isDefault),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProductBarcodeDb copyWith(
          {int? id,
          int? productId,
          Value<int?> productUnitId = const Value.absent(),
          String? barcode,
          String? barcodeType,
          Value<String?> source = const Value.absent(),
          bool? isDefault,
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ProductBarcodeDb(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        productUnitId:
            productUnitId.present ? productUnitId.value : this.productUnitId,
        barcode: barcode ?? this.barcode,
        barcodeType: barcodeType ?? this.barcodeType,
        source: source.present ? source.value : this.source,
        isDefault: isDefault ?? this.isDefault,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ProductBarcodeDb copyWithCompanion(ProductBarcodesCompanion data) {
    return ProductBarcodeDb(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      productUnitId: data.productUnitId.present
          ? data.productUnitId.value
          : this.productUnitId,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      barcodeType:
          data.barcodeType.present ? data.barcodeType.value : this.barcodeType,
      source: data.source.present ? data.source.value : this.source,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductBarcodeDb(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('productUnitId: $productUnitId, ')
          ..write('barcode: $barcode, ')
          ..write('barcodeType: $barcodeType, ')
          ..write('source: $source, ')
          ..write('isDefault: $isDefault, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, productUnitId, barcode,
      barcodeType, source, isDefault, isActive, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductBarcodeDb &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.productUnitId == this.productUnitId &&
          other.barcode == this.barcode &&
          other.barcodeType == this.barcodeType &&
          other.source == this.source &&
          other.isDefault == this.isDefault &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductBarcodesCompanion extends UpdateCompanion<ProductBarcodeDb> {
  final Value<int> id;
  final Value<int> productId;
  final Value<int?> productUnitId;
  final Value<String> barcode;
  final Value<String> barcodeType;
  final Value<String?> source;
  final Value<bool> isDefault;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ProductBarcodesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.productUnitId = const Value.absent(),
    this.barcode = const Value.absent(),
    this.barcodeType = const Value.absent(),
    this.source = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProductBarcodesCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    this.productUnitId = const Value.absent(),
    required String barcode,
    this.barcodeType = const Value.absent(),
    this.source = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : productId = Value(productId),
        barcode = Value(barcode);
  static Insertable<ProductBarcodeDb> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? productUnitId,
    Expression<String>? barcode,
    Expression<String>? barcodeType,
    Expression<String>? source,
    Expression<bool>? isDefault,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (productUnitId != null) 'product_unit_id': productUnitId,
      if (barcode != null) 'barcode': barcode,
      if (barcodeType != null) 'barcode_type': barcodeType,
      if (source != null) 'source': source,
      if (isDefault != null) 'is_default': isDefault,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProductBarcodesCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<int?>? productUnitId,
      Value<String>? barcode,
      Value<String>? barcodeType,
      Value<String?>? source,
      Value<bool>? isDefault,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ProductBarcodesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productUnitId: productUnitId ?? this.productUnitId,
      barcode: barcode ?? this.barcode,
      barcodeType: barcodeType ?? this.barcodeType,
      source: source ?? this.source,
      isDefault: isDefault ?? this.isDefault,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productUnitId.present) {
      map['product_unit_id'] = Variable<int>(productUnitId.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (barcodeType.present) {
      map['barcode_type'] = Variable<String>(barcodeType.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductBarcodesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('productUnitId: $productUnitId, ')
          ..write('barcode: $barcode, ')
          ..write('barcodeType: $barcodeType, ')
          ..write('source: $source, ')
          ..write('isDefault: $isDefault, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductImagesTable extends ProductImages
    with TableInfo<$ProductImagesTable, ProductImageDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imageNameMeta =
      const VerificationMeta('imageName');
  @override
  late final GeneratedColumn<String> imageName = GeneratedColumn<String>(
      'image_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isPrimaryMeta =
      const VerificationMeta('isPrimary');
  @override
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
      'is_primary', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_primary" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        imagePath,
        imageName,
        isPrimary,
        sortOrder,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_images';
  @override
  VerificationContext validateIntegrity(Insertable<ProductImageDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('image_name')) {
      context.handle(_imageNameMeta,
          imageName.isAcceptableOrUnknown(data['image_name']!, _imageNameMeta));
    }
    if (data.containsKey('is_primary')) {
      context.handle(_isPrimaryMeta,
          isPrimary.isAcceptableOrUnknown(data['is_primary']!, _isPrimaryMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductImageDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductImageDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path'])!,
      imageName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_name']),
      isPrimary: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_primary'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ProductImagesTable createAlias(String alias) {
    return $ProductImagesTable(attachedDatabase, alias);
  }
}

class ProductImageDb extends DataClass implements Insertable<ProductImageDb> {
  final int id;
  final int productId;
  final String imagePath;
  final String? imageName;
  final bool isPrimary;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ProductImageDb(
      {required this.id,
      required this.productId,
      required this.imagePath,
      this.imageName,
      required this.isPrimary,
      required this.sortOrder,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['image_path'] = Variable<String>(imagePath);
    if (!nullToAbsent || imageName != null) {
      map['image_name'] = Variable<String>(imageName);
    }
    map['is_primary'] = Variable<bool>(isPrimary);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProductImagesCompanion toCompanion(bool nullToAbsent) {
    return ProductImagesCompanion(
      id: Value(id),
      productId: Value(productId),
      imagePath: Value(imagePath),
      imageName: imageName == null && nullToAbsent
          ? const Value.absent()
          : Value(imageName),
      isPrimary: Value(isPrimary),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProductImageDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductImageDb(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      imageName: serializer.fromJson<String?>(json['imageName']),
      isPrimary: serializer.fromJson<bool>(json['isPrimary']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'imagePath': serializer.toJson<String>(imagePath),
      'imageName': serializer.toJson<String?>(imageName),
      'isPrimary': serializer.toJson<bool>(isPrimary),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProductImageDb copyWith(
          {int? id,
          int? productId,
          String? imagePath,
          Value<String?> imageName = const Value.absent(),
          bool? isPrimary,
          int? sortOrder,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ProductImageDb(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        imagePath: imagePath ?? this.imagePath,
        imageName: imageName.present ? imageName.value : this.imageName,
        isPrimary: isPrimary ?? this.isPrimary,
        sortOrder: sortOrder ?? this.sortOrder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ProductImageDb copyWithCompanion(ProductImagesCompanion data) {
    return ProductImageDb(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      imageName: data.imageName.present ? data.imageName.value : this.imageName,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductImageDb(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageName: $imageName, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, imagePath, imageName,
      isPrimary, sortOrder, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductImageDb &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.imagePath == this.imagePath &&
          other.imageName == this.imageName &&
          other.isPrimary == this.isPrimary &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductImagesCompanion extends UpdateCompanion<ProductImageDb> {
  final Value<int> id;
  final Value<int> productId;
  final Value<String> imagePath;
  final Value<String?> imageName;
  final Value<bool> isPrimary;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ProductImagesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.imageName = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProductImagesCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required String imagePath,
    this.imageName = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : productId = Value(productId),
        imagePath = Value(imagePath);
  static Insertable<ProductImageDb> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<String>? imagePath,
    Expression<String>? imageName,
    Expression<bool>? isPrimary,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (imagePath != null) 'image_path': imagePath,
      if (imageName != null) 'image_name': imageName,
      if (isPrimary != null) 'is_primary': isPrimary,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProductImagesCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<String>? imagePath,
      Value<String?>? imageName,
      Value<bool>? isPrimary,
      Value<int>? sortOrder,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ProductImagesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      imagePath: imagePath ?? this.imagePath,
      imageName: imageName ?? this.imageName,
      isPrimary: isPrimary ?? this.isPrimary,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (imageName.present) {
      map['image_name'] = Variable<String>(imageName.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = Variable<bool>(isPrimary.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductImagesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageName: $imageName, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, CustomerDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerCodeMeta =
      const VerificationMeta('customerCode');
  @override
  late final GeneratedColumn<String> customerCode = GeneratedColumn<String>(
      'customer_code', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _customerTypeMeta =
      const VerificationMeta('customerType');
  @override
  late final GeneratedColumn<String> customerType = GeneratedColumn<String>(
      'customer_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('individual'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _contactPersonMeta =
      const VerificationMeta('contactPerson');
  @override
  late final GeneratedColumn<String> contactPerson = GeneratedColumn<String>(
      'contact_person', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _secondaryPhoneMeta =
      const VerificationMeta('secondaryPhone');
  @override
  late final GeneratedColumn<String> secondaryPhone = GeneratedColumn<String>(
      'secondary_phone', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _whatsappMeta =
      const VerificationMeta('whatsapp');
  @override
  late final GeneratedColumn<String> whatsapp = GeneratedColumn<String>(
      'whatsapp', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _nationalIdMeta =
      const VerificationMeta('nationalId');
  @override
  late final GeneratedColumn<String> nationalId = GeneratedColumn<String>(
      'national_id', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _taxNumberMeta =
      const VerificationMeta('taxNumber');
  @override
  late final GeneratedColumn<String> taxNumber = GeneratedColumn<String>(
      'tax_number', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _commercialRegisterMeta =
      const VerificationMeta('commercialRegister');
  @override
  late final GeneratedColumn<String> commercialRegister =
      GeneratedColumn<String>('commercial_register', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
      'region', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _buildingNumberMeta =
      const VerificationMeta('buildingNumber');
  @override
  late final GeneratedColumn<String> buildingNumber = GeneratedColumn<String>(
      'building_number', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
      'postal_code', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _billingAddressMeta =
      const VerificationMeta('billingAddress');
  @override
  late final GeneratedColumn<String> billingAddress = GeneratedColumn<String>(
      'billing_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _shippingAddressMeta =
      const VerificationMeta('shippingAddress');
  @override
  late final GeneratedColumn<String> shippingAddress = GeneratedColumn<String>(
      'shipping_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customerCategoryMeta =
      const VerificationMeta('customerCategory');
  @override
  late final GeneratedColumn<String> customerCategory = GeneratedColumn<String>(
      'customer_category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('normal'));
  static const VerificationMeta _priceLevelMeta =
      const VerificationMeta('priceLevel');
  @override
  late final GeneratedColumn<String> priceLevel = GeneratedColumn<String>(
      'price_level', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('retail'));
  static const VerificationMeta _allowCreditMeta =
      const VerificationMeta('allowCredit');
  @override
  late final GeneratedColumn<bool> allowCredit = GeneratedColumn<bool>(
      'allow_credit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("allow_credit" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _creditLimitMeta =
      const VerificationMeta('creditLimit');
  @override
  late final GeneratedColumn<double> creditLimit = GeneratedColumn<double>(
      'credit_limit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _currentBalanceMeta =
      const VerificationMeta('currentBalance');
  @override
  late final GeneratedColumn<double> currentBalance = GeneratedColumn<double>(
      'current_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _paymentTermsDaysMeta =
      const VerificationMeta('paymentTermsDays');
  @override
  late final GeneratedColumn<int> paymentTermsDays = GeneratedColumn<int>(
      'payment_terms_days', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _defaultDiscountMeta =
      const VerificationMeta('defaultDiscount');
  @override
  late final GeneratedColumn<double> defaultDiscount = GeneratedColumn<double>(
      'default_discount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _preferredPaymentMethodMeta =
      const VerificationMeta('preferredPaymentMethod');
  @override
  late final GeneratedColumn<String> preferredPaymentMethod =
      GeneratedColumn<String>('preferred_payment_method', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('cash'));
  static const VerificationMeta _loyaltyPointsMeta =
      const VerificationMeta('loyaltyPoints');
  @override
  late final GeneratedColumn<int> loyaltyPoints = GeneratedColumn<int>(
      'loyalty_points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastSaleAtMeta =
      const VerificationMeta('lastSaleAt');
  @override
  late final GeneratedColumn<DateTime> lastSaleAt = GeneratedColumn<DateTime>(
      'last_sale_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastPaymentAtMeta =
      const VerificationMeta('lastPaymentAt');
  @override
  late final GeneratedColumn<DateTime> lastPaymentAt =
      GeneratedColumn<DateTime>('last_payment_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        customerCode,
        customerType,
        name,
        companyName,
        contactPerson,
        imagePath,
        phone,
        secondaryPhone,
        whatsapp,
        email,
        website,
        nationalId,
        taxNumber,
        commercialRegister,
        address,
        country,
        city,
        region,
        street,
        buildingNumber,
        postalCode,
        billingAddress,
        shippingAddress,
        customerCategory,
        priceLevel,
        allowCredit,
        creditLimit,
        openingBalance,
        currentBalance,
        paymentTermsDays,
        defaultDiscount,
        preferredPaymentMethod,
        loyaltyPoints,
        lastSaleAt,
        lastPaymentAt,
        isActive,
        notes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_code')) {
      context.handle(
          _customerCodeMeta,
          customerCode.isAcceptableOrUnknown(
              data['customer_code']!, _customerCodeMeta));
    }
    if (data.containsKey('customer_type')) {
      context.handle(
          _customerTypeMeta,
          customerType.isAcceptableOrUnknown(
              data['customer_type']!, _customerTypeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    }
    if (data.containsKey('contact_person')) {
      context.handle(
          _contactPersonMeta,
          contactPerson.isAcceptableOrUnknown(
              data['contact_person']!, _contactPersonMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('secondary_phone')) {
      context.handle(
          _secondaryPhoneMeta,
          secondaryPhone.isAcceptableOrUnknown(
              data['secondary_phone']!, _secondaryPhoneMeta));
    }
    if (data.containsKey('whatsapp')) {
      context.handle(_whatsappMeta,
          whatsapp.isAcceptableOrUnknown(data['whatsapp']!, _whatsappMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    }
    if (data.containsKey('national_id')) {
      context.handle(
          _nationalIdMeta,
          nationalId.isAcceptableOrUnknown(
              data['national_id']!, _nationalIdMeta));
    }
    if (data.containsKey('tax_number')) {
      context.handle(_taxNumberMeta,
          taxNumber.isAcceptableOrUnknown(data['tax_number']!, _taxNumberMeta));
    }
    if (data.containsKey('commercial_register')) {
      context.handle(
          _commercialRegisterMeta,
          commercialRegister.isAcceptableOrUnknown(
              data['commercial_register']!, _commercialRegisterMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region']!, _regionMeta));
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    }
    if (data.containsKey('building_number')) {
      context.handle(
          _buildingNumberMeta,
          buildingNumber.isAcceptableOrUnknown(
              data['building_number']!, _buildingNumberMeta));
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    }
    if (data.containsKey('billing_address')) {
      context.handle(
          _billingAddressMeta,
          billingAddress.isAcceptableOrUnknown(
              data['billing_address']!, _billingAddressMeta));
    }
    if (data.containsKey('shipping_address')) {
      context.handle(
          _shippingAddressMeta,
          shippingAddress.isAcceptableOrUnknown(
              data['shipping_address']!, _shippingAddressMeta));
    }
    if (data.containsKey('customer_category')) {
      context.handle(
          _customerCategoryMeta,
          customerCategory.isAcceptableOrUnknown(
              data['customer_category']!, _customerCategoryMeta));
    }
    if (data.containsKey('price_level')) {
      context.handle(
          _priceLevelMeta,
          priceLevel.isAcceptableOrUnknown(
              data['price_level']!, _priceLevelMeta));
    }
    if (data.containsKey('allow_credit')) {
      context.handle(
          _allowCreditMeta,
          allowCredit.isAcceptableOrUnknown(
              data['allow_credit']!, _allowCreditMeta));
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
          _creditLimitMeta,
          creditLimit.isAcceptableOrUnknown(
              data['credit_limit']!, _creditLimitMeta));
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    }
    if (data.containsKey('current_balance')) {
      context.handle(
          _currentBalanceMeta,
          currentBalance.isAcceptableOrUnknown(
              data['current_balance']!, _currentBalanceMeta));
    }
    if (data.containsKey('payment_terms_days')) {
      context.handle(
          _paymentTermsDaysMeta,
          paymentTermsDays.isAcceptableOrUnknown(
              data['payment_terms_days']!, _paymentTermsDaysMeta));
    }
    if (data.containsKey('default_discount')) {
      context.handle(
          _defaultDiscountMeta,
          defaultDiscount.isAcceptableOrUnknown(
              data['default_discount']!, _defaultDiscountMeta));
    }
    if (data.containsKey('preferred_payment_method')) {
      context.handle(
          _preferredPaymentMethodMeta,
          preferredPaymentMethod.isAcceptableOrUnknown(
              data['preferred_payment_method']!, _preferredPaymentMethodMeta));
    }
    if (data.containsKey('loyalty_points')) {
      context.handle(
          _loyaltyPointsMeta,
          loyaltyPoints.isAcceptableOrUnknown(
              data['loyalty_points']!, _loyaltyPointsMeta));
    }
    if (data.containsKey('last_sale_at')) {
      context.handle(
          _lastSaleAtMeta,
          lastSaleAt.isAcceptableOrUnknown(
              data['last_sale_at']!, _lastSaleAtMeta));
    }
    if (data.containsKey('last_payment_at')) {
      context.handle(
          _lastPaymentAtMeta,
          lastPaymentAt.isAcceptableOrUnknown(
              data['last_payment_at']!, _lastPaymentAtMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_code']),
      customerType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_type'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name']),
      contactPerson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_person']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      secondaryPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}secondary_phone']),
      whatsapp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}whatsapp']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website']),
      nationalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}national_id']),
      taxNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tax_number']),
      commercialRegister: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}commercial_register']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      region: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}region']),
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street']),
      buildingNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}building_number']),
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal_code']),
      billingAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_address']),
      shippingAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}shipping_address']),
      customerCategory: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}customer_category'])!,
      priceLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price_level'])!,
      allowCredit: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}allow_credit'])!,
      creditLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}credit_limit'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}opening_balance'])!,
      currentBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}current_balance'])!,
      paymentTermsDays: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}payment_terms_days'])!,
      defaultDiscount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}default_discount'])!,
      preferredPaymentMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}preferred_payment_method'])!,
      loyaltyPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}loyalty_points'])!,
      lastSaleAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_sale_at']),
      lastPaymentAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_payment_at']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class CustomerDb extends DataClass implements Insertable<CustomerDb> {
  final int id;
  final String? customerCode;
  final String customerType;
  final String name;
  final String? companyName;
  final String? contactPerson;
  final String? imagePath;
  final String? phone;
  final String? secondaryPhone;
  final String? whatsapp;
  final String? email;
  final String? website;
  final String? nationalId;
  final String? taxNumber;
  final String? commercialRegister;
  final String? address;
  final String? country;
  final String? city;
  final String? region;
  final String? street;
  final String? buildingNumber;
  final String? postalCode;
  final String? billingAddress;
  final String? shippingAddress;
  final String customerCategory;
  final String priceLevel;
  final bool allowCredit;
  final double creditLimit;
  final double openingBalance;
  final double currentBalance;
  final int paymentTermsDays;
  final double defaultDiscount;
  final String preferredPaymentMethod;
  final int loyaltyPoints;
  final DateTime? lastSaleAt;
  final DateTime? lastPaymentAt;
  final bool isActive;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CustomerDb(
      {required this.id,
      this.customerCode,
      required this.customerType,
      required this.name,
      this.companyName,
      this.contactPerson,
      this.imagePath,
      this.phone,
      this.secondaryPhone,
      this.whatsapp,
      this.email,
      this.website,
      this.nationalId,
      this.taxNumber,
      this.commercialRegister,
      this.address,
      this.country,
      this.city,
      this.region,
      this.street,
      this.buildingNumber,
      this.postalCode,
      this.billingAddress,
      this.shippingAddress,
      required this.customerCategory,
      required this.priceLevel,
      required this.allowCredit,
      required this.creditLimit,
      required this.openingBalance,
      required this.currentBalance,
      required this.paymentTermsDays,
      required this.defaultDiscount,
      required this.preferredPaymentMethod,
      required this.loyaltyPoints,
      this.lastSaleAt,
      this.lastPaymentAt,
      required this.isActive,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || customerCode != null) {
      map['customer_code'] = Variable<String>(customerCode);
    }
    map['customer_type'] = Variable<String>(customerType);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || contactPerson != null) {
      map['contact_person'] = Variable<String>(contactPerson);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || secondaryPhone != null) {
      map['secondary_phone'] = Variable<String>(secondaryPhone);
    }
    if (!nullToAbsent || whatsapp != null) {
      map['whatsapp'] = Variable<String>(whatsapp);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || nationalId != null) {
      map['national_id'] = Variable<String>(nationalId);
    }
    if (!nullToAbsent || taxNumber != null) {
      map['tax_number'] = Variable<String>(taxNumber);
    }
    if (!nullToAbsent || commercialRegister != null) {
      map['commercial_register'] = Variable<String>(commercialRegister);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || region != null) {
      map['region'] = Variable<String>(region);
    }
    if (!nullToAbsent || street != null) {
      map['street'] = Variable<String>(street);
    }
    if (!nullToAbsent || buildingNumber != null) {
      map['building_number'] = Variable<String>(buildingNumber);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || billingAddress != null) {
      map['billing_address'] = Variable<String>(billingAddress);
    }
    if (!nullToAbsent || shippingAddress != null) {
      map['shipping_address'] = Variable<String>(shippingAddress);
    }
    map['customer_category'] = Variable<String>(customerCategory);
    map['price_level'] = Variable<String>(priceLevel);
    map['allow_credit'] = Variable<bool>(allowCredit);
    map['credit_limit'] = Variable<double>(creditLimit);
    map['opening_balance'] = Variable<double>(openingBalance);
    map['current_balance'] = Variable<double>(currentBalance);
    map['payment_terms_days'] = Variable<int>(paymentTermsDays);
    map['default_discount'] = Variable<double>(defaultDiscount);
    map['preferred_payment_method'] = Variable<String>(preferredPaymentMethod);
    map['loyalty_points'] = Variable<int>(loyaltyPoints);
    if (!nullToAbsent || lastSaleAt != null) {
      map['last_sale_at'] = Variable<DateTime>(lastSaleAt);
    }
    if (!nullToAbsent || lastPaymentAt != null) {
      map['last_payment_at'] = Variable<DateTime>(lastPaymentAt);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      customerCode: customerCode == null && nullToAbsent
          ? const Value.absent()
          : Value(customerCode),
      customerType: Value(customerType),
      name: Value(name),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      contactPerson: contactPerson == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPerson),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      secondaryPhone: secondaryPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryPhone),
      whatsapp: whatsapp == null && nullToAbsent
          ? const Value.absent()
          : Value(whatsapp),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      nationalId: nationalId == null && nullToAbsent
          ? const Value.absent()
          : Value(nationalId),
      taxNumber: taxNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(taxNumber),
      commercialRegister: commercialRegister == null && nullToAbsent
          ? const Value.absent()
          : Value(commercialRegister),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      region:
          region == null && nullToAbsent ? const Value.absent() : Value(region),
      street:
          street == null && nullToAbsent ? const Value.absent() : Value(street),
      buildingNumber: buildingNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(buildingNumber),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      billingAddress: billingAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(billingAddress),
      shippingAddress: shippingAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingAddress),
      customerCategory: Value(customerCategory),
      priceLevel: Value(priceLevel),
      allowCredit: Value(allowCredit),
      creditLimit: Value(creditLimit),
      openingBalance: Value(openingBalance),
      currentBalance: Value(currentBalance),
      paymentTermsDays: Value(paymentTermsDays),
      defaultDiscount: Value(defaultDiscount),
      preferredPaymentMethod: Value(preferredPaymentMethod),
      loyaltyPoints: Value(loyaltyPoints),
      lastSaleAt: lastSaleAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSaleAt),
      lastPaymentAt: lastPaymentAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPaymentAt),
      isActive: Value(isActive),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CustomerDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerDb(
      id: serializer.fromJson<int>(json['id']),
      customerCode: serializer.fromJson<String?>(json['customerCode']),
      customerType: serializer.fromJson<String>(json['customerType']),
      name: serializer.fromJson<String>(json['name']),
      companyName: serializer.fromJson<String?>(json['companyName']),
      contactPerson: serializer.fromJson<String?>(json['contactPerson']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      phone: serializer.fromJson<String?>(json['phone']),
      secondaryPhone: serializer.fromJson<String?>(json['secondaryPhone']),
      whatsapp: serializer.fromJson<String?>(json['whatsapp']),
      email: serializer.fromJson<String?>(json['email']),
      website: serializer.fromJson<String?>(json['website']),
      nationalId: serializer.fromJson<String?>(json['nationalId']),
      taxNumber: serializer.fromJson<String?>(json['taxNumber']),
      commercialRegister:
          serializer.fromJson<String?>(json['commercialRegister']),
      address: serializer.fromJson<String?>(json['address']),
      country: serializer.fromJson<String?>(json['country']),
      city: serializer.fromJson<String?>(json['city']),
      region: serializer.fromJson<String?>(json['region']),
      street: serializer.fromJson<String?>(json['street']),
      buildingNumber: serializer.fromJson<String?>(json['buildingNumber']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      billingAddress: serializer.fromJson<String?>(json['billingAddress']),
      shippingAddress: serializer.fromJson<String?>(json['shippingAddress']),
      customerCategory: serializer.fromJson<String>(json['customerCategory']),
      priceLevel: serializer.fromJson<String>(json['priceLevel']),
      allowCredit: serializer.fromJson<bool>(json['allowCredit']),
      creditLimit: serializer.fromJson<double>(json['creditLimit']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      currentBalance: serializer.fromJson<double>(json['currentBalance']),
      paymentTermsDays: serializer.fromJson<int>(json['paymentTermsDays']),
      defaultDiscount: serializer.fromJson<double>(json['defaultDiscount']),
      preferredPaymentMethod:
          serializer.fromJson<String>(json['preferredPaymentMethod']),
      loyaltyPoints: serializer.fromJson<int>(json['loyaltyPoints']),
      lastSaleAt: serializer.fromJson<DateTime?>(json['lastSaleAt']),
      lastPaymentAt: serializer.fromJson<DateTime?>(json['lastPaymentAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerCode': serializer.toJson<String?>(customerCode),
      'customerType': serializer.toJson<String>(customerType),
      'name': serializer.toJson<String>(name),
      'companyName': serializer.toJson<String?>(companyName),
      'contactPerson': serializer.toJson<String?>(contactPerson),
      'imagePath': serializer.toJson<String?>(imagePath),
      'phone': serializer.toJson<String?>(phone),
      'secondaryPhone': serializer.toJson<String?>(secondaryPhone),
      'whatsapp': serializer.toJson<String?>(whatsapp),
      'email': serializer.toJson<String?>(email),
      'website': serializer.toJson<String?>(website),
      'nationalId': serializer.toJson<String?>(nationalId),
      'taxNumber': serializer.toJson<String?>(taxNumber),
      'commercialRegister': serializer.toJson<String?>(commercialRegister),
      'address': serializer.toJson<String?>(address),
      'country': serializer.toJson<String?>(country),
      'city': serializer.toJson<String?>(city),
      'region': serializer.toJson<String?>(region),
      'street': serializer.toJson<String?>(street),
      'buildingNumber': serializer.toJson<String?>(buildingNumber),
      'postalCode': serializer.toJson<String?>(postalCode),
      'billingAddress': serializer.toJson<String?>(billingAddress),
      'shippingAddress': serializer.toJson<String?>(shippingAddress),
      'customerCategory': serializer.toJson<String>(customerCategory),
      'priceLevel': serializer.toJson<String>(priceLevel),
      'allowCredit': serializer.toJson<bool>(allowCredit),
      'creditLimit': serializer.toJson<double>(creditLimit),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'currentBalance': serializer.toJson<double>(currentBalance),
      'paymentTermsDays': serializer.toJson<int>(paymentTermsDays),
      'defaultDiscount': serializer.toJson<double>(defaultDiscount),
      'preferredPaymentMethod':
          serializer.toJson<String>(preferredPaymentMethod),
      'loyaltyPoints': serializer.toJson<int>(loyaltyPoints),
      'lastSaleAt': serializer.toJson<DateTime?>(lastSaleAt),
      'lastPaymentAt': serializer.toJson<DateTime?>(lastPaymentAt),
      'isActive': serializer.toJson<bool>(isActive),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CustomerDb copyWith(
          {int? id,
          Value<String?> customerCode = const Value.absent(),
          String? customerType,
          String? name,
          Value<String?> companyName = const Value.absent(),
          Value<String?> contactPerson = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> secondaryPhone = const Value.absent(),
          Value<String?> whatsapp = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> website = const Value.absent(),
          Value<String?> nationalId = const Value.absent(),
          Value<String?> taxNumber = const Value.absent(),
          Value<String?> commercialRegister = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> country = const Value.absent(),
          Value<String?> city = const Value.absent(),
          Value<String?> region = const Value.absent(),
          Value<String?> street = const Value.absent(),
          Value<String?> buildingNumber = const Value.absent(),
          Value<String?> postalCode = const Value.absent(),
          Value<String?> billingAddress = const Value.absent(),
          Value<String?> shippingAddress = const Value.absent(),
          String? customerCategory,
          String? priceLevel,
          bool? allowCredit,
          double? creditLimit,
          double? openingBalance,
          double? currentBalance,
          int? paymentTermsDays,
          double? defaultDiscount,
          String? preferredPaymentMethod,
          int? loyaltyPoints,
          Value<DateTime?> lastSaleAt = const Value.absent(),
          Value<DateTime?> lastPaymentAt = const Value.absent(),
          bool? isActive,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CustomerDb(
        id: id ?? this.id,
        customerCode:
            customerCode.present ? customerCode.value : this.customerCode,
        customerType: customerType ?? this.customerType,
        name: name ?? this.name,
        companyName: companyName.present ? companyName.value : this.companyName,
        contactPerson:
            contactPerson.present ? contactPerson.value : this.contactPerson,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        phone: phone.present ? phone.value : this.phone,
        secondaryPhone:
            secondaryPhone.present ? secondaryPhone.value : this.secondaryPhone,
        whatsapp: whatsapp.present ? whatsapp.value : this.whatsapp,
        email: email.present ? email.value : this.email,
        website: website.present ? website.value : this.website,
        nationalId: nationalId.present ? nationalId.value : this.nationalId,
        taxNumber: taxNumber.present ? taxNumber.value : this.taxNumber,
        commercialRegister: commercialRegister.present
            ? commercialRegister.value
            : this.commercialRegister,
        address: address.present ? address.value : this.address,
        country: country.present ? country.value : this.country,
        city: city.present ? city.value : this.city,
        region: region.present ? region.value : this.region,
        street: street.present ? street.value : this.street,
        buildingNumber:
            buildingNumber.present ? buildingNumber.value : this.buildingNumber,
        postalCode: postalCode.present ? postalCode.value : this.postalCode,
        billingAddress:
            billingAddress.present ? billingAddress.value : this.billingAddress,
        shippingAddress: shippingAddress.present
            ? shippingAddress.value
            : this.shippingAddress,
        customerCategory: customerCategory ?? this.customerCategory,
        priceLevel: priceLevel ?? this.priceLevel,
        allowCredit: allowCredit ?? this.allowCredit,
        creditLimit: creditLimit ?? this.creditLimit,
        openingBalance: openingBalance ?? this.openingBalance,
        currentBalance: currentBalance ?? this.currentBalance,
        paymentTermsDays: paymentTermsDays ?? this.paymentTermsDays,
        defaultDiscount: defaultDiscount ?? this.defaultDiscount,
        preferredPaymentMethod:
            preferredPaymentMethod ?? this.preferredPaymentMethod,
        loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
        lastSaleAt: lastSaleAt.present ? lastSaleAt.value : this.lastSaleAt,
        lastPaymentAt:
            lastPaymentAt.present ? lastPaymentAt.value : this.lastPaymentAt,
        isActive: isActive ?? this.isActive,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CustomerDb copyWithCompanion(CustomersCompanion data) {
    return CustomerDb(
      id: data.id.present ? data.id.value : this.id,
      customerCode: data.customerCode.present
          ? data.customerCode.value
          : this.customerCode,
      customerType: data.customerType.present
          ? data.customerType.value
          : this.customerType,
      name: data.name.present ? data.name.value : this.name,
      companyName:
          data.companyName.present ? data.companyName.value : this.companyName,
      contactPerson: data.contactPerson.present
          ? data.contactPerson.value
          : this.contactPerson,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      phone: data.phone.present ? data.phone.value : this.phone,
      secondaryPhone: data.secondaryPhone.present
          ? data.secondaryPhone.value
          : this.secondaryPhone,
      whatsapp: data.whatsapp.present ? data.whatsapp.value : this.whatsapp,
      email: data.email.present ? data.email.value : this.email,
      website: data.website.present ? data.website.value : this.website,
      nationalId:
          data.nationalId.present ? data.nationalId.value : this.nationalId,
      taxNumber: data.taxNumber.present ? data.taxNumber.value : this.taxNumber,
      commercialRegister: data.commercialRegister.present
          ? data.commercialRegister.value
          : this.commercialRegister,
      address: data.address.present ? data.address.value : this.address,
      country: data.country.present ? data.country.value : this.country,
      city: data.city.present ? data.city.value : this.city,
      region: data.region.present ? data.region.value : this.region,
      street: data.street.present ? data.street.value : this.street,
      buildingNumber: data.buildingNumber.present
          ? data.buildingNumber.value
          : this.buildingNumber,
      postalCode:
          data.postalCode.present ? data.postalCode.value : this.postalCode,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      shippingAddress: data.shippingAddress.present
          ? data.shippingAddress.value
          : this.shippingAddress,
      customerCategory: data.customerCategory.present
          ? data.customerCategory.value
          : this.customerCategory,
      priceLevel:
          data.priceLevel.present ? data.priceLevel.value : this.priceLevel,
      allowCredit:
          data.allowCredit.present ? data.allowCredit.value : this.allowCredit,
      creditLimit:
          data.creditLimit.present ? data.creditLimit.value : this.creditLimit,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      currentBalance: data.currentBalance.present
          ? data.currentBalance.value
          : this.currentBalance,
      paymentTermsDays: data.paymentTermsDays.present
          ? data.paymentTermsDays.value
          : this.paymentTermsDays,
      defaultDiscount: data.defaultDiscount.present
          ? data.defaultDiscount.value
          : this.defaultDiscount,
      preferredPaymentMethod: data.preferredPaymentMethod.present
          ? data.preferredPaymentMethod.value
          : this.preferredPaymentMethod,
      loyaltyPoints: data.loyaltyPoints.present
          ? data.loyaltyPoints.value
          : this.loyaltyPoints,
      lastSaleAt:
          data.lastSaleAt.present ? data.lastSaleAt.value : this.lastSaleAt,
      lastPaymentAt: data.lastPaymentAt.present
          ? data.lastPaymentAt.value
          : this.lastPaymentAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerDb(')
          ..write('id: $id, ')
          ..write('customerCode: $customerCode, ')
          ..write('customerType: $customerType, ')
          ..write('name: $name, ')
          ..write('companyName: $companyName, ')
          ..write('contactPerson: $contactPerson, ')
          ..write('imagePath: $imagePath, ')
          ..write('phone: $phone, ')
          ..write('secondaryPhone: $secondaryPhone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('nationalId: $nationalId, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('commercialRegister: $commercialRegister, ')
          ..write('address: $address, ')
          ..write('country: $country, ')
          ..write('city: $city, ')
          ..write('region: $region, ')
          ..write('street: $street, ')
          ..write('buildingNumber: $buildingNumber, ')
          ..write('postalCode: $postalCode, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('customerCategory: $customerCategory, ')
          ..write('priceLevel: $priceLevel, ')
          ..write('allowCredit: $allowCredit, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('paymentTermsDays: $paymentTermsDays, ')
          ..write('defaultDiscount: $defaultDiscount, ')
          ..write('preferredPaymentMethod: $preferredPaymentMethod, ')
          ..write('loyaltyPoints: $loyaltyPoints, ')
          ..write('lastSaleAt: $lastSaleAt, ')
          ..write('lastPaymentAt: $lastPaymentAt, ')
          ..write('isActive: $isActive, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        customerCode,
        customerType,
        name,
        companyName,
        contactPerson,
        imagePath,
        phone,
        secondaryPhone,
        whatsapp,
        email,
        website,
        nationalId,
        taxNumber,
        commercialRegister,
        address,
        country,
        city,
        region,
        street,
        buildingNumber,
        postalCode,
        billingAddress,
        shippingAddress,
        customerCategory,
        priceLevel,
        allowCredit,
        creditLimit,
        openingBalance,
        currentBalance,
        paymentTermsDays,
        defaultDiscount,
        preferredPaymentMethod,
        loyaltyPoints,
        lastSaleAt,
        lastPaymentAt,
        isActive,
        notes,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerDb &&
          other.id == this.id &&
          other.customerCode == this.customerCode &&
          other.customerType == this.customerType &&
          other.name == this.name &&
          other.companyName == this.companyName &&
          other.contactPerson == this.contactPerson &&
          other.imagePath == this.imagePath &&
          other.phone == this.phone &&
          other.secondaryPhone == this.secondaryPhone &&
          other.whatsapp == this.whatsapp &&
          other.email == this.email &&
          other.website == this.website &&
          other.nationalId == this.nationalId &&
          other.taxNumber == this.taxNumber &&
          other.commercialRegister == this.commercialRegister &&
          other.address == this.address &&
          other.country == this.country &&
          other.city == this.city &&
          other.region == this.region &&
          other.street == this.street &&
          other.buildingNumber == this.buildingNumber &&
          other.postalCode == this.postalCode &&
          other.billingAddress == this.billingAddress &&
          other.shippingAddress == this.shippingAddress &&
          other.customerCategory == this.customerCategory &&
          other.priceLevel == this.priceLevel &&
          other.allowCredit == this.allowCredit &&
          other.creditLimit == this.creditLimit &&
          other.openingBalance == this.openingBalance &&
          other.currentBalance == this.currentBalance &&
          other.paymentTermsDays == this.paymentTermsDays &&
          other.defaultDiscount == this.defaultDiscount &&
          other.preferredPaymentMethod == this.preferredPaymentMethod &&
          other.loyaltyPoints == this.loyaltyPoints &&
          other.lastSaleAt == this.lastSaleAt &&
          other.lastPaymentAt == this.lastPaymentAt &&
          other.isActive == this.isActive &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CustomersCompanion extends UpdateCompanion<CustomerDb> {
  final Value<int> id;
  final Value<String?> customerCode;
  final Value<String> customerType;
  final Value<String> name;
  final Value<String?> companyName;
  final Value<String?> contactPerson;
  final Value<String?> imagePath;
  final Value<String?> phone;
  final Value<String?> secondaryPhone;
  final Value<String?> whatsapp;
  final Value<String?> email;
  final Value<String?> website;
  final Value<String?> nationalId;
  final Value<String?> taxNumber;
  final Value<String?> commercialRegister;
  final Value<String?> address;
  final Value<String?> country;
  final Value<String?> city;
  final Value<String?> region;
  final Value<String?> street;
  final Value<String?> buildingNumber;
  final Value<String?> postalCode;
  final Value<String?> billingAddress;
  final Value<String?> shippingAddress;
  final Value<String> customerCategory;
  final Value<String> priceLevel;
  final Value<bool> allowCredit;
  final Value<double> creditLimit;
  final Value<double> openingBalance;
  final Value<double> currentBalance;
  final Value<int> paymentTermsDays;
  final Value<double> defaultDiscount;
  final Value<String> preferredPaymentMethod;
  final Value<int> loyaltyPoints;
  final Value<DateTime?> lastSaleAt;
  final Value<DateTime?> lastPaymentAt;
  final Value<bool> isActive;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.customerCode = const Value.absent(),
    this.customerType = const Value.absent(),
    this.name = const Value.absent(),
    this.companyName = const Value.absent(),
    this.contactPerson = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.phone = const Value.absent(),
    this.secondaryPhone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.commercialRegister = const Value.absent(),
    this.address = const Value.absent(),
    this.country = const Value.absent(),
    this.city = const Value.absent(),
    this.region = const Value.absent(),
    this.street = const Value.absent(),
    this.buildingNumber = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.shippingAddress = const Value.absent(),
    this.customerCategory = const Value.absent(),
    this.priceLevel = const Value.absent(),
    this.allowCredit = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.paymentTermsDays = const Value.absent(),
    this.defaultDiscount = const Value.absent(),
    this.preferredPaymentMethod = const Value.absent(),
    this.loyaltyPoints = const Value.absent(),
    this.lastSaleAt = const Value.absent(),
    this.lastPaymentAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    this.customerCode = const Value.absent(),
    this.customerType = const Value.absent(),
    required String name,
    this.companyName = const Value.absent(),
    this.contactPerson = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.phone = const Value.absent(),
    this.secondaryPhone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.commercialRegister = const Value.absent(),
    this.address = const Value.absent(),
    this.country = const Value.absent(),
    this.city = const Value.absent(),
    this.region = const Value.absent(),
    this.street = const Value.absent(),
    this.buildingNumber = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.shippingAddress = const Value.absent(),
    this.customerCategory = const Value.absent(),
    this.priceLevel = const Value.absent(),
    this.allowCredit = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.paymentTermsDays = const Value.absent(),
    this.defaultDiscount = const Value.absent(),
    this.preferredPaymentMethod = const Value.absent(),
    this.loyaltyPoints = const Value.absent(),
    this.lastSaleAt = const Value.absent(),
    this.lastPaymentAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CustomerDb> custom({
    Expression<int>? id,
    Expression<String>? customerCode,
    Expression<String>? customerType,
    Expression<String>? name,
    Expression<String>? companyName,
    Expression<String>? contactPerson,
    Expression<String>? imagePath,
    Expression<String>? phone,
    Expression<String>? secondaryPhone,
    Expression<String>? whatsapp,
    Expression<String>? email,
    Expression<String>? website,
    Expression<String>? nationalId,
    Expression<String>? taxNumber,
    Expression<String>? commercialRegister,
    Expression<String>? address,
    Expression<String>? country,
    Expression<String>? city,
    Expression<String>? region,
    Expression<String>? street,
    Expression<String>? buildingNumber,
    Expression<String>? postalCode,
    Expression<String>? billingAddress,
    Expression<String>? shippingAddress,
    Expression<String>? customerCategory,
    Expression<String>? priceLevel,
    Expression<bool>? allowCredit,
    Expression<double>? creditLimit,
    Expression<double>? openingBalance,
    Expression<double>? currentBalance,
    Expression<int>? paymentTermsDays,
    Expression<double>? defaultDiscount,
    Expression<String>? preferredPaymentMethod,
    Expression<int>? loyaltyPoints,
    Expression<DateTime>? lastSaleAt,
    Expression<DateTime>? lastPaymentAt,
    Expression<bool>? isActive,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerCode != null) 'customer_code': customerCode,
      if (customerType != null) 'customer_type': customerType,
      if (name != null) 'name': name,
      if (companyName != null) 'company_name': companyName,
      if (contactPerson != null) 'contact_person': contactPerson,
      if (imagePath != null) 'image_path': imagePath,
      if (phone != null) 'phone': phone,
      if (secondaryPhone != null) 'secondary_phone': secondaryPhone,
      if (whatsapp != null) 'whatsapp': whatsapp,
      if (email != null) 'email': email,
      if (website != null) 'website': website,
      if (nationalId != null) 'national_id': nationalId,
      if (taxNumber != null) 'tax_number': taxNumber,
      if (commercialRegister != null) 'commercial_register': commercialRegister,
      if (address != null) 'address': address,
      if (country != null) 'country': country,
      if (city != null) 'city': city,
      if (region != null) 'region': region,
      if (street != null) 'street': street,
      if (buildingNumber != null) 'building_number': buildingNumber,
      if (postalCode != null) 'postal_code': postalCode,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (shippingAddress != null) 'shipping_address': shippingAddress,
      if (customerCategory != null) 'customer_category': customerCategory,
      if (priceLevel != null) 'price_level': priceLevel,
      if (allowCredit != null) 'allow_credit': allowCredit,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (currentBalance != null) 'current_balance': currentBalance,
      if (paymentTermsDays != null) 'payment_terms_days': paymentTermsDays,
      if (defaultDiscount != null) 'default_discount': defaultDiscount,
      if (preferredPaymentMethod != null)
        'preferred_payment_method': preferredPaymentMethod,
      if (loyaltyPoints != null) 'loyalty_points': loyaltyPoints,
      if (lastSaleAt != null) 'last_sale_at': lastSaleAt,
      if (lastPaymentAt != null) 'last_payment_at': lastPaymentAt,
      if (isActive != null) 'is_active': isActive,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CustomersCompanion copyWith(
      {Value<int>? id,
      Value<String?>? customerCode,
      Value<String>? customerType,
      Value<String>? name,
      Value<String?>? companyName,
      Value<String?>? contactPerson,
      Value<String?>? imagePath,
      Value<String?>? phone,
      Value<String?>? secondaryPhone,
      Value<String?>? whatsapp,
      Value<String?>? email,
      Value<String?>? website,
      Value<String?>? nationalId,
      Value<String?>? taxNumber,
      Value<String?>? commercialRegister,
      Value<String?>? address,
      Value<String?>? country,
      Value<String?>? city,
      Value<String?>? region,
      Value<String?>? street,
      Value<String?>? buildingNumber,
      Value<String?>? postalCode,
      Value<String?>? billingAddress,
      Value<String?>? shippingAddress,
      Value<String>? customerCategory,
      Value<String>? priceLevel,
      Value<bool>? allowCredit,
      Value<double>? creditLimit,
      Value<double>? openingBalance,
      Value<double>? currentBalance,
      Value<int>? paymentTermsDays,
      Value<double>? defaultDiscount,
      Value<String>? preferredPaymentMethod,
      Value<int>? loyaltyPoints,
      Value<DateTime?>? lastSaleAt,
      Value<DateTime?>? lastPaymentAt,
      Value<bool>? isActive,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return CustomersCompanion(
      id: id ?? this.id,
      customerCode: customerCode ?? this.customerCode,
      customerType: customerType ?? this.customerType,
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      contactPerson: contactPerson ?? this.contactPerson,
      imagePath: imagePath ?? this.imagePath,
      phone: phone ?? this.phone,
      secondaryPhone: secondaryPhone ?? this.secondaryPhone,
      whatsapp: whatsapp ?? this.whatsapp,
      email: email ?? this.email,
      website: website ?? this.website,
      nationalId: nationalId ?? this.nationalId,
      taxNumber: taxNumber ?? this.taxNumber,
      commercialRegister: commercialRegister ?? this.commercialRegister,
      address: address ?? this.address,
      country: country ?? this.country,
      city: city ?? this.city,
      region: region ?? this.region,
      street: street ?? this.street,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      postalCode: postalCode ?? this.postalCode,
      billingAddress: billingAddress ?? this.billingAddress,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      customerCategory: customerCategory ?? this.customerCategory,
      priceLevel: priceLevel ?? this.priceLevel,
      allowCredit: allowCredit ?? this.allowCredit,
      creditLimit: creditLimit ?? this.creditLimit,
      openingBalance: openingBalance ?? this.openingBalance,
      currentBalance: currentBalance ?? this.currentBalance,
      paymentTermsDays: paymentTermsDays ?? this.paymentTermsDays,
      defaultDiscount: defaultDiscount ?? this.defaultDiscount,
      preferredPaymentMethod:
          preferredPaymentMethod ?? this.preferredPaymentMethod,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      lastSaleAt: lastSaleAt ?? this.lastSaleAt,
      lastPaymentAt: lastPaymentAt ?? this.lastPaymentAt,
      isActive: isActive ?? this.isActive,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerCode.present) {
      map['customer_code'] = Variable<String>(customerCode.value);
    }
    if (customerType.present) {
      map['customer_type'] = Variable<String>(customerType.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (contactPerson.present) {
      map['contact_person'] = Variable<String>(contactPerson.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (secondaryPhone.present) {
      map['secondary_phone'] = Variable<String>(secondaryPhone.value);
    }
    if (whatsapp.present) {
      map['whatsapp'] = Variable<String>(whatsapp.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (nationalId.present) {
      map['national_id'] = Variable<String>(nationalId.value);
    }
    if (taxNumber.present) {
      map['tax_number'] = Variable<String>(taxNumber.value);
    }
    if (commercialRegister.present) {
      map['commercial_register'] = Variable<String>(commercialRegister.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (buildingNumber.present) {
      map['building_number'] = Variable<String>(buildingNumber.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = Variable<String>(billingAddress.value);
    }
    if (shippingAddress.present) {
      map['shipping_address'] = Variable<String>(shippingAddress.value);
    }
    if (customerCategory.present) {
      map['customer_category'] = Variable<String>(customerCategory.value);
    }
    if (priceLevel.present) {
      map['price_level'] = Variable<String>(priceLevel.value);
    }
    if (allowCredit.present) {
      map['allow_credit'] = Variable<bool>(allowCredit.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<double>(creditLimit.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (currentBalance.present) {
      map['current_balance'] = Variable<double>(currentBalance.value);
    }
    if (paymentTermsDays.present) {
      map['payment_terms_days'] = Variable<int>(paymentTermsDays.value);
    }
    if (defaultDiscount.present) {
      map['default_discount'] = Variable<double>(defaultDiscount.value);
    }
    if (preferredPaymentMethod.present) {
      map['preferred_payment_method'] =
          Variable<String>(preferredPaymentMethod.value);
    }
    if (loyaltyPoints.present) {
      map['loyalty_points'] = Variable<int>(loyaltyPoints.value);
    }
    if (lastSaleAt.present) {
      map['last_sale_at'] = Variable<DateTime>(lastSaleAt.value);
    }
    if (lastPaymentAt.present) {
      map['last_payment_at'] = Variable<DateTime>(lastPaymentAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('customerCode: $customerCode, ')
          ..write('customerType: $customerType, ')
          ..write('name: $name, ')
          ..write('companyName: $companyName, ')
          ..write('contactPerson: $contactPerson, ')
          ..write('imagePath: $imagePath, ')
          ..write('phone: $phone, ')
          ..write('secondaryPhone: $secondaryPhone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('nationalId: $nationalId, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('commercialRegister: $commercialRegister, ')
          ..write('address: $address, ')
          ..write('country: $country, ')
          ..write('city: $city, ')
          ..write('region: $region, ')
          ..write('street: $street, ')
          ..write('buildingNumber: $buildingNumber, ')
          ..write('postalCode: $postalCode, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('customerCategory: $customerCategory, ')
          ..write('priceLevel: $priceLevel, ')
          ..write('allowCredit: $allowCredit, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('paymentTermsDays: $paymentTermsDays, ')
          ..write('defaultDiscount: $defaultDiscount, ')
          ..write('preferredPaymentMethod: $preferredPaymentMethod, ')
          ..write('loyaltyPoints: $loyaltyPoints, ')
          ..write('lastSaleAt: $lastSaleAt, ')
          ..write('lastPaymentAt: $lastPaymentAt, ')
          ..write('isActive: $isActive, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, SupplierDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _supplierCodeMeta =
      const VerificationMeta('supplierCode');
  @override
  late final GeneratedColumn<String> supplierCode = GeneratedColumn<String>(
      'supplier_code', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _supplierTypeMeta =
      const VerificationMeta('supplierType');
  @override
  late final GeneratedColumn<String> supplierType = GeneratedColumn<String>(
      'supplier_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('company'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _contactPersonMeta =
      const VerificationMeta('contactPerson');
  @override
  late final GeneratedColumn<String> contactPerson = GeneratedColumn<String>(
      'contact_person', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _secondaryPhoneMeta =
      const VerificationMeta('secondaryPhone');
  @override
  late final GeneratedColumn<String> secondaryPhone = GeneratedColumn<String>(
      'secondary_phone', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _whatsappMeta =
      const VerificationMeta('whatsapp');
  @override
  late final GeneratedColumn<String> whatsapp = GeneratedColumn<String>(
      'whatsapp', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _nationalIdMeta =
      const VerificationMeta('nationalId');
  @override
  late final GeneratedColumn<String> nationalId = GeneratedColumn<String>(
      'national_id', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _taxNumberMeta =
      const VerificationMeta('taxNumber');
  @override
  late final GeneratedColumn<String> taxNumber = GeneratedColumn<String>(
      'tax_number', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _commercialRegisterMeta =
      const VerificationMeta('commercialRegister');
  @override
  late final GeneratedColumn<String> commercialRegister =
      GeneratedColumn<String>('commercial_register', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
      'region', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _buildingNumberMeta =
      const VerificationMeta('buildingNumber');
  @override
  late final GeneratedColumn<String> buildingNumber = GeneratedColumn<String>(
      'building_number', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
      'postal_code', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _billingAddressMeta =
      const VerificationMeta('billingAddress');
  @override
  late final GeneratedColumn<String> billingAddress = GeneratedColumn<String>(
      'billing_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _shippingAddressMeta =
      const VerificationMeta('shippingAddress');
  @override
  late final GeneratedColumn<String> shippingAddress = GeneratedColumn<String>(
      'shipping_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _supplierCategoryMeta =
      const VerificationMeta('supplierCategory');
  @override
  late final GeneratedColumn<String> supplierCategory = GeneratedColumn<String>(
      'supplier_category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('wholesaler'));
  static const VerificationMeta _supplierLevelMeta =
      const VerificationMeta('supplierLevel');
  @override
  late final GeneratedColumn<String> supplierLevel = GeneratedColumn<String>(
      'supplier_level', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('normal'));
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _isPreferredMeta =
      const VerificationMeta('isPreferred');
  @override
  late final GeneratedColumn<bool> isPreferred = GeneratedColumn<bool>(
      'is_preferred', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_preferred" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _allowCreditMeta =
      const VerificationMeta('allowCredit');
  @override
  late final GeneratedColumn<bool> allowCredit = GeneratedColumn<bool>(
      'allow_credit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("allow_credit" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _creditLimitMeta =
      const VerificationMeta('creditLimit');
  @override
  late final GeneratedColumn<double> creditLimit = GeneratedColumn<double>(
      'credit_limit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _currentBalanceMeta =
      const VerificationMeta('currentBalance');
  @override
  late final GeneratedColumn<double> currentBalance = GeneratedColumn<double>(
      'current_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _paymentTermsDaysMeta =
      const VerificationMeta('paymentTermsDays');
  @override
  late final GeneratedColumn<int> paymentTermsDays = GeneratedColumn<int>(
      'payment_terms_days', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _preferredPaymentMethodMeta =
      const VerificationMeta('preferredPaymentMethod');
  @override
  late final GeneratedColumn<String> preferredPaymentMethod =
      GeneratedColumn<String>('preferred_payment_method', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('bank_transfer'));
  static const VerificationMeta _bankNameMeta =
      const VerificationMeta('bankName');
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
      'bank_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bankBranchMeta =
      const VerificationMeta('bankBranch');
  @override
  late final GeneratedColumn<String> bankBranch = GeneratedColumn<String>(
      'bank_branch', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bankAccountNameMeta =
      const VerificationMeta('bankAccountName');
  @override
  late final GeneratedColumn<String> bankAccountName = GeneratedColumn<String>(
      'bank_account_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bankAccountNumberMeta =
      const VerificationMeta('bankAccountNumber');
  @override
  late final GeneratedColumn<String> bankAccountNumber =
      GeneratedColumn<String>('bank_account_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ibanMeta = const VerificationMeta('iban');
  @override
  late final GeneratedColumn<String> iban = GeneratedColumn<String>(
      'iban', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _swiftCodeMeta =
      const VerificationMeta('swiftCode');
  @override
  late final GeneratedColumn<String> swiftCode = GeneratedColumn<String>(
      'swift_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastPurchaseAtMeta =
      const VerificationMeta('lastPurchaseAt');
  @override
  late final GeneratedColumn<DateTime> lastPurchaseAt =
      GeneratedColumn<DateTime>('last_purchase_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastPaymentAtMeta =
      const VerificationMeta('lastPaymentAt');
  @override
  late final GeneratedColumn<DateTime> lastPaymentAt =
      GeneratedColumn<DateTime>('last_payment_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        supplierCode,
        supplierType,
        name,
        companyName,
        contactPerson,
        imagePath,
        phone,
        secondaryPhone,
        whatsapp,
        email,
        website,
        nationalId,
        taxNumber,
        commercialRegister,
        address,
        country,
        city,
        region,
        street,
        buildingNumber,
        postalCode,
        billingAddress,
        shippingAddress,
        supplierCategory,
        supplierLevel,
        rating,
        isPreferred,
        allowCredit,
        creditLimit,
        openingBalance,
        currentBalance,
        paymentTermsDays,
        preferredPaymentMethod,
        bankName,
        bankBranch,
        bankAccountName,
        bankAccountNumber,
        iban,
        swiftCode,
        lastPurchaseAt,
        lastPaymentAt,
        isActive,
        notes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(Insertable<SupplierDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_code')) {
      context.handle(
          _supplierCodeMeta,
          supplierCode.isAcceptableOrUnknown(
              data['supplier_code']!, _supplierCodeMeta));
    }
    if (data.containsKey('supplier_type')) {
      context.handle(
          _supplierTypeMeta,
          supplierType.isAcceptableOrUnknown(
              data['supplier_type']!, _supplierTypeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    }
    if (data.containsKey('contact_person')) {
      context.handle(
          _contactPersonMeta,
          contactPerson.isAcceptableOrUnknown(
              data['contact_person']!, _contactPersonMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('secondary_phone')) {
      context.handle(
          _secondaryPhoneMeta,
          secondaryPhone.isAcceptableOrUnknown(
              data['secondary_phone']!, _secondaryPhoneMeta));
    }
    if (data.containsKey('whatsapp')) {
      context.handle(_whatsappMeta,
          whatsapp.isAcceptableOrUnknown(data['whatsapp']!, _whatsappMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    }
    if (data.containsKey('national_id')) {
      context.handle(
          _nationalIdMeta,
          nationalId.isAcceptableOrUnknown(
              data['national_id']!, _nationalIdMeta));
    }
    if (data.containsKey('tax_number')) {
      context.handle(_taxNumberMeta,
          taxNumber.isAcceptableOrUnknown(data['tax_number']!, _taxNumberMeta));
    }
    if (data.containsKey('commercial_register')) {
      context.handle(
          _commercialRegisterMeta,
          commercialRegister.isAcceptableOrUnknown(
              data['commercial_register']!, _commercialRegisterMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region']!, _regionMeta));
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    }
    if (data.containsKey('building_number')) {
      context.handle(
          _buildingNumberMeta,
          buildingNumber.isAcceptableOrUnknown(
              data['building_number']!, _buildingNumberMeta));
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    }
    if (data.containsKey('billing_address')) {
      context.handle(
          _billingAddressMeta,
          billingAddress.isAcceptableOrUnknown(
              data['billing_address']!, _billingAddressMeta));
    }
    if (data.containsKey('shipping_address')) {
      context.handle(
          _shippingAddressMeta,
          shippingAddress.isAcceptableOrUnknown(
              data['shipping_address']!, _shippingAddressMeta));
    }
    if (data.containsKey('supplier_category')) {
      context.handle(
          _supplierCategoryMeta,
          supplierCategory.isAcceptableOrUnknown(
              data['supplier_category']!, _supplierCategoryMeta));
    }
    if (data.containsKey('supplier_level')) {
      context.handle(
          _supplierLevelMeta,
          supplierLevel.isAcceptableOrUnknown(
              data['supplier_level']!, _supplierLevelMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    if (data.containsKey('is_preferred')) {
      context.handle(
          _isPreferredMeta,
          isPreferred.isAcceptableOrUnknown(
              data['is_preferred']!, _isPreferredMeta));
    }
    if (data.containsKey('allow_credit')) {
      context.handle(
          _allowCreditMeta,
          allowCredit.isAcceptableOrUnknown(
              data['allow_credit']!, _allowCreditMeta));
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
          _creditLimitMeta,
          creditLimit.isAcceptableOrUnknown(
              data['credit_limit']!, _creditLimitMeta));
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    }
    if (data.containsKey('current_balance')) {
      context.handle(
          _currentBalanceMeta,
          currentBalance.isAcceptableOrUnknown(
              data['current_balance']!, _currentBalanceMeta));
    }
    if (data.containsKey('payment_terms_days')) {
      context.handle(
          _paymentTermsDaysMeta,
          paymentTermsDays.isAcceptableOrUnknown(
              data['payment_terms_days']!, _paymentTermsDaysMeta));
    }
    if (data.containsKey('preferred_payment_method')) {
      context.handle(
          _preferredPaymentMethodMeta,
          preferredPaymentMethod.isAcceptableOrUnknown(
              data['preferred_payment_method']!, _preferredPaymentMethodMeta));
    }
    if (data.containsKey('bank_name')) {
      context.handle(_bankNameMeta,
          bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta));
    }
    if (data.containsKey('bank_branch')) {
      context.handle(
          _bankBranchMeta,
          bankBranch.isAcceptableOrUnknown(
              data['bank_branch']!, _bankBranchMeta));
    }
    if (data.containsKey('bank_account_name')) {
      context.handle(
          _bankAccountNameMeta,
          bankAccountName.isAcceptableOrUnknown(
              data['bank_account_name']!, _bankAccountNameMeta));
    }
    if (data.containsKey('bank_account_number')) {
      context.handle(
          _bankAccountNumberMeta,
          bankAccountNumber.isAcceptableOrUnknown(
              data['bank_account_number']!, _bankAccountNumberMeta));
    }
    if (data.containsKey('iban')) {
      context.handle(
          _ibanMeta, iban.isAcceptableOrUnknown(data['iban']!, _ibanMeta));
    }
    if (data.containsKey('swift_code')) {
      context.handle(_swiftCodeMeta,
          swiftCode.isAcceptableOrUnknown(data['swift_code']!, _swiftCodeMeta));
    }
    if (data.containsKey('last_purchase_at')) {
      context.handle(
          _lastPurchaseAtMeta,
          lastPurchaseAt.isAcceptableOrUnknown(
              data['last_purchase_at']!, _lastPurchaseAtMeta));
    }
    if (data.containsKey('last_payment_at')) {
      context.handle(
          _lastPaymentAtMeta,
          lastPaymentAt.isAcceptableOrUnknown(
              data['last_payment_at']!, _lastPaymentAtMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      supplierCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier_code']),
      supplierType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier_type'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name']),
      contactPerson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_person']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      secondaryPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}secondary_phone']),
      whatsapp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}whatsapp']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website']),
      nationalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}national_id']),
      taxNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tax_number']),
      commercialRegister: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}commercial_register']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      region: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}region']),
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street']),
      buildingNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}building_number']),
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal_code']),
      billingAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_address']),
      shippingAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}shipping_address']),
      supplierCategory: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}supplier_category'])!,
      supplierLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier_level'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
      isPreferred: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_preferred'])!,
      allowCredit: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}allow_credit'])!,
      creditLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}credit_limit'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}opening_balance'])!,
      currentBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}current_balance'])!,
      paymentTermsDays: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}payment_terms_days'])!,
      preferredPaymentMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}preferred_payment_method'])!,
      bankName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_name']),
      bankBranch: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_branch']),
      bankAccountName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}bank_account_name']),
      bankAccountNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}bank_account_number']),
      iban: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}iban']),
      swiftCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}swift_code']),
      lastPurchaseAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_purchase_at']),
      lastPaymentAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_payment_at']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class SupplierDb extends DataClass implements Insertable<SupplierDb> {
  final int id;
  final String? supplierCode;
  final String supplierType;
  final String name;
  final String? companyName;
  final String? contactPerson;
  final String? imagePath;
  final String? phone;
  final String? secondaryPhone;
  final String? whatsapp;
  final String? email;
  final String? website;
  final String? nationalId;
  final String? taxNumber;
  final String? commercialRegister;
  final String? address;
  final String? country;
  final String? city;
  final String? region;
  final String? street;
  final String? buildingNumber;
  final String? postalCode;
  final String? billingAddress;
  final String? shippingAddress;
  final String supplierCategory;
  final String supplierLevel;
  final double rating;
  final bool isPreferred;
  final bool allowCredit;
  final double creditLimit;
  final double openingBalance;
  final double currentBalance;
  final int paymentTermsDays;
  final String preferredPaymentMethod;
  final String? bankName;
  final String? bankBranch;
  final String? bankAccountName;
  final String? bankAccountNumber;
  final String? iban;
  final String? swiftCode;
  final DateTime? lastPurchaseAt;
  final DateTime? lastPaymentAt;
  final bool isActive;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SupplierDb(
      {required this.id,
      this.supplierCode,
      required this.supplierType,
      required this.name,
      this.companyName,
      this.contactPerson,
      this.imagePath,
      this.phone,
      this.secondaryPhone,
      this.whatsapp,
      this.email,
      this.website,
      this.nationalId,
      this.taxNumber,
      this.commercialRegister,
      this.address,
      this.country,
      this.city,
      this.region,
      this.street,
      this.buildingNumber,
      this.postalCode,
      this.billingAddress,
      this.shippingAddress,
      required this.supplierCategory,
      required this.supplierLevel,
      required this.rating,
      required this.isPreferred,
      required this.allowCredit,
      required this.creditLimit,
      required this.openingBalance,
      required this.currentBalance,
      required this.paymentTermsDays,
      required this.preferredPaymentMethod,
      this.bankName,
      this.bankBranch,
      this.bankAccountName,
      this.bankAccountNumber,
      this.iban,
      this.swiftCode,
      this.lastPurchaseAt,
      this.lastPaymentAt,
      required this.isActive,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || supplierCode != null) {
      map['supplier_code'] = Variable<String>(supplierCode);
    }
    map['supplier_type'] = Variable<String>(supplierType);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || contactPerson != null) {
      map['contact_person'] = Variable<String>(contactPerson);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || secondaryPhone != null) {
      map['secondary_phone'] = Variable<String>(secondaryPhone);
    }
    if (!nullToAbsent || whatsapp != null) {
      map['whatsapp'] = Variable<String>(whatsapp);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || nationalId != null) {
      map['national_id'] = Variable<String>(nationalId);
    }
    if (!nullToAbsent || taxNumber != null) {
      map['tax_number'] = Variable<String>(taxNumber);
    }
    if (!nullToAbsent || commercialRegister != null) {
      map['commercial_register'] = Variable<String>(commercialRegister);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || region != null) {
      map['region'] = Variable<String>(region);
    }
    if (!nullToAbsent || street != null) {
      map['street'] = Variable<String>(street);
    }
    if (!nullToAbsent || buildingNumber != null) {
      map['building_number'] = Variable<String>(buildingNumber);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || billingAddress != null) {
      map['billing_address'] = Variable<String>(billingAddress);
    }
    if (!nullToAbsent || shippingAddress != null) {
      map['shipping_address'] = Variable<String>(shippingAddress);
    }
    map['supplier_category'] = Variable<String>(supplierCategory);
    map['supplier_level'] = Variable<String>(supplierLevel);
    map['rating'] = Variable<double>(rating);
    map['is_preferred'] = Variable<bool>(isPreferred);
    map['allow_credit'] = Variable<bool>(allowCredit);
    map['credit_limit'] = Variable<double>(creditLimit);
    map['opening_balance'] = Variable<double>(openingBalance);
    map['current_balance'] = Variable<double>(currentBalance);
    map['payment_terms_days'] = Variable<int>(paymentTermsDays);
    map['preferred_payment_method'] = Variable<String>(preferredPaymentMethod);
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || bankBranch != null) {
      map['bank_branch'] = Variable<String>(bankBranch);
    }
    if (!nullToAbsent || bankAccountName != null) {
      map['bank_account_name'] = Variable<String>(bankAccountName);
    }
    if (!nullToAbsent || bankAccountNumber != null) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber);
    }
    if (!nullToAbsent || iban != null) {
      map['iban'] = Variable<String>(iban);
    }
    if (!nullToAbsent || swiftCode != null) {
      map['swift_code'] = Variable<String>(swiftCode);
    }
    if (!nullToAbsent || lastPurchaseAt != null) {
      map['last_purchase_at'] = Variable<DateTime>(lastPurchaseAt);
    }
    if (!nullToAbsent || lastPaymentAt != null) {
      map['last_payment_at'] = Variable<DateTime>(lastPaymentAt);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SuppliersCompanion toCompanion(bool nullToAbsent) {
    return SuppliersCompanion(
      id: Value(id),
      supplierCode: supplierCode == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierCode),
      supplierType: Value(supplierType),
      name: Value(name),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      contactPerson: contactPerson == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPerson),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      secondaryPhone: secondaryPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryPhone),
      whatsapp: whatsapp == null && nullToAbsent
          ? const Value.absent()
          : Value(whatsapp),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      nationalId: nationalId == null && nullToAbsent
          ? const Value.absent()
          : Value(nationalId),
      taxNumber: taxNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(taxNumber),
      commercialRegister: commercialRegister == null && nullToAbsent
          ? const Value.absent()
          : Value(commercialRegister),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      region:
          region == null && nullToAbsent ? const Value.absent() : Value(region),
      street:
          street == null && nullToAbsent ? const Value.absent() : Value(street),
      buildingNumber: buildingNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(buildingNumber),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      billingAddress: billingAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(billingAddress),
      shippingAddress: shippingAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingAddress),
      supplierCategory: Value(supplierCategory),
      supplierLevel: Value(supplierLevel),
      rating: Value(rating),
      isPreferred: Value(isPreferred),
      allowCredit: Value(allowCredit),
      creditLimit: Value(creditLimit),
      openingBalance: Value(openingBalance),
      currentBalance: Value(currentBalance),
      paymentTermsDays: Value(paymentTermsDays),
      preferredPaymentMethod: Value(preferredPaymentMethod),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      bankBranch: bankBranch == null && nullToAbsent
          ? const Value.absent()
          : Value(bankBranch),
      bankAccountName: bankAccountName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccountName),
      bankAccountNumber: bankAccountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccountNumber),
      iban: iban == null && nullToAbsent ? const Value.absent() : Value(iban),
      swiftCode: swiftCode == null && nullToAbsent
          ? const Value.absent()
          : Value(swiftCode),
      lastPurchaseAt: lastPurchaseAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPurchaseAt),
      lastPaymentAt: lastPaymentAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPaymentAt),
      isActive: Value(isActive),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SupplierDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierDb(
      id: serializer.fromJson<int>(json['id']),
      supplierCode: serializer.fromJson<String?>(json['supplierCode']),
      supplierType: serializer.fromJson<String>(json['supplierType']),
      name: serializer.fromJson<String>(json['name']),
      companyName: serializer.fromJson<String?>(json['companyName']),
      contactPerson: serializer.fromJson<String?>(json['contactPerson']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      phone: serializer.fromJson<String?>(json['phone']),
      secondaryPhone: serializer.fromJson<String?>(json['secondaryPhone']),
      whatsapp: serializer.fromJson<String?>(json['whatsapp']),
      email: serializer.fromJson<String?>(json['email']),
      website: serializer.fromJson<String?>(json['website']),
      nationalId: serializer.fromJson<String?>(json['nationalId']),
      taxNumber: serializer.fromJson<String?>(json['taxNumber']),
      commercialRegister:
          serializer.fromJson<String?>(json['commercialRegister']),
      address: serializer.fromJson<String?>(json['address']),
      country: serializer.fromJson<String?>(json['country']),
      city: serializer.fromJson<String?>(json['city']),
      region: serializer.fromJson<String?>(json['region']),
      street: serializer.fromJson<String?>(json['street']),
      buildingNumber: serializer.fromJson<String?>(json['buildingNumber']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      billingAddress: serializer.fromJson<String?>(json['billingAddress']),
      shippingAddress: serializer.fromJson<String?>(json['shippingAddress']),
      supplierCategory: serializer.fromJson<String>(json['supplierCategory']),
      supplierLevel: serializer.fromJson<String>(json['supplierLevel']),
      rating: serializer.fromJson<double>(json['rating']),
      isPreferred: serializer.fromJson<bool>(json['isPreferred']),
      allowCredit: serializer.fromJson<bool>(json['allowCredit']),
      creditLimit: serializer.fromJson<double>(json['creditLimit']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      currentBalance: serializer.fromJson<double>(json['currentBalance']),
      paymentTermsDays: serializer.fromJson<int>(json['paymentTermsDays']),
      preferredPaymentMethod:
          serializer.fromJson<String>(json['preferredPaymentMethod']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      bankBranch: serializer.fromJson<String?>(json['bankBranch']),
      bankAccountName: serializer.fromJson<String?>(json['bankAccountName']),
      bankAccountNumber:
          serializer.fromJson<String?>(json['bankAccountNumber']),
      iban: serializer.fromJson<String?>(json['iban']),
      swiftCode: serializer.fromJson<String?>(json['swiftCode']),
      lastPurchaseAt: serializer.fromJson<DateTime?>(json['lastPurchaseAt']),
      lastPaymentAt: serializer.fromJson<DateTime?>(json['lastPaymentAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplierCode': serializer.toJson<String?>(supplierCode),
      'supplierType': serializer.toJson<String>(supplierType),
      'name': serializer.toJson<String>(name),
      'companyName': serializer.toJson<String?>(companyName),
      'contactPerson': serializer.toJson<String?>(contactPerson),
      'imagePath': serializer.toJson<String?>(imagePath),
      'phone': serializer.toJson<String?>(phone),
      'secondaryPhone': serializer.toJson<String?>(secondaryPhone),
      'whatsapp': serializer.toJson<String?>(whatsapp),
      'email': serializer.toJson<String?>(email),
      'website': serializer.toJson<String?>(website),
      'nationalId': serializer.toJson<String?>(nationalId),
      'taxNumber': serializer.toJson<String?>(taxNumber),
      'commercialRegister': serializer.toJson<String?>(commercialRegister),
      'address': serializer.toJson<String?>(address),
      'country': serializer.toJson<String?>(country),
      'city': serializer.toJson<String?>(city),
      'region': serializer.toJson<String?>(region),
      'street': serializer.toJson<String?>(street),
      'buildingNumber': serializer.toJson<String?>(buildingNumber),
      'postalCode': serializer.toJson<String?>(postalCode),
      'billingAddress': serializer.toJson<String?>(billingAddress),
      'shippingAddress': serializer.toJson<String?>(shippingAddress),
      'supplierCategory': serializer.toJson<String>(supplierCategory),
      'supplierLevel': serializer.toJson<String>(supplierLevel),
      'rating': serializer.toJson<double>(rating),
      'isPreferred': serializer.toJson<bool>(isPreferred),
      'allowCredit': serializer.toJson<bool>(allowCredit),
      'creditLimit': serializer.toJson<double>(creditLimit),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'currentBalance': serializer.toJson<double>(currentBalance),
      'paymentTermsDays': serializer.toJson<int>(paymentTermsDays),
      'preferredPaymentMethod':
          serializer.toJson<String>(preferredPaymentMethod),
      'bankName': serializer.toJson<String?>(bankName),
      'bankBranch': serializer.toJson<String?>(bankBranch),
      'bankAccountName': serializer.toJson<String?>(bankAccountName),
      'bankAccountNumber': serializer.toJson<String?>(bankAccountNumber),
      'iban': serializer.toJson<String?>(iban),
      'swiftCode': serializer.toJson<String?>(swiftCode),
      'lastPurchaseAt': serializer.toJson<DateTime?>(lastPurchaseAt),
      'lastPaymentAt': serializer.toJson<DateTime?>(lastPaymentAt),
      'isActive': serializer.toJson<bool>(isActive),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SupplierDb copyWith(
          {int? id,
          Value<String?> supplierCode = const Value.absent(),
          String? supplierType,
          String? name,
          Value<String?> companyName = const Value.absent(),
          Value<String?> contactPerson = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> secondaryPhone = const Value.absent(),
          Value<String?> whatsapp = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> website = const Value.absent(),
          Value<String?> nationalId = const Value.absent(),
          Value<String?> taxNumber = const Value.absent(),
          Value<String?> commercialRegister = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> country = const Value.absent(),
          Value<String?> city = const Value.absent(),
          Value<String?> region = const Value.absent(),
          Value<String?> street = const Value.absent(),
          Value<String?> buildingNumber = const Value.absent(),
          Value<String?> postalCode = const Value.absent(),
          Value<String?> billingAddress = const Value.absent(),
          Value<String?> shippingAddress = const Value.absent(),
          String? supplierCategory,
          String? supplierLevel,
          double? rating,
          bool? isPreferred,
          bool? allowCredit,
          double? creditLimit,
          double? openingBalance,
          double? currentBalance,
          int? paymentTermsDays,
          String? preferredPaymentMethod,
          Value<String?> bankName = const Value.absent(),
          Value<String?> bankBranch = const Value.absent(),
          Value<String?> bankAccountName = const Value.absent(),
          Value<String?> bankAccountNumber = const Value.absent(),
          Value<String?> iban = const Value.absent(),
          Value<String?> swiftCode = const Value.absent(),
          Value<DateTime?> lastPurchaseAt = const Value.absent(),
          Value<DateTime?> lastPaymentAt = const Value.absent(),
          bool? isActive,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      SupplierDb(
        id: id ?? this.id,
        supplierCode:
            supplierCode.present ? supplierCode.value : this.supplierCode,
        supplierType: supplierType ?? this.supplierType,
        name: name ?? this.name,
        companyName: companyName.present ? companyName.value : this.companyName,
        contactPerson:
            contactPerson.present ? contactPerson.value : this.contactPerson,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        phone: phone.present ? phone.value : this.phone,
        secondaryPhone:
            secondaryPhone.present ? secondaryPhone.value : this.secondaryPhone,
        whatsapp: whatsapp.present ? whatsapp.value : this.whatsapp,
        email: email.present ? email.value : this.email,
        website: website.present ? website.value : this.website,
        nationalId: nationalId.present ? nationalId.value : this.nationalId,
        taxNumber: taxNumber.present ? taxNumber.value : this.taxNumber,
        commercialRegister: commercialRegister.present
            ? commercialRegister.value
            : this.commercialRegister,
        address: address.present ? address.value : this.address,
        country: country.present ? country.value : this.country,
        city: city.present ? city.value : this.city,
        region: region.present ? region.value : this.region,
        street: street.present ? street.value : this.street,
        buildingNumber:
            buildingNumber.present ? buildingNumber.value : this.buildingNumber,
        postalCode: postalCode.present ? postalCode.value : this.postalCode,
        billingAddress:
            billingAddress.present ? billingAddress.value : this.billingAddress,
        shippingAddress: shippingAddress.present
            ? shippingAddress.value
            : this.shippingAddress,
        supplierCategory: supplierCategory ?? this.supplierCategory,
        supplierLevel: supplierLevel ?? this.supplierLevel,
        rating: rating ?? this.rating,
        isPreferred: isPreferred ?? this.isPreferred,
        allowCredit: allowCredit ?? this.allowCredit,
        creditLimit: creditLimit ?? this.creditLimit,
        openingBalance: openingBalance ?? this.openingBalance,
        currentBalance: currentBalance ?? this.currentBalance,
        paymentTermsDays: paymentTermsDays ?? this.paymentTermsDays,
        preferredPaymentMethod:
            preferredPaymentMethod ?? this.preferredPaymentMethod,
        bankName: bankName.present ? bankName.value : this.bankName,
        bankBranch: bankBranch.present ? bankBranch.value : this.bankBranch,
        bankAccountName: bankAccountName.present
            ? bankAccountName.value
            : this.bankAccountName,
        bankAccountNumber: bankAccountNumber.present
            ? bankAccountNumber.value
            : this.bankAccountNumber,
        iban: iban.present ? iban.value : this.iban,
        swiftCode: swiftCode.present ? swiftCode.value : this.swiftCode,
        lastPurchaseAt:
            lastPurchaseAt.present ? lastPurchaseAt.value : this.lastPurchaseAt,
        lastPaymentAt:
            lastPaymentAt.present ? lastPaymentAt.value : this.lastPaymentAt,
        isActive: isActive ?? this.isActive,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SupplierDb copyWithCompanion(SuppliersCompanion data) {
    return SupplierDb(
      id: data.id.present ? data.id.value : this.id,
      supplierCode: data.supplierCode.present
          ? data.supplierCode.value
          : this.supplierCode,
      supplierType: data.supplierType.present
          ? data.supplierType.value
          : this.supplierType,
      name: data.name.present ? data.name.value : this.name,
      companyName:
          data.companyName.present ? data.companyName.value : this.companyName,
      contactPerson: data.contactPerson.present
          ? data.contactPerson.value
          : this.contactPerson,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      phone: data.phone.present ? data.phone.value : this.phone,
      secondaryPhone: data.secondaryPhone.present
          ? data.secondaryPhone.value
          : this.secondaryPhone,
      whatsapp: data.whatsapp.present ? data.whatsapp.value : this.whatsapp,
      email: data.email.present ? data.email.value : this.email,
      website: data.website.present ? data.website.value : this.website,
      nationalId:
          data.nationalId.present ? data.nationalId.value : this.nationalId,
      taxNumber: data.taxNumber.present ? data.taxNumber.value : this.taxNumber,
      commercialRegister: data.commercialRegister.present
          ? data.commercialRegister.value
          : this.commercialRegister,
      address: data.address.present ? data.address.value : this.address,
      country: data.country.present ? data.country.value : this.country,
      city: data.city.present ? data.city.value : this.city,
      region: data.region.present ? data.region.value : this.region,
      street: data.street.present ? data.street.value : this.street,
      buildingNumber: data.buildingNumber.present
          ? data.buildingNumber.value
          : this.buildingNumber,
      postalCode:
          data.postalCode.present ? data.postalCode.value : this.postalCode,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      shippingAddress: data.shippingAddress.present
          ? data.shippingAddress.value
          : this.shippingAddress,
      supplierCategory: data.supplierCategory.present
          ? data.supplierCategory.value
          : this.supplierCategory,
      supplierLevel: data.supplierLevel.present
          ? data.supplierLevel.value
          : this.supplierLevel,
      rating: data.rating.present ? data.rating.value : this.rating,
      isPreferred:
          data.isPreferred.present ? data.isPreferred.value : this.isPreferred,
      allowCredit:
          data.allowCredit.present ? data.allowCredit.value : this.allowCredit,
      creditLimit:
          data.creditLimit.present ? data.creditLimit.value : this.creditLimit,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      currentBalance: data.currentBalance.present
          ? data.currentBalance.value
          : this.currentBalance,
      paymentTermsDays: data.paymentTermsDays.present
          ? data.paymentTermsDays.value
          : this.paymentTermsDays,
      preferredPaymentMethod: data.preferredPaymentMethod.present
          ? data.preferredPaymentMethod.value
          : this.preferredPaymentMethod,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      bankBranch:
          data.bankBranch.present ? data.bankBranch.value : this.bankBranch,
      bankAccountName: data.bankAccountName.present
          ? data.bankAccountName.value
          : this.bankAccountName,
      bankAccountNumber: data.bankAccountNumber.present
          ? data.bankAccountNumber.value
          : this.bankAccountNumber,
      iban: data.iban.present ? data.iban.value : this.iban,
      swiftCode: data.swiftCode.present ? data.swiftCode.value : this.swiftCode,
      lastPurchaseAt: data.lastPurchaseAt.present
          ? data.lastPurchaseAt.value
          : this.lastPurchaseAt,
      lastPaymentAt: data.lastPaymentAt.present
          ? data.lastPaymentAt.value
          : this.lastPaymentAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierDb(')
          ..write('id: $id, ')
          ..write('supplierCode: $supplierCode, ')
          ..write('supplierType: $supplierType, ')
          ..write('name: $name, ')
          ..write('companyName: $companyName, ')
          ..write('contactPerson: $contactPerson, ')
          ..write('imagePath: $imagePath, ')
          ..write('phone: $phone, ')
          ..write('secondaryPhone: $secondaryPhone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('nationalId: $nationalId, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('commercialRegister: $commercialRegister, ')
          ..write('address: $address, ')
          ..write('country: $country, ')
          ..write('city: $city, ')
          ..write('region: $region, ')
          ..write('street: $street, ')
          ..write('buildingNumber: $buildingNumber, ')
          ..write('postalCode: $postalCode, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('supplierCategory: $supplierCategory, ')
          ..write('supplierLevel: $supplierLevel, ')
          ..write('rating: $rating, ')
          ..write('isPreferred: $isPreferred, ')
          ..write('allowCredit: $allowCredit, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('paymentTermsDays: $paymentTermsDays, ')
          ..write('preferredPaymentMethod: $preferredPaymentMethod, ')
          ..write('bankName: $bankName, ')
          ..write('bankBranch: $bankBranch, ')
          ..write('bankAccountName: $bankAccountName, ')
          ..write('bankAccountNumber: $bankAccountNumber, ')
          ..write('iban: $iban, ')
          ..write('swiftCode: $swiftCode, ')
          ..write('lastPurchaseAt: $lastPurchaseAt, ')
          ..write('lastPaymentAt: $lastPaymentAt, ')
          ..write('isActive: $isActive, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        supplierCode,
        supplierType,
        name,
        companyName,
        contactPerson,
        imagePath,
        phone,
        secondaryPhone,
        whatsapp,
        email,
        website,
        nationalId,
        taxNumber,
        commercialRegister,
        address,
        country,
        city,
        region,
        street,
        buildingNumber,
        postalCode,
        billingAddress,
        shippingAddress,
        supplierCategory,
        supplierLevel,
        rating,
        isPreferred,
        allowCredit,
        creditLimit,
        openingBalance,
        currentBalance,
        paymentTermsDays,
        preferredPaymentMethod,
        bankName,
        bankBranch,
        bankAccountName,
        bankAccountNumber,
        iban,
        swiftCode,
        lastPurchaseAt,
        lastPaymentAt,
        isActive,
        notes,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierDb &&
          other.id == this.id &&
          other.supplierCode == this.supplierCode &&
          other.supplierType == this.supplierType &&
          other.name == this.name &&
          other.companyName == this.companyName &&
          other.contactPerson == this.contactPerson &&
          other.imagePath == this.imagePath &&
          other.phone == this.phone &&
          other.secondaryPhone == this.secondaryPhone &&
          other.whatsapp == this.whatsapp &&
          other.email == this.email &&
          other.website == this.website &&
          other.nationalId == this.nationalId &&
          other.taxNumber == this.taxNumber &&
          other.commercialRegister == this.commercialRegister &&
          other.address == this.address &&
          other.country == this.country &&
          other.city == this.city &&
          other.region == this.region &&
          other.street == this.street &&
          other.buildingNumber == this.buildingNumber &&
          other.postalCode == this.postalCode &&
          other.billingAddress == this.billingAddress &&
          other.shippingAddress == this.shippingAddress &&
          other.supplierCategory == this.supplierCategory &&
          other.supplierLevel == this.supplierLevel &&
          other.rating == this.rating &&
          other.isPreferred == this.isPreferred &&
          other.allowCredit == this.allowCredit &&
          other.creditLimit == this.creditLimit &&
          other.openingBalance == this.openingBalance &&
          other.currentBalance == this.currentBalance &&
          other.paymentTermsDays == this.paymentTermsDays &&
          other.preferredPaymentMethod == this.preferredPaymentMethod &&
          other.bankName == this.bankName &&
          other.bankBranch == this.bankBranch &&
          other.bankAccountName == this.bankAccountName &&
          other.bankAccountNumber == this.bankAccountNumber &&
          other.iban == this.iban &&
          other.swiftCode == this.swiftCode &&
          other.lastPurchaseAt == this.lastPurchaseAt &&
          other.lastPaymentAt == this.lastPaymentAt &&
          other.isActive == this.isActive &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SuppliersCompanion extends UpdateCompanion<SupplierDb> {
  final Value<int> id;
  final Value<String?> supplierCode;
  final Value<String> supplierType;
  final Value<String> name;
  final Value<String?> companyName;
  final Value<String?> contactPerson;
  final Value<String?> imagePath;
  final Value<String?> phone;
  final Value<String?> secondaryPhone;
  final Value<String?> whatsapp;
  final Value<String?> email;
  final Value<String?> website;
  final Value<String?> nationalId;
  final Value<String?> taxNumber;
  final Value<String?> commercialRegister;
  final Value<String?> address;
  final Value<String?> country;
  final Value<String?> city;
  final Value<String?> region;
  final Value<String?> street;
  final Value<String?> buildingNumber;
  final Value<String?> postalCode;
  final Value<String?> billingAddress;
  final Value<String?> shippingAddress;
  final Value<String> supplierCategory;
  final Value<String> supplierLevel;
  final Value<double> rating;
  final Value<bool> isPreferred;
  final Value<bool> allowCredit;
  final Value<double> creditLimit;
  final Value<double> openingBalance;
  final Value<double> currentBalance;
  final Value<int> paymentTermsDays;
  final Value<String> preferredPaymentMethod;
  final Value<String?> bankName;
  final Value<String?> bankBranch;
  final Value<String?> bankAccountName;
  final Value<String?> bankAccountNumber;
  final Value<String?> iban;
  final Value<String?> swiftCode;
  final Value<DateTime?> lastPurchaseAt;
  final Value<DateTime?> lastPaymentAt;
  final Value<bool> isActive;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.supplierCode = const Value.absent(),
    this.supplierType = const Value.absent(),
    this.name = const Value.absent(),
    this.companyName = const Value.absent(),
    this.contactPerson = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.phone = const Value.absent(),
    this.secondaryPhone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.commercialRegister = const Value.absent(),
    this.address = const Value.absent(),
    this.country = const Value.absent(),
    this.city = const Value.absent(),
    this.region = const Value.absent(),
    this.street = const Value.absent(),
    this.buildingNumber = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.shippingAddress = const Value.absent(),
    this.supplierCategory = const Value.absent(),
    this.supplierLevel = const Value.absent(),
    this.rating = const Value.absent(),
    this.isPreferred = const Value.absent(),
    this.allowCredit = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.paymentTermsDays = const Value.absent(),
    this.preferredPaymentMethod = const Value.absent(),
    this.bankName = const Value.absent(),
    this.bankBranch = const Value.absent(),
    this.bankAccountName = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
    this.iban = const Value.absent(),
    this.swiftCode = const Value.absent(),
    this.lastPurchaseAt = const Value.absent(),
    this.lastPaymentAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SuppliersCompanion.insert({
    this.id = const Value.absent(),
    this.supplierCode = const Value.absent(),
    this.supplierType = const Value.absent(),
    required String name,
    this.companyName = const Value.absent(),
    this.contactPerson = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.phone = const Value.absent(),
    this.secondaryPhone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.commercialRegister = const Value.absent(),
    this.address = const Value.absent(),
    this.country = const Value.absent(),
    this.city = const Value.absent(),
    this.region = const Value.absent(),
    this.street = const Value.absent(),
    this.buildingNumber = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.shippingAddress = const Value.absent(),
    this.supplierCategory = const Value.absent(),
    this.supplierLevel = const Value.absent(),
    this.rating = const Value.absent(),
    this.isPreferred = const Value.absent(),
    this.allowCredit = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.paymentTermsDays = const Value.absent(),
    this.preferredPaymentMethod = const Value.absent(),
    this.bankName = const Value.absent(),
    this.bankBranch = const Value.absent(),
    this.bankAccountName = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
    this.iban = const Value.absent(),
    this.swiftCode = const Value.absent(),
    this.lastPurchaseAt = const Value.absent(),
    this.lastPaymentAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<SupplierDb> custom({
    Expression<int>? id,
    Expression<String>? supplierCode,
    Expression<String>? supplierType,
    Expression<String>? name,
    Expression<String>? companyName,
    Expression<String>? contactPerson,
    Expression<String>? imagePath,
    Expression<String>? phone,
    Expression<String>? secondaryPhone,
    Expression<String>? whatsapp,
    Expression<String>? email,
    Expression<String>? website,
    Expression<String>? nationalId,
    Expression<String>? taxNumber,
    Expression<String>? commercialRegister,
    Expression<String>? address,
    Expression<String>? country,
    Expression<String>? city,
    Expression<String>? region,
    Expression<String>? street,
    Expression<String>? buildingNumber,
    Expression<String>? postalCode,
    Expression<String>? billingAddress,
    Expression<String>? shippingAddress,
    Expression<String>? supplierCategory,
    Expression<String>? supplierLevel,
    Expression<double>? rating,
    Expression<bool>? isPreferred,
    Expression<bool>? allowCredit,
    Expression<double>? creditLimit,
    Expression<double>? openingBalance,
    Expression<double>? currentBalance,
    Expression<int>? paymentTermsDays,
    Expression<String>? preferredPaymentMethod,
    Expression<String>? bankName,
    Expression<String>? bankBranch,
    Expression<String>? bankAccountName,
    Expression<String>? bankAccountNumber,
    Expression<String>? iban,
    Expression<String>? swiftCode,
    Expression<DateTime>? lastPurchaseAt,
    Expression<DateTime>? lastPaymentAt,
    Expression<bool>? isActive,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierCode != null) 'supplier_code': supplierCode,
      if (supplierType != null) 'supplier_type': supplierType,
      if (name != null) 'name': name,
      if (companyName != null) 'company_name': companyName,
      if (contactPerson != null) 'contact_person': contactPerson,
      if (imagePath != null) 'image_path': imagePath,
      if (phone != null) 'phone': phone,
      if (secondaryPhone != null) 'secondary_phone': secondaryPhone,
      if (whatsapp != null) 'whatsapp': whatsapp,
      if (email != null) 'email': email,
      if (website != null) 'website': website,
      if (nationalId != null) 'national_id': nationalId,
      if (taxNumber != null) 'tax_number': taxNumber,
      if (commercialRegister != null) 'commercial_register': commercialRegister,
      if (address != null) 'address': address,
      if (country != null) 'country': country,
      if (city != null) 'city': city,
      if (region != null) 'region': region,
      if (street != null) 'street': street,
      if (buildingNumber != null) 'building_number': buildingNumber,
      if (postalCode != null) 'postal_code': postalCode,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (shippingAddress != null) 'shipping_address': shippingAddress,
      if (supplierCategory != null) 'supplier_category': supplierCategory,
      if (supplierLevel != null) 'supplier_level': supplierLevel,
      if (rating != null) 'rating': rating,
      if (isPreferred != null) 'is_preferred': isPreferred,
      if (allowCredit != null) 'allow_credit': allowCredit,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (currentBalance != null) 'current_balance': currentBalance,
      if (paymentTermsDays != null) 'payment_terms_days': paymentTermsDays,
      if (preferredPaymentMethod != null)
        'preferred_payment_method': preferredPaymentMethod,
      if (bankName != null) 'bank_name': bankName,
      if (bankBranch != null) 'bank_branch': bankBranch,
      if (bankAccountName != null) 'bank_account_name': bankAccountName,
      if (bankAccountNumber != null) 'bank_account_number': bankAccountNumber,
      if (iban != null) 'iban': iban,
      if (swiftCode != null) 'swift_code': swiftCode,
      if (lastPurchaseAt != null) 'last_purchase_at': lastPurchaseAt,
      if (lastPaymentAt != null) 'last_payment_at': lastPaymentAt,
      if (isActive != null) 'is_active': isActive,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SuppliersCompanion copyWith(
      {Value<int>? id,
      Value<String?>? supplierCode,
      Value<String>? supplierType,
      Value<String>? name,
      Value<String?>? companyName,
      Value<String?>? contactPerson,
      Value<String?>? imagePath,
      Value<String?>? phone,
      Value<String?>? secondaryPhone,
      Value<String?>? whatsapp,
      Value<String?>? email,
      Value<String?>? website,
      Value<String?>? nationalId,
      Value<String?>? taxNumber,
      Value<String?>? commercialRegister,
      Value<String?>? address,
      Value<String?>? country,
      Value<String?>? city,
      Value<String?>? region,
      Value<String?>? street,
      Value<String?>? buildingNumber,
      Value<String?>? postalCode,
      Value<String?>? billingAddress,
      Value<String?>? shippingAddress,
      Value<String>? supplierCategory,
      Value<String>? supplierLevel,
      Value<double>? rating,
      Value<bool>? isPreferred,
      Value<bool>? allowCredit,
      Value<double>? creditLimit,
      Value<double>? openingBalance,
      Value<double>? currentBalance,
      Value<int>? paymentTermsDays,
      Value<String>? preferredPaymentMethod,
      Value<String?>? bankName,
      Value<String?>? bankBranch,
      Value<String?>? bankAccountName,
      Value<String?>? bankAccountNumber,
      Value<String?>? iban,
      Value<String?>? swiftCode,
      Value<DateTime?>? lastPurchaseAt,
      Value<DateTime?>? lastPaymentAt,
      Value<bool>? isActive,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return SuppliersCompanion(
      id: id ?? this.id,
      supplierCode: supplierCode ?? this.supplierCode,
      supplierType: supplierType ?? this.supplierType,
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      contactPerson: contactPerson ?? this.contactPerson,
      imagePath: imagePath ?? this.imagePath,
      phone: phone ?? this.phone,
      secondaryPhone: secondaryPhone ?? this.secondaryPhone,
      whatsapp: whatsapp ?? this.whatsapp,
      email: email ?? this.email,
      website: website ?? this.website,
      nationalId: nationalId ?? this.nationalId,
      taxNumber: taxNumber ?? this.taxNumber,
      commercialRegister: commercialRegister ?? this.commercialRegister,
      address: address ?? this.address,
      country: country ?? this.country,
      city: city ?? this.city,
      region: region ?? this.region,
      street: street ?? this.street,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      postalCode: postalCode ?? this.postalCode,
      billingAddress: billingAddress ?? this.billingAddress,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      supplierCategory: supplierCategory ?? this.supplierCategory,
      supplierLevel: supplierLevel ?? this.supplierLevel,
      rating: rating ?? this.rating,
      isPreferred: isPreferred ?? this.isPreferred,
      allowCredit: allowCredit ?? this.allowCredit,
      creditLimit: creditLimit ?? this.creditLimit,
      openingBalance: openingBalance ?? this.openingBalance,
      currentBalance: currentBalance ?? this.currentBalance,
      paymentTermsDays: paymentTermsDays ?? this.paymentTermsDays,
      preferredPaymentMethod:
          preferredPaymentMethod ?? this.preferredPaymentMethod,
      bankName: bankName ?? this.bankName,
      bankBranch: bankBranch ?? this.bankBranch,
      bankAccountName: bankAccountName ?? this.bankAccountName,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      iban: iban ?? this.iban,
      swiftCode: swiftCode ?? this.swiftCode,
      lastPurchaseAt: lastPurchaseAt ?? this.lastPurchaseAt,
      lastPaymentAt: lastPaymentAt ?? this.lastPaymentAt,
      isActive: isActive ?? this.isActive,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierCode.present) {
      map['supplier_code'] = Variable<String>(supplierCode.value);
    }
    if (supplierType.present) {
      map['supplier_type'] = Variable<String>(supplierType.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (contactPerson.present) {
      map['contact_person'] = Variable<String>(contactPerson.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (secondaryPhone.present) {
      map['secondary_phone'] = Variable<String>(secondaryPhone.value);
    }
    if (whatsapp.present) {
      map['whatsapp'] = Variable<String>(whatsapp.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (nationalId.present) {
      map['national_id'] = Variable<String>(nationalId.value);
    }
    if (taxNumber.present) {
      map['tax_number'] = Variable<String>(taxNumber.value);
    }
    if (commercialRegister.present) {
      map['commercial_register'] = Variable<String>(commercialRegister.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (buildingNumber.present) {
      map['building_number'] = Variable<String>(buildingNumber.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = Variable<String>(billingAddress.value);
    }
    if (shippingAddress.present) {
      map['shipping_address'] = Variable<String>(shippingAddress.value);
    }
    if (supplierCategory.present) {
      map['supplier_category'] = Variable<String>(supplierCategory.value);
    }
    if (supplierLevel.present) {
      map['supplier_level'] = Variable<String>(supplierLevel.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (isPreferred.present) {
      map['is_preferred'] = Variable<bool>(isPreferred.value);
    }
    if (allowCredit.present) {
      map['allow_credit'] = Variable<bool>(allowCredit.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<double>(creditLimit.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (currentBalance.present) {
      map['current_balance'] = Variable<double>(currentBalance.value);
    }
    if (paymentTermsDays.present) {
      map['payment_terms_days'] = Variable<int>(paymentTermsDays.value);
    }
    if (preferredPaymentMethod.present) {
      map['preferred_payment_method'] =
          Variable<String>(preferredPaymentMethod.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (bankBranch.present) {
      map['bank_branch'] = Variable<String>(bankBranch.value);
    }
    if (bankAccountName.present) {
      map['bank_account_name'] = Variable<String>(bankAccountName.value);
    }
    if (bankAccountNumber.present) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber.value);
    }
    if (iban.present) {
      map['iban'] = Variable<String>(iban.value);
    }
    if (swiftCode.present) {
      map['swift_code'] = Variable<String>(swiftCode.value);
    }
    if (lastPurchaseAt.present) {
      map['last_purchase_at'] = Variable<DateTime>(lastPurchaseAt.value);
    }
    if (lastPaymentAt.present) {
      map['last_payment_at'] = Variable<DateTime>(lastPaymentAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('supplierCode: $supplierCode, ')
          ..write('supplierType: $supplierType, ')
          ..write('name: $name, ')
          ..write('companyName: $companyName, ')
          ..write('contactPerson: $contactPerson, ')
          ..write('imagePath: $imagePath, ')
          ..write('phone: $phone, ')
          ..write('secondaryPhone: $secondaryPhone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('nationalId: $nationalId, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('commercialRegister: $commercialRegister, ')
          ..write('address: $address, ')
          ..write('country: $country, ')
          ..write('city: $city, ')
          ..write('region: $region, ')
          ..write('street: $street, ')
          ..write('buildingNumber: $buildingNumber, ')
          ..write('postalCode: $postalCode, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('supplierCategory: $supplierCategory, ')
          ..write('supplierLevel: $supplierLevel, ')
          ..write('rating: $rating, ')
          ..write('isPreferred: $isPreferred, ')
          ..write('allowCredit: $allowCredit, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('paymentTermsDays: $paymentTermsDays, ')
          ..write('preferredPaymentMethod: $preferredPaymentMethod, ')
          ..write('bankName: $bankName, ')
          ..write('bankBranch: $bankBranch, ')
          ..write('bankAccountName: $bankAccountName, ')
          ..write('bankAccountNumber: $bankAccountNumber, ')
          ..write('iban: $iban, ')
          ..write('swiftCode: $swiftCode, ')
          ..write('lastPurchaseAt: $lastPurchaseAt, ')
          ..write('lastPaymentAt: $lastPaymentAt, ')
          ..write('isActive: $isActive, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PurchaseOrdersTable extends PurchaseOrders
    with TableInfo<$PurchaseOrdersTable, PurchaseOrderDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseOrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _supplierIdMeta =
      const VerificationMeta('supplierId');
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
      'supplier_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _invoiceNumberMeta =
      const VerificationMeta('invoiceNumber');
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
      'invoice_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _supplierInvoiceNumberMeta =
      const VerificationMeta('supplierInvoiceNumber');
  @override
  late final GeneratedColumn<String> supplierInvoiceNumber =
      GeneratedColumn<String>('supplier_invoice_number', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _purchaseDateMeta =
      const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
      'purchase_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _expectedDeliveryDateMeta =
      const VerificationMeta('expectedDeliveryDate');
  @override
  late final GeneratedColumn<DateTime> expectedDeliveryDate =
      GeneratedColumn<DateTime>('expected_delivery_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _taxMeta = const VerificationMeta('tax');
  @override
  late final GeneratedColumn<double> tax = GeneratedColumn<double>(
      'tax', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _shippingCostMeta =
      const VerificationMeta('shippingCost');
  @override
  late final GeneratedColumn<double> shippingCost = GeneratedColumn<double>(
      'shipping_cost', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _additionalCostMeta =
      const VerificationMeta('additionalCost');
  @override
  late final GeneratedColumn<double> additionalCost = GeneratedColumn<double>(
      'additional_cost', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _remainingAmountMeta =
      const VerificationMeta('remainingAmount');
  @override
  late final GeneratedColumn<double> remainingAmount = GeneratedColumn<double>(
      'remaining_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('draft'));
  static const VerificationMeta _paymentStatusMeta =
      const VerificationMeta('paymentStatus');
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
      'payment_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('unpaid'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _internalNotesMeta =
      const VerificationMeta('internalNotes');
  @override
  late final GeneratedColumn<String> internalNotes = GeneratedColumn<String>(
      'internal_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        supplierId,
        invoiceNumber,
        supplierInvoiceNumber,
        purchaseDate,
        expectedDeliveryDate,
        completedAt,
        subtotal,
        discount,
        tax,
        shippingCost,
        additionalCost,
        total,
        paidAmount,
        remainingAmount,
        status,
        paymentStatus,
        notes,
        internalNotes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_orders';
  @override
  VerificationContext validateIntegrity(Insertable<PurchaseOrderDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
          _supplierIdMeta,
          supplierId.isAcceptableOrUnknown(
              data['supplier_id']!, _supplierIdMeta));
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
          _invoiceNumberMeta,
          invoiceNumber.isAcceptableOrUnknown(
              data['invoice_number']!, _invoiceNumberMeta));
    } else if (isInserting) {
      context.missing(_invoiceNumberMeta);
    }
    if (data.containsKey('supplier_invoice_number')) {
      context.handle(
          _supplierInvoiceNumberMeta,
          supplierInvoiceNumber.isAcceptableOrUnknown(
              data['supplier_invoice_number']!, _supplierInvoiceNumberMeta));
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
          _purchaseDateMeta,
          purchaseDate.isAcceptableOrUnknown(
              data['purchase_date']!, _purchaseDateMeta));
    }
    if (data.containsKey('expected_delivery_date')) {
      context.handle(
          _expectedDeliveryDateMeta,
          expectedDeliveryDate.isAcceptableOrUnknown(
              data['expected_delivery_date']!, _expectedDeliveryDateMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('tax')) {
      context.handle(
          _taxMeta, tax.isAcceptableOrUnknown(data['tax']!, _taxMeta));
    }
    if (data.containsKey('shipping_cost')) {
      context.handle(
          _shippingCostMeta,
          shippingCost.isAcceptableOrUnknown(
              data['shipping_cost']!, _shippingCostMeta));
    }
    if (data.containsKey('additional_cost')) {
      context.handle(
          _additionalCostMeta,
          additionalCost.isAcceptableOrUnknown(
              data['additional_cost']!, _additionalCostMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    }
    if (data.containsKey('remaining_amount')) {
      context.handle(
          _remainingAmountMeta,
          remainingAmount.isAcceptableOrUnknown(
              data['remaining_amount']!, _remainingAmountMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('payment_status')) {
      context.handle(
          _paymentStatusMeta,
          paymentStatus.isAcceptableOrUnknown(
              data['payment_status']!, _paymentStatusMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('internal_notes')) {
      context.handle(
          _internalNotesMeta,
          internalNotes.isAcceptableOrUnknown(
              data['internal_notes']!, _internalNotesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseOrderDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseOrderDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      supplierId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}supplier_id'])!,
      invoiceNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_number'])!,
      supplierInvoiceNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}supplier_invoice_number']),
      purchaseDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}purchase_date'])!,
      expectedDeliveryDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}expected_delivery_date']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount'])!,
      tax: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax'])!,
      shippingCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}shipping_cost'])!,
      additionalCost: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}additional_cost'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_amount'])!,
      remainingAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}remaining_amount'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      paymentStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_status'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      internalNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}internal_notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PurchaseOrdersTable createAlias(String alias) {
    return $PurchaseOrdersTable(attachedDatabase, alias);
  }
}

class PurchaseOrderDb extends DataClass implements Insertable<PurchaseOrderDb> {
  final int id;
  final int supplierId;
  final String invoiceNumber;
  final String? supplierInvoiceNumber;
  final DateTime purchaseDate;
  final DateTime? expectedDeliveryDate;
  final DateTime? completedAt;
  final double subtotal;
  final double discount;
  final double tax;
  final double shippingCost;
  final double additionalCost;
  final double total;
  final double paidAmount;
  final double remainingAmount;
  final String status;
  final String paymentStatus;
  final String? notes;
  final String? internalNotes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PurchaseOrderDb(
      {required this.id,
      required this.supplierId,
      required this.invoiceNumber,
      this.supplierInvoiceNumber,
      required this.purchaseDate,
      this.expectedDeliveryDate,
      this.completedAt,
      required this.subtotal,
      required this.discount,
      required this.tax,
      required this.shippingCost,
      required this.additionalCost,
      required this.total,
      required this.paidAmount,
      required this.remainingAmount,
      required this.status,
      required this.paymentStatus,
      this.notes,
      this.internalNotes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['supplier_id'] = Variable<int>(supplierId);
    map['invoice_number'] = Variable<String>(invoiceNumber);
    if (!nullToAbsent || supplierInvoiceNumber != null) {
      map['supplier_invoice_number'] = Variable<String>(supplierInvoiceNumber);
    }
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    if (!nullToAbsent || expectedDeliveryDate != null) {
      map['expected_delivery_date'] = Variable<DateTime>(expectedDeliveryDate);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['subtotal'] = Variable<double>(subtotal);
    map['discount'] = Variable<double>(discount);
    map['tax'] = Variable<double>(tax);
    map['shipping_cost'] = Variable<double>(shippingCost);
    map['additional_cost'] = Variable<double>(additionalCost);
    map['total'] = Variable<double>(total);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['remaining_amount'] = Variable<double>(remainingAmount);
    map['status'] = Variable<String>(status);
    map['payment_status'] = Variable<String>(paymentStatus);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || internalNotes != null) {
      map['internal_notes'] = Variable<String>(internalNotes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PurchaseOrdersCompanion toCompanion(bool nullToAbsent) {
    return PurchaseOrdersCompanion(
      id: Value(id),
      supplierId: Value(supplierId),
      invoiceNumber: Value(invoiceNumber),
      supplierInvoiceNumber: supplierInvoiceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierInvoiceNumber),
      purchaseDate: Value(purchaseDate),
      expectedDeliveryDate: expectedDeliveryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedDeliveryDate),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      subtotal: Value(subtotal),
      discount: Value(discount),
      tax: Value(tax),
      shippingCost: Value(shippingCost),
      additionalCost: Value(additionalCost),
      total: Value(total),
      paidAmount: Value(paidAmount),
      remainingAmount: Value(remainingAmount),
      status: Value(status),
      paymentStatus: Value(paymentStatus),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      internalNotes: internalNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(internalNotes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PurchaseOrderDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseOrderDb(
      id: serializer.fromJson<int>(json['id']),
      supplierId: serializer.fromJson<int>(json['supplierId']),
      invoiceNumber: serializer.fromJson<String>(json['invoiceNumber']),
      supplierInvoiceNumber:
          serializer.fromJson<String?>(json['supplierInvoiceNumber']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      expectedDeliveryDate:
          serializer.fromJson<DateTime?>(json['expectedDeliveryDate']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      discount: serializer.fromJson<double>(json['discount']),
      tax: serializer.fromJson<double>(json['tax']),
      shippingCost: serializer.fromJson<double>(json['shippingCost']),
      additionalCost: serializer.fromJson<double>(json['additionalCost']),
      total: serializer.fromJson<double>(json['total']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      remainingAmount: serializer.fromJson<double>(json['remainingAmount']),
      status: serializer.fromJson<String>(json['status']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      notes: serializer.fromJson<String?>(json['notes']),
      internalNotes: serializer.fromJson<String?>(json['internalNotes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplierId': serializer.toJson<int>(supplierId),
      'invoiceNumber': serializer.toJson<String>(invoiceNumber),
      'supplierInvoiceNumber':
          serializer.toJson<String?>(supplierInvoiceNumber),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'expectedDeliveryDate':
          serializer.toJson<DateTime?>(expectedDeliveryDate),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'subtotal': serializer.toJson<double>(subtotal),
      'discount': serializer.toJson<double>(discount),
      'tax': serializer.toJson<double>(tax),
      'shippingCost': serializer.toJson<double>(shippingCost),
      'additionalCost': serializer.toJson<double>(additionalCost),
      'total': serializer.toJson<double>(total),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'remainingAmount': serializer.toJson<double>(remainingAmount),
      'status': serializer.toJson<String>(status),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'notes': serializer.toJson<String?>(notes),
      'internalNotes': serializer.toJson<String?>(internalNotes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PurchaseOrderDb copyWith(
          {int? id,
          int? supplierId,
          String? invoiceNumber,
          Value<String?> supplierInvoiceNumber = const Value.absent(),
          DateTime? purchaseDate,
          Value<DateTime?> expectedDeliveryDate = const Value.absent(),
          Value<DateTime?> completedAt = const Value.absent(),
          double? subtotal,
          double? discount,
          double? tax,
          double? shippingCost,
          double? additionalCost,
          double? total,
          double? paidAmount,
          double? remainingAmount,
          String? status,
          String? paymentStatus,
          Value<String?> notes = const Value.absent(),
          Value<String?> internalNotes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PurchaseOrderDb(
        id: id ?? this.id,
        supplierId: supplierId ?? this.supplierId,
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        supplierInvoiceNumber: supplierInvoiceNumber.present
            ? supplierInvoiceNumber.value
            : this.supplierInvoiceNumber,
        purchaseDate: purchaseDate ?? this.purchaseDate,
        expectedDeliveryDate: expectedDeliveryDate.present
            ? expectedDeliveryDate.value
            : this.expectedDeliveryDate,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        subtotal: subtotal ?? this.subtotal,
        discount: discount ?? this.discount,
        tax: tax ?? this.tax,
        shippingCost: shippingCost ?? this.shippingCost,
        additionalCost: additionalCost ?? this.additionalCost,
        total: total ?? this.total,
        paidAmount: paidAmount ?? this.paidAmount,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        status: status ?? this.status,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        notes: notes.present ? notes.value : this.notes,
        internalNotes:
            internalNotes.present ? internalNotes.value : this.internalNotes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PurchaseOrderDb copyWithCompanion(PurchaseOrdersCompanion data) {
    return PurchaseOrderDb(
      id: data.id.present ? data.id.value : this.id,
      supplierId:
          data.supplierId.present ? data.supplierId.value : this.supplierId,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      supplierInvoiceNumber: data.supplierInvoiceNumber.present
          ? data.supplierInvoiceNumber.value
          : this.supplierInvoiceNumber,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      expectedDeliveryDate: data.expectedDeliveryDate.present
          ? data.expectedDeliveryDate.value
          : this.expectedDeliveryDate,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discount: data.discount.present ? data.discount.value : this.discount,
      tax: data.tax.present ? data.tax.value : this.tax,
      shippingCost: data.shippingCost.present
          ? data.shippingCost.value
          : this.shippingCost,
      additionalCost: data.additionalCost.present
          ? data.additionalCost.value
          : this.additionalCost,
      total: data.total.present ? data.total.value : this.total,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      remainingAmount: data.remainingAmount.present
          ? data.remainingAmount.value
          : this.remainingAmount,
      status: data.status.present ? data.status.value : this.status,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      notes: data.notes.present ? data.notes.value : this.notes,
      internalNotes: data.internalNotes.present
          ? data.internalNotes.value
          : this.internalNotes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrderDb(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('supplierInvoiceNumber: $supplierInvoiceNumber, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('expectedDeliveryDate: $expectedDeliveryDate, ')
          ..write('completedAt: $completedAt, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('tax: $tax, ')
          ..write('shippingCost: $shippingCost, ')
          ..write('additionalCost: $additionalCost, ')
          ..write('total: $total, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('remainingAmount: $remainingAmount, ')
          ..write('status: $status, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('notes: $notes, ')
          ..write('internalNotes: $internalNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        supplierId,
        invoiceNumber,
        supplierInvoiceNumber,
        purchaseDate,
        expectedDeliveryDate,
        completedAt,
        subtotal,
        discount,
        tax,
        shippingCost,
        additionalCost,
        total,
        paidAmount,
        remainingAmount,
        status,
        paymentStatus,
        notes,
        internalNotes,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseOrderDb &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.invoiceNumber == this.invoiceNumber &&
          other.supplierInvoiceNumber == this.supplierInvoiceNumber &&
          other.purchaseDate == this.purchaseDate &&
          other.expectedDeliveryDate == this.expectedDeliveryDate &&
          other.completedAt == this.completedAt &&
          other.subtotal == this.subtotal &&
          other.discount == this.discount &&
          other.tax == this.tax &&
          other.shippingCost == this.shippingCost &&
          other.additionalCost == this.additionalCost &&
          other.total == this.total &&
          other.paidAmount == this.paidAmount &&
          other.remainingAmount == this.remainingAmount &&
          other.status == this.status &&
          other.paymentStatus == this.paymentStatus &&
          other.notes == this.notes &&
          other.internalNotes == this.internalNotes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PurchaseOrdersCompanion extends UpdateCompanion<PurchaseOrderDb> {
  final Value<int> id;
  final Value<int> supplierId;
  final Value<String> invoiceNumber;
  final Value<String?> supplierInvoiceNumber;
  final Value<DateTime> purchaseDate;
  final Value<DateTime?> expectedDeliveryDate;
  final Value<DateTime?> completedAt;
  final Value<double> subtotal;
  final Value<double> discount;
  final Value<double> tax;
  final Value<double> shippingCost;
  final Value<double> additionalCost;
  final Value<double> total;
  final Value<double> paidAmount;
  final Value<double> remainingAmount;
  final Value<String> status;
  final Value<String> paymentStatus;
  final Value<String?> notes;
  final Value<String?> internalNotes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PurchaseOrdersCompanion({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.supplierInvoiceNumber = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.expectedDeliveryDate = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.tax = const Value.absent(),
    this.shippingCost = const Value.absent(),
    this.additionalCost = const Value.absent(),
    this.total = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.remainingAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.notes = const Value.absent(),
    this.internalNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PurchaseOrdersCompanion.insert({
    this.id = const Value.absent(),
    required int supplierId,
    required String invoiceNumber,
    this.supplierInvoiceNumber = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.expectedDeliveryDate = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.tax = const Value.absent(),
    this.shippingCost = const Value.absent(),
    this.additionalCost = const Value.absent(),
    this.total = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.remainingAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.notes = const Value.absent(),
    this.internalNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : supplierId = Value(supplierId),
        invoiceNumber = Value(invoiceNumber);
  static Insertable<PurchaseOrderDb> custom({
    Expression<int>? id,
    Expression<int>? supplierId,
    Expression<String>? invoiceNumber,
    Expression<String>? supplierInvoiceNumber,
    Expression<DateTime>? purchaseDate,
    Expression<DateTime>? expectedDeliveryDate,
    Expression<DateTime>? completedAt,
    Expression<double>? subtotal,
    Expression<double>? discount,
    Expression<double>? tax,
    Expression<double>? shippingCost,
    Expression<double>? additionalCost,
    Expression<double>? total,
    Expression<double>? paidAmount,
    Expression<double>? remainingAmount,
    Expression<String>? status,
    Expression<String>? paymentStatus,
    Expression<String>? notes,
    Expression<String>? internalNotes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (supplierInvoiceNumber != null)
        'supplier_invoice_number': supplierInvoiceNumber,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (expectedDeliveryDate != null)
        'expected_delivery_date': expectedDeliveryDate,
      if (completedAt != null) 'completed_at': completedAt,
      if (subtotal != null) 'subtotal': subtotal,
      if (discount != null) 'discount': discount,
      if (tax != null) 'tax': tax,
      if (shippingCost != null) 'shipping_cost': shippingCost,
      if (additionalCost != null) 'additional_cost': additionalCost,
      if (total != null) 'total': total,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (remainingAmount != null) 'remaining_amount': remainingAmount,
      if (status != null) 'status': status,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (notes != null) 'notes': notes,
      if (internalNotes != null) 'internal_notes': internalNotes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PurchaseOrdersCompanion copyWith(
      {Value<int>? id,
      Value<int>? supplierId,
      Value<String>? invoiceNumber,
      Value<String?>? supplierInvoiceNumber,
      Value<DateTime>? purchaseDate,
      Value<DateTime?>? expectedDeliveryDate,
      Value<DateTime?>? completedAt,
      Value<double>? subtotal,
      Value<double>? discount,
      Value<double>? tax,
      Value<double>? shippingCost,
      Value<double>? additionalCost,
      Value<double>? total,
      Value<double>? paidAmount,
      Value<double>? remainingAmount,
      Value<String>? status,
      Value<String>? paymentStatus,
      Value<String?>? notes,
      Value<String?>? internalNotes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return PurchaseOrdersCompanion(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      supplierInvoiceNumber:
          supplierInvoiceNumber ?? this.supplierInvoiceNumber,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      expectedDeliveryDate: expectedDeliveryDate ?? this.expectedDeliveryDate,
      completedAt: completedAt ?? this.completedAt,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      tax: tax ?? this.tax,
      shippingCost: shippingCost ?? this.shippingCost,
      additionalCost: additionalCost ?? this.additionalCost,
      total: total ?? this.total,
      paidAmount: paidAmount ?? this.paidAmount,
      remainingAmount: remainingAmount ?? this.remainingAmount,
      status: status ?? this.status,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      notes: notes ?? this.notes,
      internalNotes: internalNotes ?? this.internalNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (supplierInvoiceNumber.present) {
      map['supplier_invoice_number'] =
          Variable<String>(supplierInvoiceNumber.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (expectedDeliveryDate.present) {
      map['expected_delivery_date'] =
          Variable<DateTime>(expectedDeliveryDate.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (tax.present) {
      map['tax'] = Variable<double>(tax.value);
    }
    if (shippingCost.present) {
      map['shipping_cost'] = Variable<double>(shippingCost.value);
    }
    if (additionalCost.present) {
      map['additional_cost'] = Variable<double>(additionalCost.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (remainingAmount.present) {
      map['remaining_amount'] = Variable<double>(remainingAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (internalNotes.present) {
      map['internal_notes'] = Variable<String>(internalNotes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrdersCompanion(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('supplierInvoiceNumber: $supplierInvoiceNumber, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('expectedDeliveryDate: $expectedDeliveryDate, ')
          ..write('completedAt: $completedAt, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('tax: $tax, ')
          ..write('shippingCost: $shippingCost, ')
          ..write('additionalCost: $additionalCost, ')
          ..write('total: $total, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('remainingAmount: $remainingAmount, ')
          ..write('status: $status, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('notes: $notes, ')
          ..write('internalNotes: $internalNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PurchaseItemsTable extends PurchaseItems
    with TableInfo<$PurchaseItemsTable, PurchaseItemDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _purchaseOrderIdMeta =
      const VerificationMeta('purchaseOrderId');
  @override
  late final GeneratedColumn<int> purchaseOrderId = GeneratedColumn<int>(
      'purchase_order_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productUnitIdMeta =
      const VerificationMeta('productUnitId');
  @override
  late final GeneratedColumn<int> productUnitId = GeneratedColumn<int>(
      'product_unit_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _unitNameMeta =
      const VerificationMeta('unitName');
  @override
  late final GeneratedColumn<String> unitName = GeneratedColumn<String>(
      'unit_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('piece'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _conversionFactorMeta =
      const VerificationMeta('conversionFactor');
  @override
  late final GeneratedColumn<double> conversionFactor = GeneratedColumn<double>(
      'conversion_factor', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(1.0));
  static const VerificationMeta _baseQuantityMeta =
      const VerificationMeta('baseQuantity');
  @override
  late final GeneratedColumn<double> baseQuantity = GeneratedColumn<double>(
      'base_quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
      'unit_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _baseUnitCostMeta =
      const VerificationMeta('baseUnitCost');
  @override
  late final GeneratedColumn<double> baseUnitCost = GeneratedColumn<double>(
      'base_unit_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        purchaseOrderId,
        productId,
        productUnitId,
        productName,
        unitName,
        quantity,
        conversionFactor,
        baseQuantity,
        unitPrice,
        baseUnitCost,
        total,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_items';
  @override
  VerificationContext validateIntegrity(Insertable<PurchaseItemDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('purchase_order_id')) {
      context.handle(
          _purchaseOrderIdMeta,
          purchaseOrderId.isAcceptableOrUnknown(
              data['purchase_order_id']!, _purchaseOrderIdMeta));
    } else if (isInserting) {
      context.missing(_purchaseOrderIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_unit_id')) {
      context.handle(
          _productUnitIdMeta,
          productUnitId.isAcceptableOrUnknown(
              data['product_unit_id']!, _productUnitIdMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('unit_name')) {
      context.handle(_unitNameMeta,
          unitName.isAcceptableOrUnknown(data['unit_name']!, _unitNameMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('conversion_factor')) {
      context.handle(
          _conversionFactorMeta,
          conversionFactor.isAcceptableOrUnknown(
              data['conversion_factor']!, _conversionFactorMeta));
    }
    if (data.containsKey('base_quantity')) {
      context.handle(
          _baseQuantityMeta,
          baseQuantity.isAcceptableOrUnknown(
              data['base_quantity']!, _baseQuantityMeta));
    } else if (isInserting) {
      context.missing(_baseQuantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('base_unit_cost')) {
      context.handle(
          _baseUnitCostMeta,
          baseUnitCost.isAcceptableOrUnknown(
              data['base_unit_cost']!, _baseUnitCostMeta));
    } else if (isInserting) {
      context.missing(_baseUnitCostMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseItemDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseItemDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      purchaseOrderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_order_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      productUnitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_unit_id']),
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      unitName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit_name'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      conversionFactor: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}conversion_factor'])!,
      baseQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}base_quantity'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_price'])!,
      baseUnitCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}base_unit_cost'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $PurchaseItemsTable createAlias(String alias) {
    return $PurchaseItemsTable(attachedDatabase, alias);
  }
}

class PurchaseItemDb extends DataClass implements Insertable<PurchaseItemDb> {
  final int id;
  final int purchaseOrderId;
  final int productId;
  final int? productUnitId;
  final String productName;
  final String unitName;
  final double quantity;
  final double conversionFactor;
  final double baseQuantity;
  final double unitPrice;
  final double baseUnitCost;
  final double total;
  final String? notes;
  const PurchaseItemDb(
      {required this.id,
      required this.purchaseOrderId,
      required this.productId,
      this.productUnitId,
      required this.productName,
      required this.unitName,
      required this.quantity,
      required this.conversionFactor,
      required this.baseQuantity,
      required this.unitPrice,
      required this.baseUnitCost,
      required this.total,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['purchase_order_id'] = Variable<int>(purchaseOrderId);
    map['product_id'] = Variable<int>(productId);
    if (!nullToAbsent || productUnitId != null) {
      map['product_unit_id'] = Variable<int>(productUnitId);
    }
    map['product_name'] = Variable<String>(productName);
    map['unit_name'] = Variable<String>(unitName);
    map['quantity'] = Variable<double>(quantity);
    map['conversion_factor'] = Variable<double>(conversionFactor);
    map['base_quantity'] = Variable<double>(baseQuantity);
    map['unit_price'] = Variable<double>(unitPrice);
    map['base_unit_cost'] = Variable<double>(baseUnitCost);
    map['total'] = Variable<double>(total);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PurchaseItemsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseItemsCompanion(
      id: Value(id),
      purchaseOrderId: Value(purchaseOrderId),
      productId: Value(productId),
      productUnitId: productUnitId == null && nullToAbsent
          ? const Value.absent()
          : Value(productUnitId),
      productName: Value(productName),
      unitName: Value(unitName),
      quantity: Value(quantity),
      conversionFactor: Value(conversionFactor),
      baseQuantity: Value(baseQuantity),
      unitPrice: Value(unitPrice),
      baseUnitCost: Value(baseUnitCost),
      total: Value(total),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory PurchaseItemDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseItemDb(
      id: serializer.fromJson<int>(json['id']),
      purchaseOrderId: serializer.fromJson<int>(json['purchaseOrderId']),
      productId: serializer.fromJson<int>(json['productId']),
      productUnitId: serializer.fromJson<int?>(json['productUnitId']),
      productName: serializer.fromJson<String>(json['productName']),
      unitName: serializer.fromJson<String>(json['unitName']),
      quantity: serializer.fromJson<double>(json['quantity']),
      conversionFactor: serializer.fromJson<double>(json['conversionFactor']),
      baseQuantity: serializer.fromJson<double>(json['baseQuantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      baseUnitCost: serializer.fromJson<double>(json['baseUnitCost']),
      total: serializer.fromJson<double>(json['total']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'purchaseOrderId': serializer.toJson<int>(purchaseOrderId),
      'productId': serializer.toJson<int>(productId),
      'productUnitId': serializer.toJson<int?>(productUnitId),
      'productName': serializer.toJson<String>(productName),
      'unitName': serializer.toJson<String>(unitName),
      'quantity': serializer.toJson<double>(quantity),
      'conversionFactor': serializer.toJson<double>(conversionFactor),
      'baseQuantity': serializer.toJson<double>(baseQuantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'baseUnitCost': serializer.toJson<double>(baseUnitCost),
      'total': serializer.toJson<double>(total),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  PurchaseItemDb copyWith(
          {int? id,
          int? purchaseOrderId,
          int? productId,
          Value<int?> productUnitId = const Value.absent(),
          String? productName,
          String? unitName,
          double? quantity,
          double? conversionFactor,
          double? baseQuantity,
          double? unitPrice,
          double? baseUnitCost,
          double? total,
          Value<String?> notes = const Value.absent()}) =>
      PurchaseItemDb(
        id: id ?? this.id,
        purchaseOrderId: purchaseOrderId ?? this.purchaseOrderId,
        productId: productId ?? this.productId,
        productUnitId:
            productUnitId.present ? productUnitId.value : this.productUnitId,
        productName: productName ?? this.productName,
        unitName: unitName ?? this.unitName,
        quantity: quantity ?? this.quantity,
        conversionFactor: conversionFactor ?? this.conversionFactor,
        baseQuantity: baseQuantity ?? this.baseQuantity,
        unitPrice: unitPrice ?? this.unitPrice,
        baseUnitCost: baseUnitCost ?? this.baseUnitCost,
        total: total ?? this.total,
        notes: notes.present ? notes.value : this.notes,
      );
  PurchaseItemDb copyWithCompanion(PurchaseItemsCompanion data) {
    return PurchaseItemDb(
      id: data.id.present ? data.id.value : this.id,
      purchaseOrderId: data.purchaseOrderId.present
          ? data.purchaseOrderId.value
          : this.purchaseOrderId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productUnitId: data.productUnitId.present
          ? data.productUnitId.value
          : this.productUnitId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      unitName: data.unitName.present ? data.unitName.value : this.unitName,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      conversionFactor: data.conversionFactor.present
          ? data.conversionFactor.value
          : this.conversionFactor,
      baseQuantity: data.baseQuantity.present
          ? data.baseQuantity.value
          : this.baseQuantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      baseUnitCost: data.baseUnitCost.present
          ? data.baseUnitCost.value
          : this.baseUnitCost,
      total: data.total.present ? data.total.value : this.total,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseItemDb(')
          ..write('id: $id, ')
          ..write('purchaseOrderId: $purchaseOrderId, ')
          ..write('productId: $productId, ')
          ..write('productUnitId: $productUnitId, ')
          ..write('productName: $productName, ')
          ..write('unitName: $unitName, ')
          ..write('quantity: $quantity, ')
          ..write('conversionFactor: $conversionFactor, ')
          ..write('baseQuantity: $baseQuantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('baseUnitCost: $baseUnitCost, ')
          ..write('total: $total, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      purchaseOrderId,
      productId,
      productUnitId,
      productName,
      unitName,
      quantity,
      conversionFactor,
      baseQuantity,
      unitPrice,
      baseUnitCost,
      total,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseItemDb &&
          other.id == this.id &&
          other.purchaseOrderId == this.purchaseOrderId &&
          other.productId == this.productId &&
          other.productUnitId == this.productUnitId &&
          other.productName == this.productName &&
          other.unitName == this.unitName &&
          other.quantity == this.quantity &&
          other.conversionFactor == this.conversionFactor &&
          other.baseQuantity == this.baseQuantity &&
          other.unitPrice == this.unitPrice &&
          other.baseUnitCost == this.baseUnitCost &&
          other.total == this.total &&
          other.notes == this.notes);
}

class PurchaseItemsCompanion extends UpdateCompanion<PurchaseItemDb> {
  final Value<int> id;
  final Value<int> purchaseOrderId;
  final Value<int> productId;
  final Value<int?> productUnitId;
  final Value<String> productName;
  final Value<String> unitName;
  final Value<double> quantity;
  final Value<double> conversionFactor;
  final Value<double> baseQuantity;
  final Value<double> unitPrice;
  final Value<double> baseUnitCost;
  final Value<double> total;
  final Value<String?> notes;
  const PurchaseItemsCompanion({
    this.id = const Value.absent(),
    this.purchaseOrderId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productUnitId = const Value.absent(),
    this.productName = const Value.absent(),
    this.unitName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.conversionFactor = const Value.absent(),
    this.baseQuantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.baseUnitCost = const Value.absent(),
    this.total = const Value.absent(),
    this.notes = const Value.absent(),
  });
  PurchaseItemsCompanion.insert({
    this.id = const Value.absent(),
    required int purchaseOrderId,
    required int productId,
    this.productUnitId = const Value.absent(),
    required String productName,
    this.unitName = const Value.absent(),
    required double quantity,
    this.conversionFactor = const Value.absent(),
    required double baseQuantity,
    required double unitPrice,
    required double baseUnitCost,
    required double total,
    this.notes = const Value.absent(),
  })  : purchaseOrderId = Value(purchaseOrderId),
        productId = Value(productId),
        productName = Value(productName),
        quantity = Value(quantity),
        baseQuantity = Value(baseQuantity),
        unitPrice = Value(unitPrice),
        baseUnitCost = Value(baseUnitCost),
        total = Value(total);
  static Insertable<PurchaseItemDb> custom({
    Expression<int>? id,
    Expression<int>? purchaseOrderId,
    Expression<int>? productId,
    Expression<int>? productUnitId,
    Expression<String>? productName,
    Expression<String>? unitName,
    Expression<double>? quantity,
    Expression<double>? conversionFactor,
    Expression<double>? baseQuantity,
    Expression<double>? unitPrice,
    Expression<double>? baseUnitCost,
    Expression<double>? total,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (purchaseOrderId != null) 'purchase_order_id': purchaseOrderId,
      if (productId != null) 'product_id': productId,
      if (productUnitId != null) 'product_unit_id': productUnitId,
      if (productName != null) 'product_name': productName,
      if (unitName != null) 'unit_name': unitName,
      if (quantity != null) 'quantity': quantity,
      if (conversionFactor != null) 'conversion_factor': conversionFactor,
      if (baseQuantity != null) 'base_quantity': baseQuantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (baseUnitCost != null) 'base_unit_cost': baseUnitCost,
      if (total != null) 'total': total,
      if (notes != null) 'notes': notes,
    });
  }

  PurchaseItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? purchaseOrderId,
      Value<int>? productId,
      Value<int?>? productUnitId,
      Value<String>? productName,
      Value<String>? unitName,
      Value<double>? quantity,
      Value<double>? conversionFactor,
      Value<double>? baseQuantity,
      Value<double>? unitPrice,
      Value<double>? baseUnitCost,
      Value<double>? total,
      Value<String?>? notes}) {
    return PurchaseItemsCompanion(
      id: id ?? this.id,
      purchaseOrderId: purchaseOrderId ?? this.purchaseOrderId,
      productId: productId ?? this.productId,
      productUnitId: productUnitId ?? this.productUnitId,
      productName: productName ?? this.productName,
      unitName: unitName ?? this.unitName,
      quantity: quantity ?? this.quantity,
      conversionFactor: conversionFactor ?? this.conversionFactor,
      baseQuantity: baseQuantity ?? this.baseQuantity,
      unitPrice: unitPrice ?? this.unitPrice,
      baseUnitCost: baseUnitCost ?? this.baseUnitCost,
      total: total ?? this.total,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (purchaseOrderId.present) {
      map['purchase_order_id'] = Variable<int>(purchaseOrderId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productUnitId.present) {
      map['product_unit_id'] = Variable<int>(productUnitId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (unitName.present) {
      map['unit_name'] = Variable<String>(unitName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (conversionFactor.present) {
      map['conversion_factor'] = Variable<double>(conversionFactor.value);
    }
    if (baseQuantity.present) {
      map['base_quantity'] = Variable<double>(baseQuantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (baseUnitCost.present) {
      map['base_unit_cost'] = Variable<double>(baseUnitCost.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseItemsCompanion(')
          ..write('id: $id, ')
          ..write('purchaseOrderId: $purchaseOrderId, ')
          ..write('productId: $productId, ')
          ..write('productUnitId: $productUnitId, ')
          ..write('productName: $productName, ')
          ..write('unitName: $unitName, ')
          ..write('quantity: $quantity, ')
          ..write('conversionFactor: $conversionFactor, ')
          ..write('baseQuantity: $baseQuantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('baseUnitCost: $baseUnitCost, ')
          ..write('total: $total, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $PurchaseReceiptsTable extends PurchaseReceipts
    with TableInfo<$PurchaseReceiptsTable, PurchaseReceiptDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseReceiptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _purchaseOrderIdMeta =
      const VerificationMeta('purchaseOrderId');
  @override
  late final GeneratedColumn<int> purchaseOrderId = GeneratedColumn<int>(
      'purchase_order_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _receiptNumberMeta =
      const VerificationMeta('receiptNumber');
  @override
  late final GeneratedColumn<String> receiptNumber = GeneratedColumn<String>(
      'receipt_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _receivedAtMeta =
      const VerificationMeta('receivedAt');
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
      'received_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('draft'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _internalNotesMeta =
      const VerificationMeta('internalNotes');
  @override
  late final GeneratedColumn<String> internalNotes = GeneratedColumn<String>(
      'internal_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        purchaseOrderId,
        receiptNumber,
        receivedAt,
        status,
        notes,
        internalNotes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_receipts';
  @override
  VerificationContext validateIntegrity(Insertable<PurchaseReceiptDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('purchase_order_id')) {
      context.handle(
          _purchaseOrderIdMeta,
          purchaseOrderId.isAcceptableOrUnknown(
              data['purchase_order_id']!, _purchaseOrderIdMeta));
    } else if (isInserting) {
      context.missing(_purchaseOrderIdMeta);
    }
    if (data.containsKey('receipt_number')) {
      context.handle(
          _receiptNumberMeta,
          receiptNumber.isAcceptableOrUnknown(
              data['receipt_number']!, _receiptNumberMeta));
    } else if (isInserting) {
      context.missing(_receiptNumberMeta);
    }
    if (data.containsKey('received_at')) {
      context.handle(
          _receivedAtMeta,
          receivedAt.isAcceptableOrUnknown(
              data['received_at']!, _receivedAtMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('internal_notes')) {
      context.handle(
          _internalNotesMeta,
          internalNotes.isAcceptableOrUnknown(
              data['internal_notes']!, _internalNotesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseReceiptDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseReceiptDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      purchaseOrderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_order_id'])!,
      receiptNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_number'])!,
      receivedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}received_at'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      internalNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}internal_notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PurchaseReceiptsTable createAlias(String alias) {
    return $PurchaseReceiptsTable(attachedDatabase, alias);
  }
}

class PurchaseReceiptDb extends DataClass
    implements Insertable<PurchaseReceiptDb> {
  final int id;
  final int purchaseOrderId;
  final String receiptNumber;
  final DateTime receivedAt;
  final String status;
  final String? notes;
  final String? internalNotes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PurchaseReceiptDb(
      {required this.id,
      required this.purchaseOrderId,
      required this.receiptNumber,
      required this.receivedAt,
      required this.status,
      this.notes,
      this.internalNotes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['purchase_order_id'] = Variable<int>(purchaseOrderId);
    map['receipt_number'] = Variable<String>(receiptNumber);
    map['received_at'] = Variable<DateTime>(receivedAt);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || internalNotes != null) {
      map['internal_notes'] = Variable<String>(internalNotes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PurchaseReceiptsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseReceiptsCompanion(
      id: Value(id),
      purchaseOrderId: Value(purchaseOrderId),
      receiptNumber: Value(receiptNumber),
      receivedAt: Value(receivedAt),
      status: Value(status),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      internalNotes: internalNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(internalNotes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PurchaseReceiptDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseReceiptDb(
      id: serializer.fromJson<int>(json['id']),
      purchaseOrderId: serializer.fromJson<int>(json['purchaseOrderId']),
      receiptNumber: serializer.fromJson<String>(json['receiptNumber']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      internalNotes: serializer.fromJson<String?>(json['internalNotes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'purchaseOrderId': serializer.toJson<int>(purchaseOrderId),
      'receiptNumber': serializer.toJson<String>(receiptNumber),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'internalNotes': serializer.toJson<String?>(internalNotes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PurchaseReceiptDb copyWith(
          {int? id,
          int? purchaseOrderId,
          String? receiptNumber,
          DateTime? receivedAt,
          String? status,
          Value<String?> notes = const Value.absent(),
          Value<String?> internalNotes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PurchaseReceiptDb(
        id: id ?? this.id,
        purchaseOrderId: purchaseOrderId ?? this.purchaseOrderId,
        receiptNumber: receiptNumber ?? this.receiptNumber,
        receivedAt: receivedAt ?? this.receivedAt,
        status: status ?? this.status,
        notes: notes.present ? notes.value : this.notes,
        internalNotes:
            internalNotes.present ? internalNotes.value : this.internalNotes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PurchaseReceiptDb copyWithCompanion(PurchaseReceiptsCompanion data) {
    return PurchaseReceiptDb(
      id: data.id.present ? data.id.value : this.id,
      purchaseOrderId: data.purchaseOrderId.present
          ? data.purchaseOrderId.value
          : this.purchaseOrderId,
      receiptNumber: data.receiptNumber.present
          ? data.receiptNumber.value
          : this.receiptNumber,
      receivedAt:
          data.receivedAt.present ? data.receivedAt.value : this.receivedAt,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      internalNotes: data.internalNotes.present
          ? data.internalNotes.value
          : this.internalNotes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseReceiptDb(')
          ..write('id: $id, ')
          ..write('purchaseOrderId: $purchaseOrderId, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('internalNotes: $internalNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, purchaseOrderId, receiptNumber,
      receivedAt, status, notes, internalNotes, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseReceiptDb &&
          other.id == this.id &&
          other.purchaseOrderId == this.purchaseOrderId &&
          other.receiptNumber == this.receiptNumber &&
          other.receivedAt == this.receivedAt &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.internalNotes == this.internalNotes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PurchaseReceiptsCompanion extends UpdateCompanion<PurchaseReceiptDb> {
  final Value<int> id;
  final Value<int> purchaseOrderId;
  final Value<String> receiptNumber;
  final Value<DateTime> receivedAt;
  final Value<String> status;
  final Value<String?> notes;
  final Value<String?> internalNotes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PurchaseReceiptsCompanion({
    this.id = const Value.absent(),
    this.purchaseOrderId = const Value.absent(),
    this.receiptNumber = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.internalNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PurchaseReceiptsCompanion.insert({
    this.id = const Value.absent(),
    required int purchaseOrderId,
    required String receiptNumber,
    this.receivedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.internalNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : purchaseOrderId = Value(purchaseOrderId),
        receiptNumber = Value(receiptNumber);
  static Insertable<PurchaseReceiptDb> custom({
    Expression<int>? id,
    Expression<int>? purchaseOrderId,
    Expression<String>? receiptNumber,
    Expression<DateTime>? receivedAt,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<String>? internalNotes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (purchaseOrderId != null) 'purchase_order_id': purchaseOrderId,
      if (receiptNumber != null) 'receipt_number': receiptNumber,
      if (receivedAt != null) 'received_at': receivedAt,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (internalNotes != null) 'internal_notes': internalNotes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PurchaseReceiptsCompanion copyWith(
      {Value<int>? id,
      Value<int>? purchaseOrderId,
      Value<String>? receiptNumber,
      Value<DateTime>? receivedAt,
      Value<String>? status,
      Value<String?>? notes,
      Value<String?>? internalNotes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return PurchaseReceiptsCompanion(
      id: id ?? this.id,
      purchaseOrderId: purchaseOrderId ?? this.purchaseOrderId,
      receiptNumber: receiptNumber ?? this.receiptNumber,
      receivedAt: receivedAt ?? this.receivedAt,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      internalNotes: internalNotes ?? this.internalNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (purchaseOrderId.present) {
      map['purchase_order_id'] = Variable<int>(purchaseOrderId.value);
    }
    if (receiptNumber.present) {
      map['receipt_number'] = Variable<String>(receiptNumber.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (internalNotes.present) {
      map['internal_notes'] = Variable<String>(internalNotes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('purchaseOrderId: $purchaseOrderId, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('internalNotes: $internalNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PurchaseReceiptItemsTable extends PurchaseReceiptItems
    with TableInfo<$PurchaseReceiptItemsTable, PurchaseReceiptItemDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseReceiptItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _purchaseReceiptIdMeta =
      const VerificationMeta('purchaseReceiptId');
  @override
  late final GeneratedColumn<int> purchaseReceiptId = GeneratedColumn<int>(
      'purchase_receipt_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _purchaseItemIdMeta =
      const VerificationMeta('purchaseItemId');
  @override
  late final GeneratedColumn<int> purchaseItemId = GeneratedColumn<int>(
      'purchase_item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _rejectedQuantityMeta =
      const VerificationMeta('rejectedQuantity');
  @override
  late final GeneratedColumn<double> rejectedQuantity = GeneratedColumn<double>(
      'rejected_quantity', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        purchaseReceiptId,
        purchaseItemId,
        quantity,
        rejectedQuantity,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_receipt_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<PurchaseReceiptItemDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('purchase_receipt_id')) {
      context.handle(
          _purchaseReceiptIdMeta,
          purchaseReceiptId.isAcceptableOrUnknown(
              data['purchase_receipt_id']!, _purchaseReceiptIdMeta));
    } else if (isInserting) {
      context.missing(_purchaseReceiptIdMeta);
    }
    if (data.containsKey('purchase_item_id')) {
      context.handle(
          _purchaseItemIdMeta,
          purchaseItemId.isAcceptableOrUnknown(
              data['purchase_item_id']!, _purchaseItemIdMeta));
    } else if (isInserting) {
      context.missing(_purchaseItemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('rejected_quantity')) {
      context.handle(
          _rejectedQuantityMeta,
          rejectedQuantity.isAcceptableOrUnknown(
              data['rejected_quantity']!, _rejectedQuantityMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseReceiptItemDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseReceiptItemDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      purchaseReceiptId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}purchase_receipt_id'])!,
      purchaseItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_item_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      rejectedQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}rejected_quantity'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $PurchaseReceiptItemsTable createAlias(String alias) {
    return $PurchaseReceiptItemsTable(attachedDatabase, alias);
  }
}

class PurchaseReceiptItemDb extends DataClass
    implements Insertable<PurchaseReceiptItemDb> {
  final int id;
  final int purchaseReceiptId;
  final int purchaseItemId;
  final double quantity;
  final double rejectedQuantity;
  final String? notes;
  const PurchaseReceiptItemDb(
      {required this.id,
      required this.purchaseReceiptId,
      required this.purchaseItemId,
      required this.quantity,
      required this.rejectedQuantity,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['purchase_receipt_id'] = Variable<int>(purchaseReceiptId);
    map['purchase_item_id'] = Variable<int>(purchaseItemId);
    map['quantity'] = Variable<double>(quantity);
    map['rejected_quantity'] = Variable<double>(rejectedQuantity);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PurchaseReceiptItemsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseReceiptItemsCompanion(
      id: Value(id),
      purchaseReceiptId: Value(purchaseReceiptId),
      purchaseItemId: Value(purchaseItemId),
      quantity: Value(quantity),
      rejectedQuantity: Value(rejectedQuantity),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory PurchaseReceiptItemDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseReceiptItemDb(
      id: serializer.fromJson<int>(json['id']),
      purchaseReceiptId: serializer.fromJson<int>(json['purchaseReceiptId']),
      purchaseItemId: serializer.fromJson<int>(json['purchaseItemId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      rejectedQuantity: serializer.fromJson<double>(json['rejectedQuantity']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'purchaseReceiptId': serializer.toJson<int>(purchaseReceiptId),
      'purchaseItemId': serializer.toJson<int>(purchaseItemId),
      'quantity': serializer.toJson<double>(quantity),
      'rejectedQuantity': serializer.toJson<double>(rejectedQuantity),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  PurchaseReceiptItemDb copyWith(
          {int? id,
          int? purchaseReceiptId,
          int? purchaseItemId,
          double? quantity,
          double? rejectedQuantity,
          Value<String?> notes = const Value.absent()}) =>
      PurchaseReceiptItemDb(
        id: id ?? this.id,
        purchaseReceiptId: purchaseReceiptId ?? this.purchaseReceiptId,
        purchaseItemId: purchaseItemId ?? this.purchaseItemId,
        quantity: quantity ?? this.quantity,
        rejectedQuantity: rejectedQuantity ?? this.rejectedQuantity,
        notes: notes.present ? notes.value : this.notes,
      );
  PurchaseReceiptItemDb copyWithCompanion(PurchaseReceiptItemsCompanion data) {
    return PurchaseReceiptItemDb(
      id: data.id.present ? data.id.value : this.id,
      purchaseReceiptId: data.purchaseReceiptId.present
          ? data.purchaseReceiptId.value
          : this.purchaseReceiptId,
      purchaseItemId: data.purchaseItemId.present
          ? data.purchaseItemId.value
          : this.purchaseItemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      rejectedQuantity: data.rejectedQuantity.present
          ? data.rejectedQuantity.value
          : this.rejectedQuantity,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseReceiptItemDb(')
          ..write('id: $id, ')
          ..write('purchaseReceiptId: $purchaseReceiptId, ')
          ..write('purchaseItemId: $purchaseItemId, ')
          ..write('quantity: $quantity, ')
          ..write('rejectedQuantity: $rejectedQuantity, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, purchaseReceiptId, purchaseItemId, quantity, rejectedQuantity, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseReceiptItemDb &&
          other.id == this.id &&
          other.purchaseReceiptId == this.purchaseReceiptId &&
          other.purchaseItemId == this.purchaseItemId &&
          other.quantity == this.quantity &&
          other.rejectedQuantity == this.rejectedQuantity &&
          other.notes == this.notes);
}

class PurchaseReceiptItemsCompanion
    extends UpdateCompanion<PurchaseReceiptItemDb> {
  final Value<int> id;
  final Value<int> purchaseReceiptId;
  final Value<int> purchaseItemId;
  final Value<double> quantity;
  final Value<double> rejectedQuantity;
  final Value<String?> notes;
  const PurchaseReceiptItemsCompanion({
    this.id = const Value.absent(),
    this.purchaseReceiptId = const Value.absent(),
    this.purchaseItemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rejectedQuantity = const Value.absent(),
    this.notes = const Value.absent(),
  });
  PurchaseReceiptItemsCompanion.insert({
    this.id = const Value.absent(),
    required int purchaseReceiptId,
    required int purchaseItemId,
    required double quantity,
    this.rejectedQuantity = const Value.absent(),
    this.notes = const Value.absent(),
  })  : purchaseReceiptId = Value(purchaseReceiptId),
        purchaseItemId = Value(purchaseItemId),
        quantity = Value(quantity);
  static Insertable<PurchaseReceiptItemDb> custom({
    Expression<int>? id,
    Expression<int>? purchaseReceiptId,
    Expression<int>? purchaseItemId,
    Expression<double>? quantity,
    Expression<double>? rejectedQuantity,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (purchaseReceiptId != null) 'purchase_receipt_id': purchaseReceiptId,
      if (purchaseItemId != null) 'purchase_item_id': purchaseItemId,
      if (quantity != null) 'quantity': quantity,
      if (rejectedQuantity != null) 'rejected_quantity': rejectedQuantity,
      if (notes != null) 'notes': notes,
    });
  }

  PurchaseReceiptItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? purchaseReceiptId,
      Value<int>? purchaseItemId,
      Value<double>? quantity,
      Value<double>? rejectedQuantity,
      Value<String?>? notes}) {
    return PurchaseReceiptItemsCompanion(
      id: id ?? this.id,
      purchaseReceiptId: purchaseReceiptId ?? this.purchaseReceiptId,
      purchaseItemId: purchaseItemId ?? this.purchaseItemId,
      quantity: quantity ?? this.quantity,
      rejectedQuantity: rejectedQuantity ?? this.rejectedQuantity,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (purchaseReceiptId.present) {
      map['purchase_receipt_id'] = Variable<int>(purchaseReceiptId.value);
    }
    if (purchaseItemId.present) {
      map['purchase_item_id'] = Variable<int>(purchaseItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (rejectedQuantity.present) {
      map['rejected_quantity'] = Variable<double>(rejectedQuantity.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseReceiptItemsCompanion(')
          ..write('id: $id, ')
          ..write('purchaseReceiptId: $purchaseReceiptId, ')
          ..write('purchaseItemId: $purchaseItemId, ')
          ..write('quantity: $quantity, ')
          ..write('rejectedQuantity: $rejectedQuantity, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $PurchasePaymentsTable extends PurchasePayments
    with TableInfo<$PurchasePaymentsTable, PurchasePaymentDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchasePaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _purchaseOrderIdMeta =
      const VerificationMeta('purchaseOrderId');
  @override
  late final GeneratedColumn<int> purchaseOrderId = GeneratedColumn<int>(
      'purchase_order_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _paymentNumberMeta =
      const VerificationMeta('paymentNumber');
  @override
  late final GeneratedColumn<String> paymentNumber = GeneratedColumn<String>(
      'payment_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('cash'));
  static const VerificationMeta _referenceNumberMeta =
      const VerificationMeta('referenceNumber');
  @override
  late final GeneratedColumn<String> referenceNumber = GeneratedColumn<String>(
      'reference_number', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        purchaseOrderId,
        paymentNumber,
        amount,
        paymentDate,
        paymentMethod,
        referenceNumber,
        notes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_payments';
  @override
  VerificationContext validateIntegrity(Insertable<PurchasePaymentDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('purchase_order_id')) {
      context.handle(
          _purchaseOrderIdMeta,
          purchaseOrderId.isAcceptableOrUnknown(
              data['purchase_order_id']!, _purchaseOrderIdMeta));
    } else if (isInserting) {
      context.missing(_purchaseOrderIdMeta);
    }
    if (data.containsKey('payment_number')) {
      context.handle(
          _paymentNumberMeta,
          paymentNumber.isAcceptableOrUnknown(
              data['payment_number']!, _paymentNumberMeta));
    } else if (isInserting) {
      context.missing(_paymentNumberMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('reference_number')) {
      context.handle(
          _referenceNumberMeta,
          referenceNumber.isAcceptableOrUnknown(
              data['reference_number']!, _referenceNumberMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchasePaymentDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchasePaymentDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      purchaseOrderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_order_id'])!,
      paymentNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_number'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      referenceNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reference_number']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PurchasePaymentsTable createAlias(String alias) {
    return $PurchasePaymentsTable(attachedDatabase, alias);
  }
}

class PurchasePaymentDb extends DataClass
    implements Insertable<PurchasePaymentDb> {
  final int id;
  final int purchaseOrderId;
  final String paymentNumber;
  final double amount;
  final DateTime paymentDate;
  final String paymentMethod;
  final String? referenceNumber;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PurchasePaymentDb(
      {required this.id,
      required this.purchaseOrderId,
      required this.paymentNumber,
      required this.amount,
      required this.paymentDate,
      required this.paymentMethod,
      this.referenceNumber,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['purchase_order_id'] = Variable<int>(purchaseOrderId);
    map['payment_number'] = Variable<String>(paymentNumber);
    map['amount'] = Variable<double>(amount);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['payment_method'] = Variable<String>(paymentMethod);
    if (!nullToAbsent || referenceNumber != null) {
      map['reference_number'] = Variable<String>(referenceNumber);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PurchasePaymentsCompanion toCompanion(bool nullToAbsent) {
    return PurchasePaymentsCompanion(
      id: Value(id),
      purchaseOrderId: Value(purchaseOrderId),
      paymentNumber: Value(paymentNumber),
      amount: Value(amount),
      paymentDate: Value(paymentDate),
      paymentMethod: Value(paymentMethod),
      referenceNumber: referenceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceNumber),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PurchasePaymentDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchasePaymentDb(
      id: serializer.fromJson<int>(json['id']),
      purchaseOrderId: serializer.fromJson<int>(json['purchaseOrderId']),
      paymentNumber: serializer.fromJson<String>(json['paymentNumber']),
      amount: serializer.fromJson<double>(json['amount']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      referenceNumber: serializer.fromJson<String?>(json['referenceNumber']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'purchaseOrderId': serializer.toJson<int>(purchaseOrderId),
      'paymentNumber': serializer.toJson<String>(paymentNumber),
      'amount': serializer.toJson<double>(amount),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'referenceNumber': serializer.toJson<String?>(referenceNumber),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PurchasePaymentDb copyWith(
          {int? id,
          int? purchaseOrderId,
          String? paymentNumber,
          double? amount,
          DateTime? paymentDate,
          String? paymentMethod,
          Value<String?> referenceNumber = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PurchasePaymentDb(
        id: id ?? this.id,
        purchaseOrderId: purchaseOrderId ?? this.purchaseOrderId,
        paymentNumber: paymentNumber ?? this.paymentNumber,
        amount: amount ?? this.amount,
        paymentDate: paymentDate ?? this.paymentDate,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        referenceNumber: referenceNumber.present
            ? referenceNumber.value
            : this.referenceNumber,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PurchasePaymentDb copyWithCompanion(PurchasePaymentsCompanion data) {
    return PurchasePaymentDb(
      id: data.id.present ? data.id.value : this.id,
      purchaseOrderId: data.purchaseOrderId.present
          ? data.purchaseOrderId.value
          : this.purchaseOrderId,
      paymentNumber: data.paymentNumber.present
          ? data.paymentNumber.value
          : this.paymentNumber,
      amount: data.amount.present ? data.amount.value : this.amount,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      referenceNumber: data.referenceNumber.present
          ? data.referenceNumber.value
          : this.referenceNumber,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchasePaymentDb(')
          ..write('id: $id, ')
          ..write('purchaseOrderId: $purchaseOrderId, ')
          ..write('paymentNumber: $paymentNumber, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, purchaseOrderId, paymentNumber, amount,
      paymentDate, paymentMethod, referenceNumber, notes, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchasePaymentDb &&
          other.id == this.id &&
          other.purchaseOrderId == this.purchaseOrderId &&
          other.paymentNumber == this.paymentNumber &&
          other.amount == this.amount &&
          other.paymentDate == this.paymentDate &&
          other.paymentMethod == this.paymentMethod &&
          other.referenceNumber == this.referenceNumber &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PurchasePaymentsCompanion extends UpdateCompanion<PurchasePaymentDb> {
  final Value<int> id;
  final Value<int> purchaseOrderId;
  final Value<String> paymentNumber;
  final Value<double> amount;
  final Value<DateTime> paymentDate;
  final Value<String> paymentMethod;
  final Value<String?> referenceNumber;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PurchasePaymentsCompanion({
    this.id = const Value.absent(),
    this.purchaseOrderId = const Value.absent(),
    this.paymentNumber = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PurchasePaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int purchaseOrderId,
    required String paymentNumber,
    required double amount,
    this.paymentDate = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : purchaseOrderId = Value(purchaseOrderId),
        paymentNumber = Value(paymentNumber),
        amount = Value(amount);
  static Insertable<PurchasePaymentDb> custom({
    Expression<int>? id,
    Expression<int>? purchaseOrderId,
    Expression<String>? paymentNumber,
    Expression<double>? amount,
    Expression<DateTime>? paymentDate,
    Expression<String>? paymentMethod,
    Expression<String>? referenceNumber,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (purchaseOrderId != null) 'purchase_order_id': purchaseOrderId,
      if (paymentNumber != null) 'payment_number': paymentNumber,
      if (amount != null) 'amount': amount,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (referenceNumber != null) 'reference_number': referenceNumber,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PurchasePaymentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? purchaseOrderId,
      Value<String>? paymentNumber,
      Value<double>? amount,
      Value<DateTime>? paymentDate,
      Value<String>? paymentMethod,
      Value<String?>? referenceNumber,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return PurchasePaymentsCompanion(
      id: id ?? this.id,
      purchaseOrderId: purchaseOrderId ?? this.purchaseOrderId,
      paymentNumber: paymentNumber ?? this.paymentNumber,
      amount: amount ?? this.amount,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (purchaseOrderId.present) {
      map['purchase_order_id'] = Variable<int>(purchaseOrderId.value);
    }
    if (paymentNumber.present) {
      map['payment_number'] = Variable<String>(paymentNumber.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (referenceNumber.present) {
      map['reference_number'] = Variable<String>(referenceNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchasePaymentsCompanion(')
          ..write('id: $id, ')
          ..write('purchaseOrderId: $purchaseOrderId, ')
          ..write('paymentNumber: $paymentNumber, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SupplierProductsTable extends SupplierProducts
    with TableInfo<$SupplierProductsTable, SupplierProductDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _supplierIdMeta =
      const VerificationMeta('supplierId');
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
      'supplier_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productUnitIdMeta =
      const VerificationMeta('productUnitId');
  @override
  late final GeneratedColumn<int> productUnitId = GeneratedColumn<int>(
      'product_unit_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _supplierProductCodeMeta =
      const VerificationMeta('supplierProductCode');
  @override
  late final GeneratedColumn<String> supplierProductCode =
      GeneratedColumn<String>('supplier_product_code', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _supplierBarcodeMeta =
      const VerificationMeta('supplierBarcode');
  @override
  late final GeneratedColumn<String> supplierBarcode = GeneratedColumn<String>(
      'supplier_barcode', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _purchasePriceMeta =
      const VerificationMeta('purchasePrice');
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
      'purchase_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _minimumOrderQuantityMeta =
      const VerificationMeta('minimumOrderQuantity');
  @override
  late final GeneratedColumn<double> minimumOrderQuantity =
      GeneratedColumn<double>('minimum_order_quantity', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(1.0));
  static const VerificationMeta _maximumOrderQuantityMeta =
      const VerificationMeta('maximumOrderQuantity');
  @override
  late final GeneratedColumn<double> maximumOrderQuantity =
      GeneratedColumn<double>('maximum_order_quantity', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0.0));
  static const VerificationMeta _deliveryDaysMeta =
      const VerificationMeta('deliveryDays');
  @override
  late final GeneratedColumn<int> deliveryDays = GeneratedColumn<int>(
      'delivery_days', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isPreferredMeta =
      const VerificationMeta('isPreferred');
  @override
  late final GeneratedColumn<bool> isPreferred = GeneratedColumn<bool>(
      'is_preferred', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_preferred" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _lastPurchaseAtMeta =
      const VerificationMeta('lastPurchaseAt');
  @override
  late final GeneratedColumn<DateTime> lastPurchaseAt =
      GeneratedColumn<DateTime>('last_purchase_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastPurchasedPriceMeta =
      const VerificationMeta('lastPurchasedPrice');
  @override
  late final GeneratedColumn<double> lastPurchasedPrice =
      GeneratedColumn<double>('last_purchased_price', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0.0));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        supplierId,
        productId,
        productUnitId,
        supplierProductCode,
        supplierBarcode,
        purchasePrice,
        minimumOrderQuantity,
        maximumOrderQuantity,
        deliveryDays,
        isPreferred,
        isActive,
        lastPurchaseAt,
        lastPurchasedPrice,
        notes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier_products';
  @override
  VerificationContext validateIntegrity(Insertable<SupplierProductDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
          _supplierIdMeta,
          supplierId.isAcceptableOrUnknown(
              data['supplier_id']!, _supplierIdMeta));
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_unit_id')) {
      context.handle(
          _productUnitIdMeta,
          productUnitId.isAcceptableOrUnknown(
              data['product_unit_id']!, _productUnitIdMeta));
    }
    if (data.containsKey('supplier_product_code')) {
      context.handle(
          _supplierProductCodeMeta,
          supplierProductCode.isAcceptableOrUnknown(
              data['supplier_product_code']!, _supplierProductCodeMeta));
    }
    if (data.containsKey('supplier_barcode')) {
      context.handle(
          _supplierBarcodeMeta,
          supplierBarcode.isAcceptableOrUnknown(
              data['supplier_barcode']!, _supplierBarcodeMeta));
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
          _purchasePriceMeta,
          purchasePrice.isAcceptableOrUnknown(
              data['purchase_price']!, _purchasePriceMeta));
    }
    if (data.containsKey('minimum_order_quantity')) {
      context.handle(
          _minimumOrderQuantityMeta,
          minimumOrderQuantity.isAcceptableOrUnknown(
              data['minimum_order_quantity']!, _minimumOrderQuantityMeta));
    }
    if (data.containsKey('maximum_order_quantity')) {
      context.handle(
          _maximumOrderQuantityMeta,
          maximumOrderQuantity.isAcceptableOrUnknown(
              data['maximum_order_quantity']!, _maximumOrderQuantityMeta));
    }
    if (data.containsKey('delivery_days')) {
      context.handle(
          _deliveryDaysMeta,
          deliveryDays.isAcceptableOrUnknown(
              data['delivery_days']!, _deliveryDaysMeta));
    }
    if (data.containsKey('is_preferred')) {
      context.handle(
          _isPreferredMeta,
          isPreferred.isAcceptableOrUnknown(
              data['is_preferred']!, _isPreferredMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('last_purchase_at')) {
      context.handle(
          _lastPurchaseAtMeta,
          lastPurchaseAt.isAcceptableOrUnknown(
              data['last_purchase_at']!, _lastPurchaseAtMeta));
    }
    if (data.containsKey('last_purchased_price')) {
      context.handle(
          _lastPurchasedPriceMeta,
          lastPurchasedPrice.isAcceptableOrUnknown(
              data['last_purchased_price']!, _lastPurchasedPriceMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {supplierId, productId},
      ];
  @override
  SupplierProductDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierProductDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      supplierId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}supplier_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      productUnitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_unit_id']),
      supplierProductCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}supplier_product_code']),
      supplierBarcode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}supplier_barcode']),
      purchasePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}purchase_price'])!,
      minimumOrderQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}minimum_order_quantity'])!,
      maximumOrderQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}maximum_order_quantity'])!,
      deliveryDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}delivery_days'])!,
      isPreferred: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_preferred'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      lastPurchaseAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_purchase_at']),
      lastPurchasedPrice: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}last_purchased_price'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SupplierProductsTable createAlias(String alias) {
    return $SupplierProductsTable(attachedDatabase, alias);
  }
}

class SupplierProductDb extends DataClass
    implements Insertable<SupplierProductDb> {
  final int id;
  final int supplierId;
  final int productId;
  final int? productUnitId;
  final String? supplierProductCode;
  final String? supplierBarcode;
  final double purchasePrice;
  final double minimumOrderQuantity;
  final double maximumOrderQuantity;
  final int deliveryDays;
  final bool isPreferred;
  final bool isActive;
  final DateTime? lastPurchaseAt;
  final double lastPurchasedPrice;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SupplierProductDb(
      {required this.id,
      required this.supplierId,
      required this.productId,
      this.productUnitId,
      this.supplierProductCode,
      this.supplierBarcode,
      required this.purchasePrice,
      required this.minimumOrderQuantity,
      required this.maximumOrderQuantity,
      required this.deliveryDays,
      required this.isPreferred,
      required this.isActive,
      this.lastPurchaseAt,
      required this.lastPurchasedPrice,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['supplier_id'] = Variable<int>(supplierId);
    map['product_id'] = Variable<int>(productId);
    if (!nullToAbsent || productUnitId != null) {
      map['product_unit_id'] = Variable<int>(productUnitId);
    }
    if (!nullToAbsent || supplierProductCode != null) {
      map['supplier_product_code'] = Variable<String>(supplierProductCode);
    }
    if (!nullToAbsent || supplierBarcode != null) {
      map['supplier_barcode'] = Variable<String>(supplierBarcode);
    }
    map['purchase_price'] = Variable<double>(purchasePrice);
    map['minimum_order_quantity'] = Variable<double>(minimumOrderQuantity);
    map['maximum_order_quantity'] = Variable<double>(maximumOrderQuantity);
    map['delivery_days'] = Variable<int>(deliveryDays);
    map['is_preferred'] = Variable<bool>(isPreferred);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || lastPurchaseAt != null) {
      map['last_purchase_at'] = Variable<DateTime>(lastPurchaseAt);
    }
    map['last_purchased_price'] = Variable<double>(lastPurchasedPrice);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SupplierProductsCompanion toCompanion(bool nullToAbsent) {
    return SupplierProductsCompanion(
      id: Value(id),
      supplierId: Value(supplierId),
      productId: Value(productId),
      productUnitId: productUnitId == null && nullToAbsent
          ? const Value.absent()
          : Value(productUnitId),
      supplierProductCode: supplierProductCode == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierProductCode),
      supplierBarcode: supplierBarcode == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierBarcode),
      purchasePrice: Value(purchasePrice),
      minimumOrderQuantity: Value(minimumOrderQuantity),
      maximumOrderQuantity: Value(maximumOrderQuantity),
      deliveryDays: Value(deliveryDays),
      isPreferred: Value(isPreferred),
      isActive: Value(isActive),
      lastPurchaseAt: lastPurchaseAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPurchaseAt),
      lastPurchasedPrice: Value(lastPurchasedPrice),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SupplierProductDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierProductDb(
      id: serializer.fromJson<int>(json['id']),
      supplierId: serializer.fromJson<int>(json['supplierId']),
      productId: serializer.fromJson<int>(json['productId']),
      productUnitId: serializer.fromJson<int?>(json['productUnitId']),
      supplierProductCode:
          serializer.fromJson<String?>(json['supplierProductCode']),
      supplierBarcode: serializer.fromJson<String?>(json['supplierBarcode']),
      purchasePrice: serializer.fromJson<double>(json['purchasePrice']),
      minimumOrderQuantity:
          serializer.fromJson<double>(json['minimumOrderQuantity']),
      maximumOrderQuantity:
          serializer.fromJson<double>(json['maximumOrderQuantity']),
      deliveryDays: serializer.fromJson<int>(json['deliveryDays']),
      isPreferred: serializer.fromJson<bool>(json['isPreferred']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      lastPurchaseAt: serializer.fromJson<DateTime?>(json['lastPurchaseAt']),
      lastPurchasedPrice:
          serializer.fromJson<double>(json['lastPurchasedPrice']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplierId': serializer.toJson<int>(supplierId),
      'productId': serializer.toJson<int>(productId),
      'productUnitId': serializer.toJson<int?>(productUnitId),
      'supplierProductCode': serializer.toJson<String?>(supplierProductCode),
      'supplierBarcode': serializer.toJson<String?>(supplierBarcode),
      'purchasePrice': serializer.toJson<double>(purchasePrice),
      'minimumOrderQuantity': serializer.toJson<double>(minimumOrderQuantity),
      'maximumOrderQuantity': serializer.toJson<double>(maximumOrderQuantity),
      'deliveryDays': serializer.toJson<int>(deliveryDays),
      'isPreferred': serializer.toJson<bool>(isPreferred),
      'isActive': serializer.toJson<bool>(isActive),
      'lastPurchaseAt': serializer.toJson<DateTime?>(lastPurchaseAt),
      'lastPurchasedPrice': serializer.toJson<double>(lastPurchasedPrice),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SupplierProductDb copyWith(
          {int? id,
          int? supplierId,
          int? productId,
          Value<int?> productUnitId = const Value.absent(),
          Value<String?> supplierProductCode = const Value.absent(),
          Value<String?> supplierBarcode = const Value.absent(),
          double? purchasePrice,
          double? minimumOrderQuantity,
          double? maximumOrderQuantity,
          int? deliveryDays,
          bool? isPreferred,
          bool? isActive,
          Value<DateTime?> lastPurchaseAt = const Value.absent(),
          double? lastPurchasedPrice,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      SupplierProductDb(
        id: id ?? this.id,
        supplierId: supplierId ?? this.supplierId,
        productId: productId ?? this.productId,
        productUnitId:
            productUnitId.present ? productUnitId.value : this.productUnitId,
        supplierProductCode: supplierProductCode.present
            ? supplierProductCode.value
            : this.supplierProductCode,
        supplierBarcode: supplierBarcode.present
            ? supplierBarcode.value
            : this.supplierBarcode,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
        maximumOrderQuantity: maximumOrderQuantity ?? this.maximumOrderQuantity,
        deliveryDays: deliveryDays ?? this.deliveryDays,
        isPreferred: isPreferred ?? this.isPreferred,
        isActive: isActive ?? this.isActive,
        lastPurchaseAt:
            lastPurchaseAt.present ? lastPurchaseAt.value : this.lastPurchaseAt,
        lastPurchasedPrice: lastPurchasedPrice ?? this.lastPurchasedPrice,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SupplierProductDb copyWithCompanion(SupplierProductsCompanion data) {
    return SupplierProductDb(
      id: data.id.present ? data.id.value : this.id,
      supplierId:
          data.supplierId.present ? data.supplierId.value : this.supplierId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productUnitId: data.productUnitId.present
          ? data.productUnitId.value
          : this.productUnitId,
      supplierProductCode: data.supplierProductCode.present
          ? data.supplierProductCode.value
          : this.supplierProductCode,
      supplierBarcode: data.supplierBarcode.present
          ? data.supplierBarcode.value
          : this.supplierBarcode,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      minimumOrderQuantity: data.minimumOrderQuantity.present
          ? data.minimumOrderQuantity.value
          : this.minimumOrderQuantity,
      maximumOrderQuantity: data.maximumOrderQuantity.present
          ? data.maximumOrderQuantity.value
          : this.maximumOrderQuantity,
      deliveryDays: data.deliveryDays.present
          ? data.deliveryDays.value
          : this.deliveryDays,
      isPreferred:
          data.isPreferred.present ? data.isPreferred.value : this.isPreferred,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      lastPurchaseAt: data.lastPurchaseAt.present
          ? data.lastPurchaseAt.value
          : this.lastPurchaseAt,
      lastPurchasedPrice: data.lastPurchasedPrice.present
          ? data.lastPurchasedPrice.value
          : this.lastPurchasedPrice,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierProductDb(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('productId: $productId, ')
          ..write('productUnitId: $productUnitId, ')
          ..write('supplierProductCode: $supplierProductCode, ')
          ..write('supplierBarcode: $supplierBarcode, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('minimumOrderQuantity: $minimumOrderQuantity, ')
          ..write('maximumOrderQuantity: $maximumOrderQuantity, ')
          ..write('deliveryDays: $deliveryDays, ')
          ..write('isPreferred: $isPreferred, ')
          ..write('isActive: $isActive, ')
          ..write('lastPurchaseAt: $lastPurchaseAt, ')
          ..write('lastPurchasedPrice: $lastPurchasedPrice, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      supplierId,
      productId,
      productUnitId,
      supplierProductCode,
      supplierBarcode,
      purchasePrice,
      minimumOrderQuantity,
      maximumOrderQuantity,
      deliveryDays,
      isPreferred,
      isActive,
      lastPurchaseAt,
      lastPurchasedPrice,
      notes,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierProductDb &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.productId == this.productId &&
          other.productUnitId == this.productUnitId &&
          other.supplierProductCode == this.supplierProductCode &&
          other.supplierBarcode == this.supplierBarcode &&
          other.purchasePrice == this.purchasePrice &&
          other.minimumOrderQuantity == this.minimumOrderQuantity &&
          other.maximumOrderQuantity == this.maximumOrderQuantity &&
          other.deliveryDays == this.deliveryDays &&
          other.isPreferred == this.isPreferred &&
          other.isActive == this.isActive &&
          other.lastPurchaseAt == this.lastPurchaseAt &&
          other.lastPurchasedPrice == this.lastPurchasedPrice &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SupplierProductsCompanion extends UpdateCompanion<SupplierProductDb> {
  final Value<int> id;
  final Value<int> supplierId;
  final Value<int> productId;
  final Value<int?> productUnitId;
  final Value<String?> supplierProductCode;
  final Value<String?> supplierBarcode;
  final Value<double> purchasePrice;
  final Value<double> minimumOrderQuantity;
  final Value<double> maximumOrderQuantity;
  final Value<int> deliveryDays;
  final Value<bool> isPreferred;
  final Value<bool> isActive;
  final Value<DateTime?> lastPurchaseAt;
  final Value<double> lastPurchasedPrice;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SupplierProductsCompanion({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productUnitId = const Value.absent(),
    this.supplierProductCode = const Value.absent(),
    this.supplierBarcode = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.minimumOrderQuantity = const Value.absent(),
    this.maximumOrderQuantity = const Value.absent(),
    this.deliveryDays = const Value.absent(),
    this.isPreferred = const Value.absent(),
    this.isActive = const Value.absent(),
    this.lastPurchaseAt = const Value.absent(),
    this.lastPurchasedPrice = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SupplierProductsCompanion.insert({
    this.id = const Value.absent(),
    required int supplierId,
    required int productId,
    this.productUnitId = const Value.absent(),
    this.supplierProductCode = const Value.absent(),
    this.supplierBarcode = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.minimumOrderQuantity = const Value.absent(),
    this.maximumOrderQuantity = const Value.absent(),
    this.deliveryDays = const Value.absent(),
    this.isPreferred = const Value.absent(),
    this.isActive = const Value.absent(),
    this.lastPurchaseAt = const Value.absent(),
    this.lastPurchasedPrice = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : supplierId = Value(supplierId),
        productId = Value(productId);
  static Insertable<SupplierProductDb> custom({
    Expression<int>? id,
    Expression<int>? supplierId,
    Expression<int>? productId,
    Expression<int>? productUnitId,
    Expression<String>? supplierProductCode,
    Expression<String>? supplierBarcode,
    Expression<double>? purchasePrice,
    Expression<double>? minimumOrderQuantity,
    Expression<double>? maximumOrderQuantity,
    Expression<int>? deliveryDays,
    Expression<bool>? isPreferred,
    Expression<bool>? isActive,
    Expression<DateTime>? lastPurchaseAt,
    Expression<double>? lastPurchasedPrice,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (productId != null) 'product_id': productId,
      if (productUnitId != null) 'product_unit_id': productUnitId,
      if (supplierProductCode != null)
        'supplier_product_code': supplierProductCode,
      if (supplierBarcode != null) 'supplier_barcode': supplierBarcode,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (minimumOrderQuantity != null)
        'minimum_order_quantity': minimumOrderQuantity,
      if (maximumOrderQuantity != null)
        'maximum_order_quantity': maximumOrderQuantity,
      if (deliveryDays != null) 'delivery_days': deliveryDays,
      if (isPreferred != null) 'is_preferred': isPreferred,
      if (isActive != null) 'is_active': isActive,
      if (lastPurchaseAt != null) 'last_purchase_at': lastPurchaseAt,
      if (lastPurchasedPrice != null)
        'last_purchased_price': lastPurchasedPrice,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SupplierProductsCompanion copyWith(
      {Value<int>? id,
      Value<int>? supplierId,
      Value<int>? productId,
      Value<int?>? productUnitId,
      Value<String?>? supplierProductCode,
      Value<String?>? supplierBarcode,
      Value<double>? purchasePrice,
      Value<double>? minimumOrderQuantity,
      Value<double>? maximumOrderQuantity,
      Value<int>? deliveryDays,
      Value<bool>? isPreferred,
      Value<bool>? isActive,
      Value<DateTime?>? lastPurchaseAt,
      Value<double>? lastPurchasedPrice,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return SupplierProductsCompanion(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      productId: productId ?? this.productId,
      productUnitId: productUnitId ?? this.productUnitId,
      supplierProductCode: supplierProductCode ?? this.supplierProductCode,
      supplierBarcode: supplierBarcode ?? this.supplierBarcode,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      maximumOrderQuantity: maximumOrderQuantity ?? this.maximumOrderQuantity,
      deliveryDays: deliveryDays ?? this.deliveryDays,
      isPreferred: isPreferred ?? this.isPreferred,
      isActive: isActive ?? this.isActive,
      lastPurchaseAt: lastPurchaseAt ?? this.lastPurchaseAt,
      lastPurchasedPrice: lastPurchasedPrice ?? this.lastPurchasedPrice,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productUnitId.present) {
      map['product_unit_id'] = Variable<int>(productUnitId.value);
    }
    if (supplierProductCode.present) {
      map['supplier_product_code'] =
          Variable<String>(supplierProductCode.value);
    }
    if (supplierBarcode.present) {
      map['supplier_barcode'] = Variable<String>(supplierBarcode.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (minimumOrderQuantity.present) {
      map['minimum_order_quantity'] =
          Variable<double>(minimumOrderQuantity.value);
    }
    if (maximumOrderQuantity.present) {
      map['maximum_order_quantity'] =
          Variable<double>(maximumOrderQuantity.value);
    }
    if (deliveryDays.present) {
      map['delivery_days'] = Variable<int>(deliveryDays.value);
    }
    if (isPreferred.present) {
      map['is_preferred'] = Variable<bool>(isPreferred.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (lastPurchaseAt.present) {
      map['last_purchase_at'] = Variable<DateTime>(lastPurchaseAt.value);
    }
    if (lastPurchasedPrice.present) {
      map['last_purchased_price'] = Variable<double>(lastPurchasedPrice.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierProductsCompanion(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('productId: $productId, ')
          ..write('productUnitId: $productUnitId, ')
          ..write('supplierProductCode: $supplierProductCode, ')
          ..write('supplierBarcode: $supplierBarcode, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('minimumOrderQuantity: $minimumOrderQuantity, ')
          ..write('maximumOrderQuantity: $maximumOrderQuantity, ')
          ..write('deliveryDays: $deliveryDays, ')
          ..write('isPreferred: $isPreferred, ')
          ..write('isActive: $isActive, ')
          ..write('lastPurchaseAt: $lastPurchaseAt, ')
          ..write('lastPurchasedPrice: $lastPurchasedPrice, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SalesTable extends Sales with TableInfo<$SalesTable, SaleDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _invoiceNumberMeta =
      const VerificationMeta('invoiceNumber');
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
      'invoice_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('cash'));
  static const VerificationMeta _paymentStatusMeta =
      const VerificationMeta('paymentStatus');
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
      'payment_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('unpaid'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('completed'));
  static const VerificationMeta _cancelledAtMeta =
      const VerificationMeta('cancelledAt');
  @override
  late final GeneratedColumn<DateTime> cancelledAt = GeneratedColumn<DateTime>(
      'cancelled_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cancellationReasonMeta =
      const VerificationMeta('cancellationReason');
  @override
  late final GeneratedColumn<String> cancellationReason =
      GeneratedColumn<String>('cancellation_reason', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        invoiceNumber,
        subtotal,
        discount,
        total,
        paidAmount,
        paymentMethod,
        paymentStatus,
        status,
        cancelledAt,
        cancellationReason,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales';
  @override
  VerificationContext validateIntegrity(Insertable<SaleDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
          _invoiceNumberMeta,
          invoiceNumber.isAcceptableOrUnknown(
              data['invoice_number']!, _invoiceNumberMeta));
    } else if (isInserting) {
      context.missing(_invoiceNumberMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('payment_status')) {
      context.handle(
          _paymentStatusMeta,
          paymentStatus.isAcceptableOrUnknown(
              data['payment_status']!, _paymentStatusMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('cancelled_at')) {
      context.handle(
          _cancelledAtMeta,
          cancelledAt.isAcceptableOrUnknown(
              data['cancelled_at']!, _cancelledAtMeta));
    }
    if (data.containsKey('cancellation_reason')) {
      context.handle(
          _cancellationReasonMeta,
          cancellationReason.isAcceptableOrUnknown(
              data['cancellation_reason']!, _cancellationReasonMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SaleDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      invoiceNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_number'])!,
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_amount'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      paymentStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_status'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      cancelledAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cancelled_at']),
      cancellationReason: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cancellation_reason']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SalesTable createAlias(String alias) {
    return $SalesTable(attachedDatabase, alias);
  }
}

class SaleDb extends DataClass implements Insertable<SaleDb> {
  final int id;
  final String invoiceNumber;
  final double subtotal;
  final double discount;
  final double total;
  final double paidAmount;
  final String paymentMethod;
  final String paymentStatus;
  final String status;
  final DateTime? cancelledAt;
  final String? cancellationReason;
  final DateTime createdAt;
  const SaleDb(
      {required this.id,
      required this.invoiceNumber,
      required this.subtotal,
      required this.discount,
      required this.total,
      required this.paidAmount,
      required this.paymentMethod,
      required this.paymentStatus,
      required this.status,
      this.cancelledAt,
      this.cancellationReason,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_number'] = Variable<String>(invoiceNumber);
    map['subtotal'] = Variable<double>(subtotal);
    map['discount'] = Variable<double>(discount);
    map['total'] = Variable<double>(total);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['payment_status'] = Variable<String>(paymentStatus);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || cancelledAt != null) {
      map['cancelled_at'] = Variable<DateTime>(cancelledAt);
    }
    if (!nullToAbsent || cancellationReason != null) {
      map['cancellation_reason'] = Variable<String>(cancellationReason);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SalesCompanion toCompanion(bool nullToAbsent) {
    return SalesCompanion(
      id: Value(id),
      invoiceNumber: Value(invoiceNumber),
      subtotal: Value(subtotal),
      discount: Value(discount),
      total: Value(total),
      paidAmount: Value(paidAmount),
      paymentMethod: Value(paymentMethod),
      paymentStatus: Value(paymentStatus),
      status: Value(status),
      cancelledAt: cancelledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(cancelledAt),
      cancellationReason: cancellationReason == null && nullToAbsent
          ? const Value.absent()
          : Value(cancellationReason),
      createdAt: Value(createdAt),
    );
  }

  factory SaleDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleDb(
      id: serializer.fromJson<int>(json['id']),
      invoiceNumber: serializer.fromJson<String>(json['invoiceNumber']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      discount: serializer.fromJson<double>(json['discount']),
      total: serializer.fromJson<double>(json['total']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      status: serializer.fromJson<String>(json['status']),
      cancelledAt: serializer.fromJson<DateTime?>(json['cancelledAt']),
      cancellationReason:
          serializer.fromJson<String?>(json['cancellationReason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceNumber': serializer.toJson<String>(invoiceNumber),
      'subtotal': serializer.toJson<double>(subtotal),
      'discount': serializer.toJson<double>(discount),
      'total': serializer.toJson<double>(total),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'status': serializer.toJson<String>(status),
      'cancelledAt': serializer.toJson<DateTime?>(cancelledAt),
      'cancellationReason': serializer.toJson<String?>(cancellationReason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SaleDb copyWith(
          {int? id,
          String? invoiceNumber,
          double? subtotal,
          double? discount,
          double? total,
          double? paidAmount,
          String? paymentMethod,
          String? paymentStatus,
          String? status,
          Value<DateTime?> cancelledAt = const Value.absent(),
          Value<String?> cancellationReason = const Value.absent(),
          DateTime? createdAt}) =>
      SaleDb(
        id: id ?? this.id,
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        subtotal: subtotal ?? this.subtotal,
        discount: discount ?? this.discount,
        total: total ?? this.total,
        paidAmount: paidAmount ?? this.paidAmount,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        status: status ?? this.status,
        cancelledAt: cancelledAt.present ? cancelledAt.value : this.cancelledAt,
        cancellationReason: cancellationReason.present
            ? cancellationReason.value
            : this.cancellationReason,
        createdAt: createdAt ?? this.createdAt,
      );
  SaleDb copyWithCompanion(SalesCompanion data) {
    return SaleDb(
      id: data.id.present ? data.id.value : this.id,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discount: data.discount.present ? data.discount.value : this.discount,
      total: data.total.present ? data.total.value : this.total,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      status: data.status.present ? data.status.value : this.status,
      cancelledAt:
          data.cancelledAt.present ? data.cancelledAt.value : this.cancelledAt,
      cancellationReason: data.cancellationReason.present
          ? data.cancellationReason.value
          : this.cancellationReason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleDb(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('total: $total, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('status: $status, ')
          ..write('cancelledAt: $cancelledAt, ')
          ..write('cancellationReason: $cancellationReason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      invoiceNumber,
      subtotal,
      discount,
      total,
      paidAmount,
      paymentMethod,
      paymentStatus,
      status,
      cancelledAt,
      cancellationReason,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleDb &&
          other.id == this.id &&
          other.invoiceNumber == this.invoiceNumber &&
          other.subtotal == this.subtotal &&
          other.discount == this.discount &&
          other.total == this.total &&
          other.paidAmount == this.paidAmount &&
          other.paymentMethod == this.paymentMethod &&
          other.paymentStatus == this.paymentStatus &&
          other.status == this.status &&
          other.cancelledAt == this.cancelledAt &&
          other.cancellationReason == this.cancellationReason &&
          other.createdAt == this.createdAt);
}

class SalesCompanion extends UpdateCompanion<SaleDb> {
  final Value<int> id;
  final Value<String> invoiceNumber;
  final Value<double> subtotal;
  final Value<double> discount;
  final Value<double> total;
  final Value<double> paidAmount;
  final Value<String> paymentMethod;
  final Value<String> paymentStatus;
  final Value<String> status;
  final Value<DateTime?> cancelledAt;
  final Value<String?> cancellationReason;
  final Value<DateTime> createdAt;
  const SalesCompanion({
    this.id = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.total = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.status = const Value.absent(),
    this.cancelledAt = const Value.absent(),
    this.cancellationReason = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SalesCompanion.insert({
    this.id = const Value.absent(),
    required String invoiceNumber,
    required double subtotal,
    this.discount = const Value.absent(),
    required double total,
    this.paidAmount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.status = const Value.absent(),
    this.cancelledAt = const Value.absent(),
    this.cancellationReason = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : invoiceNumber = Value(invoiceNumber),
        subtotal = Value(subtotal),
        total = Value(total);
  static Insertable<SaleDb> custom({
    Expression<int>? id,
    Expression<String>? invoiceNumber,
    Expression<double>? subtotal,
    Expression<double>? discount,
    Expression<double>? total,
    Expression<double>? paidAmount,
    Expression<String>? paymentMethod,
    Expression<String>? paymentStatus,
    Expression<String>? status,
    Expression<DateTime>? cancelledAt,
    Expression<String>? cancellationReason,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (subtotal != null) 'subtotal': subtotal,
      if (discount != null) 'discount': discount,
      if (total != null) 'total': total,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (status != null) 'status': status,
      if (cancelledAt != null) 'cancelled_at': cancelledAt,
      if (cancellationReason != null) 'cancellation_reason': cancellationReason,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SalesCompanion copyWith(
      {Value<int>? id,
      Value<String>? invoiceNumber,
      Value<double>? subtotal,
      Value<double>? discount,
      Value<double>? total,
      Value<double>? paidAmount,
      Value<String>? paymentMethod,
      Value<String>? paymentStatus,
      Value<String>? status,
      Value<DateTime?>? cancelledAt,
      Value<String?>? cancellationReason,
      Value<DateTime>? createdAt}) {
    return SalesCompanion(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      paidAmount: paidAmount ?? this.paidAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      status: status ?? this.status,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      cancellationReason: cancellationReason ?? this.cancellationReason,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (cancelledAt.present) {
      map['cancelled_at'] = Variable<DateTime>(cancelledAt.value);
    }
    if (cancellationReason.present) {
      map['cancellation_reason'] = Variable<String>(cancellationReason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('total: $total, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('status: $status, ')
          ..write('cancelledAt: $cancelledAt, ')
          ..write('cancellationReason: $cancellationReason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SaleItemsTable extends SaleItems
    with TableInfo<$SaleItemsTable, SaleItemDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<int> saleId = GeneratedColumn<int>(
      'sale_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
      'unit_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _costPriceMeta =
      const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
      'cost_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        saleId,
        productId,
        productName,
        quantity,
        unitPrice,
        costPrice,
        total
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sale_items';
  @override
  VerificationContext validateIntegrity(Insertable<SaleItemDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sale_id')) {
      context.handle(_saleIdMeta,
          saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta));
    } else if (isInserting) {
      context.missing(_saleIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    } else if (isInserting) {
      context.missing(_costPriceMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SaleItemDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleItemDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      saleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sale_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_price'])!,
      costPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost_price'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
    );
  }

  @override
  $SaleItemsTable createAlias(String alias) {
    return $SaleItemsTable(attachedDatabase, alias);
  }
}

class SaleItemDb extends DataClass implements Insertable<SaleItemDb> {
  final int id;
  final int saleId;
  final int productId;
  final String productName;
  final double quantity;
  final double unitPrice;
  final double costPrice;
  final double total;
  const SaleItemDb(
      {required this.id,
      required this.saleId,
      required this.productId,
      required this.productName,
      required this.quantity,
      required this.unitPrice,
      required this.costPrice,
      required this.total});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sale_id'] = Variable<int>(saleId);
    map['product_id'] = Variable<int>(productId);
    map['product_name'] = Variable<String>(productName);
    map['quantity'] = Variable<double>(quantity);
    map['unit_price'] = Variable<double>(unitPrice);
    map['cost_price'] = Variable<double>(costPrice);
    map['total'] = Variable<double>(total);
    return map;
  }

  SaleItemsCompanion toCompanion(bool nullToAbsent) {
    return SaleItemsCompanion(
      id: Value(id),
      saleId: Value(saleId),
      productId: Value(productId),
      productName: Value(productName),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      costPrice: Value(costPrice),
      total: Value(total),
    );
  }

  factory SaleItemDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleItemDb(
      id: serializer.fromJson<int>(json['id']),
      saleId: serializer.fromJson<int>(json['saleId']),
      productId: serializer.fromJson<int>(json['productId']),
      productName: serializer.fromJson<String>(json['productName']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      total: serializer.fromJson<double>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'saleId': serializer.toJson<int>(saleId),
      'productId': serializer.toJson<int>(productId),
      'productName': serializer.toJson<String>(productName),
      'quantity': serializer.toJson<double>(quantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'costPrice': serializer.toJson<double>(costPrice),
      'total': serializer.toJson<double>(total),
    };
  }

  SaleItemDb copyWith(
          {int? id,
          int? saleId,
          int? productId,
          String? productName,
          double? quantity,
          double? unitPrice,
          double? costPrice,
          double? total}) =>
      SaleItemDb(
        id: id ?? this.id,
        saleId: saleId ?? this.saleId,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        costPrice: costPrice ?? this.costPrice,
        total: total ?? this.total,
      );
  SaleItemDb copyWithCompanion(SaleItemsCompanion data) {
    return SaleItemDb(
      id: data.id.present ? data.id.value : this.id,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      total: data.total.present ? data.total.value : this.total,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleItemDb(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, saleId, productId, productName, quantity,
      unitPrice, costPrice, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleItemDb &&
          other.id == this.id &&
          other.saleId == this.saleId &&
          other.productId == this.productId &&
          other.productName == this.productName &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.costPrice == this.costPrice &&
          other.total == this.total);
}

class SaleItemsCompanion extends UpdateCompanion<SaleItemDb> {
  final Value<int> id;
  final Value<int> saleId;
  final Value<int> productId;
  final Value<String> productName;
  final Value<double> quantity;
  final Value<double> unitPrice;
  final Value<double> costPrice;
  final Value<double> total;
  const SaleItemsCompanion({
    this.id = const Value.absent(),
    this.saleId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.total = const Value.absent(),
  });
  SaleItemsCompanion.insert({
    this.id = const Value.absent(),
    required int saleId,
    required int productId,
    required String productName,
    required double quantity,
    required double unitPrice,
    required double costPrice,
    required double total,
  })  : saleId = Value(saleId),
        productId = Value(productId),
        productName = Value(productName),
        quantity = Value(quantity),
        unitPrice = Value(unitPrice),
        costPrice = Value(costPrice),
        total = Value(total);
  static Insertable<SaleItemDb> custom({
    Expression<int>? id,
    Expression<int>? saleId,
    Expression<int>? productId,
    Expression<String>? productName,
    Expression<double>? quantity,
    Expression<double>? unitPrice,
    Expression<double>? costPrice,
    Expression<double>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (saleId != null) 'sale_id': saleId,
      if (productId != null) 'product_id': productId,
      if (productName != null) 'product_name': productName,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (costPrice != null) 'cost_price': costPrice,
      if (total != null) 'total': total,
    });
  }

  SaleItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? saleId,
      Value<int>? productId,
      Value<String>? productName,
      Value<double>? quantity,
      Value<double>? unitPrice,
      Value<double>? costPrice,
      Value<double>? total}) {
    return SaleItemsCompanion(
      id: id ?? this.id,
      saleId: saleId ?? this.saleId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      costPrice: costPrice ?? this.costPrice,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<int>(saleId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleItemsCompanion(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

class $StockMovementsTable extends StockMovements
    with TableInfo<$StockMovementsTable, StockMovementDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockMovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _referenceMeta =
      const VerificationMeta('reference');
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
      'reference', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, quantity, type, reference, note, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_movements';
  @override
  VerificationContext validateIntegrity(Insertable<StockMovementDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('reference')) {
      context.handle(_referenceMeta,
          reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockMovementDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockMovementDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      reference: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $StockMovementsTable createAlias(String alias) {
    return $StockMovementsTable(attachedDatabase, alias);
  }
}

class StockMovementDb extends DataClass implements Insertable<StockMovementDb> {
  final int id;
  final int productId;
  final double quantity;
  final String type;
  final String? reference;
  final String? note;
  final DateTime createdAt;
  const StockMovementDb(
      {required this.id,
      required this.productId,
      required this.quantity,
      required this.type,
      this.reference,
      this.note,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<double>(quantity);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || reference != null) {
      map['reference'] = Variable<String>(reference);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StockMovementsCompanion toCompanion(bool nullToAbsent) {
    return StockMovementsCompanion(
      id: Value(id),
      productId: Value(productId),
      quantity: Value(quantity),
      type: Value(type),
      reference: reference == null && nullToAbsent
          ? const Value.absent()
          : Value(reference),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory StockMovementDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockMovementDb(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      type: serializer.fromJson<String>(json['type']),
      reference: serializer.fromJson<String?>(json['reference']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<double>(quantity),
      'type': serializer.toJson<String>(type),
      'reference': serializer.toJson<String?>(reference),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  StockMovementDb copyWith(
          {int? id,
          int? productId,
          double? quantity,
          String? type,
          Value<String?> reference = const Value.absent(),
          Value<String?> note = const Value.absent(),
          DateTime? createdAt}) =>
      StockMovementDb(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        type: type ?? this.type,
        reference: reference.present ? reference.value : this.reference,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
      );
  StockMovementDb copyWithCompanion(StockMovementsCompanion data) {
    return StockMovementDb(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      type: data.type.present ? data.type.value : this.type,
      reference: data.reference.present ? data.reference.value : this.reference,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockMovementDb(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('type: $type, ')
          ..write('reference: $reference, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productId, quantity, type, reference, note, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockMovementDb &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.type == this.type &&
          other.reference == this.reference &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class StockMovementsCompanion extends UpdateCompanion<StockMovementDb> {
  final Value<int> id;
  final Value<int> productId;
  final Value<double> quantity;
  final Value<String> type;
  final Value<String?> reference;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  const StockMovementsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.type = const Value.absent(),
    this.reference = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  StockMovementsCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required double quantity,
    required String type,
    this.reference = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : productId = Value(productId),
        quantity = Value(quantity),
        type = Value(type);
  static Insertable<StockMovementDb> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<double>? quantity,
    Expression<String>? type,
    Expression<String>? reference,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (type != null) 'type': type,
      if (reference != null) 'reference': reference,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  StockMovementsCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<double>? quantity,
      Value<String>? type,
      Value<String?>? reference,
      Value<String?>? note,
      Value<DateTime>? createdAt}) {
    return StockMovementsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      type: type ?? this.type,
      reference: reference ?? this.reference,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockMovementsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('type: $type, ')
          ..write('reference: $reference, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ReturnsTable extends Returns with TableInfo<$ReturnsTable, ReturnDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReturnsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<int> saleId = GeneratedColumn<int>(
      'sale_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, saleId, total, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'returns';
  @override
  VerificationContext validateIntegrity(Insertable<ReturnDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sale_id')) {
      context.handle(_saleIdMeta,
          saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta));
    } else if (isInserting) {
      context.missing(_saleIdMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReturnDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReturnDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      saleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sale_id'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ReturnsTable createAlias(String alias) {
    return $ReturnsTable(attachedDatabase, alias);
  }
}

class ReturnDb extends DataClass implements Insertable<ReturnDb> {
  final int id;
  final int saleId;
  final double total;
  final DateTime createdAt;
  const ReturnDb(
      {required this.id,
      required this.saleId,
      required this.total,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sale_id'] = Variable<int>(saleId);
    map['total'] = Variable<double>(total);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ReturnsCompanion toCompanion(bool nullToAbsent) {
    return ReturnsCompanion(
      id: Value(id),
      saleId: Value(saleId),
      total: Value(total),
      createdAt: Value(createdAt),
    );
  }

  factory ReturnDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReturnDb(
      id: serializer.fromJson<int>(json['id']),
      saleId: serializer.fromJson<int>(json['saleId']),
      total: serializer.fromJson<double>(json['total']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'saleId': serializer.toJson<int>(saleId),
      'total': serializer.toJson<double>(total),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ReturnDb copyWith(
          {int? id, int? saleId, double? total, DateTime? createdAt}) =>
      ReturnDb(
        id: id ?? this.id,
        saleId: saleId ?? this.saleId,
        total: total ?? this.total,
        createdAt: createdAt ?? this.createdAt,
      );
  ReturnDb copyWithCompanion(ReturnsCompanion data) {
    return ReturnDb(
      id: data.id.present ? data.id.value : this.id,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
      total: data.total.present ? data.total.value : this.total,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReturnDb(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('total: $total, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, saleId, total, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReturnDb &&
          other.id == this.id &&
          other.saleId == this.saleId &&
          other.total == this.total &&
          other.createdAt == this.createdAt);
}

class ReturnsCompanion extends UpdateCompanion<ReturnDb> {
  final Value<int> id;
  final Value<int> saleId;
  final Value<double> total;
  final Value<DateTime> createdAt;
  const ReturnsCompanion({
    this.id = const Value.absent(),
    this.saleId = const Value.absent(),
    this.total = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ReturnsCompanion.insert({
    this.id = const Value.absent(),
    required int saleId,
    required double total,
    this.createdAt = const Value.absent(),
  })  : saleId = Value(saleId),
        total = Value(total);
  static Insertable<ReturnDb> custom({
    Expression<int>? id,
    Expression<int>? saleId,
    Expression<double>? total,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (saleId != null) 'sale_id': saleId,
      if (total != null) 'total': total,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ReturnsCompanion copyWith(
      {Value<int>? id,
      Value<int>? saleId,
      Value<double>? total,
      Value<DateTime>? createdAt}) {
    return ReturnsCompanion(
      id: id ?? this.id,
      saleId: saleId ?? this.saleId,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<int>(saleId.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReturnsCompanion(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('total: $total, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ReturnItemsTable extends ReturnItems
    with TableInfo<$ReturnItemsTable, ReturnItemDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReturnItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _returnIdMeta =
      const VerificationMeta('returnId');
  @override
  late final GeneratedColumn<int> returnId = GeneratedColumn<int>(
      'return_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
      'unit_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, returnId, productId, quantity, unitPrice, total];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'return_items';
  @override
  VerificationContext validateIntegrity(Insertable<ReturnItemDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('return_id')) {
      context.handle(_returnIdMeta,
          returnId.isAcceptableOrUnknown(data['return_id']!, _returnIdMeta));
    } else if (isInserting) {
      context.missing(_returnIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReturnItemDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReturnItemDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      returnId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}return_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_price'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
    );
  }

  @override
  $ReturnItemsTable createAlias(String alias) {
    return $ReturnItemsTable(attachedDatabase, alias);
  }
}

class ReturnItemDb extends DataClass implements Insertable<ReturnItemDb> {
  final int id;
  final int returnId;
  final int productId;
  final double quantity;
  final double unitPrice;
  final double total;
  const ReturnItemDb(
      {required this.id,
      required this.returnId,
      required this.productId,
      required this.quantity,
      required this.unitPrice,
      required this.total});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['return_id'] = Variable<int>(returnId);
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<double>(quantity);
    map['unit_price'] = Variable<double>(unitPrice);
    map['total'] = Variable<double>(total);
    return map;
  }

  ReturnItemsCompanion toCompanion(bool nullToAbsent) {
    return ReturnItemsCompanion(
      id: Value(id),
      returnId: Value(returnId),
      productId: Value(productId),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      total: Value(total),
    );
  }

  factory ReturnItemDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReturnItemDb(
      id: serializer.fromJson<int>(json['id']),
      returnId: serializer.fromJson<int>(json['returnId']),
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      total: serializer.fromJson<double>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'returnId': serializer.toJson<int>(returnId),
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<double>(quantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'total': serializer.toJson<double>(total),
    };
  }

  ReturnItemDb copyWith(
          {int? id,
          int? returnId,
          int? productId,
          double? quantity,
          double? unitPrice,
          double? total}) =>
      ReturnItemDb(
        id: id ?? this.id,
        returnId: returnId ?? this.returnId,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        total: total ?? this.total,
      );
  ReturnItemDb copyWithCompanion(ReturnItemsCompanion data) {
    return ReturnItemDb(
      id: data.id.present ? data.id.value : this.id,
      returnId: data.returnId.present ? data.returnId.value : this.returnId,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      total: data.total.present ? data.total.value : this.total,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReturnItemDb(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, returnId, productId, quantity, unitPrice, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReturnItemDb &&
          other.id == this.id &&
          other.returnId == this.returnId &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.total == this.total);
}

class ReturnItemsCompanion extends UpdateCompanion<ReturnItemDb> {
  final Value<int> id;
  final Value<int> returnId;
  final Value<int> productId;
  final Value<double> quantity;
  final Value<double> unitPrice;
  final Value<double> total;
  const ReturnItemsCompanion({
    this.id = const Value.absent(),
    this.returnId = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.total = const Value.absent(),
  });
  ReturnItemsCompanion.insert({
    this.id = const Value.absent(),
    required int returnId,
    required int productId,
    required double quantity,
    required double unitPrice,
    required double total,
  })  : returnId = Value(returnId),
        productId = Value(productId),
        quantity = Value(quantity),
        unitPrice = Value(unitPrice),
        total = Value(total);
  static Insertable<ReturnItemDb> custom({
    Expression<int>? id,
    Expression<int>? returnId,
    Expression<int>? productId,
    Expression<double>? quantity,
    Expression<double>? unitPrice,
    Expression<double>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (returnId != null) 'return_id': returnId,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (total != null) 'total': total,
    });
  }

  ReturnItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? returnId,
      Value<int>? productId,
      Value<double>? quantity,
      Value<double>? unitPrice,
      Value<double>? total}) {
    return ReturnItemsCompanion(
      id: id ?? this.id,
      returnId: returnId ?? this.returnId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (returnId.present) {
      map['return_id'] = Variable<int>(returnId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReturnItemsCompanion(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

class $ReferenceTestParentsTable extends ReferenceTestParents
    with TableInfo<$ReferenceTestParentsTable, ReferenceTestParentDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReferenceTestParentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reference_test_parents';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReferenceTestParentDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReferenceTestParentDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReferenceTestParentDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $ReferenceTestParentsTable createAlias(String alias) {
    return $ReferenceTestParentsTable(attachedDatabase, alias);
  }
}

class ReferenceTestParentDb extends DataClass
    implements Insertable<ReferenceTestParentDb> {
  final int id;
  const ReferenceTestParentDb({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  ReferenceTestParentsCompanion toCompanion(bool nullToAbsent) {
    return ReferenceTestParentsCompanion(
      id: Value(id),
    );
  }

  factory ReferenceTestParentDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReferenceTestParentDb(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  ReferenceTestParentDb copyWith({int? id}) => ReferenceTestParentDb(
        id: id ?? this.id,
      );
  ReferenceTestParentDb copyWithCompanion(ReferenceTestParentsCompanion data) {
    return ReferenceTestParentDb(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceTestParentDb(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReferenceTestParentDb && other.id == this.id);
}

class ReferenceTestParentsCompanion
    extends UpdateCompanion<ReferenceTestParentDb> {
  final Value<int> id;
  const ReferenceTestParentsCompanion({
    this.id = const Value.absent(),
  });
  ReferenceTestParentsCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<ReferenceTestParentDb> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  ReferenceTestParentsCompanion copyWith({Value<int>? id}) {
    return ReferenceTestParentsCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceTestParentsCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $ReferenceTestChildrenTable extends ReferenceTestChildren
    with TableInfo<$ReferenceTestChildrenTable, ReferenceTestChildDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReferenceTestChildrenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, parentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reference_test_children';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReferenceTestChildDb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReferenceTestChildDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReferenceTestChildDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
    );
  }

  @override
  $ReferenceTestChildrenTable createAlias(String alias) {
    return $ReferenceTestChildrenTable(attachedDatabase, alias);
  }
}

class ReferenceTestChildDb extends DataClass
    implements Insertable<ReferenceTestChildDb> {
  final int id;
  final int parentId;
  const ReferenceTestChildDb({required this.id, required this.parentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<int>(parentId);
    return map;
  }

  ReferenceTestChildrenCompanion toCompanion(bool nullToAbsent) {
    return ReferenceTestChildrenCompanion(
      id: Value(id),
      parentId: Value(parentId),
    );
  }

  factory ReferenceTestChildDb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReferenceTestChildDb(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int>(json['parentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int>(parentId),
    };
  }

  ReferenceTestChildDb copyWith({int? id, int? parentId}) =>
      ReferenceTestChildDb(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
      );
  ReferenceTestChildDb copyWithCompanion(ReferenceTestChildrenCompanion data) {
    return ReferenceTestChildDb(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceTestChildDb(')
          ..write('id: $id, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReferenceTestChildDb &&
          other.id == this.id &&
          other.parentId == this.parentId);
}

class ReferenceTestChildrenCompanion
    extends UpdateCompanion<ReferenceTestChildDb> {
  final Value<int> id;
  final Value<int> parentId;
  const ReferenceTestChildrenCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
  });
  ReferenceTestChildrenCompanion.insert({
    this.id = const Value.absent(),
    required int parentId,
  }) : parentId = Value(parentId);
  static Insertable<ReferenceTestChildDb> custom({
    Expression<int>? id,
    Expression<int>? parentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
    });
  }

  ReferenceTestChildrenCompanion copyWith(
      {Value<int>? id, Value<int>? parentId}) {
    return ReferenceTestChildrenCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceTestChildrenCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $BrandsTable brands = $BrandsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductUnitsTable productUnits = $ProductUnitsTable(this);
  late final $ProductBarcodesTable productBarcodes =
      $ProductBarcodesTable(this);
  late final $ProductImagesTable productImages = $ProductImagesTable(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  late final $PurchaseOrdersTable purchaseOrders = $PurchaseOrdersTable(this);
  late final $PurchaseItemsTable purchaseItems = $PurchaseItemsTable(this);
  late final $PurchaseReceiptsTable purchaseReceipts =
      $PurchaseReceiptsTable(this);
  late final $PurchaseReceiptItemsTable purchaseReceiptItems =
      $PurchaseReceiptItemsTable(this);
  late final $PurchasePaymentsTable purchasePayments =
      $PurchasePaymentsTable(this);
  late final $SupplierProductsTable supplierProducts =
      $SupplierProductsTable(this);
  late final $SalesTable sales = $SalesTable(this);
  late final $SaleItemsTable saleItems = $SaleItemsTable(this);
  late final $StockMovementsTable stockMovements = $StockMovementsTable(this);
  late final $ReturnsTable returns = $ReturnsTable(this);
  late final $ReturnItemsTable returnItems = $ReturnItemsTable(this);
  late final $ReferenceTestParentsTable referenceTestParents =
      $ReferenceTestParentsTable(this);
  late final $ReferenceTestChildrenTable referenceTestChildren =
      $ReferenceTestChildrenTable(this);
  late final ProductsDao productsDao = ProductsDao(this as AppDatabase);
  late final CustomersDao customersDao = CustomersDao(this as AppDatabase);
  late final SuppliersDao suppliersDao = SuppliersDao(this as AppDatabase);
  late final PurchaseOrdersDao purchaseOrdersDao =
      PurchaseOrdersDao(this as AppDatabase);
  late final PurchaseItemsDao purchaseItemsDao =
      PurchaseItemsDao(this as AppDatabase);
  late final PurchaseReceiptsDao purchaseReceiptsDao =
      PurchaseReceiptsDao(this as AppDatabase);
  late final PurchaseReceiptItemsDao purchaseReceiptItemsDao =
      PurchaseReceiptItemsDao(this as AppDatabase);
  late final PurchasePaymentsDao purchasePaymentsDao =
      PurchasePaymentsDao(this as AppDatabase);
  late final SupplierProductsDao supplierProductsDao =
      SupplierProductsDao(this as AppDatabase);
  late final PurchaseTransactionsDao purchaseTransactionsDao =
      PurchaseTransactionsDao(this as AppDatabase);
  late final SalesDao salesDao = SalesDao(this as AppDatabase);
  late final StockDao stockDao = StockDao(this as AppDatabase);
  late final ReportsDao reportsDao = ReportsDao(this as AppDatabase);
  late final HomeDao homeDao = HomeDao(this as AppDatabase);
  late final DatabaseMaintenanceDao databaseMaintenanceDao =
      DatabaseMaintenanceDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        categories,
        brands,
        products,
        productUnits,
        productBarcodes,
        productImages,
        customers,
        suppliers,
        purchaseOrders,
        purchaseItems,
        purchaseReceipts,
        purchaseReceiptItems,
        purchasePayments,
        supplierProducts,
        sales,
        saleItems,
        stockMovements,
        returns,
        returnItems,
        referenceTestParents,
        referenceTestChildren
      ];
}

typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<int?> parentId,
  Value<String?> imagePath,
  Value<bool> isActive,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<int?> parentId,
  Value<String?> imagePath,
  Value<bool> isActive,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    CategoryDb,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (CategoryDb, BaseReferences<_$AppDatabase, $CategoriesTable, CategoryDb>),
    CategoryDb,
    PrefetchHooks Function()> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> parentId = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            description: description,
            parentId: parentId,
            imagePath: imagePath,
            isActive: isActive,
            sortOrder: sortOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<int?> parentId = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            description: description,
            parentId: parentId,
            imagePath: imagePath,
            isActive: isActive,
            sortOrder: sortOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    CategoryDb,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (CategoryDb, BaseReferences<_$AppDatabase, $CategoriesTable, CategoryDb>),
    CategoryDb,
    PrefetchHooks Function()>;
typedef $$BrandsTableCreateCompanionBuilder = BrandsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<String?> imagePath,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$BrandsTableUpdateCompanionBuilder = BrandsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> imagePath,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$BrandsTableFilterComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$BrandsTableOrderingComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$BrandsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BrandsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BrandsTable,
    BrandDb,
    $$BrandsTableFilterComposer,
    $$BrandsTableOrderingComposer,
    $$BrandsTableAnnotationComposer,
    $$BrandsTableCreateCompanionBuilder,
    $$BrandsTableUpdateCompanionBuilder,
    (BrandDb, BaseReferences<_$AppDatabase, $BrandsTable, BrandDb>),
    BrandDb,
    PrefetchHooks Function()> {
  $$BrandsTableTableManager(_$AppDatabase db, $BrandsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BrandsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BrandsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BrandsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BrandsCompanion(
            id: id,
            name: name,
            description: description,
            imagePath: imagePath,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BrandsCompanion.insert(
            id: id,
            name: name,
            description: description,
            imagePath: imagePath,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BrandsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BrandsTable,
    BrandDb,
    $$BrandsTableFilterComposer,
    $$BrandsTableOrderingComposer,
    $$BrandsTableAnnotationComposer,
    $$BrandsTableCreateCompanionBuilder,
    $$BrandsTableUpdateCompanionBuilder,
    (BrandDb, BaseReferences<_$AppDatabase, $BrandsTable, BrandDb>),
    BrandDb,
    PrefetchHooks Function()>;
typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<int?> categoryId,
  Value<int?> brandId,
  Value<String> productType,
  Value<String> baseUnit,
  Value<bool> allowDecimalQuantity,
  Value<double> costPrice,
  Value<double> salePrice,
  Value<double> quantity,
  Value<double> minStock,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<int?> categoryId,
  Value<int?> brandId,
  Value<String> productType,
  Value<String> baseUnit,
  Value<bool> allowDecimalQuantity,
  Value<double> costPrice,
  Value<double> salePrice,
  Value<double> quantity,
  Value<double> minStock,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get brandId => $composableBuilder(
      column: $table.brandId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productType => $composableBuilder(
      column: $table.productType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseUnit => $composableBuilder(
      column: $table.baseUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allowDecimalQuantity => $composableBuilder(
      column: $table.allowDecimalQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minStock => $composableBuilder(
      column: $table.minStock, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get brandId => $composableBuilder(
      column: $table.brandId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productType => $composableBuilder(
      column: $table.productType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseUnit => $composableBuilder(
      column: $table.baseUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allowDecimalQuantity => $composableBuilder(
      column: $table.allowDecimalQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minStock => $composableBuilder(
      column: $table.minStock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<int> get brandId =>
      $composableBuilder(column: $table.brandId, builder: (column) => column);

  GeneratedColumn<String> get productType => $composableBuilder(
      column: $table.productType, builder: (column) => column);

  GeneratedColumn<String> get baseUnit =>
      $composableBuilder(column: $table.baseUnit, builder: (column) => column);

  GeneratedColumn<bool> get allowDecimalQuantity => $composableBuilder(
      column: $table.allowDecimalQuantity, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get minStock =>
      $composableBuilder(column: $table.minStock, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTable,
    ProductDb,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (ProductDb, BaseReferences<_$AppDatabase, $ProductsTable, ProductDb>),
    ProductDb,
    PrefetchHooks Function()> {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<int?> brandId = const Value.absent(),
            Value<String> productType = const Value.absent(),
            Value<String> baseUnit = const Value.absent(),
            Value<bool> allowDecimalQuantity = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> minStock = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            name: name,
            description: description,
            categoryId: categoryId,
            brandId: brandId,
            productType: productType,
            baseUnit: baseUnit,
            allowDecimalQuantity: allowDecimalQuantity,
            costPrice: costPrice,
            salePrice: salePrice,
            quantity: quantity,
            minStock: minStock,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<int?> brandId = const Value.absent(),
            Value<String> productType = const Value.absent(),
            Value<String> baseUnit = const Value.absent(),
            Value<bool> allowDecimalQuantity = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> minStock = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            name: name,
            description: description,
            categoryId: categoryId,
            brandId: brandId,
            productType: productType,
            baseUnit: baseUnit,
            allowDecimalQuantity: allowDecimalQuantity,
            costPrice: costPrice,
            salePrice: salePrice,
            quantity: quantity,
            minStock: minStock,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTable,
    ProductDb,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (ProductDb, BaseReferences<_$AppDatabase, $ProductsTable, ProductDb>),
    ProductDb,
    PrefetchHooks Function()>;
typedef $$ProductUnitsTableCreateCompanionBuilder = ProductUnitsCompanion
    Function({
  Value<int> id,
  required int productId,
  required String unitName,
  Value<double> conversionFactor,
  Value<double> costPrice,
  Value<double> salePrice,
  Value<bool> isBaseUnit,
  Value<bool> isDefault,
  Value<bool> isActive,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ProductUnitsTableUpdateCompanionBuilder = ProductUnitsCompanion
    Function({
  Value<int> id,
  Value<int> productId,
  Value<String> unitName,
  Value<double> conversionFactor,
  Value<double> costPrice,
  Value<double> salePrice,
  Value<bool> isBaseUnit,
  Value<bool> isDefault,
  Value<bool> isActive,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$ProductUnitsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductUnitsTable> {
  $$ProductUnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unitName => $composableBuilder(
      column: $table.unitName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get conversionFactor => $composableBuilder(
      column: $table.conversionFactor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBaseUnit => $composableBuilder(
      column: $table.isBaseUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ProductUnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductUnitsTable> {
  $$ProductUnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unitName => $composableBuilder(
      column: $table.unitName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get conversionFactor => $composableBuilder(
      column: $table.conversionFactor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBaseUnit => $composableBuilder(
      column: $table.isBaseUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductUnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductUnitsTable> {
  $$ProductUnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get unitName =>
      $composableBuilder(column: $table.unitName, builder: (column) => column);

  GeneratedColumn<double> get conversionFactor => $composableBuilder(
      column: $table.conversionFactor, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<bool> get isBaseUnit => $composableBuilder(
      column: $table.isBaseUnit, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProductUnitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductUnitsTable,
    ProductUnitDb,
    $$ProductUnitsTableFilterComposer,
    $$ProductUnitsTableOrderingComposer,
    $$ProductUnitsTableAnnotationComposer,
    $$ProductUnitsTableCreateCompanionBuilder,
    $$ProductUnitsTableUpdateCompanionBuilder,
    (
      ProductUnitDb,
      BaseReferences<_$AppDatabase, $ProductUnitsTable, ProductUnitDb>
    ),
    ProductUnitDb,
    PrefetchHooks Function()> {
  $$ProductUnitsTableTableManager(_$AppDatabase db, $ProductUnitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductUnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductUnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductUnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> unitName = const Value.absent(),
            Value<double> conversionFactor = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<bool> isBaseUnit = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProductUnitsCompanion(
            id: id,
            productId: productId,
            unitName: unitName,
            conversionFactor: conversionFactor,
            costPrice: costPrice,
            salePrice: salePrice,
            isBaseUnit: isBaseUnit,
            isDefault: isDefault,
            isActive: isActive,
            sortOrder: sortOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int productId,
            required String unitName,
            Value<double> conversionFactor = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<bool> isBaseUnit = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProductUnitsCompanion.insert(
            id: id,
            productId: productId,
            unitName: unitName,
            conversionFactor: conversionFactor,
            costPrice: costPrice,
            salePrice: salePrice,
            isBaseUnit: isBaseUnit,
            isDefault: isDefault,
            isActive: isActive,
            sortOrder: sortOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductUnitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductUnitsTable,
    ProductUnitDb,
    $$ProductUnitsTableFilterComposer,
    $$ProductUnitsTableOrderingComposer,
    $$ProductUnitsTableAnnotationComposer,
    $$ProductUnitsTableCreateCompanionBuilder,
    $$ProductUnitsTableUpdateCompanionBuilder,
    (
      ProductUnitDb,
      BaseReferences<_$AppDatabase, $ProductUnitsTable, ProductUnitDb>
    ),
    ProductUnitDb,
    PrefetchHooks Function()>;
typedef $$ProductBarcodesTableCreateCompanionBuilder = ProductBarcodesCompanion
    Function({
  Value<int> id,
  required int productId,
  Value<int?> productUnitId,
  required String barcode,
  Value<String> barcodeType,
  Value<String?> source,
  Value<bool> isDefault,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ProductBarcodesTableUpdateCompanionBuilder = ProductBarcodesCompanion
    Function({
  Value<int> id,
  Value<int> productId,
  Value<int?> productUnitId,
  Value<String> barcode,
  Value<String> barcodeType,
  Value<String?> source,
  Value<bool> isDefault,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$ProductBarcodesTableFilterComposer
    extends Composer<_$AppDatabase, $ProductBarcodesTable> {
  $$ProductBarcodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productUnitId => $composableBuilder(
      column: $table.productUnitId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcodeType => $composableBuilder(
      column: $table.barcodeType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ProductBarcodesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductBarcodesTable> {
  $$ProductBarcodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productUnitId => $composableBuilder(
      column: $table.productUnitId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcodeType => $composableBuilder(
      column: $table.barcodeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductBarcodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductBarcodesTable> {
  $$ProductBarcodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get productUnitId => $composableBuilder(
      column: $table.productUnitId, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get barcodeType => $composableBuilder(
      column: $table.barcodeType, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProductBarcodesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductBarcodesTable,
    ProductBarcodeDb,
    $$ProductBarcodesTableFilterComposer,
    $$ProductBarcodesTableOrderingComposer,
    $$ProductBarcodesTableAnnotationComposer,
    $$ProductBarcodesTableCreateCompanionBuilder,
    $$ProductBarcodesTableUpdateCompanionBuilder,
    (
      ProductBarcodeDb,
      BaseReferences<_$AppDatabase, $ProductBarcodesTable, ProductBarcodeDb>
    ),
    ProductBarcodeDb,
    PrefetchHooks Function()> {
  $$ProductBarcodesTableTableManager(
      _$AppDatabase db, $ProductBarcodesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductBarcodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductBarcodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductBarcodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<int?> productUnitId = const Value.absent(),
            Value<String> barcode = const Value.absent(),
            Value<String> barcodeType = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProductBarcodesCompanion(
            id: id,
            productId: productId,
            productUnitId: productUnitId,
            barcode: barcode,
            barcodeType: barcodeType,
            source: source,
            isDefault: isDefault,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int productId,
            Value<int?> productUnitId = const Value.absent(),
            required String barcode,
            Value<String> barcodeType = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProductBarcodesCompanion.insert(
            id: id,
            productId: productId,
            productUnitId: productUnitId,
            barcode: barcode,
            barcodeType: barcodeType,
            source: source,
            isDefault: isDefault,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductBarcodesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductBarcodesTable,
    ProductBarcodeDb,
    $$ProductBarcodesTableFilterComposer,
    $$ProductBarcodesTableOrderingComposer,
    $$ProductBarcodesTableAnnotationComposer,
    $$ProductBarcodesTableCreateCompanionBuilder,
    $$ProductBarcodesTableUpdateCompanionBuilder,
    (
      ProductBarcodeDb,
      BaseReferences<_$AppDatabase, $ProductBarcodesTable, ProductBarcodeDb>
    ),
    ProductBarcodeDb,
    PrefetchHooks Function()>;
typedef $$ProductImagesTableCreateCompanionBuilder = ProductImagesCompanion
    Function({
  Value<int> id,
  required int productId,
  required String imagePath,
  Value<String?> imageName,
  Value<bool> isPrimary,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ProductImagesTableUpdateCompanionBuilder = ProductImagesCompanion
    Function({
  Value<int> id,
  Value<int> productId,
  Value<String> imagePath,
  Value<String?> imageName,
  Value<bool> isPrimary,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$ProductImagesTableFilterComposer
    extends Composer<_$AppDatabase, $ProductImagesTable> {
  $$ProductImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageName => $composableBuilder(
      column: $table.imageName, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPrimary => $composableBuilder(
      column: $table.isPrimary, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ProductImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductImagesTable> {
  $$ProductImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageName => $composableBuilder(
      column: $table.imageName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPrimary => $composableBuilder(
      column: $table.isPrimary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductImagesTable> {
  $$ProductImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get imageName =>
      $composableBuilder(column: $table.imageName, builder: (column) => column);

  GeneratedColumn<bool> get isPrimary =>
      $composableBuilder(column: $table.isPrimary, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProductImagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductImagesTable,
    ProductImageDb,
    $$ProductImagesTableFilterComposer,
    $$ProductImagesTableOrderingComposer,
    $$ProductImagesTableAnnotationComposer,
    $$ProductImagesTableCreateCompanionBuilder,
    $$ProductImagesTableUpdateCompanionBuilder,
    (
      ProductImageDb,
      BaseReferences<_$AppDatabase, $ProductImagesTable, ProductImageDb>
    ),
    ProductImageDb,
    PrefetchHooks Function()> {
  $$ProductImagesTableTableManager(_$AppDatabase db, $ProductImagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> imagePath = const Value.absent(),
            Value<String?> imageName = const Value.absent(),
            Value<bool> isPrimary = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProductImagesCompanion(
            id: id,
            productId: productId,
            imagePath: imagePath,
            imageName: imageName,
            isPrimary: isPrimary,
            sortOrder: sortOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int productId,
            required String imagePath,
            Value<String?> imageName = const Value.absent(),
            Value<bool> isPrimary = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProductImagesCompanion.insert(
            id: id,
            productId: productId,
            imagePath: imagePath,
            imageName: imageName,
            isPrimary: isPrimary,
            sortOrder: sortOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductImagesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductImagesTable,
    ProductImageDb,
    $$ProductImagesTableFilterComposer,
    $$ProductImagesTableOrderingComposer,
    $$ProductImagesTableAnnotationComposer,
    $$ProductImagesTableCreateCompanionBuilder,
    $$ProductImagesTableUpdateCompanionBuilder,
    (
      ProductImageDb,
      BaseReferences<_$AppDatabase, $ProductImagesTable, ProductImageDb>
    ),
    ProductImageDb,
    PrefetchHooks Function()>;
typedef $$CustomersTableCreateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  Value<String?> customerCode,
  Value<String> customerType,
  required String name,
  Value<String?> companyName,
  Value<String?> contactPerson,
  Value<String?> imagePath,
  Value<String?> phone,
  Value<String?> secondaryPhone,
  Value<String?> whatsapp,
  Value<String?> email,
  Value<String?> website,
  Value<String?> nationalId,
  Value<String?> taxNumber,
  Value<String?> commercialRegister,
  Value<String?> address,
  Value<String?> country,
  Value<String?> city,
  Value<String?> region,
  Value<String?> street,
  Value<String?> buildingNumber,
  Value<String?> postalCode,
  Value<String?> billingAddress,
  Value<String?> shippingAddress,
  Value<String> customerCategory,
  Value<String> priceLevel,
  Value<bool> allowCredit,
  Value<double> creditLimit,
  Value<double> openingBalance,
  Value<double> currentBalance,
  Value<int> paymentTermsDays,
  Value<double> defaultDiscount,
  Value<String> preferredPaymentMethod,
  Value<int> loyaltyPoints,
  Value<DateTime?> lastSaleAt,
  Value<DateTime?> lastPaymentAt,
  Value<bool> isActive,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$CustomersTableUpdateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  Value<String?> customerCode,
  Value<String> customerType,
  Value<String> name,
  Value<String?> companyName,
  Value<String?> contactPerson,
  Value<String?> imagePath,
  Value<String?> phone,
  Value<String?> secondaryPhone,
  Value<String?> whatsapp,
  Value<String?> email,
  Value<String?> website,
  Value<String?> nationalId,
  Value<String?> taxNumber,
  Value<String?> commercialRegister,
  Value<String?> address,
  Value<String?> country,
  Value<String?> city,
  Value<String?> region,
  Value<String?> street,
  Value<String?> buildingNumber,
  Value<String?> postalCode,
  Value<String?> billingAddress,
  Value<String?> shippingAddress,
  Value<String> customerCategory,
  Value<String> priceLevel,
  Value<bool> allowCredit,
  Value<double> creditLimit,
  Value<double> openingBalance,
  Value<double> currentBalance,
  Value<int> paymentTermsDays,
  Value<double> defaultDiscount,
  Value<String> preferredPaymentMethod,
  Value<int> loyaltyPoints,
  Value<DateTime?> lastSaleAt,
  Value<DateTime?> lastPaymentAt,
  Value<bool> isActive,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerCode => $composableBuilder(
      column: $table.customerCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerType => $composableBuilder(
      column: $table.customerType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactPerson => $composableBuilder(
      column: $table.contactPerson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get whatsapp => $composableBuilder(
      column: $table.whatsapp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nationalId => $composableBuilder(
      column: $table.nationalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taxNumber => $composableBuilder(
      column: $table.taxNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get commercialRegister => $composableBuilder(
      column: $table.commercialRegister,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get region => $composableBuilder(
      column: $table.region, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get buildingNumber => $composableBuilder(
      column: $table.buildingNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shippingAddress => $composableBuilder(
      column: $table.shippingAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerCategory => $composableBuilder(
      column: $table.customerCategory,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priceLevel => $composableBuilder(
      column: $table.priceLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allowCredit => $composableBuilder(
      column: $table.allowCredit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get creditLimit => $composableBuilder(
      column: $table.creditLimit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get paymentTermsDays => $composableBuilder(
      column: $table.paymentTermsDays,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get defaultDiscount => $composableBuilder(
      column: $table.defaultDiscount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preferredPaymentMethod => $composableBuilder(
      column: $table.preferredPaymentMethod,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get loyaltyPoints => $composableBuilder(
      column: $table.loyaltyPoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSaleAt => $composableBuilder(
      column: $table.lastSaleAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPaymentAt => $composableBuilder(
      column: $table.lastPaymentAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerCode => $composableBuilder(
      column: $table.customerCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerType => $composableBuilder(
      column: $table.customerType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactPerson => $composableBuilder(
      column: $table.contactPerson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get whatsapp => $composableBuilder(
      column: $table.whatsapp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nationalId => $composableBuilder(
      column: $table.nationalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taxNumber => $composableBuilder(
      column: $table.taxNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get commercialRegister => $composableBuilder(
      column: $table.commercialRegister,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get region => $composableBuilder(
      column: $table.region, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get buildingNumber => $composableBuilder(
      column: $table.buildingNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shippingAddress => $composableBuilder(
      column: $table.shippingAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerCategory => $composableBuilder(
      column: $table.customerCategory,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priceLevel => $composableBuilder(
      column: $table.priceLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allowCredit => $composableBuilder(
      column: $table.allowCredit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get creditLimit => $composableBuilder(
      column: $table.creditLimit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get paymentTermsDays => $composableBuilder(
      column: $table.paymentTermsDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get defaultDiscount => $composableBuilder(
      column: $table.defaultDiscount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferredPaymentMethod => $composableBuilder(
      column: $table.preferredPaymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get loyaltyPoints => $composableBuilder(
      column: $table.loyaltyPoints,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSaleAt => $composableBuilder(
      column: $table.lastSaleAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPaymentAt => $composableBuilder(
      column: $table.lastPaymentAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customerCode => $composableBuilder(
      column: $table.customerCode, builder: (column) => column);

  GeneratedColumn<String> get customerType => $composableBuilder(
      column: $table.customerType, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => column);

  GeneratedColumn<String> get contactPerson => $composableBuilder(
      column: $table.contactPerson, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone, builder: (column) => column);

  GeneratedColumn<String> get whatsapp =>
      $composableBuilder(column: $table.whatsapp, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get nationalId => $composableBuilder(
      column: $table.nationalId, builder: (column) => column);

  GeneratedColumn<String> get taxNumber =>
      $composableBuilder(column: $table.taxNumber, builder: (column) => column);

  GeneratedColumn<String> get commercialRegister => $composableBuilder(
      column: $table.commercialRegister, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get buildingNumber => $composableBuilder(
      column: $table.buildingNumber, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => column);

  GeneratedColumn<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress, builder: (column) => column);

  GeneratedColumn<String> get shippingAddress => $composableBuilder(
      column: $table.shippingAddress, builder: (column) => column);

  GeneratedColumn<String> get customerCategory => $composableBuilder(
      column: $table.customerCategory, builder: (column) => column);

  GeneratedColumn<String> get priceLevel => $composableBuilder(
      column: $table.priceLevel, builder: (column) => column);

  GeneratedColumn<bool> get allowCredit => $composableBuilder(
      column: $table.allowCredit, builder: (column) => column);

  GeneratedColumn<double> get creditLimit => $composableBuilder(
      column: $table.creditLimit, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance, builder: (column) => column);

  GeneratedColumn<int> get paymentTermsDays => $composableBuilder(
      column: $table.paymentTermsDays, builder: (column) => column);

  GeneratedColumn<double> get defaultDiscount => $composableBuilder(
      column: $table.defaultDiscount, builder: (column) => column);

  GeneratedColumn<String> get preferredPaymentMethod => $composableBuilder(
      column: $table.preferredPaymentMethod, builder: (column) => column);

  GeneratedColumn<int> get loyaltyPoints => $composableBuilder(
      column: $table.loyaltyPoints, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSaleAt => $composableBuilder(
      column: $table.lastSaleAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPaymentAt => $composableBuilder(
      column: $table.lastPaymentAt, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CustomersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomersTable,
    CustomerDb,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (CustomerDb, BaseReferences<_$AppDatabase, $CustomersTable, CustomerDb>),
    CustomerDb,
    PrefetchHooks Function()> {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> customerCode = const Value.absent(),
            Value<String> customerType = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> companyName = const Value.absent(),
            Value<String?> contactPerson = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> secondaryPhone = const Value.absent(),
            Value<String?> whatsapp = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<String?> nationalId = const Value.absent(),
            Value<String?> taxNumber = const Value.absent(),
            Value<String?> commercialRegister = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> country = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> region = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> buildingNumber = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> billingAddress = const Value.absent(),
            Value<String?> shippingAddress = const Value.absent(),
            Value<String> customerCategory = const Value.absent(),
            Value<String> priceLevel = const Value.absent(),
            Value<bool> allowCredit = const Value.absent(),
            Value<double> creditLimit = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<double> currentBalance = const Value.absent(),
            Value<int> paymentTermsDays = const Value.absent(),
            Value<double> defaultDiscount = const Value.absent(),
            Value<String> preferredPaymentMethod = const Value.absent(),
            Value<int> loyaltyPoints = const Value.absent(),
            Value<DateTime?> lastSaleAt = const Value.absent(),
            Value<DateTime?> lastPaymentAt = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CustomersCompanion(
            id: id,
            customerCode: customerCode,
            customerType: customerType,
            name: name,
            companyName: companyName,
            contactPerson: contactPerson,
            imagePath: imagePath,
            phone: phone,
            secondaryPhone: secondaryPhone,
            whatsapp: whatsapp,
            email: email,
            website: website,
            nationalId: nationalId,
            taxNumber: taxNumber,
            commercialRegister: commercialRegister,
            address: address,
            country: country,
            city: city,
            region: region,
            street: street,
            buildingNumber: buildingNumber,
            postalCode: postalCode,
            billingAddress: billingAddress,
            shippingAddress: shippingAddress,
            customerCategory: customerCategory,
            priceLevel: priceLevel,
            allowCredit: allowCredit,
            creditLimit: creditLimit,
            openingBalance: openingBalance,
            currentBalance: currentBalance,
            paymentTermsDays: paymentTermsDays,
            defaultDiscount: defaultDiscount,
            preferredPaymentMethod: preferredPaymentMethod,
            loyaltyPoints: loyaltyPoints,
            lastSaleAt: lastSaleAt,
            lastPaymentAt: lastPaymentAt,
            isActive: isActive,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> customerCode = const Value.absent(),
            Value<String> customerType = const Value.absent(),
            required String name,
            Value<String?> companyName = const Value.absent(),
            Value<String?> contactPerson = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> secondaryPhone = const Value.absent(),
            Value<String?> whatsapp = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<String?> nationalId = const Value.absent(),
            Value<String?> taxNumber = const Value.absent(),
            Value<String?> commercialRegister = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> country = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> region = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> buildingNumber = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> billingAddress = const Value.absent(),
            Value<String?> shippingAddress = const Value.absent(),
            Value<String> customerCategory = const Value.absent(),
            Value<String> priceLevel = const Value.absent(),
            Value<bool> allowCredit = const Value.absent(),
            Value<double> creditLimit = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<double> currentBalance = const Value.absent(),
            Value<int> paymentTermsDays = const Value.absent(),
            Value<double> defaultDiscount = const Value.absent(),
            Value<String> preferredPaymentMethod = const Value.absent(),
            Value<int> loyaltyPoints = const Value.absent(),
            Value<DateTime?> lastSaleAt = const Value.absent(),
            Value<DateTime?> lastPaymentAt = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CustomersCompanion.insert(
            id: id,
            customerCode: customerCode,
            customerType: customerType,
            name: name,
            companyName: companyName,
            contactPerson: contactPerson,
            imagePath: imagePath,
            phone: phone,
            secondaryPhone: secondaryPhone,
            whatsapp: whatsapp,
            email: email,
            website: website,
            nationalId: nationalId,
            taxNumber: taxNumber,
            commercialRegister: commercialRegister,
            address: address,
            country: country,
            city: city,
            region: region,
            street: street,
            buildingNumber: buildingNumber,
            postalCode: postalCode,
            billingAddress: billingAddress,
            shippingAddress: shippingAddress,
            customerCategory: customerCategory,
            priceLevel: priceLevel,
            allowCredit: allowCredit,
            creditLimit: creditLimit,
            openingBalance: openingBalance,
            currentBalance: currentBalance,
            paymentTermsDays: paymentTermsDays,
            defaultDiscount: defaultDiscount,
            preferredPaymentMethod: preferredPaymentMethod,
            loyaltyPoints: loyaltyPoints,
            lastSaleAt: lastSaleAt,
            lastPaymentAt: lastPaymentAt,
            isActive: isActive,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomersTable,
    CustomerDb,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (CustomerDb, BaseReferences<_$AppDatabase, $CustomersTable, CustomerDb>),
    CustomerDb,
    PrefetchHooks Function()>;
typedef $$SuppliersTableCreateCompanionBuilder = SuppliersCompanion Function({
  Value<int> id,
  Value<String?> supplierCode,
  Value<String> supplierType,
  required String name,
  Value<String?> companyName,
  Value<String?> contactPerson,
  Value<String?> imagePath,
  Value<String?> phone,
  Value<String?> secondaryPhone,
  Value<String?> whatsapp,
  Value<String?> email,
  Value<String?> website,
  Value<String?> nationalId,
  Value<String?> taxNumber,
  Value<String?> commercialRegister,
  Value<String?> address,
  Value<String?> country,
  Value<String?> city,
  Value<String?> region,
  Value<String?> street,
  Value<String?> buildingNumber,
  Value<String?> postalCode,
  Value<String?> billingAddress,
  Value<String?> shippingAddress,
  Value<String> supplierCategory,
  Value<String> supplierLevel,
  Value<double> rating,
  Value<bool> isPreferred,
  Value<bool> allowCredit,
  Value<double> creditLimit,
  Value<double> openingBalance,
  Value<double> currentBalance,
  Value<int> paymentTermsDays,
  Value<String> preferredPaymentMethod,
  Value<String?> bankName,
  Value<String?> bankBranch,
  Value<String?> bankAccountName,
  Value<String?> bankAccountNumber,
  Value<String?> iban,
  Value<String?> swiftCode,
  Value<DateTime?> lastPurchaseAt,
  Value<DateTime?> lastPaymentAt,
  Value<bool> isActive,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$SuppliersTableUpdateCompanionBuilder = SuppliersCompanion Function({
  Value<int> id,
  Value<String?> supplierCode,
  Value<String> supplierType,
  Value<String> name,
  Value<String?> companyName,
  Value<String?> contactPerson,
  Value<String?> imagePath,
  Value<String?> phone,
  Value<String?> secondaryPhone,
  Value<String?> whatsapp,
  Value<String?> email,
  Value<String?> website,
  Value<String?> nationalId,
  Value<String?> taxNumber,
  Value<String?> commercialRegister,
  Value<String?> address,
  Value<String?> country,
  Value<String?> city,
  Value<String?> region,
  Value<String?> street,
  Value<String?> buildingNumber,
  Value<String?> postalCode,
  Value<String?> billingAddress,
  Value<String?> shippingAddress,
  Value<String> supplierCategory,
  Value<String> supplierLevel,
  Value<double> rating,
  Value<bool> isPreferred,
  Value<bool> allowCredit,
  Value<double> creditLimit,
  Value<double> openingBalance,
  Value<double> currentBalance,
  Value<int> paymentTermsDays,
  Value<String> preferredPaymentMethod,
  Value<String?> bankName,
  Value<String?> bankBranch,
  Value<String?> bankAccountName,
  Value<String?> bankAccountNumber,
  Value<String?> iban,
  Value<String?> swiftCode,
  Value<DateTime?> lastPurchaseAt,
  Value<DateTime?> lastPaymentAt,
  Value<bool> isActive,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$SuppliersTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplierCode => $composableBuilder(
      column: $table.supplierCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplierType => $composableBuilder(
      column: $table.supplierType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactPerson => $composableBuilder(
      column: $table.contactPerson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get whatsapp => $composableBuilder(
      column: $table.whatsapp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nationalId => $composableBuilder(
      column: $table.nationalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taxNumber => $composableBuilder(
      column: $table.taxNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get commercialRegister => $composableBuilder(
      column: $table.commercialRegister,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get region => $composableBuilder(
      column: $table.region, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get buildingNumber => $composableBuilder(
      column: $table.buildingNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shippingAddress => $composableBuilder(
      column: $table.shippingAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplierCategory => $composableBuilder(
      column: $table.supplierCategory,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplierLevel => $composableBuilder(
      column: $table.supplierLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPreferred => $composableBuilder(
      column: $table.isPreferred, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allowCredit => $composableBuilder(
      column: $table.allowCredit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get creditLimit => $composableBuilder(
      column: $table.creditLimit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get paymentTermsDays => $composableBuilder(
      column: $table.paymentTermsDays,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preferredPaymentMethod => $composableBuilder(
      column: $table.preferredPaymentMethod,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankBranch => $composableBuilder(
      column: $table.bankBranch, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankAccountName => $composableBuilder(
      column: $table.bankAccountName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankAccountNumber => $composableBuilder(
      column: $table.bankAccountNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iban => $composableBuilder(
      column: $table.iban, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get swiftCode => $composableBuilder(
      column: $table.swiftCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPurchaseAt => $composableBuilder(
      column: $table.lastPurchaseAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPaymentAt => $composableBuilder(
      column: $table.lastPaymentAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SuppliersTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplierCode => $composableBuilder(
      column: $table.supplierCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplierType => $composableBuilder(
      column: $table.supplierType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactPerson => $composableBuilder(
      column: $table.contactPerson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get whatsapp => $composableBuilder(
      column: $table.whatsapp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nationalId => $composableBuilder(
      column: $table.nationalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taxNumber => $composableBuilder(
      column: $table.taxNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get commercialRegister => $composableBuilder(
      column: $table.commercialRegister,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get region => $composableBuilder(
      column: $table.region, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get buildingNumber => $composableBuilder(
      column: $table.buildingNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shippingAddress => $composableBuilder(
      column: $table.shippingAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplierCategory => $composableBuilder(
      column: $table.supplierCategory,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplierLevel => $composableBuilder(
      column: $table.supplierLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPreferred => $composableBuilder(
      column: $table.isPreferred, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allowCredit => $composableBuilder(
      column: $table.allowCredit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get creditLimit => $composableBuilder(
      column: $table.creditLimit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get paymentTermsDays => $composableBuilder(
      column: $table.paymentTermsDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferredPaymentMethod => $composableBuilder(
      column: $table.preferredPaymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankBranch => $composableBuilder(
      column: $table.bankBranch, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankAccountName => $composableBuilder(
      column: $table.bankAccountName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankAccountNumber => $composableBuilder(
      column: $table.bankAccountNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iban => $composableBuilder(
      column: $table.iban, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get swiftCode => $composableBuilder(
      column: $table.swiftCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPurchaseAt => $composableBuilder(
      column: $table.lastPurchaseAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPaymentAt => $composableBuilder(
      column: $table.lastPaymentAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SuppliersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get supplierCode => $composableBuilder(
      column: $table.supplierCode, builder: (column) => column);

  GeneratedColumn<String> get supplierType => $composableBuilder(
      column: $table.supplierType, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => column);

  GeneratedColumn<String> get contactPerson => $composableBuilder(
      column: $table.contactPerson, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone, builder: (column) => column);

  GeneratedColumn<String> get whatsapp =>
      $composableBuilder(column: $table.whatsapp, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get nationalId => $composableBuilder(
      column: $table.nationalId, builder: (column) => column);

  GeneratedColumn<String> get taxNumber =>
      $composableBuilder(column: $table.taxNumber, builder: (column) => column);

  GeneratedColumn<String> get commercialRegister => $composableBuilder(
      column: $table.commercialRegister, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get buildingNumber => $composableBuilder(
      column: $table.buildingNumber, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => column);

  GeneratedColumn<String> get billingAddress => $composableBuilder(
      column: $table.billingAddress, builder: (column) => column);

  GeneratedColumn<String> get shippingAddress => $composableBuilder(
      column: $table.shippingAddress, builder: (column) => column);

  GeneratedColumn<String> get supplierCategory => $composableBuilder(
      column: $table.supplierCategory, builder: (column) => column);

  GeneratedColumn<String> get supplierLevel => $composableBuilder(
      column: $table.supplierLevel, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<bool> get isPreferred => $composableBuilder(
      column: $table.isPreferred, builder: (column) => column);

  GeneratedColumn<bool> get allowCredit => $composableBuilder(
      column: $table.allowCredit, builder: (column) => column);

  GeneratedColumn<double> get creditLimit => $composableBuilder(
      column: $table.creditLimit, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance, builder: (column) => column);

  GeneratedColumn<int> get paymentTermsDays => $composableBuilder(
      column: $table.paymentTermsDays, builder: (column) => column);

  GeneratedColumn<String> get preferredPaymentMethod => $composableBuilder(
      column: $table.preferredPaymentMethod, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get bankBranch => $composableBuilder(
      column: $table.bankBranch, builder: (column) => column);

  GeneratedColumn<String> get bankAccountName => $composableBuilder(
      column: $table.bankAccountName, builder: (column) => column);

  GeneratedColumn<String> get bankAccountNumber => $composableBuilder(
      column: $table.bankAccountNumber, builder: (column) => column);

  GeneratedColumn<String> get iban =>
      $composableBuilder(column: $table.iban, builder: (column) => column);

  GeneratedColumn<String> get swiftCode =>
      $composableBuilder(column: $table.swiftCode, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPurchaseAt => $composableBuilder(
      column: $table.lastPurchaseAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPaymentAt => $composableBuilder(
      column: $table.lastPaymentAt, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SuppliersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SuppliersTable,
    SupplierDb,
    $$SuppliersTableFilterComposer,
    $$SuppliersTableOrderingComposer,
    $$SuppliersTableAnnotationComposer,
    $$SuppliersTableCreateCompanionBuilder,
    $$SuppliersTableUpdateCompanionBuilder,
    (SupplierDb, BaseReferences<_$AppDatabase, $SuppliersTable, SupplierDb>),
    SupplierDb,
    PrefetchHooks Function()> {
  $$SuppliersTableTableManager(_$AppDatabase db, $SuppliersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> supplierCode = const Value.absent(),
            Value<String> supplierType = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> companyName = const Value.absent(),
            Value<String?> contactPerson = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> secondaryPhone = const Value.absent(),
            Value<String?> whatsapp = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<String?> nationalId = const Value.absent(),
            Value<String?> taxNumber = const Value.absent(),
            Value<String?> commercialRegister = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> country = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> region = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> buildingNumber = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> billingAddress = const Value.absent(),
            Value<String?> shippingAddress = const Value.absent(),
            Value<String> supplierCategory = const Value.absent(),
            Value<String> supplierLevel = const Value.absent(),
            Value<double> rating = const Value.absent(),
            Value<bool> isPreferred = const Value.absent(),
            Value<bool> allowCredit = const Value.absent(),
            Value<double> creditLimit = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<double> currentBalance = const Value.absent(),
            Value<int> paymentTermsDays = const Value.absent(),
            Value<String> preferredPaymentMethod = const Value.absent(),
            Value<String?> bankName = const Value.absent(),
            Value<String?> bankBranch = const Value.absent(),
            Value<String?> bankAccountName = const Value.absent(),
            Value<String?> bankAccountNumber = const Value.absent(),
            Value<String?> iban = const Value.absent(),
            Value<String?> swiftCode = const Value.absent(),
            Value<DateTime?> lastPurchaseAt = const Value.absent(),
            Value<DateTime?> lastPaymentAt = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SuppliersCompanion(
            id: id,
            supplierCode: supplierCode,
            supplierType: supplierType,
            name: name,
            companyName: companyName,
            contactPerson: contactPerson,
            imagePath: imagePath,
            phone: phone,
            secondaryPhone: secondaryPhone,
            whatsapp: whatsapp,
            email: email,
            website: website,
            nationalId: nationalId,
            taxNumber: taxNumber,
            commercialRegister: commercialRegister,
            address: address,
            country: country,
            city: city,
            region: region,
            street: street,
            buildingNumber: buildingNumber,
            postalCode: postalCode,
            billingAddress: billingAddress,
            shippingAddress: shippingAddress,
            supplierCategory: supplierCategory,
            supplierLevel: supplierLevel,
            rating: rating,
            isPreferred: isPreferred,
            allowCredit: allowCredit,
            creditLimit: creditLimit,
            openingBalance: openingBalance,
            currentBalance: currentBalance,
            paymentTermsDays: paymentTermsDays,
            preferredPaymentMethod: preferredPaymentMethod,
            bankName: bankName,
            bankBranch: bankBranch,
            bankAccountName: bankAccountName,
            bankAccountNumber: bankAccountNumber,
            iban: iban,
            swiftCode: swiftCode,
            lastPurchaseAt: lastPurchaseAt,
            lastPaymentAt: lastPaymentAt,
            isActive: isActive,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> supplierCode = const Value.absent(),
            Value<String> supplierType = const Value.absent(),
            required String name,
            Value<String?> companyName = const Value.absent(),
            Value<String?> contactPerson = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> secondaryPhone = const Value.absent(),
            Value<String?> whatsapp = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<String?> nationalId = const Value.absent(),
            Value<String?> taxNumber = const Value.absent(),
            Value<String?> commercialRegister = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> country = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> region = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> buildingNumber = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> billingAddress = const Value.absent(),
            Value<String?> shippingAddress = const Value.absent(),
            Value<String> supplierCategory = const Value.absent(),
            Value<String> supplierLevel = const Value.absent(),
            Value<double> rating = const Value.absent(),
            Value<bool> isPreferred = const Value.absent(),
            Value<bool> allowCredit = const Value.absent(),
            Value<double> creditLimit = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<double> currentBalance = const Value.absent(),
            Value<int> paymentTermsDays = const Value.absent(),
            Value<String> preferredPaymentMethod = const Value.absent(),
            Value<String?> bankName = const Value.absent(),
            Value<String?> bankBranch = const Value.absent(),
            Value<String?> bankAccountName = const Value.absent(),
            Value<String?> bankAccountNumber = const Value.absent(),
            Value<String?> iban = const Value.absent(),
            Value<String?> swiftCode = const Value.absent(),
            Value<DateTime?> lastPurchaseAt = const Value.absent(),
            Value<DateTime?> lastPaymentAt = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SuppliersCompanion.insert(
            id: id,
            supplierCode: supplierCode,
            supplierType: supplierType,
            name: name,
            companyName: companyName,
            contactPerson: contactPerson,
            imagePath: imagePath,
            phone: phone,
            secondaryPhone: secondaryPhone,
            whatsapp: whatsapp,
            email: email,
            website: website,
            nationalId: nationalId,
            taxNumber: taxNumber,
            commercialRegister: commercialRegister,
            address: address,
            country: country,
            city: city,
            region: region,
            street: street,
            buildingNumber: buildingNumber,
            postalCode: postalCode,
            billingAddress: billingAddress,
            shippingAddress: shippingAddress,
            supplierCategory: supplierCategory,
            supplierLevel: supplierLevel,
            rating: rating,
            isPreferred: isPreferred,
            allowCredit: allowCredit,
            creditLimit: creditLimit,
            openingBalance: openingBalance,
            currentBalance: currentBalance,
            paymentTermsDays: paymentTermsDays,
            preferredPaymentMethod: preferredPaymentMethod,
            bankName: bankName,
            bankBranch: bankBranch,
            bankAccountName: bankAccountName,
            bankAccountNumber: bankAccountNumber,
            iban: iban,
            swiftCode: swiftCode,
            lastPurchaseAt: lastPurchaseAt,
            lastPaymentAt: lastPaymentAt,
            isActive: isActive,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SuppliersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SuppliersTable,
    SupplierDb,
    $$SuppliersTableFilterComposer,
    $$SuppliersTableOrderingComposer,
    $$SuppliersTableAnnotationComposer,
    $$SuppliersTableCreateCompanionBuilder,
    $$SuppliersTableUpdateCompanionBuilder,
    (SupplierDb, BaseReferences<_$AppDatabase, $SuppliersTable, SupplierDb>),
    SupplierDb,
    PrefetchHooks Function()>;
typedef $$PurchaseOrdersTableCreateCompanionBuilder = PurchaseOrdersCompanion
    Function({
  Value<int> id,
  required int supplierId,
  required String invoiceNumber,
  Value<String?> supplierInvoiceNumber,
  Value<DateTime> purchaseDate,
  Value<DateTime?> expectedDeliveryDate,
  Value<DateTime?> completedAt,
  Value<double> subtotal,
  Value<double> discount,
  Value<double> tax,
  Value<double> shippingCost,
  Value<double> additionalCost,
  Value<double> total,
  Value<double> paidAmount,
  Value<double> remainingAmount,
  Value<String> status,
  Value<String> paymentStatus,
  Value<String?> notes,
  Value<String?> internalNotes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$PurchaseOrdersTableUpdateCompanionBuilder = PurchaseOrdersCompanion
    Function({
  Value<int> id,
  Value<int> supplierId,
  Value<String> invoiceNumber,
  Value<String?> supplierInvoiceNumber,
  Value<DateTime> purchaseDate,
  Value<DateTime?> expectedDeliveryDate,
  Value<DateTime?> completedAt,
  Value<double> subtotal,
  Value<double> discount,
  Value<double> tax,
  Value<double> shippingCost,
  Value<double> additionalCost,
  Value<double> total,
  Value<double> paidAmount,
  Value<double> remainingAmount,
  Value<String> status,
  Value<String> paymentStatus,
  Value<String?> notes,
  Value<String?> internalNotes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$PurchaseOrdersTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseOrdersTable> {
  $$PurchaseOrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invoiceNumber => $composableBuilder(
      column: $table.invoiceNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplierInvoiceNumber => $composableBuilder(
      column: $table.supplierInvoiceNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expectedDeliveryDate => $composableBuilder(
      column: $table.expectedDeliveryDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get tax => $composableBuilder(
      column: $table.tax, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shippingCost => $composableBuilder(
      column: $table.shippingCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get additionalCost => $composableBuilder(
      column: $table.additionalCost,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get remainingAmount => $composableBuilder(
      column: $table.remainingAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get internalNotes => $composableBuilder(
      column: $table.internalNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PurchaseOrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseOrdersTable> {
  $$PurchaseOrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invoiceNumber => $composableBuilder(
      column: $table.invoiceNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplierInvoiceNumber => $composableBuilder(
      column: $table.supplierInvoiceNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expectedDeliveryDate => $composableBuilder(
      column: $table.expectedDeliveryDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get tax => $composableBuilder(
      column: $table.tax, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shippingCost => $composableBuilder(
      column: $table.shippingCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get additionalCost => $composableBuilder(
      column: $table.additionalCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get remainingAmount => $composableBuilder(
      column: $table.remainingAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get internalNotes => $composableBuilder(
      column: $table.internalNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PurchaseOrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseOrdersTable> {
  $$PurchaseOrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => column);

  GeneratedColumn<String> get invoiceNumber => $composableBuilder(
      column: $table.invoiceNumber, builder: (column) => column);

  GeneratedColumn<String> get supplierInvoiceNumber => $composableBuilder(
      column: $table.supplierInvoiceNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => column);

  GeneratedColumn<DateTime> get expectedDeliveryDate => $composableBuilder(
      column: $table.expectedDeliveryDate, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<double> get tax =>
      $composableBuilder(column: $table.tax, builder: (column) => column);

  GeneratedColumn<double> get shippingCost => $composableBuilder(
      column: $table.shippingCost, builder: (column) => column);

  GeneratedColumn<double> get additionalCost => $composableBuilder(
      column: $table.additionalCost, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<double> get remainingAmount => $composableBuilder(
      column: $table.remainingAmount, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get internalNotes => $composableBuilder(
      column: $table.internalNotes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PurchaseOrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchaseOrdersTable,
    PurchaseOrderDb,
    $$PurchaseOrdersTableFilterComposer,
    $$PurchaseOrdersTableOrderingComposer,
    $$PurchaseOrdersTableAnnotationComposer,
    $$PurchaseOrdersTableCreateCompanionBuilder,
    $$PurchaseOrdersTableUpdateCompanionBuilder,
    (
      PurchaseOrderDb,
      BaseReferences<_$AppDatabase, $PurchaseOrdersTable, PurchaseOrderDb>
    ),
    PurchaseOrderDb,
    PrefetchHooks Function()> {
  $$PurchaseOrdersTableTableManager(
      _$AppDatabase db, $PurchaseOrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseOrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseOrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseOrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> supplierId = const Value.absent(),
            Value<String> invoiceNumber = const Value.absent(),
            Value<String?> supplierInvoiceNumber = const Value.absent(),
            Value<DateTime> purchaseDate = const Value.absent(),
            Value<DateTime?> expectedDeliveryDate = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<double> subtotal = const Value.absent(),
            Value<double> discount = const Value.absent(),
            Value<double> tax = const Value.absent(),
            Value<double> shippingCost = const Value.absent(),
            Value<double> additionalCost = const Value.absent(),
            Value<double> total = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
            Value<double> remainingAmount = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> internalNotes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PurchaseOrdersCompanion(
            id: id,
            supplierId: supplierId,
            invoiceNumber: invoiceNumber,
            supplierInvoiceNumber: supplierInvoiceNumber,
            purchaseDate: purchaseDate,
            expectedDeliveryDate: expectedDeliveryDate,
            completedAt: completedAt,
            subtotal: subtotal,
            discount: discount,
            tax: tax,
            shippingCost: shippingCost,
            additionalCost: additionalCost,
            total: total,
            paidAmount: paidAmount,
            remainingAmount: remainingAmount,
            status: status,
            paymentStatus: paymentStatus,
            notes: notes,
            internalNotes: internalNotes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int supplierId,
            required String invoiceNumber,
            Value<String?> supplierInvoiceNumber = const Value.absent(),
            Value<DateTime> purchaseDate = const Value.absent(),
            Value<DateTime?> expectedDeliveryDate = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<double> subtotal = const Value.absent(),
            Value<double> discount = const Value.absent(),
            Value<double> tax = const Value.absent(),
            Value<double> shippingCost = const Value.absent(),
            Value<double> additionalCost = const Value.absent(),
            Value<double> total = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
            Value<double> remainingAmount = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> internalNotes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PurchaseOrdersCompanion.insert(
            id: id,
            supplierId: supplierId,
            invoiceNumber: invoiceNumber,
            supplierInvoiceNumber: supplierInvoiceNumber,
            purchaseDate: purchaseDate,
            expectedDeliveryDate: expectedDeliveryDate,
            completedAt: completedAt,
            subtotal: subtotal,
            discount: discount,
            tax: tax,
            shippingCost: shippingCost,
            additionalCost: additionalCost,
            total: total,
            paidAmount: paidAmount,
            remainingAmount: remainingAmount,
            status: status,
            paymentStatus: paymentStatus,
            notes: notes,
            internalNotes: internalNotes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PurchaseOrdersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PurchaseOrdersTable,
    PurchaseOrderDb,
    $$PurchaseOrdersTableFilterComposer,
    $$PurchaseOrdersTableOrderingComposer,
    $$PurchaseOrdersTableAnnotationComposer,
    $$PurchaseOrdersTableCreateCompanionBuilder,
    $$PurchaseOrdersTableUpdateCompanionBuilder,
    (
      PurchaseOrderDb,
      BaseReferences<_$AppDatabase, $PurchaseOrdersTable, PurchaseOrderDb>
    ),
    PurchaseOrderDb,
    PrefetchHooks Function()>;
typedef $$PurchaseItemsTableCreateCompanionBuilder = PurchaseItemsCompanion
    Function({
  Value<int> id,
  required int purchaseOrderId,
  required int productId,
  Value<int?> productUnitId,
  required String productName,
  Value<String> unitName,
  required double quantity,
  Value<double> conversionFactor,
  required double baseQuantity,
  required double unitPrice,
  required double baseUnitCost,
  required double total,
  Value<String?> notes,
});
typedef $$PurchaseItemsTableUpdateCompanionBuilder = PurchaseItemsCompanion
    Function({
  Value<int> id,
  Value<int> purchaseOrderId,
  Value<int> productId,
  Value<int?> productUnitId,
  Value<String> productName,
  Value<String> unitName,
  Value<double> quantity,
  Value<double> conversionFactor,
  Value<double> baseQuantity,
  Value<double> unitPrice,
  Value<double> baseUnitCost,
  Value<double> total,
  Value<String?> notes,
});

class $$PurchaseItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseItemsTable> {
  $$PurchaseItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchaseOrderId => $composableBuilder(
      column: $table.purchaseOrderId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productUnitId => $composableBuilder(
      column: $table.productUnitId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unitName => $composableBuilder(
      column: $table.unitName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get conversionFactor => $composableBuilder(
      column: $table.conversionFactor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get baseQuantity => $composableBuilder(
      column: $table.baseQuantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get baseUnitCost => $composableBuilder(
      column: $table.baseUnitCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$PurchaseItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseItemsTable> {
  $$PurchaseItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchaseOrderId => $composableBuilder(
      column: $table.purchaseOrderId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productUnitId => $composableBuilder(
      column: $table.productUnitId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unitName => $composableBuilder(
      column: $table.unitName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get conversionFactor => $composableBuilder(
      column: $table.conversionFactor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get baseQuantity => $composableBuilder(
      column: $table.baseQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get baseUnitCost => $composableBuilder(
      column: $table.baseUnitCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$PurchaseItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseItemsTable> {
  $$PurchaseItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get purchaseOrderId => $composableBuilder(
      column: $table.purchaseOrderId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get productUnitId => $composableBuilder(
      column: $table.productUnitId, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<String> get unitName =>
      $composableBuilder(column: $table.unitName, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get conversionFactor => $composableBuilder(
      column: $table.conversionFactor, builder: (column) => column);

  GeneratedColumn<double> get baseQuantity => $composableBuilder(
      column: $table.baseQuantity, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get baseUnitCost => $composableBuilder(
      column: $table.baseUnitCost, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$PurchaseItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchaseItemsTable,
    PurchaseItemDb,
    $$PurchaseItemsTableFilterComposer,
    $$PurchaseItemsTableOrderingComposer,
    $$PurchaseItemsTableAnnotationComposer,
    $$PurchaseItemsTableCreateCompanionBuilder,
    $$PurchaseItemsTableUpdateCompanionBuilder,
    (
      PurchaseItemDb,
      BaseReferences<_$AppDatabase, $PurchaseItemsTable, PurchaseItemDb>
    ),
    PurchaseItemDb,
    PrefetchHooks Function()> {
  $$PurchaseItemsTableTableManager(_$AppDatabase db, $PurchaseItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> purchaseOrderId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<int?> productUnitId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<String> unitName = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> conversionFactor = const Value.absent(),
            Value<double> baseQuantity = const Value.absent(),
            Value<double> unitPrice = const Value.absent(),
            Value<double> baseUnitCost = const Value.absent(),
            Value<double> total = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              PurchaseItemsCompanion(
            id: id,
            purchaseOrderId: purchaseOrderId,
            productId: productId,
            productUnitId: productUnitId,
            productName: productName,
            unitName: unitName,
            quantity: quantity,
            conversionFactor: conversionFactor,
            baseQuantity: baseQuantity,
            unitPrice: unitPrice,
            baseUnitCost: baseUnitCost,
            total: total,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int purchaseOrderId,
            required int productId,
            Value<int?> productUnitId = const Value.absent(),
            required String productName,
            Value<String> unitName = const Value.absent(),
            required double quantity,
            Value<double> conversionFactor = const Value.absent(),
            required double baseQuantity,
            required double unitPrice,
            required double baseUnitCost,
            required double total,
            Value<String?> notes = const Value.absent(),
          }) =>
              PurchaseItemsCompanion.insert(
            id: id,
            purchaseOrderId: purchaseOrderId,
            productId: productId,
            productUnitId: productUnitId,
            productName: productName,
            unitName: unitName,
            quantity: quantity,
            conversionFactor: conversionFactor,
            baseQuantity: baseQuantity,
            unitPrice: unitPrice,
            baseUnitCost: baseUnitCost,
            total: total,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PurchaseItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PurchaseItemsTable,
    PurchaseItemDb,
    $$PurchaseItemsTableFilterComposer,
    $$PurchaseItemsTableOrderingComposer,
    $$PurchaseItemsTableAnnotationComposer,
    $$PurchaseItemsTableCreateCompanionBuilder,
    $$PurchaseItemsTableUpdateCompanionBuilder,
    (
      PurchaseItemDb,
      BaseReferences<_$AppDatabase, $PurchaseItemsTable, PurchaseItemDb>
    ),
    PurchaseItemDb,
    PrefetchHooks Function()>;
typedef $$PurchaseReceiptsTableCreateCompanionBuilder
    = PurchaseReceiptsCompanion Function({
  Value<int> id,
  required int purchaseOrderId,
  required String receiptNumber,
  Value<DateTime> receivedAt,
  Value<String> status,
  Value<String?> notes,
  Value<String?> internalNotes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$PurchaseReceiptsTableUpdateCompanionBuilder
    = PurchaseReceiptsCompanion Function({
  Value<int> id,
  Value<int> purchaseOrderId,
  Value<String> receiptNumber,
  Value<DateTime> receivedAt,
  Value<String> status,
  Value<String?> notes,
  Value<String?> internalNotes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$PurchaseReceiptsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseReceiptsTable> {
  $$PurchaseReceiptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchaseOrderId => $composableBuilder(
      column: $table.purchaseOrderId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptNumber => $composableBuilder(
      column: $table.receiptNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
      column: $table.receivedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get internalNotes => $composableBuilder(
      column: $table.internalNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PurchaseReceiptsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseReceiptsTable> {
  $$PurchaseReceiptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchaseOrderId => $composableBuilder(
      column: $table.purchaseOrderId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptNumber => $composableBuilder(
      column: $table.receiptNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
      column: $table.receivedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get internalNotes => $composableBuilder(
      column: $table.internalNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PurchaseReceiptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseReceiptsTable> {
  $$PurchaseReceiptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get purchaseOrderId => $composableBuilder(
      column: $table.purchaseOrderId, builder: (column) => column);

  GeneratedColumn<String> get receiptNumber => $composableBuilder(
      column: $table.receiptNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
      column: $table.receivedAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get internalNotes => $composableBuilder(
      column: $table.internalNotes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PurchaseReceiptsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchaseReceiptsTable,
    PurchaseReceiptDb,
    $$PurchaseReceiptsTableFilterComposer,
    $$PurchaseReceiptsTableOrderingComposer,
    $$PurchaseReceiptsTableAnnotationComposer,
    $$PurchaseReceiptsTableCreateCompanionBuilder,
    $$PurchaseReceiptsTableUpdateCompanionBuilder,
    (
      PurchaseReceiptDb,
      BaseReferences<_$AppDatabase, $PurchaseReceiptsTable, PurchaseReceiptDb>
    ),
    PurchaseReceiptDb,
    PrefetchHooks Function()> {
  $$PurchaseReceiptsTableTableManager(
      _$AppDatabase db, $PurchaseReceiptsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseReceiptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseReceiptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseReceiptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> purchaseOrderId = const Value.absent(),
            Value<String> receiptNumber = const Value.absent(),
            Value<DateTime> receivedAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> internalNotes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PurchaseReceiptsCompanion(
            id: id,
            purchaseOrderId: purchaseOrderId,
            receiptNumber: receiptNumber,
            receivedAt: receivedAt,
            status: status,
            notes: notes,
            internalNotes: internalNotes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int purchaseOrderId,
            required String receiptNumber,
            Value<DateTime> receivedAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> internalNotes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PurchaseReceiptsCompanion.insert(
            id: id,
            purchaseOrderId: purchaseOrderId,
            receiptNumber: receiptNumber,
            receivedAt: receivedAt,
            status: status,
            notes: notes,
            internalNotes: internalNotes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PurchaseReceiptsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PurchaseReceiptsTable,
    PurchaseReceiptDb,
    $$PurchaseReceiptsTableFilterComposer,
    $$PurchaseReceiptsTableOrderingComposer,
    $$PurchaseReceiptsTableAnnotationComposer,
    $$PurchaseReceiptsTableCreateCompanionBuilder,
    $$PurchaseReceiptsTableUpdateCompanionBuilder,
    (
      PurchaseReceiptDb,
      BaseReferences<_$AppDatabase, $PurchaseReceiptsTable, PurchaseReceiptDb>
    ),
    PurchaseReceiptDb,
    PrefetchHooks Function()>;
typedef $$PurchaseReceiptItemsTableCreateCompanionBuilder
    = PurchaseReceiptItemsCompanion Function({
  Value<int> id,
  required int purchaseReceiptId,
  required int purchaseItemId,
  required double quantity,
  Value<double> rejectedQuantity,
  Value<String?> notes,
});
typedef $$PurchaseReceiptItemsTableUpdateCompanionBuilder
    = PurchaseReceiptItemsCompanion Function({
  Value<int> id,
  Value<int> purchaseReceiptId,
  Value<int> purchaseItemId,
  Value<double> quantity,
  Value<double> rejectedQuantity,
  Value<String?> notes,
});

class $$PurchaseReceiptItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseReceiptItemsTable> {
  $$PurchaseReceiptItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchaseReceiptId => $composableBuilder(
      column: $table.purchaseReceiptId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchaseItemId => $composableBuilder(
      column: $table.purchaseItemId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rejectedQuantity => $composableBuilder(
      column: $table.rejectedQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$PurchaseReceiptItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseReceiptItemsTable> {
  $$PurchaseReceiptItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchaseReceiptId => $composableBuilder(
      column: $table.purchaseReceiptId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchaseItemId => $composableBuilder(
      column: $table.purchaseItemId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rejectedQuantity => $composableBuilder(
      column: $table.rejectedQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$PurchaseReceiptItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseReceiptItemsTable> {
  $$PurchaseReceiptItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get purchaseReceiptId => $composableBuilder(
      column: $table.purchaseReceiptId, builder: (column) => column);

  GeneratedColumn<int> get purchaseItemId => $composableBuilder(
      column: $table.purchaseItemId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get rejectedQuantity => $composableBuilder(
      column: $table.rejectedQuantity, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$PurchaseReceiptItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchaseReceiptItemsTable,
    PurchaseReceiptItemDb,
    $$PurchaseReceiptItemsTableFilterComposer,
    $$PurchaseReceiptItemsTableOrderingComposer,
    $$PurchaseReceiptItemsTableAnnotationComposer,
    $$PurchaseReceiptItemsTableCreateCompanionBuilder,
    $$PurchaseReceiptItemsTableUpdateCompanionBuilder,
    (
      PurchaseReceiptItemDb,
      BaseReferences<_$AppDatabase, $PurchaseReceiptItemsTable,
          PurchaseReceiptItemDb>
    ),
    PurchaseReceiptItemDb,
    PrefetchHooks Function()> {
  $$PurchaseReceiptItemsTableTableManager(
      _$AppDatabase db, $PurchaseReceiptItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseReceiptItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseReceiptItemsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseReceiptItemsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> purchaseReceiptId = const Value.absent(),
            Value<int> purchaseItemId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> rejectedQuantity = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              PurchaseReceiptItemsCompanion(
            id: id,
            purchaseReceiptId: purchaseReceiptId,
            purchaseItemId: purchaseItemId,
            quantity: quantity,
            rejectedQuantity: rejectedQuantity,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int purchaseReceiptId,
            required int purchaseItemId,
            required double quantity,
            Value<double> rejectedQuantity = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              PurchaseReceiptItemsCompanion.insert(
            id: id,
            purchaseReceiptId: purchaseReceiptId,
            purchaseItemId: purchaseItemId,
            quantity: quantity,
            rejectedQuantity: rejectedQuantity,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PurchaseReceiptItemsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PurchaseReceiptItemsTable,
        PurchaseReceiptItemDb,
        $$PurchaseReceiptItemsTableFilterComposer,
        $$PurchaseReceiptItemsTableOrderingComposer,
        $$PurchaseReceiptItemsTableAnnotationComposer,
        $$PurchaseReceiptItemsTableCreateCompanionBuilder,
        $$PurchaseReceiptItemsTableUpdateCompanionBuilder,
        (
          PurchaseReceiptItemDb,
          BaseReferences<_$AppDatabase, $PurchaseReceiptItemsTable,
              PurchaseReceiptItemDb>
        ),
        PurchaseReceiptItemDb,
        PrefetchHooks Function()>;
typedef $$PurchasePaymentsTableCreateCompanionBuilder
    = PurchasePaymentsCompanion Function({
  Value<int> id,
  required int purchaseOrderId,
  required String paymentNumber,
  required double amount,
  Value<DateTime> paymentDate,
  Value<String> paymentMethod,
  Value<String?> referenceNumber,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$PurchasePaymentsTableUpdateCompanionBuilder
    = PurchasePaymentsCompanion Function({
  Value<int> id,
  Value<int> purchaseOrderId,
  Value<String> paymentNumber,
  Value<double> amount,
  Value<DateTime> paymentDate,
  Value<String> paymentMethod,
  Value<String?> referenceNumber,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$PurchasePaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchasePaymentsTable> {
  $$PurchasePaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchaseOrderId => $composableBuilder(
      column: $table.purchaseOrderId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentNumber => $composableBuilder(
      column: $table.paymentNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PurchasePaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchasePaymentsTable> {
  $$PurchasePaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchaseOrderId => $composableBuilder(
      column: $table.purchaseOrderId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentNumber => $composableBuilder(
      column: $table.paymentNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PurchasePaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchasePaymentsTable> {
  $$PurchasePaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get purchaseOrderId => $composableBuilder(
      column: $table.purchaseOrderId, builder: (column) => column);

  GeneratedColumn<String> get paymentNumber => $composableBuilder(
      column: $table.paymentNumber, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PurchasePaymentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchasePaymentsTable,
    PurchasePaymentDb,
    $$PurchasePaymentsTableFilterComposer,
    $$PurchasePaymentsTableOrderingComposer,
    $$PurchasePaymentsTableAnnotationComposer,
    $$PurchasePaymentsTableCreateCompanionBuilder,
    $$PurchasePaymentsTableUpdateCompanionBuilder,
    (
      PurchasePaymentDb,
      BaseReferences<_$AppDatabase, $PurchasePaymentsTable, PurchasePaymentDb>
    ),
    PurchasePaymentDb,
    PrefetchHooks Function()> {
  $$PurchasePaymentsTableTableManager(
      _$AppDatabase db, $PurchasePaymentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchasePaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchasePaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchasePaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> purchaseOrderId = const Value.absent(),
            Value<String> paymentNumber = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String?> referenceNumber = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PurchasePaymentsCompanion(
            id: id,
            purchaseOrderId: purchaseOrderId,
            paymentNumber: paymentNumber,
            amount: amount,
            paymentDate: paymentDate,
            paymentMethod: paymentMethod,
            referenceNumber: referenceNumber,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int purchaseOrderId,
            required String paymentNumber,
            required double amount,
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String?> referenceNumber = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PurchasePaymentsCompanion.insert(
            id: id,
            purchaseOrderId: purchaseOrderId,
            paymentNumber: paymentNumber,
            amount: amount,
            paymentDate: paymentDate,
            paymentMethod: paymentMethod,
            referenceNumber: referenceNumber,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PurchasePaymentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PurchasePaymentsTable,
    PurchasePaymentDb,
    $$PurchasePaymentsTableFilterComposer,
    $$PurchasePaymentsTableOrderingComposer,
    $$PurchasePaymentsTableAnnotationComposer,
    $$PurchasePaymentsTableCreateCompanionBuilder,
    $$PurchasePaymentsTableUpdateCompanionBuilder,
    (
      PurchasePaymentDb,
      BaseReferences<_$AppDatabase, $PurchasePaymentsTable, PurchasePaymentDb>
    ),
    PurchasePaymentDb,
    PrefetchHooks Function()>;
typedef $$SupplierProductsTableCreateCompanionBuilder
    = SupplierProductsCompanion Function({
  Value<int> id,
  required int supplierId,
  required int productId,
  Value<int?> productUnitId,
  Value<String?> supplierProductCode,
  Value<String?> supplierBarcode,
  Value<double> purchasePrice,
  Value<double> minimumOrderQuantity,
  Value<double> maximumOrderQuantity,
  Value<int> deliveryDays,
  Value<bool> isPreferred,
  Value<bool> isActive,
  Value<DateTime?> lastPurchaseAt,
  Value<double> lastPurchasedPrice,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$SupplierProductsTableUpdateCompanionBuilder
    = SupplierProductsCompanion Function({
  Value<int> id,
  Value<int> supplierId,
  Value<int> productId,
  Value<int?> productUnitId,
  Value<String?> supplierProductCode,
  Value<String?> supplierBarcode,
  Value<double> purchasePrice,
  Value<double> minimumOrderQuantity,
  Value<double> maximumOrderQuantity,
  Value<int> deliveryDays,
  Value<bool> isPreferred,
  Value<bool> isActive,
  Value<DateTime?> lastPurchaseAt,
  Value<double> lastPurchasedPrice,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$SupplierProductsTableFilterComposer
    extends Composer<_$AppDatabase, $SupplierProductsTable> {
  $$SupplierProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productUnitId => $composableBuilder(
      column: $table.productUnitId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplierProductCode => $composableBuilder(
      column: $table.supplierProductCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplierBarcode => $composableBuilder(
      column: $table.supplierBarcode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minimumOrderQuantity => $composableBuilder(
      column: $table.minimumOrderQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maximumOrderQuantity => $composableBuilder(
      column: $table.maximumOrderQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deliveryDays => $composableBuilder(
      column: $table.deliveryDays, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPreferred => $composableBuilder(
      column: $table.isPreferred, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPurchaseAt => $composableBuilder(
      column: $table.lastPurchaseAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lastPurchasedPrice => $composableBuilder(
      column: $table.lastPurchasedPrice,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SupplierProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplierProductsTable> {
  $$SupplierProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productUnitId => $composableBuilder(
      column: $table.productUnitId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplierProductCode => $composableBuilder(
      column: $table.supplierProductCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplierBarcode => $composableBuilder(
      column: $table.supplierBarcode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minimumOrderQuantity => $composableBuilder(
      column: $table.minimumOrderQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maximumOrderQuantity => $composableBuilder(
      column: $table.maximumOrderQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deliveryDays => $composableBuilder(
      column: $table.deliveryDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPreferred => $composableBuilder(
      column: $table.isPreferred, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPurchaseAt => $composableBuilder(
      column: $table.lastPurchaseAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lastPurchasedPrice => $composableBuilder(
      column: $table.lastPurchasedPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SupplierProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplierProductsTable> {
  $$SupplierProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get productUnitId => $composableBuilder(
      column: $table.productUnitId, builder: (column) => column);

  GeneratedColumn<String> get supplierProductCode => $composableBuilder(
      column: $table.supplierProductCode, builder: (column) => column);

  GeneratedColumn<String> get supplierBarcode => $composableBuilder(
      column: $table.supplierBarcode, builder: (column) => column);

  GeneratedColumn<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => column);

  GeneratedColumn<double> get minimumOrderQuantity => $composableBuilder(
      column: $table.minimumOrderQuantity, builder: (column) => column);

  GeneratedColumn<double> get maximumOrderQuantity => $composableBuilder(
      column: $table.maximumOrderQuantity, builder: (column) => column);

  GeneratedColumn<int> get deliveryDays => $composableBuilder(
      column: $table.deliveryDays, builder: (column) => column);

  GeneratedColumn<bool> get isPreferred => $composableBuilder(
      column: $table.isPreferred, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPurchaseAt => $composableBuilder(
      column: $table.lastPurchaseAt, builder: (column) => column);

  GeneratedColumn<double> get lastPurchasedPrice => $composableBuilder(
      column: $table.lastPurchasedPrice, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SupplierProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SupplierProductsTable,
    SupplierProductDb,
    $$SupplierProductsTableFilterComposer,
    $$SupplierProductsTableOrderingComposer,
    $$SupplierProductsTableAnnotationComposer,
    $$SupplierProductsTableCreateCompanionBuilder,
    $$SupplierProductsTableUpdateCompanionBuilder,
    (
      SupplierProductDb,
      BaseReferences<_$AppDatabase, $SupplierProductsTable, SupplierProductDb>
    ),
    SupplierProductDb,
    PrefetchHooks Function()> {
  $$SupplierProductsTableTableManager(
      _$AppDatabase db, $SupplierProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplierProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplierProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> supplierId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<int?> productUnitId = const Value.absent(),
            Value<String?> supplierProductCode = const Value.absent(),
            Value<String?> supplierBarcode = const Value.absent(),
            Value<double> purchasePrice = const Value.absent(),
            Value<double> minimumOrderQuantity = const Value.absent(),
            Value<double> maximumOrderQuantity = const Value.absent(),
            Value<int> deliveryDays = const Value.absent(),
            Value<bool> isPreferred = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime?> lastPurchaseAt = const Value.absent(),
            Value<double> lastPurchasedPrice = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SupplierProductsCompanion(
            id: id,
            supplierId: supplierId,
            productId: productId,
            productUnitId: productUnitId,
            supplierProductCode: supplierProductCode,
            supplierBarcode: supplierBarcode,
            purchasePrice: purchasePrice,
            minimumOrderQuantity: minimumOrderQuantity,
            maximumOrderQuantity: maximumOrderQuantity,
            deliveryDays: deliveryDays,
            isPreferred: isPreferred,
            isActive: isActive,
            lastPurchaseAt: lastPurchaseAt,
            lastPurchasedPrice: lastPurchasedPrice,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int supplierId,
            required int productId,
            Value<int?> productUnitId = const Value.absent(),
            Value<String?> supplierProductCode = const Value.absent(),
            Value<String?> supplierBarcode = const Value.absent(),
            Value<double> purchasePrice = const Value.absent(),
            Value<double> minimumOrderQuantity = const Value.absent(),
            Value<double> maximumOrderQuantity = const Value.absent(),
            Value<int> deliveryDays = const Value.absent(),
            Value<bool> isPreferred = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime?> lastPurchaseAt = const Value.absent(),
            Value<double> lastPurchasedPrice = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SupplierProductsCompanion.insert(
            id: id,
            supplierId: supplierId,
            productId: productId,
            productUnitId: productUnitId,
            supplierProductCode: supplierProductCode,
            supplierBarcode: supplierBarcode,
            purchasePrice: purchasePrice,
            minimumOrderQuantity: minimumOrderQuantity,
            maximumOrderQuantity: maximumOrderQuantity,
            deliveryDays: deliveryDays,
            isPreferred: isPreferred,
            isActive: isActive,
            lastPurchaseAt: lastPurchaseAt,
            lastPurchasedPrice: lastPurchasedPrice,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SupplierProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SupplierProductsTable,
    SupplierProductDb,
    $$SupplierProductsTableFilterComposer,
    $$SupplierProductsTableOrderingComposer,
    $$SupplierProductsTableAnnotationComposer,
    $$SupplierProductsTableCreateCompanionBuilder,
    $$SupplierProductsTableUpdateCompanionBuilder,
    (
      SupplierProductDb,
      BaseReferences<_$AppDatabase, $SupplierProductsTable, SupplierProductDb>
    ),
    SupplierProductDb,
    PrefetchHooks Function()>;
typedef $$SalesTableCreateCompanionBuilder = SalesCompanion Function({
  Value<int> id,
  required String invoiceNumber,
  required double subtotal,
  Value<double> discount,
  required double total,
  Value<double> paidAmount,
  Value<String> paymentMethod,
  Value<String> paymentStatus,
  Value<String> status,
  Value<DateTime?> cancelledAt,
  Value<String?> cancellationReason,
  Value<DateTime> createdAt,
});
typedef $$SalesTableUpdateCompanionBuilder = SalesCompanion Function({
  Value<int> id,
  Value<String> invoiceNumber,
  Value<double> subtotal,
  Value<double> discount,
  Value<double> total,
  Value<double> paidAmount,
  Value<String> paymentMethod,
  Value<String> paymentStatus,
  Value<String> status,
  Value<DateTime?> cancelledAt,
  Value<String?> cancellationReason,
  Value<DateTime> createdAt,
});

class $$SalesTableFilterComposer extends Composer<_$AppDatabase, $SalesTable> {
  $$SalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invoiceNumber => $composableBuilder(
      column: $table.invoiceNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cancelledAt => $composableBuilder(
      column: $table.cancelledAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cancellationReason => $composableBuilder(
      column: $table.cancellationReason,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$SalesTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesTable> {
  $$SalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invoiceNumber => $composableBuilder(
      column: $table.invoiceNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cancelledAt => $composableBuilder(
      column: $table.cancelledAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cancellationReason => $composableBuilder(
      column: $table.cancellationReason,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesTable> {
  $$SalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNumber => $composableBuilder(
      column: $table.invoiceNumber, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get cancelledAt => $composableBuilder(
      column: $table.cancelledAt, builder: (column) => column);

  GeneratedColumn<String> get cancellationReason => $composableBuilder(
      column: $table.cancellationReason, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SalesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SalesTable,
    SaleDb,
    $$SalesTableFilterComposer,
    $$SalesTableOrderingComposer,
    $$SalesTableAnnotationComposer,
    $$SalesTableCreateCompanionBuilder,
    $$SalesTableUpdateCompanionBuilder,
    (SaleDb, BaseReferences<_$AppDatabase, $SalesTable, SaleDb>),
    SaleDb,
    PrefetchHooks Function()> {
  $$SalesTableTableManager(_$AppDatabase db, $SalesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> invoiceNumber = const Value.absent(),
            Value<double> subtotal = const Value.absent(),
            Value<double> discount = const Value.absent(),
            Value<double> total = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> cancelledAt = const Value.absent(),
            Value<String?> cancellationReason = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SalesCompanion(
            id: id,
            invoiceNumber: invoiceNumber,
            subtotal: subtotal,
            discount: discount,
            total: total,
            paidAmount: paidAmount,
            paymentMethod: paymentMethod,
            paymentStatus: paymentStatus,
            status: status,
            cancelledAt: cancelledAt,
            cancellationReason: cancellationReason,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String invoiceNumber,
            required double subtotal,
            Value<double> discount = const Value.absent(),
            required double total,
            Value<double> paidAmount = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> cancelledAt = const Value.absent(),
            Value<String?> cancellationReason = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SalesCompanion.insert(
            id: id,
            invoiceNumber: invoiceNumber,
            subtotal: subtotal,
            discount: discount,
            total: total,
            paidAmount: paidAmount,
            paymentMethod: paymentMethod,
            paymentStatus: paymentStatus,
            status: status,
            cancelledAt: cancelledAt,
            cancellationReason: cancellationReason,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SalesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SalesTable,
    SaleDb,
    $$SalesTableFilterComposer,
    $$SalesTableOrderingComposer,
    $$SalesTableAnnotationComposer,
    $$SalesTableCreateCompanionBuilder,
    $$SalesTableUpdateCompanionBuilder,
    (SaleDb, BaseReferences<_$AppDatabase, $SalesTable, SaleDb>),
    SaleDb,
    PrefetchHooks Function()>;
typedef $$SaleItemsTableCreateCompanionBuilder = SaleItemsCompanion Function({
  Value<int> id,
  required int saleId,
  required int productId,
  required String productName,
  required double quantity,
  required double unitPrice,
  required double costPrice,
  required double total,
});
typedef $$SaleItemsTableUpdateCompanionBuilder = SaleItemsCompanion Function({
  Value<int> id,
  Value<int> saleId,
  Value<int> productId,
  Value<String> productName,
  Value<double> quantity,
  Value<double> unitPrice,
  Value<double> costPrice,
  Value<double> total,
});

class $$SaleItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get saleId => $composableBuilder(
      column: $table.saleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));
}

class $$SaleItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get saleId => $composableBuilder(
      column: $table.saleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));
}

class $$SaleItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get saleId =>
      $composableBuilder(column: $table.saleId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);
}

class $$SaleItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SaleItemsTable,
    SaleItemDb,
    $$SaleItemsTableFilterComposer,
    $$SaleItemsTableOrderingComposer,
    $$SaleItemsTableAnnotationComposer,
    $$SaleItemsTableCreateCompanionBuilder,
    $$SaleItemsTableUpdateCompanionBuilder,
    (SaleItemDb, BaseReferences<_$AppDatabase, $SaleItemsTable, SaleItemDb>),
    SaleItemDb,
    PrefetchHooks Function()> {
  $$SaleItemsTableTableManager(_$AppDatabase db, $SaleItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SaleItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SaleItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SaleItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> saleId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> unitPrice = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
            Value<double> total = const Value.absent(),
          }) =>
              SaleItemsCompanion(
            id: id,
            saleId: saleId,
            productId: productId,
            productName: productName,
            quantity: quantity,
            unitPrice: unitPrice,
            costPrice: costPrice,
            total: total,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int saleId,
            required int productId,
            required String productName,
            required double quantity,
            required double unitPrice,
            required double costPrice,
            required double total,
          }) =>
              SaleItemsCompanion.insert(
            id: id,
            saleId: saleId,
            productId: productId,
            productName: productName,
            quantity: quantity,
            unitPrice: unitPrice,
            costPrice: costPrice,
            total: total,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SaleItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SaleItemsTable,
    SaleItemDb,
    $$SaleItemsTableFilterComposer,
    $$SaleItemsTableOrderingComposer,
    $$SaleItemsTableAnnotationComposer,
    $$SaleItemsTableCreateCompanionBuilder,
    $$SaleItemsTableUpdateCompanionBuilder,
    (SaleItemDb, BaseReferences<_$AppDatabase, $SaleItemsTable, SaleItemDb>),
    SaleItemDb,
    PrefetchHooks Function()>;
typedef $$StockMovementsTableCreateCompanionBuilder = StockMovementsCompanion
    Function({
  Value<int> id,
  required int productId,
  required double quantity,
  required String type,
  Value<String?> reference,
  Value<String?> note,
  Value<DateTime> createdAt,
});
typedef $$StockMovementsTableUpdateCompanionBuilder = StockMovementsCompanion
    Function({
  Value<int> id,
  Value<int> productId,
  Value<double> quantity,
  Value<String> type,
  Value<String?> reference,
  Value<String?> note,
  Value<DateTime> createdAt,
});

class $$StockMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reference => $composableBuilder(
      column: $table.reference, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$StockMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reference => $composableBuilder(
      column: $table.reference, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$StockMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$StockMovementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StockMovementsTable,
    StockMovementDb,
    $$StockMovementsTableFilterComposer,
    $$StockMovementsTableOrderingComposer,
    $$StockMovementsTableAnnotationComposer,
    $$StockMovementsTableCreateCompanionBuilder,
    $$StockMovementsTableUpdateCompanionBuilder,
    (
      StockMovementDb,
      BaseReferences<_$AppDatabase, $StockMovementsTable, StockMovementDb>
    ),
    StockMovementDb,
    PrefetchHooks Function()> {
  $$StockMovementsTableTableManager(
      _$AppDatabase db, $StockMovementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockMovementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockMovementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> reference = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              StockMovementsCompanion(
            id: id,
            productId: productId,
            quantity: quantity,
            type: type,
            reference: reference,
            note: note,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int productId,
            required double quantity,
            required String type,
            Value<String?> reference = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              StockMovementsCompanion.insert(
            id: id,
            productId: productId,
            quantity: quantity,
            type: type,
            reference: reference,
            note: note,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StockMovementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StockMovementsTable,
    StockMovementDb,
    $$StockMovementsTableFilterComposer,
    $$StockMovementsTableOrderingComposer,
    $$StockMovementsTableAnnotationComposer,
    $$StockMovementsTableCreateCompanionBuilder,
    $$StockMovementsTableUpdateCompanionBuilder,
    (
      StockMovementDb,
      BaseReferences<_$AppDatabase, $StockMovementsTable, StockMovementDb>
    ),
    StockMovementDb,
    PrefetchHooks Function()>;
typedef $$ReturnsTableCreateCompanionBuilder = ReturnsCompanion Function({
  Value<int> id,
  required int saleId,
  required double total,
  Value<DateTime> createdAt,
});
typedef $$ReturnsTableUpdateCompanionBuilder = ReturnsCompanion Function({
  Value<int> id,
  Value<int> saleId,
  Value<double> total,
  Value<DateTime> createdAt,
});

class $$ReturnsTableFilterComposer
    extends Composer<_$AppDatabase, $ReturnsTable> {
  $$ReturnsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get saleId => $composableBuilder(
      column: $table.saleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$ReturnsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReturnsTable> {
  $$ReturnsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get saleId => $composableBuilder(
      column: $table.saleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ReturnsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReturnsTable> {
  $$ReturnsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get saleId =>
      $composableBuilder(column: $table.saleId, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ReturnsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReturnsTable,
    ReturnDb,
    $$ReturnsTableFilterComposer,
    $$ReturnsTableOrderingComposer,
    $$ReturnsTableAnnotationComposer,
    $$ReturnsTableCreateCompanionBuilder,
    $$ReturnsTableUpdateCompanionBuilder,
    (ReturnDb, BaseReferences<_$AppDatabase, $ReturnsTable, ReturnDb>),
    ReturnDb,
    PrefetchHooks Function()> {
  $$ReturnsTableTableManager(_$AppDatabase db, $ReturnsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReturnsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReturnsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReturnsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> saleId = const Value.absent(),
            Value<double> total = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ReturnsCompanion(
            id: id,
            saleId: saleId,
            total: total,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int saleId,
            required double total,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ReturnsCompanion.insert(
            id: id,
            saleId: saleId,
            total: total,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReturnsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReturnsTable,
    ReturnDb,
    $$ReturnsTableFilterComposer,
    $$ReturnsTableOrderingComposer,
    $$ReturnsTableAnnotationComposer,
    $$ReturnsTableCreateCompanionBuilder,
    $$ReturnsTableUpdateCompanionBuilder,
    (ReturnDb, BaseReferences<_$AppDatabase, $ReturnsTable, ReturnDb>),
    ReturnDb,
    PrefetchHooks Function()>;
typedef $$ReturnItemsTableCreateCompanionBuilder = ReturnItemsCompanion
    Function({
  Value<int> id,
  required int returnId,
  required int productId,
  required double quantity,
  required double unitPrice,
  required double total,
});
typedef $$ReturnItemsTableUpdateCompanionBuilder = ReturnItemsCompanion
    Function({
  Value<int> id,
  Value<int> returnId,
  Value<int> productId,
  Value<double> quantity,
  Value<double> unitPrice,
  Value<double> total,
});

class $$ReturnItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ReturnItemsTable> {
  $$ReturnItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get returnId => $composableBuilder(
      column: $table.returnId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));
}

class $$ReturnItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReturnItemsTable> {
  $$ReturnItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get returnId => $composableBuilder(
      column: $table.returnId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));
}

class $$ReturnItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReturnItemsTable> {
  $$ReturnItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get returnId =>
      $composableBuilder(column: $table.returnId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);
}

class $$ReturnItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReturnItemsTable,
    ReturnItemDb,
    $$ReturnItemsTableFilterComposer,
    $$ReturnItemsTableOrderingComposer,
    $$ReturnItemsTableAnnotationComposer,
    $$ReturnItemsTableCreateCompanionBuilder,
    $$ReturnItemsTableUpdateCompanionBuilder,
    (
      ReturnItemDb,
      BaseReferences<_$AppDatabase, $ReturnItemsTable, ReturnItemDb>
    ),
    ReturnItemDb,
    PrefetchHooks Function()> {
  $$ReturnItemsTableTableManager(_$AppDatabase db, $ReturnItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReturnItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReturnItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReturnItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> returnId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> unitPrice = const Value.absent(),
            Value<double> total = const Value.absent(),
          }) =>
              ReturnItemsCompanion(
            id: id,
            returnId: returnId,
            productId: productId,
            quantity: quantity,
            unitPrice: unitPrice,
            total: total,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int returnId,
            required int productId,
            required double quantity,
            required double unitPrice,
            required double total,
          }) =>
              ReturnItemsCompanion.insert(
            id: id,
            returnId: returnId,
            productId: productId,
            quantity: quantity,
            unitPrice: unitPrice,
            total: total,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReturnItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReturnItemsTable,
    ReturnItemDb,
    $$ReturnItemsTableFilterComposer,
    $$ReturnItemsTableOrderingComposer,
    $$ReturnItemsTableAnnotationComposer,
    $$ReturnItemsTableCreateCompanionBuilder,
    $$ReturnItemsTableUpdateCompanionBuilder,
    (
      ReturnItemDb,
      BaseReferences<_$AppDatabase, $ReturnItemsTable, ReturnItemDb>
    ),
    ReturnItemDb,
    PrefetchHooks Function()>;
typedef $$ReferenceTestParentsTableCreateCompanionBuilder
    = ReferenceTestParentsCompanion Function({
  Value<int> id,
});
typedef $$ReferenceTestParentsTableUpdateCompanionBuilder
    = ReferenceTestParentsCompanion Function({
  Value<int> id,
});

class $$ReferenceTestParentsTableFilterComposer
    extends Composer<_$AppDatabase, $ReferenceTestParentsTable> {
  $$ReferenceTestParentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));
}

class $$ReferenceTestParentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReferenceTestParentsTable> {
  $$ReferenceTestParentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));
}

class $$ReferenceTestParentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReferenceTestParentsTable> {
  $$ReferenceTestParentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);
}

class $$ReferenceTestParentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReferenceTestParentsTable,
    ReferenceTestParentDb,
    $$ReferenceTestParentsTableFilterComposer,
    $$ReferenceTestParentsTableOrderingComposer,
    $$ReferenceTestParentsTableAnnotationComposer,
    $$ReferenceTestParentsTableCreateCompanionBuilder,
    $$ReferenceTestParentsTableUpdateCompanionBuilder,
    (
      ReferenceTestParentDb,
      BaseReferences<_$AppDatabase, $ReferenceTestParentsTable,
          ReferenceTestParentDb>
    ),
    ReferenceTestParentDb,
    PrefetchHooks Function()> {
  $$ReferenceTestParentsTableTableManager(
      _$AppDatabase db, $ReferenceTestParentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReferenceTestParentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReferenceTestParentsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReferenceTestParentsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
          }) =>
              ReferenceTestParentsCompanion(
            id: id,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
          }) =>
              ReferenceTestParentsCompanion.insert(
            id: id,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReferenceTestParentsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ReferenceTestParentsTable,
        ReferenceTestParentDb,
        $$ReferenceTestParentsTableFilterComposer,
        $$ReferenceTestParentsTableOrderingComposer,
        $$ReferenceTestParentsTableAnnotationComposer,
        $$ReferenceTestParentsTableCreateCompanionBuilder,
        $$ReferenceTestParentsTableUpdateCompanionBuilder,
        (
          ReferenceTestParentDb,
          BaseReferences<_$AppDatabase, $ReferenceTestParentsTable,
              ReferenceTestParentDb>
        ),
        ReferenceTestParentDb,
        PrefetchHooks Function()>;
typedef $$ReferenceTestChildrenTableCreateCompanionBuilder
    = ReferenceTestChildrenCompanion Function({
  Value<int> id,
  required int parentId,
});
typedef $$ReferenceTestChildrenTableUpdateCompanionBuilder
    = ReferenceTestChildrenCompanion Function({
  Value<int> id,
  Value<int> parentId,
});

class $$ReferenceTestChildrenTableFilterComposer
    extends Composer<_$AppDatabase, $ReferenceTestChildrenTable> {
  $$ReferenceTestChildrenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));
}

class $$ReferenceTestChildrenTableOrderingComposer
    extends Composer<_$AppDatabase, $ReferenceTestChildrenTable> {
  $$ReferenceTestChildrenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));
}

class $$ReferenceTestChildrenTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReferenceTestChildrenTable> {
  $$ReferenceTestChildrenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);
}

class $$ReferenceTestChildrenTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReferenceTestChildrenTable,
    ReferenceTestChildDb,
    $$ReferenceTestChildrenTableFilterComposer,
    $$ReferenceTestChildrenTableOrderingComposer,
    $$ReferenceTestChildrenTableAnnotationComposer,
    $$ReferenceTestChildrenTableCreateCompanionBuilder,
    $$ReferenceTestChildrenTableUpdateCompanionBuilder,
    (
      ReferenceTestChildDb,
      BaseReferences<_$AppDatabase, $ReferenceTestChildrenTable,
          ReferenceTestChildDb>
    ),
    ReferenceTestChildDb,
    PrefetchHooks Function()> {
  $$ReferenceTestChildrenTableTableManager(
      _$AppDatabase db, $ReferenceTestChildrenTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReferenceTestChildrenTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ReferenceTestChildrenTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReferenceTestChildrenTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> parentId = const Value.absent(),
          }) =>
              ReferenceTestChildrenCompanion(
            id: id,
            parentId: parentId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int parentId,
          }) =>
              ReferenceTestChildrenCompanion.insert(
            id: id,
            parentId: parentId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReferenceTestChildrenTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ReferenceTestChildrenTable,
        ReferenceTestChildDb,
        $$ReferenceTestChildrenTableFilterComposer,
        $$ReferenceTestChildrenTableOrderingComposer,
        $$ReferenceTestChildrenTableAnnotationComposer,
        $$ReferenceTestChildrenTableCreateCompanionBuilder,
        $$ReferenceTestChildrenTableUpdateCompanionBuilder,
        (
          ReferenceTestChildDb,
          BaseReferences<_$AppDatabase, $ReferenceTestChildrenTable,
              ReferenceTestChildDb>
        ),
        ReferenceTestChildDb,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$BrandsTableTableManager get brands =>
      $$BrandsTableTableManager(_db, _db.brands);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ProductUnitsTableTableManager get productUnits =>
      $$ProductUnitsTableTableManager(_db, _db.productUnits);
  $$ProductBarcodesTableTableManager get productBarcodes =>
      $$ProductBarcodesTableTableManager(_db, _db.productBarcodes);
  $$ProductImagesTableTableManager get productImages =>
      $$ProductImagesTableTableManager(_db, _db.productImages);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$SuppliersTableTableManager get suppliers =>
      $$SuppliersTableTableManager(_db, _db.suppliers);
  $$PurchaseOrdersTableTableManager get purchaseOrders =>
      $$PurchaseOrdersTableTableManager(_db, _db.purchaseOrders);
  $$PurchaseItemsTableTableManager get purchaseItems =>
      $$PurchaseItemsTableTableManager(_db, _db.purchaseItems);
  $$PurchaseReceiptsTableTableManager get purchaseReceipts =>
      $$PurchaseReceiptsTableTableManager(_db, _db.purchaseReceipts);
  $$PurchaseReceiptItemsTableTableManager get purchaseReceiptItems =>
      $$PurchaseReceiptItemsTableTableManager(_db, _db.purchaseReceiptItems);
  $$PurchasePaymentsTableTableManager get purchasePayments =>
      $$PurchasePaymentsTableTableManager(_db, _db.purchasePayments);
  $$SupplierProductsTableTableManager get supplierProducts =>
      $$SupplierProductsTableTableManager(_db, _db.supplierProducts);
  $$SalesTableTableManager get sales =>
      $$SalesTableTableManager(_db, _db.sales);
  $$SaleItemsTableTableManager get saleItems =>
      $$SaleItemsTableTableManager(_db, _db.saleItems);
  $$StockMovementsTableTableManager get stockMovements =>
      $$StockMovementsTableTableManager(_db, _db.stockMovements);
  $$ReturnsTableTableManager get returns =>
      $$ReturnsTableTableManager(_db, _db.returns);
  $$ReturnItemsTableTableManager get returnItems =>
      $$ReturnItemsTableTableManager(_db, _db.returnItems);
  $$ReferenceTestParentsTableTableManager get referenceTestParents =>
      $$ReferenceTestParentsTableTableManager(_db, _db.referenceTestParents);
  $$ReferenceTestChildrenTableTableManager get referenceTestChildren =>
      $$ReferenceTestChildrenTableTableManager(_db, _db.referenceTestChildren);
}
