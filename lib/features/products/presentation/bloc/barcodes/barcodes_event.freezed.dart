// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barcodes_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BarcodesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BarcodesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BarcodesEvent()';
  }
}

/// @nodoc
class $BarcodesEventCopyWith<$Res> {
  $BarcodesEventCopyWith(BarcodesEvent _, $Res Function(BarcodesEvent) __);
}

/// Adds pattern-matching-related methods to [BarcodesEvent].
extension BarcodesEventPatterns on BarcodesEvent {
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
    TResult Function(WatchBarcodesRequested value)? watchRequested,
    TResult Function(LoadBarcodesRequested value)? loadRequested,
    TResult Function(BarcodeLookupRequested value)? barcodeLookupRequested,
    TResult Function(ProductLookupRequested value)? productLookupRequested,
    TResult Function(AddBarcodeRequested value)? addRequested,
    TResult Function(SetDefaultBarcodeRequested value)? setDefaultRequested,
    TResult Function(DeleteBarcodeRequested value)? deleteRequested,
    TResult Function(BarcodeStreamUpdated value)? streamUpdated,
    TResult Function(BarcodeStreamFailed value)? streamFailed,
    TResult Function(ClearBarcodeLookup value)? clearLookup,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case WatchBarcodesRequested() when watchRequested != null:
        return watchRequested(_that);
      case LoadBarcodesRequested() when loadRequested != null:
        return loadRequested(_that);
      case BarcodeLookupRequested() when barcodeLookupRequested != null:
        return barcodeLookupRequested(_that);
      case ProductLookupRequested() when productLookupRequested != null:
        return productLookupRequested(_that);
      case AddBarcodeRequested() when addRequested != null:
        return addRequested(_that);
      case SetDefaultBarcodeRequested() when setDefaultRequested != null:
        return setDefaultRequested(_that);
      case DeleteBarcodeRequested() when deleteRequested != null:
        return deleteRequested(_that);
      case BarcodeStreamUpdated() when streamUpdated != null:
        return streamUpdated(_that);
      case BarcodeStreamFailed() when streamFailed != null:
        return streamFailed(_that);
      case ClearBarcodeLookup() when clearLookup != null:
        return clearLookup(_that);
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
    required TResult Function(WatchBarcodesRequested value) watchRequested,
    required TResult Function(LoadBarcodesRequested value) loadRequested,
    required TResult Function(BarcodeLookupRequested value)
        barcodeLookupRequested,
    required TResult Function(ProductLookupRequested value)
        productLookupRequested,
    required TResult Function(AddBarcodeRequested value) addRequested,
    required TResult Function(SetDefaultBarcodeRequested value)
        setDefaultRequested,
    required TResult Function(DeleteBarcodeRequested value) deleteRequested,
    required TResult Function(BarcodeStreamUpdated value) streamUpdated,
    required TResult Function(BarcodeStreamFailed value) streamFailed,
    required TResult Function(ClearBarcodeLookup value) clearLookup,
  }) {
    final _that = this;
    switch (_that) {
      case WatchBarcodesRequested():
        return watchRequested(_that);
      case LoadBarcodesRequested():
        return loadRequested(_that);
      case BarcodeLookupRequested():
        return barcodeLookupRequested(_that);
      case ProductLookupRequested():
        return productLookupRequested(_that);
      case AddBarcodeRequested():
        return addRequested(_that);
      case SetDefaultBarcodeRequested():
        return setDefaultRequested(_that);
      case DeleteBarcodeRequested():
        return deleteRequested(_that);
      case BarcodeStreamUpdated():
        return streamUpdated(_that);
      case BarcodeStreamFailed():
        return streamFailed(_that);
      case ClearBarcodeLookup():
        return clearLookup(_that);
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
    TResult? Function(WatchBarcodesRequested value)? watchRequested,
    TResult? Function(LoadBarcodesRequested value)? loadRequested,
    TResult? Function(BarcodeLookupRequested value)? barcodeLookupRequested,
    TResult? Function(ProductLookupRequested value)? productLookupRequested,
    TResult? Function(AddBarcodeRequested value)? addRequested,
    TResult? Function(SetDefaultBarcodeRequested value)? setDefaultRequested,
    TResult? Function(DeleteBarcodeRequested value)? deleteRequested,
    TResult? Function(BarcodeStreamUpdated value)? streamUpdated,
    TResult? Function(BarcodeStreamFailed value)? streamFailed,
    TResult? Function(ClearBarcodeLookup value)? clearLookup,
  }) {
    final _that = this;
    switch (_that) {
      case WatchBarcodesRequested() when watchRequested != null:
        return watchRequested(_that);
      case LoadBarcodesRequested() when loadRequested != null:
        return loadRequested(_that);
      case BarcodeLookupRequested() when barcodeLookupRequested != null:
        return barcodeLookupRequested(_that);
      case ProductLookupRequested() when productLookupRequested != null:
        return productLookupRequested(_that);
      case AddBarcodeRequested() when addRequested != null:
        return addRequested(_that);
      case SetDefaultBarcodeRequested() when setDefaultRequested != null:
        return setDefaultRequested(_that);
      case DeleteBarcodeRequested() when deleteRequested != null:
        return deleteRequested(_that);
      case BarcodeStreamUpdated() when streamUpdated != null:
        return streamUpdated(_that);
      case BarcodeStreamFailed() when streamFailed != null:
        return streamFailed(_that);
      case ClearBarcodeLookup() when clearLookup != null:
        return clearLookup(_that);
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
    TResult Function(int productId)? watchRequested,
    TResult Function(int productId)? loadRequested,
    TResult Function(String barcode)? barcodeLookupRequested,
    TResult Function(String barcode)? productLookupRequested,
    TResult Function(ProductBarcode barcode)? addRequested,
    TResult Function(int productId, int barcodeId)? setDefaultRequested,
    TResult Function(int id)? deleteRequested,
    TResult Function(List<ProductBarcode> barcodes)? streamUpdated,
    TResult Function(String message)? streamFailed,
    TResult Function()? clearLookup,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case WatchBarcodesRequested() when watchRequested != null:
        return watchRequested(_that.productId);
      case LoadBarcodesRequested() when loadRequested != null:
        return loadRequested(_that.productId);
      case BarcodeLookupRequested() when barcodeLookupRequested != null:
        return barcodeLookupRequested(_that.barcode);
      case ProductLookupRequested() when productLookupRequested != null:
        return productLookupRequested(_that.barcode);
      case AddBarcodeRequested() when addRequested != null:
        return addRequested(_that.barcode);
      case SetDefaultBarcodeRequested() when setDefaultRequested != null:
        return setDefaultRequested(_that.productId, _that.barcodeId);
      case DeleteBarcodeRequested() when deleteRequested != null:
        return deleteRequested(_that.id);
      case BarcodeStreamUpdated() when streamUpdated != null:
        return streamUpdated(_that.barcodes);
      case BarcodeStreamFailed() when streamFailed != null:
        return streamFailed(_that.message);
      case ClearBarcodeLookup() when clearLookup != null:
        return clearLookup();
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
    required TResult Function(int productId) watchRequested,
    required TResult Function(int productId) loadRequested,
    required TResult Function(String barcode) barcodeLookupRequested,
    required TResult Function(String barcode) productLookupRequested,
    required TResult Function(ProductBarcode barcode) addRequested,
    required TResult Function(int productId, int barcodeId) setDefaultRequested,
    required TResult Function(int id) deleteRequested,
    required TResult Function(List<ProductBarcode> barcodes) streamUpdated,
    required TResult Function(String message) streamFailed,
    required TResult Function() clearLookup,
  }) {
    final _that = this;
    switch (_that) {
      case WatchBarcodesRequested():
        return watchRequested(_that.productId);
      case LoadBarcodesRequested():
        return loadRequested(_that.productId);
      case BarcodeLookupRequested():
        return barcodeLookupRequested(_that.barcode);
      case ProductLookupRequested():
        return productLookupRequested(_that.barcode);
      case AddBarcodeRequested():
        return addRequested(_that.barcode);
      case SetDefaultBarcodeRequested():
        return setDefaultRequested(_that.productId, _that.barcodeId);
      case DeleteBarcodeRequested():
        return deleteRequested(_that.id);
      case BarcodeStreamUpdated():
        return streamUpdated(_that.barcodes);
      case BarcodeStreamFailed():
        return streamFailed(_that.message);
      case ClearBarcodeLookup():
        return clearLookup();
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
    TResult? Function(int productId)? watchRequested,
    TResult? Function(int productId)? loadRequested,
    TResult? Function(String barcode)? barcodeLookupRequested,
    TResult? Function(String barcode)? productLookupRequested,
    TResult? Function(ProductBarcode barcode)? addRequested,
    TResult? Function(int productId, int barcodeId)? setDefaultRequested,
    TResult? Function(int id)? deleteRequested,
    TResult? Function(List<ProductBarcode> barcodes)? streamUpdated,
    TResult? Function(String message)? streamFailed,
    TResult? Function()? clearLookup,
  }) {
    final _that = this;
    switch (_that) {
      case WatchBarcodesRequested() when watchRequested != null:
        return watchRequested(_that.productId);
      case LoadBarcodesRequested() when loadRequested != null:
        return loadRequested(_that.productId);
      case BarcodeLookupRequested() when barcodeLookupRequested != null:
        return barcodeLookupRequested(_that.barcode);
      case ProductLookupRequested() when productLookupRequested != null:
        return productLookupRequested(_that.barcode);
      case AddBarcodeRequested() when addRequested != null:
        return addRequested(_that.barcode);
      case SetDefaultBarcodeRequested() when setDefaultRequested != null:
        return setDefaultRequested(_that.productId, _that.barcodeId);
      case DeleteBarcodeRequested() when deleteRequested != null:
        return deleteRequested(_that.id);
      case BarcodeStreamUpdated() when streamUpdated != null:
        return streamUpdated(_that.barcodes);
      case BarcodeStreamFailed() when streamFailed != null:
        return streamFailed(_that.message);
      case ClearBarcodeLookup() when clearLookup != null:
        return clearLookup();
      case _:
        return null;
    }
  }
}

