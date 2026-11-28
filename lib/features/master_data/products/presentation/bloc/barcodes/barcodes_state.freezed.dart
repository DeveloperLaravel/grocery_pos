// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barcodes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BarcodesState {
  List<ProductBarcode> get barcodes;
  ProductBarcode? get selectedBarcode;
  Product? get scannedProduct;
  bool get isLoading;
  bool get isSaving;
  bool get isDeleting;
  bool get isSettingDefault;
  bool get isSearching;
  bool get isWatching;
  int? get currentProductId;
  int? get lastInsertedId;
  int? get lastDeletedId;
  bool get hasLoaded;
  String? get errorMessage;
  String? get successMessage;

  /// Create a copy of BarcodesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BarcodesStateCopyWith<BarcodesState> get copyWith =>
      _$BarcodesStateCopyWithImpl<BarcodesState>(
          this as BarcodesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BarcodesState &&
            const DeepCollectionEquality().equals(other.barcodes, barcodes) &&
            (identical(other.selectedBarcode, selectedBarcode) ||
                other.selectedBarcode == selectedBarcode) &&
            (identical(other.scannedProduct, scannedProduct) ||
                other.scannedProduct == scannedProduct) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isSettingDefault, isSettingDefault) ||
                other.isSettingDefault == isSettingDefault) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.currentProductId, currentProductId) ||
                other.currentProductId == currentProductId) &&
            (identical(other.lastInsertedId, lastInsertedId) ||
                other.lastInsertedId == lastInsertedId) &&
            (identical(other.lastDeletedId, lastDeletedId) ||
                other.lastDeletedId == lastDeletedId) &&
            (identical(other.hasLoaded, hasLoaded) ||
                other.hasLoaded == hasLoaded) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(barcodes),
      selectedBarcode,
      scannedProduct,
      isLoading,
      isSaving,
      isDeleting,
      isSettingDefault,
      isSearching,
      isWatching,
      currentProductId,
      lastInsertedId,
      lastDeletedId,
      hasLoaded,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'BarcodesState(barcodes: $barcodes, selectedBarcode: $selectedBarcode, scannedProduct: $scannedProduct, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, isSettingDefault: $isSettingDefault, isSearching: $isSearching, isWatching: $isWatching, currentProductId: $currentProductId, lastInsertedId: $lastInsertedId, lastDeletedId: $lastDeletedId, hasLoaded: $hasLoaded, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class $BarcodesStateCopyWith<$Res> {
  factory $BarcodesStateCopyWith(
          BarcodesState value, $Res Function(BarcodesState) _then) =
      _$BarcodesStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ProductBarcode> barcodes,
      ProductBarcode? selectedBarcode,
      Product? scannedProduct,
      bool isLoading,
      bool isSaving,
      bool isDeleting,
      bool isSettingDefault,
      bool isSearching,
      bool isWatching,
      int? currentProductId,
      int? lastInsertedId,
      int? lastDeletedId,
      bool hasLoaded,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class _$BarcodesStateCopyWithImpl<$Res>
    implements $BarcodesStateCopyWith<$Res> {
  _$BarcodesStateCopyWithImpl(this._self, this._then);

  final BarcodesState _self;
  final $Res Function(BarcodesState) _then;

  /// Create a copy of BarcodesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcodes = null,
    Object? selectedBarcode = freezed,
    Object? scannedProduct = freezed,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? isDeleting = null,
    Object? isSettingDefault = null,
    Object? isSearching = null,
    Object? isWatching = null,
    Object? currentProductId = freezed,
    Object? lastInsertedId = freezed,
    Object? lastDeletedId = freezed,
    Object? hasLoaded = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      barcodes: null == barcodes
          ? _self.barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<ProductBarcode>,
      selectedBarcode: freezed == selectedBarcode
          ? _self.selectedBarcode
          : selectedBarcode // ignore: cast_nullable_to_non_nullable
              as ProductBarcode?,
      scannedProduct: freezed == scannedProduct
          ? _self.scannedProduct
          : scannedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettingDefault: null == isSettingDefault
          ? _self.isSettingDefault
          : isSettingDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      currentProductId: freezed == currentProductId
          ? _self.currentProductId
          : currentProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastInsertedId: freezed == lastInsertedId
          ? _self.lastInsertedId
          : lastInsertedId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastDeletedId: freezed == lastDeletedId
          ? _self.lastDeletedId
          : lastDeletedId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasLoaded: null == hasLoaded
          ? _self.hasLoaded
          : hasLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BarcodesState].
