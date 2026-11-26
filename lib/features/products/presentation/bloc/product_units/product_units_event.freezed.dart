// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_units_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductUnitsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductUnitsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductUnitsEvent()';
  }
}

/// @nodoc
class $ProductUnitsEventCopyWith<$Res> {
  $ProductUnitsEventCopyWith(
      ProductUnitsEvent _, $Res Function(ProductUnitsEvent) __);
}

/// Adds pattern-matching-related methods to [ProductUnitsEvent].
extension ProductUnitsEventPatterns on ProductUnitsEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductUnits value)? load,
    TResult Function(WatchProductUnits value)? watch,
    TResult Function(ProductUnitsChanged value)? unitsChanged,
    TResult Function(GetProductUnitById value)? getById,
    TResult Function(CreateProductUnit value)? create,
    TResult Function(UpdateProductUnit value)? update,
    TResult Function(SetBaseProductUnit value)? setBase,
    TResult Function(SetDefaultProductUnit value)? setDefault,
    TResult Function(DeleteProductUnit value)? delete,
    TResult Function(ClearProductUnitMessages value)? clearMessages,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductUnits() when load != null:
        return load(_that);
      case WatchProductUnits() when watch != null:
        return watch(_that);
      case ProductUnitsChanged() when unitsChanged != null:
        return unitsChanged(_that);
      case GetProductUnitById() when getById != null:
        return getById(_that);
      case CreateProductUnit() when create != null:
        return create(_that);
      case UpdateProductUnit() when update != null:
        return update(_that);
      case SetBaseProductUnit() when setBase != null:
        return setBase(_that);
      case SetDefaultProductUnit() when setDefault != null:
        return setDefault(_that);
      case DeleteProductUnit() when delete != null:
        return delete(_that);
      case ClearProductUnitMessages() when clearMessages != null:
        return clearMessages(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductUnits value) load,
    required TResult Function(WatchProductUnits value) watch,
    required TResult Function(ProductUnitsChanged value) unitsChanged,
    required TResult Function(GetProductUnitById value) getById,
    required TResult Function(CreateProductUnit value) create,
    required TResult Function(UpdateProductUnit value) update,
    required TResult Function(SetBaseProductUnit value) setBase,
    required TResult Function(SetDefaultProductUnit value) setDefault,
    required TResult Function(DeleteProductUnit value) delete,
    required TResult Function(ClearProductUnitMessages value) clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductUnits():
        return load(_that);
      case WatchProductUnits():
        return watch(_that);
      case ProductUnitsChanged():
        return unitsChanged(_that);
      case GetProductUnitById():
        return getById(_that);
      case CreateProductUnit():
        return create(_that);
      case UpdateProductUnit():
        return update(_that);
      case SetBaseProductUnit():
        return setBase(_that);
      case SetDefaultProductUnit():
        return setDefault(_that);
      case DeleteProductUnit():
        return delete(_that);
      case ClearProductUnitMessages():
        return clearMessages(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductUnits value)? load,
    TResult? Function(WatchProductUnits value)? watch,
    TResult? Function(ProductUnitsChanged value)? unitsChanged,
    TResult? Function(GetProductUnitById value)? getById,
    TResult? Function(CreateProductUnit value)? create,
    TResult? Function(UpdateProductUnit value)? update,
    TResult? Function(SetBaseProductUnit value)? setBase,
    TResult? Function(SetDefaultProductUnit value)? setDefault,
    TResult? Function(DeleteProductUnit value)? delete,
    TResult? Function(ClearProductUnitMessages value)? clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductUnits() when load != null:
        return load(_that);
      case WatchProductUnits() when watch != null:
        return watch(_that);
      case ProductUnitsChanged() when unitsChanged != null:
        return unitsChanged(_that);
      case GetProductUnitById() when getById != null:
        return getById(_that);
      case CreateProductUnit() when create != null:
        return create(_that);
      case UpdateProductUnit() when update != null:
        return update(_that);
      case SetBaseProductUnit() when setBase != null:
        return setBase(_that);
      case SetDefaultProductUnit() when setDefault != null:
        return setDefault(_that);
      case DeleteProductUnit() when delete != null:
        return delete(_that);
      case ClearProductUnitMessages() when clearMessages != null:
        return clearMessages(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productId)? load,
    TResult Function(int productId)? watch,
    TResult Function(List<ProductUnit> units)? unitsChanged,
    TResult Function(int id)? getById,
    TResult Function(ProductUnit unit)? create,
    TResult Function(int id, ProductUnit unit)? update,
    TResult Function(int productId, int unitId)? setBase,
    TResult Function(int productId, int unitId)? setDefault,
    TResult Function(int id)? delete,
    TResult Function()? clearMessages,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductUnits() when load != null:
        return load(_that.productId);
      case WatchProductUnits() when watch != null:
        return watch(_that.productId);
      case ProductUnitsChanged() when unitsChanged != null:
        return unitsChanged(_that.units);
      case GetProductUnitById() when getById != null:
        return getById(_that.id);
      case CreateProductUnit() when create != null:
        return create(_that.unit);
      case UpdateProductUnit() when update != null:
        return update(_that.id, _that.unit);
      case SetBaseProductUnit() when setBase != null:
        return setBase(_that.productId, _that.unitId);
      case SetDefaultProductUnit() when setDefault != null:
        return setDefault(_that.productId, _that.unitId);
      case DeleteProductUnit() when delete != null:
        return delete(_that.id);
      case ClearProductUnitMessages() when clearMessages != null:
        return clearMessages();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int productId) load,
    required TResult Function(int productId) watch,
    required TResult Function(List<ProductUnit> units) unitsChanged,
    required TResult Function(int id) getById,
    required TResult Function(ProductUnit unit) create,
    required TResult Function(int id, ProductUnit unit) update,
    required TResult Function(int productId, int unitId) setBase,
    required TResult Function(int productId, int unitId) setDefault,
    required TResult Function(int id) delete,
    required TResult Function() clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductUnits():
        return load(_that.productId);
      case WatchProductUnits():
        return watch(_that.productId);
      case ProductUnitsChanged():
        return unitsChanged(_that.units);
      case GetProductUnitById():
        return getById(_that.id);
      case CreateProductUnit():
        return create(_that.unit);
      case UpdateProductUnit():
        return update(_that.id, _that.unit);
      case SetBaseProductUnit():
        return setBase(_that.productId, _that.unitId);
      case SetDefaultProductUnit():
        return setDefault(_that.productId, _that.unitId);
      case DeleteProductUnit():
        return delete(_that.id);
      case ClearProductUnitMessages():
        return clearMessages();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productId)? load,
    TResult? Function(int productId)? watch,
    TResult? Function(List<ProductUnit> units)? unitsChanged,
    TResult? Function(int id)? getById,
    TResult? Function(ProductUnit unit)? create,
    TResult? Function(int id, ProductUnit unit)? update,
    TResult? Function(int productId, int unitId)? setBase,
    TResult? Function(int productId, int unitId)? setDefault,
    TResult? Function(int id)? delete,
    TResult? Function()? clearMessages,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductUnits() when load != null:
        return load(_that.productId);
      case WatchProductUnits() when watch != null:
        return watch(_that.productId);
      case ProductUnitsChanged() when unitsChanged != null:
        return unitsChanged(_that.units);
      case GetProductUnitById() when getById != null:
        return getById(_that.id);
      case CreateProductUnit() when create != null:
        return create(_that.unit);
      case UpdateProductUnit() when update != null:
        return update(_that.id, _that.unit);
      case SetBaseProductUnit() when setBase != null:
        return setBase(_that.productId, _that.unitId);
      case SetDefaultProductUnit() when setDefault != null:
        return setDefault(_that.productId, _that.unitId);
      case DeleteProductUnit() when delete != null:
        return delete(_that.id);
      case ClearProductUnitMessages() when clearMessages != null:
        return clearMessages();
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadProductUnits implements ProductUnitsEvent {
  const LoadProductUnits({required this.productId});

  final int productId;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadProductUnitsCopyWith<LoadProductUnits> get copyWith =>
      _$LoadProductUnitsCopyWithImpl<LoadProductUnits>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadProductUnits &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'ProductUnitsEvent.load(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $LoadProductUnitsCopyWith<$Res>
    implements $ProductUnitsEventCopyWith<$Res> {
  factory $LoadProductUnitsCopyWith(
          LoadProductUnits value, $Res Function(LoadProductUnits) _then) =
      _$LoadProductUnitsCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$LoadProductUnitsCopyWithImpl<$Res>
    implements $LoadProductUnitsCopyWith<$Res> {
  _$LoadProductUnitsCopyWithImpl(this._self, this._then);

  final LoadProductUnits _self;
  final $Res Function(LoadProductUnits) _then;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(LoadProductUnits(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class WatchProductUnits implements ProductUnitsEvent {
  const WatchProductUnits({required this.productId});

  final int productId;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchProductUnitsCopyWith<WatchProductUnits> get copyWith =>
      _$WatchProductUnitsCopyWithImpl<WatchProductUnits>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchProductUnits &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'ProductUnitsEvent.watch(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $WatchProductUnitsCopyWith<$Res>
    implements $ProductUnitsEventCopyWith<$Res> {
  factory $WatchProductUnitsCopyWith(
          WatchProductUnits value, $Res Function(WatchProductUnits) _then) =
      _$WatchProductUnitsCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$WatchProductUnitsCopyWithImpl<$Res>
    implements $WatchProductUnitsCopyWith<$Res> {
  _$WatchProductUnitsCopyWithImpl(this._self, this._then);

  final WatchProductUnits _self;
  final $Res Function(WatchProductUnits) _then;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(WatchProductUnits(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ProductUnitsChanged implements ProductUnitsEvent {
  const ProductUnitsChanged({required final List<ProductUnit> units})
      : _units = units;

  final List<ProductUnit> _units;
  List<ProductUnit> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductUnitsChangedCopyWith<ProductUnitsChanged> get copyWith =>
      _$ProductUnitsChangedCopyWithImpl<ProductUnitsChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductUnitsChanged &&
            const DeepCollectionEquality().equals(other._units, _units));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_units));

  @override
  String toString() {
    return 'ProductUnitsEvent.unitsChanged(units: $units)';
  }
}

/// @nodoc
abstract mixin class $ProductUnitsChangedCopyWith<$Res>
    implements $ProductUnitsEventCopyWith<$Res> {
  factory $ProductUnitsChangedCopyWith(
          ProductUnitsChanged value, $Res Function(ProductUnitsChanged) _then) =
      _$ProductUnitsChangedCopyWithImpl;
  @useResult
  $Res call({List<ProductUnit> units});
}

/// @nodoc
class _$ProductUnitsChangedCopyWithImpl<$Res>
    implements $ProductUnitsChangedCopyWith<$Res> {
  _$ProductUnitsChangedCopyWithImpl(this._self, this._then);

  final ProductUnitsChanged _self;
  final $Res Function(ProductUnitsChanged) _then;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? units = null,
  }) {
    return _then(ProductUnitsChanged(
      units: null == units
          ? _self._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<ProductUnit>,
    ));
  }
}

/// @nodoc

class GetProductUnitById implements ProductUnitsEvent {
  const GetProductUnitById({required this.id});

  final int id;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetProductUnitByIdCopyWith<GetProductUnitById> get copyWith =>
      _$GetProductUnitByIdCopyWithImpl<GetProductUnitById>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetProductUnitById &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ProductUnitsEvent.getById(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetProductUnitByIdCopyWith<$Res>
    implements $ProductUnitsEventCopyWith<$Res> {
  factory $GetProductUnitByIdCopyWith(
          GetProductUnitById value, $Res Function(GetProductUnitById) _then) =
      _$GetProductUnitByIdCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$GetProductUnitByIdCopyWithImpl<$Res>
    implements $GetProductUnitByIdCopyWith<$Res> {
  _$GetProductUnitByIdCopyWithImpl(this._self, this._then);

  final GetProductUnitById _self;
  final $Res Function(GetProductUnitById) _then;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetProductUnitById(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CreateProductUnit implements ProductUnitsEvent {
  const CreateProductUnit({required this.unit});

  final ProductUnit unit;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateProductUnitCopyWith<CreateProductUnit> get copyWith =>
      _$CreateProductUnitCopyWithImpl<CreateProductUnit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateProductUnit &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unit);

  @override
  String toString() {
    return 'ProductUnitsEvent.create(unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $CreateProductUnitCopyWith<$Res>
    implements $ProductUnitsEventCopyWith<$Res> {
  factory $CreateProductUnitCopyWith(
          CreateProductUnit value, $Res Function(CreateProductUnit) _then) =
      _$CreateProductUnitCopyWithImpl;
  @useResult
  $Res call({ProductUnit unit});
}

/// @nodoc
class _$CreateProductUnitCopyWithImpl<$Res>
    implements $CreateProductUnitCopyWith<$Res> {
  _$CreateProductUnitCopyWithImpl(this._self, this._then);

  final CreateProductUnit _self;
  final $Res Function(CreateProductUnit) _then;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unit = null,
  }) {
    return _then(CreateProductUnit(
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as ProductUnit,
    ));
  }
}

/// @nodoc

class UpdateProductUnit implements ProductUnitsEvent {
  const UpdateProductUnit({required this.id, required this.unit});

  final int id;
  final ProductUnit unit;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateProductUnitCopyWith<UpdateProductUnit> get copyWith =>
      _$UpdateProductUnitCopyWithImpl<UpdateProductUnit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateProductUnit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, unit);

  @override
  String toString() {
    return 'ProductUnitsEvent.update(id: $id, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $UpdateProductUnitCopyWith<$Res>
    implements $ProductUnitsEventCopyWith<$Res> {
  factory $UpdateProductUnitCopyWith(
          UpdateProductUnit value, $Res Function(UpdateProductUnit) _then) =
      _$UpdateProductUnitCopyWithImpl;
  @useResult
  $Res call({int id, ProductUnit unit});
}

/// @nodoc
class _$UpdateProductUnitCopyWithImpl<$Res>
    implements $UpdateProductUnitCopyWith<$Res> {
  _$UpdateProductUnitCopyWithImpl(this._self, this._then);

  final UpdateProductUnit _self;
  final $Res Function(UpdateProductUnit) _then;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? unit = null,
  }) {
    return _then(UpdateProductUnit(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as ProductUnit,
    ));
  }
}

/// @nodoc

class SetBaseProductUnit implements ProductUnitsEvent {
  const SetBaseProductUnit({required this.productId, required this.unitId});

  final int productId;
  final int unitId;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetBaseProductUnitCopyWith<SetBaseProductUnit> get copyWith =>
      _$SetBaseProductUnitCopyWithImpl<SetBaseProductUnit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetBaseProductUnit &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, unitId);

  @override
  String toString() {
    return 'ProductUnitsEvent.setBase(productId: $productId, unitId: $unitId)';
  }
}

/// @nodoc
abstract mixin class $SetBaseProductUnitCopyWith<$Res>
    implements $ProductUnitsEventCopyWith<$Res> {
  factory $SetBaseProductUnitCopyWith(
          SetBaseProductUnit value, $Res Function(SetBaseProductUnit) _then) =
      _$SetBaseProductUnitCopyWithImpl;
  @useResult
  $Res call({int productId, int unitId});
}

/// @nodoc
class _$SetBaseProductUnitCopyWithImpl<$Res>
    implements $SetBaseProductUnitCopyWith<$Res> {
  _$SetBaseProductUnitCopyWithImpl(this._self, this._then);

  final SetBaseProductUnit _self;
  final $Res Function(SetBaseProductUnit) _then;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? unitId = null,
  }) {
    return _then(SetBaseProductUnit(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SetDefaultProductUnit implements ProductUnitsEvent {
  const SetDefaultProductUnit({required this.productId, required this.unitId});

  final int productId;
  final int unitId;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetDefaultProductUnitCopyWith<SetDefaultProductUnit> get copyWith =>
      _$SetDefaultProductUnitCopyWithImpl<SetDefaultProductUnit>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetDefaultProductUnit &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, unitId);

  @override
  String toString() {
    return 'ProductUnitsEvent.setDefault(productId: $productId, unitId: $unitId)';
  }
}

/// @nodoc
abstract mixin class $SetDefaultProductUnitCopyWith<$Res>
    implements $ProductUnitsEventCopyWith<$Res> {
  factory $SetDefaultProductUnitCopyWith(SetDefaultProductUnit value,
          $Res Function(SetDefaultProductUnit) _then) =
      _$SetDefaultProductUnitCopyWithImpl;
  @useResult
  $Res call({int productId, int unitId});
}

/// @nodoc
class _$SetDefaultProductUnitCopyWithImpl<$Res>
    implements $SetDefaultProductUnitCopyWith<$Res> {
  _$SetDefaultProductUnitCopyWithImpl(this._self, this._then);

  final SetDefaultProductUnit _self;
  final $Res Function(SetDefaultProductUnit) _then;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? unitId = null,
  }) {
    return _then(SetDefaultProductUnit(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class DeleteProductUnit implements ProductUnitsEvent {
  const DeleteProductUnit({required this.id});

  final int id;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteProductUnitCopyWith<DeleteProductUnit> get copyWith =>
      _$DeleteProductUnitCopyWithImpl<DeleteProductUnit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteProductUnit &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ProductUnitsEvent.delete(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteProductUnitCopyWith<$Res>
    implements $ProductUnitsEventCopyWith<$Res> {
  factory $DeleteProductUnitCopyWith(
          DeleteProductUnit value, $Res Function(DeleteProductUnit) _then) =
      _$DeleteProductUnitCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteProductUnitCopyWithImpl<$Res>
    implements $DeleteProductUnitCopyWith<$Res> {
  _$DeleteProductUnitCopyWithImpl(this._self, this._then);

  final DeleteProductUnit _self;
  final $Res Function(DeleteProductUnit) _then;

  /// Create a copy of ProductUnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteProductUnit(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ClearProductUnitMessages implements ProductUnitsEvent {
  const ClearProductUnitMessages();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearProductUnitMessages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductUnitsEvent.clearMessages()';
  }
}

// dart format on