/// @nodoc

class WatchBarcodesRequested implements BarcodesEvent {
  const WatchBarcodesRequested({required this.productId});

  final int productId;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchBarcodesRequestedCopyWith<WatchBarcodesRequested> get copyWith =>
      _$WatchBarcodesRequestedCopyWithImpl<WatchBarcodesRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchBarcodesRequested &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'BarcodesEvent.watchRequested(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $WatchBarcodesRequestedCopyWith<$Res>
    implements $BarcodesEventCopyWith<$Res> {
  factory $WatchBarcodesRequestedCopyWith(WatchBarcodesRequested value,
          $Res Function(WatchBarcodesRequested) _then) =
      _$WatchBarcodesRequestedCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$WatchBarcodesRequestedCopyWithImpl<$Res>
    implements $WatchBarcodesRequestedCopyWith<$Res> {
  _$WatchBarcodesRequestedCopyWithImpl(this._self, this._then);

  final WatchBarcodesRequested _self;
  final $Res Function(WatchBarcodesRequested) _then;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(WatchBarcodesRequested(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class LoadBarcodesRequested implements BarcodesEvent {
  const LoadBarcodesRequested({required this.productId});

  final int productId;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadBarcodesRequestedCopyWith<LoadBarcodesRequested> get copyWith =>
      _$LoadBarcodesRequestedCopyWithImpl<LoadBarcodesRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadBarcodesRequested &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'BarcodesEvent.loadRequested(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $LoadBarcodesRequestedCopyWith<$Res>
    implements $BarcodesEventCopyWith<$Res> {
  factory $LoadBarcodesRequestedCopyWith(LoadBarcodesRequested value,
          $Res Function(LoadBarcodesRequested) _then) =
      _$LoadBarcodesRequestedCopyWithImpl;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class _$LoadBarcodesRequestedCopyWithImpl<$Res>
    implements $LoadBarcodesRequestedCopyWith<$Res> {
  _$LoadBarcodesRequestedCopyWithImpl(this._self, this._then);

  final LoadBarcodesRequested _self;
  final $Res Function(LoadBarcodesRequested) _then;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(LoadBarcodesRequested(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class BarcodeLookupRequested implements BarcodesEvent {
  const BarcodeLookupRequested({required this.barcode});

  final String barcode;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BarcodeLookupRequestedCopyWith<BarcodeLookupRequested> get copyWith =>
      _$BarcodeLookupRequestedCopyWithImpl<BarcodeLookupRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BarcodeLookupRequested &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @override
  String toString() {
    return 'BarcodesEvent.barcodeLookupRequested(barcode: $barcode)';
  }
}

/// @nodoc
abstract mixin class $BarcodeLookupRequestedCopyWith<$Res>
    implements $BarcodesEventCopyWith<$Res> {
  factory $BarcodeLookupRequestedCopyWith(BarcodeLookupRequested value,
          $Res Function(BarcodeLookupRequested) _then) =
      _$BarcodeLookupRequestedCopyWithImpl;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class _$BarcodeLookupRequestedCopyWithImpl<$Res>
    implements $BarcodeLookupRequestedCopyWith<$Res> {
  _$BarcodeLookupRequestedCopyWithImpl(this._self, this._then);

  final BarcodeLookupRequested _self;
  final $Res Function(BarcodeLookupRequested) _then;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcode = null,
  }) {
    return _then(BarcodeLookupRequested(
      barcode: null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ProductLookupRequested implements BarcodesEvent {
  const ProductLookupRequested({required this.barcode});

  final String barcode;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductLookupRequestedCopyWith<ProductLookupRequested> get copyWith =>
      _$ProductLookupRequestedCopyWithImpl<ProductLookupRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductLookupRequested &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @override
  String toString() {
    return 'BarcodesEvent.productLookupRequested(barcode: $barcode)';
  }
}

/// @nodoc
abstract mixin class $ProductLookupRequestedCopyWith<$Res>
    implements $BarcodesEventCopyWith<$Res> {
  factory $ProductLookupRequestedCopyWith(ProductLookupRequested value,
          $Res Function(ProductLookupRequested) _then) =
      _$ProductLookupRequestedCopyWithImpl;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class _$ProductLookupRequestedCopyWithImpl<$Res>
    implements $ProductLookupRequestedCopyWith<$Res> {
  _$ProductLookupRequestedCopyWithImpl(this._self, this._then);

  final ProductLookupRequested _self;
  final $Res Function(ProductLookupRequested) _then;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcode = null,
  }) {
    return _then(ProductLookupRequested(
      barcode: null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AddBarcodeRequested implements BarcodesEvent {
  const AddBarcodeRequested({required this.barcode});

  final ProductBarcode barcode;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddBarcodeRequestedCopyWith<AddBarcodeRequested> get copyWith =>
      _$AddBarcodeRequestedCopyWithImpl<AddBarcodeRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddBarcodeRequested &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @override
  String toString() {
    return 'BarcodesEvent.addRequested(barcode: $barcode)';
  }
}

/// @nodoc
abstract mixin class $AddBarcodeRequestedCopyWith<$Res>
    implements $BarcodesEventCopyWith<$Res> {
  factory $AddBarcodeRequestedCopyWith(
          AddBarcodeRequested value, $Res Function(AddBarcodeRequested) _then) =
      _$AddBarcodeRequestedCopyWithImpl;
  @useResult
  $Res call({ProductBarcode barcode});
}

/// @nodoc
class _$AddBarcodeRequestedCopyWithImpl<$Res>
    implements $AddBarcodeRequestedCopyWith<$Res> {
  _$AddBarcodeRequestedCopyWithImpl(this._self, this._then);

  final AddBarcodeRequested _self;
  final $Res Function(AddBarcodeRequested) _then;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcode = null,
  }) {
    return _then(AddBarcodeRequested(
      barcode: null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as ProductBarcode,
    ));
  }
}

/// @nodoc

class SetDefaultBarcodeRequested implements BarcodesEvent {
  const SetDefaultBarcodeRequested(
      {required this.productId, required this.barcodeId});

  final int productId;
  final int barcodeId;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetDefaultBarcodeRequestedCopyWith<SetDefaultBarcodeRequested>
      get copyWith =>
          _$SetDefaultBarcodeRequestedCopyWithImpl<SetDefaultBarcodeRequested>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetDefaultBarcodeRequested &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.barcodeId, barcodeId) ||
                other.barcodeId == barcodeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, barcodeId);

  @override
  String toString() {
    return 'BarcodesEvent.setDefaultRequested(productId: $productId, barcodeId: $barcodeId)';
  }
}

/// @nodoc
abstract mixin class $SetDefaultBarcodeRequestedCopyWith<$Res>
    implements $BarcodesEventCopyWith<$Res> {
  factory $SetDefaultBarcodeRequestedCopyWith(SetDefaultBarcodeRequested value,
          $Res Function(SetDefaultBarcodeRequested) _then) =
      _$SetDefaultBarcodeRequestedCopyWithImpl;
  @useResult
  $Res call({int productId, int barcodeId});
}

/// @nodoc
class _$SetDefaultBarcodeRequestedCopyWithImpl<$Res>
    implements $SetDefaultBarcodeRequestedCopyWith<$Res> {
  _$SetDefaultBarcodeRequestedCopyWithImpl(this._self, this._then);

  final SetDefaultBarcodeRequested _self;
  final $Res Function(SetDefaultBarcodeRequested) _then;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? barcodeId = null,
  }) {
    return _then(SetDefaultBarcodeRequested(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      barcodeId: null == barcodeId
          ? _self.barcodeId
          : barcodeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class DeleteBarcodeRequested implements BarcodesEvent {
  const DeleteBarcodeRequested({required this.id});

  final int id;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteBarcodeRequestedCopyWith<DeleteBarcodeRequested> get copyWith =>
      _$DeleteBarcodeRequestedCopyWithImpl<DeleteBarcodeRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteBarcodeRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'BarcodesEvent.deleteRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteBarcodeRequestedCopyWith<$Res>
    implements $BarcodesEventCopyWith<$Res> {
  factory $DeleteBarcodeRequestedCopyWith(DeleteBarcodeRequested value,
          $Res Function(DeleteBarcodeRequested) _then) =
      _$DeleteBarcodeRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteBarcodeRequestedCopyWithImpl<$Res>
    implements $DeleteBarcodeRequestedCopyWith<$Res> {
  _$DeleteBarcodeRequestedCopyWithImpl(this._self, this._then);

  final DeleteBarcodeRequested _self;
  final $Res Function(DeleteBarcodeRequested) _then;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteBarcodeRequested(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class BarcodeStreamUpdated implements BarcodesEvent {
  const BarcodeStreamUpdated({required final List<ProductBarcode> barcodes})
      : _barcodes = barcodes;

  final List<ProductBarcode> _barcodes;
  List<ProductBarcode> get barcodes {
    if (_barcodes is EqualUnmodifiableListView) return _barcodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barcodes);
  }

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BarcodeStreamUpdatedCopyWith<BarcodeStreamUpdated> get copyWith =>
      _$BarcodeStreamUpdatedCopyWithImpl<BarcodeStreamUpdated>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BarcodeStreamUpdated &&
            const DeepCollectionEquality().equals(other._barcodes, _barcodes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_barcodes));

  @override
  String toString() {
    return 'BarcodesEvent.streamUpdated(barcodes: $barcodes)';
  }
}

/// @nodoc
abstract mixin class $BarcodeStreamUpdatedCopyWith<$Res>
    implements $BarcodesEventCopyWith<$Res> {
  factory $BarcodeStreamUpdatedCopyWith(BarcodeStreamUpdated value,
          $Res Function(BarcodeStreamUpdated) _then) =
      _$BarcodeStreamUpdatedCopyWithImpl;
  @useResult
  $Res call({List<ProductBarcode> barcodes});
}

/// @nodoc
class _$BarcodeStreamUpdatedCopyWithImpl<$Res>
    implements $BarcodeStreamUpdatedCopyWith<$Res> {
  _$BarcodeStreamUpdatedCopyWithImpl(this._self, this._then);

  final BarcodeStreamUpdated _self;
  final $Res Function(BarcodeStreamUpdated) _then;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcodes = null,
  }) {
    return _then(BarcodeStreamUpdated(
      barcodes: null == barcodes
          ? _self._barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<ProductBarcode>,
    ));
  }
}

/// @nodoc

class BarcodeStreamFailed implements BarcodesEvent {
  const BarcodeStreamFailed({required this.message});

  final String message;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BarcodeStreamFailedCopyWith<BarcodeStreamFailed> get copyWith =>
      _$BarcodeStreamFailedCopyWithImpl<BarcodeStreamFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BarcodeStreamFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'BarcodesEvent.streamFailed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $BarcodeStreamFailedCopyWith<$Res>
    implements $BarcodesEventCopyWith<$Res> {
  factory $BarcodeStreamFailedCopyWith(
          BarcodeStreamFailed value, $Res Function(BarcodeStreamFailed) _then) =
      _$BarcodeStreamFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$BarcodeStreamFailedCopyWithImpl<$Res>
    implements $BarcodeStreamFailedCopyWith<$Res> {
  _$BarcodeStreamFailedCopyWithImpl(this._self, this._then);

  final BarcodeStreamFailed _self;
  final $Res Function(BarcodeStreamFailed) _then;

  /// Create a copy of BarcodesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(BarcodeStreamFailed(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ClearBarcodeLookup implements BarcodesEvent {
  const ClearBarcodeLookup();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearBarcodeLookup);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BarcodesEvent.clearLookup()';
  }
}

// dart format on