extension BarcodesStatePatterns on BarcodesState {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BarcodesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BarcodesState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_BarcodesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BarcodesState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BarcodesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BarcodesState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<ProductBarcode> barcodes,
            ProductBarcode? selectedBarcode,
            Product? scannedProduct,
            bool isLoading,
            bool isSaving,
            bool isDeleting,
            bool isSettingDefault,
            bool isSearching,
            bool isWatching,
            int? currentProductId,
            int? lastInsertedId,
            int? lastDeletedId,
            bool hasLoaded,
            String? errorMessage,
            String? successMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BarcodesState() when $default != null:
        return $default(
            _that.barcodes,
            _that.selectedBarcode,
            _that.scannedProduct,
            _that.isLoading,
            _that.isSaving,
            _that.isDeleting,
            _that.isSettingDefault,
            _that.isSearching,
            _that.isWatching,
            _that.currentProductId,
            _that.lastInsertedId,
            _that.lastDeletedId,
            _that.hasLoaded,
            _that.errorMessage,
            _that.successMessage);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            List<ProductBarcode> barcodes,
            ProductBarcode? selectedBarcode,
            Product? scannedProduct,
            bool isLoading,
            bool isSaving,
            bool isDeleting,
            bool isSettingDefault,
            bool isSearching,
            bool isWatching,
            int? currentProductId,
            int? lastInsertedId,
            int? lastDeletedId,
            bool hasLoaded,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BarcodesState():
        return $default(
            _that.barcodes,
            _that.selectedBarcode,
            _that.scannedProduct,
            _that.isLoading,
            _that.isSaving,
            _that.isDeleting,
            _that.isSettingDefault,
            _that.isSearching,
            _that.isWatching,
            _that.currentProductId,
            _that.lastInsertedId,
            _that.lastDeletedId,
            _that.hasLoaded,
            _that.errorMessage,
            _that.successMessage);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<ProductBarcode> barcodes,
            ProductBarcode? selectedBarcode,
            Product? scannedProduct,
            bool isLoading,
            bool isSaving,
            bool isDeleting,
            bool isSettingDefault,
            bool isSearching,
            bool isWatching,
            int? currentProductId,
            int? lastInsertedId,
            int? lastDeletedId,
            bool hasLoaded,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BarcodesState() when $default != null:
        return $default(
            _that.barcodes,
            _that.selectedBarcode,
            _that.scannedProduct,
            _that.isLoading,
            _that.isSaving,
            _that.isDeleting,
            _that.isSettingDefault,
            _that.isSearching,
            _that.isWatching,
            _that.currentProductId,
            _that.lastInsertedId,
            _that.lastDeletedId,
            _that.hasLoaded,
            _that.errorMessage,
            _that.successMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BarcodesState implements BarcodesState {
  const _BarcodesState(
      {final List<ProductBarcode> barcodes = const [],
      this.selectedBarcode,
      this.scannedProduct,
      this.isLoading = false,
      this.isSaving = false,
      this.isDeleting = false,
      this.isSettingDefault = false,
      this.isSearching = false,
      this.isWatching = false,
      this.currentProductId,
      this.lastInsertedId,
      this.lastDeletedId,
      this.hasLoaded = false,
      this.errorMessage,
      this.successMessage})
      : _barcodes = barcodes;

  final List<ProductBarcode> _barcodes;
  @override
  @JsonKey()
  List<ProductBarcode> get barcodes {
    if (_barcodes is EqualUnmodifiableListView) return _barcodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barcodes);
  }

  @override
  final ProductBarcode? selectedBarcode;
  @override
  final Product? scannedProduct;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final bool isSettingDefault;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isWatching;
  @override
  final int? currentProductId;
  @override
  final int? lastInsertedId;
  @override
  final int? lastDeletedId;
  @override
  @JsonKey()
  final bool hasLoaded;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  /// Create a copy of BarcodesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BarcodesStateCopyWith<_BarcodesState> get copyWith =>
      __$BarcodesStateCopyWithImpl<_BarcodesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BarcodesState &&
            const DeepCollectionEquality().equals(other._barcodes, _barcodes) &&
            (identical(other.selectedBarcode, selectedBarcode) ||
                other.selectedBarcode == selectedBarcode) &&
            (identical(other.scannedProduct, scannedProduct) ||
                other.scannedProduct == scannedProduct) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isSettingDefault, isSettingDefault) ||
                other.isSettingDefault == isSettingDefault) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.currentProductId, currentProductId) ||
                other.currentProductId == currentProductId) &&
            (identical(other.lastInsertedId, lastInsertedId) ||
                other.lastInsertedId == lastInsertedId) &&
            (identical(other.lastDeletedId, lastDeletedId) ||
                other.lastDeletedId == lastDeletedId) &&
            (identical(other.hasLoaded, hasLoaded) ||
                other.hasLoaded == hasLoaded) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barcodes),
      selectedBarcode,
      scannedProduct,
      isLoading,
      isSaving,
      isDeleting,
      isSettingDefault,
      isSearching,
      isWatching,
      currentProductId,
      lastInsertedId,
      lastDeletedId,
      hasLoaded,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'BarcodesState(barcodes: $barcodes, selectedBarcode: $selectedBarcode, scannedProduct: $scannedProduct, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, isSettingDefault: $isSettingDefault, isSearching: $isSearching, isWatching: $isWatching, currentProductId: $currentProductId, lastInsertedId: $lastInsertedId, lastDeletedId: $lastDeletedId, hasLoaded: $hasLoaded, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class _$BarcodesStateCopyWith<$Res>
    implements $BarcodesStateCopyWith<$Res> {
  factory _$BarcodesStateCopyWith(
          _BarcodesState value, $Res Function(_BarcodesState) _then) =
      __$BarcodesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ProductBarcode> barcodes,
      ProductBarcode? selectedBarcode,
      Product? scannedProduct,
      bool isLoading,
      bool isSaving,
      bool isDeleting,
      bool isSettingDefault,
      bool isSearching,
      bool isWatching,
      int? currentProductId,
      int? lastInsertedId,
      int? lastDeletedId,
      bool hasLoaded,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class __$BarcodesStateCopyWithImpl<$Res>
    implements _$BarcodesStateCopyWith<$Res> {
  __$BarcodesStateCopyWithImpl(this._self, this._then);

  final _BarcodesState _self;
  final $Res Function(_BarcodesState) _then;

  /// Create a copy of BarcodesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcodes = null,
    Object? selectedBarcode = freezed,
    Object? scannedProduct = freezed,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? isDeleting = null,
    Object? isSettingDefault = null,
    Object? isSearching = null,
    Object? isWatching = null,
    Object? currentProductId = freezed,
    Object? lastInsertedId = freezed,
    Object? lastDeletedId = freezed,
    Object? hasLoaded = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_BarcodesState(
      barcodes: null == barcodes
          ? _self._barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<ProductBarcode>,
      selectedBarcode: freezed == selectedBarcode
          ? _self.selectedBarcode
          : selectedBarcode // ignore: cast_nullable_to_non_nullable
              as ProductBarcode?,
      scannedProduct: freezed == scannedProduct
          ? _self.scannedProduct
          : scannedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettingDefault: null == isSettingDefault
          ? _self.isSettingDefault
          : isSettingDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      currentProductId: freezed == currentProductId
          ? _self.currentProductId
          : currentProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastInsertedId: freezed == lastInsertedId
          ? _self.lastInsertedId
          : lastInsertedId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastDeletedId: freezed == lastDeletedId
          ? _self.lastDeletedId
          : lastDeletedId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasLoaded: null == hasLoaded
          ? _self.hasLoaded
          : hasLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
