// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrandEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BrandEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandEvent()';
  }
}

/// @nodoc
class $BrandEventCopyWith<$Res> {
  $BrandEventCopyWith(BrandEvent _, $Res Function(BrandEvent) __);
}

/// Adds pattern-matching-related methods to [BrandEvent].
extension BrandEventPatterns on BrandEvent {
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
    TResult Function(LoadBrandsRequested value)? loadBrandsRequested,
    TResult Function(WatchBrandsRequested value)? watchBrandsRequested,
    TResult Function(SearchBrandsRequested value)? searchBrandsRequested,
    TResult Function(GetBrandByIdRequested value)? getBrandByIdRequested,
    TResult Function(CreateBrandRequested value)? createBrandRequested,
    TResult Function(UpdateBrandRequested value)? updateBrandRequested,
    TResult Function(DeleteBrandRequested value)? deleteBrandRequested,
    TResult Function(ToggleBrandStatusRequested value)?
        toggleBrandStatusRequested,
    TResult Function(CheckBrandNameRequested value)? checkBrandNameRequested,
    TResult Function(LoadBrandsStatisticsRequested value)?
        loadBrandsStatisticsRequested,
    TResult Function(ClearBrandMessagesRequested value)?
        clearBrandMessagesRequested,
    TResult Function(ClearBrandSearchRequested value)?
        clearBrandSearchRequested,
    TResult Function(InternalBrandsUpdated value)? internalBrandsUpdated,
    TResult Function(InternalBrandsError value)? internalBrandsError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadBrandsRequested() when loadBrandsRequested != null:
        return loadBrandsRequested(_that);
      case WatchBrandsRequested() when watchBrandsRequested != null:
        return watchBrandsRequested(_that);
      case SearchBrandsRequested() when searchBrandsRequested != null:
        return searchBrandsRequested(_that);
      case GetBrandByIdRequested() when getBrandByIdRequested != null:
        return getBrandByIdRequested(_that);
      case CreateBrandRequested() when createBrandRequested != null:
        return createBrandRequested(_that);
      case UpdateBrandRequested() when updateBrandRequested != null:
        return updateBrandRequested(_that);
      case DeleteBrandRequested() when deleteBrandRequested != null:
        return deleteBrandRequested(_that);
      case ToggleBrandStatusRequested() when toggleBrandStatusRequested != null:
        return toggleBrandStatusRequested(_that);
      case CheckBrandNameRequested() when checkBrandNameRequested != null:
        return checkBrandNameRequested(_that);
      case LoadBrandsStatisticsRequested()
          when loadBrandsStatisticsRequested != null:
        return loadBrandsStatisticsRequested(_that);
      case ClearBrandMessagesRequested()
          when clearBrandMessagesRequested != null:
        return clearBrandMessagesRequested(_that);
      case ClearBrandSearchRequested() when clearBrandSearchRequested != null:
        return clearBrandSearchRequested(_that);
      case InternalBrandsUpdated() when internalBrandsUpdated != null:
        return internalBrandsUpdated(_that);
      case InternalBrandsError() when internalBrandsError != null:
        return internalBrandsError(_that);
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
    required TResult Function(LoadBrandsRequested value) loadBrandsRequested,
    required TResult Function(WatchBrandsRequested value) watchBrandsRequested,
    required TResult Function(SearchBrandsRequested value)
        searchBrandsRequested,
    required TResult Function(GetBrandByIdRequested value)
        getBrandByIdRequested,
    required TResult Function(CreateBrandRequested value) createBrandRequested,
    required TResult Function(UpdateBrandRequested value) updateBrandRequested,
    required TResult Function(DeleteBrandRequested value) deleteBrandRequested,
    required TResult Function(ToggleBrandStatusRequested value)
        toggleBrandStatusRequested,
    required TResult Function(CheckBrandNameRequested value)
        checkBrandNameRequested,
    required TResult Function(LoadBrandsStatisticsRequested value)
        loadBrandsStatisticsRequested,
    required TResult Function(ClearBrandMessagesRequested value)
        clearBrandMessagesRequested,
    required TResult Function(ClearBrandSearchRequested value)
        clearBrandSearchRequested,
    required TResult Function(InternalBrandsUpdated value)
        internalBrandsUpdated,
    required TResult Function(InternalBrandsError value) internalBrandsError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadBrandsRequested():
        return loadBrandsRequested(_that);
      case WatchBrandsRequested():
        return watchBrandsRequested(_that);
      case SearchBrandsRequested():
        return searchBrandsRequested(_that);
      case GetBrandByIdRequested():
        return getBrandByIdRequested(_that);
      case CreateBrandRequested():
        return createBrandRequested(_that);
      case UpdateBrandRequested():
        return updateBrandRequested(_that);
      case DeleteBrandRequested():
        return deleteBrandRequested(_that);
      case ToggleBrandStatusRequested():
        return toggleBrandStatusRequested(_that);
      case CheckBrandNameRequested():
        return checkBrandNameRequested(_that);
      case LoadBrandsStatisticsRequested():
        return loadBrandsStatisticsRequested(_that);
      case ClearBrandMessagesRequested():
        return clearBrandMessagesRequested(_that);
      case ClearBrandSearchRequested():
        return clearBrandSearchRequested(_that);
      case InternalBrandsUpdated():
        return internalBrandsUpdated(_that);
      case InternalBrandsError():
        return internalBrandsError(_that);
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
    TResult? Function(LoadBrandsRequested value)? loadBrandsRequested,
    TResult? Function(WatchBrandsRequested value)? watchBrandsRequested,
    TResult? Function(SearchBrandsRequested value)? searchBrandsRequested,
    TResult? Function(GetBrandByIdRequested value)? getBrandByIdRequested,
    TResult? Function(CreateBrandRequested value)? createBrandRequested,
    TResult? Function(UpdateBrandRequested value)? updateBrandRequested,
    TResult? Function(DeleteBrandRequested value)? deleteBrandRequested,
    TResult? Function(ToggleBrandStatusRequested value)?
        toggleBrandStatusRequested,
    TResult? Function(CheckBrandNameRequested value)? checkBrandNameRequested,
    TResult? Function(LoadBrandsStatisticsRequested value)?
        loadBrandsStatisticsRequested,
    TResult? Function(ClearBrandMessagesRequested value)?
        clearBrandMessagesRequested,
    TResult? Function(ClearBrandSearchRequested value)?
        clearBrandSearchRequested,
    TResult? Function(InternalBrandsUpdated value)? internalBrandsUpdated,
    TResult? Function(InternalBrandsError value)? internalBrandsError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadBrandsRequested() when loadBrandsRequested != null:
        return loadBrandsRequested(_that);
      case WatchBrandsRequested() when watchBrandsRequested != null:
        return watchBrandsRequested(_that);
      case SearchBrandsRequested() when searchBrandsRequested != null:
        return searchBrandsRequested(_that);
      case GetBrandByIdRequested() when getBrandByIdRequested != null:
        return getBrandByIdRequested(_that);
      case CreateBrandRequested() when createBrandRequested != null:
        return createBrandRequested(_that);
      case UpdateBrandRequested() when updateBrandRequested != null:
        return updateBrandRequested(_that);
      case DeleteBrandRequested() when deleteBrandRequested != null:
        return deleteBrandRequested(_that);
      case ToggleBrandStatusRequested() when toggleBrandStatusRequested != null:
        return toggleBrandStatusRequested(_that);
      case CheckBrandNameRequested() when checkBrandNameRequested != null:
        return checkBrandNameRequested(_that);
      case LoadBrandsStatisticsRequested()
          when loadBrandsStatisticsRequested != null:
        return loadBrandsStatisticsRequested(_that);
      case ClearBrandMessagesRequested()
          when clearBrandMessagesRequested != null:
        return clearBrandMessagesRequested(_that);
      case ClearBrandSearchRequested() when clearBrandSearchRequested != null:
        return clearBrandSearchRequested(_that);
      case InternalBrandsUpdated() when internalBrandsUpdated != null:
        return internalBrandsUpdated(_that);
      case InternalBrandsError() when internalBrandsError != null:
        return internalBrandsError(_that);
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
    TResult Function(bool activeOnly)? loadBrandsRequested,
    TResult Function(bool activeOnly)? watchBrandsRequested,
    TResult Function(String query)? searchBrandsRequested,
    TResult Function(int id)? getBrandByIdRequested,
    TResult Function(
            String name, String? description, String? imagePath, bool isActive)?
        createBrandRequested,
    TResult Function(Brand brand)? updateBrandRequested,
    TResult Function(int id)? deleteBrandRequested,
    TResult Function(int id)? toggleBrandStatusRequested,
    TResult Function(String name, int? excludeId)? checkBrandNameRequested,
    TResult Function()? loadBrandsStatisticsRequested,
    TResult Function()? clearBrandMessagesRequested,
    TResult Function()? clearBrandSearchRequested,
    TResult Function(List<Brand> brands)? internalBrandsUpdated,
    TResult Function(String message)? internalBrandsError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadBrandsRequested() when loadBrandsRequested != null:
        return loadBrandsRequested(_that.activeOnly);
      case WatchBrandsRequested() when watchBrandsRequested != null:
        return watchBrandsRequested(_that.activeOnly);
      case SearchBrandsRequested() when searchBrandsRequested != null:
        return searchBrandsRequested(_that.query);
      case GetBrandByIdRequested() when getBrandByIdRequested != null:
        return getBrandByIdRequested(_that.id);
      case CreateBrandRequested() when createBrandRequested != null:
        return createBrandRequested(
            _that.name, _that.description, _that.imagePath, _that.isActive);
      case UpdateBrandRequested() when updateBrandRequested != null:
        return updateBrandRequested(_that.brand);
      case DeleteBrandRequested() when deleteBrandRequested != null:
        return deleteBrandRequested(_that.id);
      case ToggleBrandStatusRequested() when toggleBrandStatusRequested != null:
        return toggleBrandStatusRequested(_that.id);
      case CheckBrandNameRequested() when checkBrandNameRequested != null:
        return checkBrandNameRequested(_that.name, _that.excludeId);
      case LoadBrandsStatisticsRequested()
          when loadBrandsStatisticsRequested != null:
        return loadBrandsStatisticsRequested();
      case ClearBrandMessagesRequested()
          when clearBrandMessagesRequested != null:
        return clearBrandMessagesRequested();
      case ClearBrandSearchRequested() when clearBrandSearchRequested != null:
        return clearBrandSearchRequested();
      case InternalBrandsUpdated() when internalBrandsUpdated != null:
        return internalBrandsUpdated(_that.brands);
      case InternalBrandsError() when internalBrandsError != null:
        return internalBrandsError(_that.message);
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
    required TResult Function(bool activeOnly) loadBrandsRequested,
    required TResult Function(bool activeOnly) watchBrandsRequested,
    required TResult Function(String query) searchBrandsRequested,
    required TResult Function(int id) getBrandByIdRequested,
    required TResult Function(
            String name, String? description, String? imagePath, bool isActive)
        createBrandRequested,
    required TResult Function(Brand brand) updateBrandRequested,
    required TResult Function(int id) deleteBrandRequested,
    required TResult Function(int id) toggleBrandStatusRequested,
    required TResult Function(String name, int? excludeId)
        checkBrandNameRequested,
    required TResult Function() loadBrandsStatisticsRequested,
    required TResult Function() clearBrandMessagesRequested,
    required TResult Function() clearBrandSearchRequested,
    required TResult Function(List<Brand> brands) internalBrandsUpdated,
    required TResult Function(String message) internalBrandsError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadBrandsRequested():
        return loadBrandsRequested(_that.activeOnly);
      case WatchBrandsRequested():
        return watchBrandsRequested(_that.activeOnly);
      case SearchBrandsRequested():
        return searchBrandsRequested(_that.query);
      case GetBrandByIdRequested():
        return getBrandByIdRequested(_that.id);
      case CreateBrandRequested():
        return createBrandRequested(
            _that.name, _that.description, _that.imagePath, _that.isActive);
      case UpdateBrandRequested():
        return updateBrandRequested(_that.brand);
      case DeleteBrandRequested():
        return deleteBrandRequested(_that.id);
      case ToggleBrandStatusRequested():
        return toggleBrandStatusRequested(_that.id);
      case CheckBrandNameRequested():
        return checkBrandNameRequested(_that.name, _that.excludeId);
      case LoadBrandsStatisticsRequested():
        return loadBrandsStatisticsRequested();
      case ClearBrandMessagesRequested():
        return clearBrandMessagesRequested();
      case ClearBrandSearchRequested():
        return clearBrandSearchRequested();
      case InternalBrandsUpdated():
        return internalBrandsUpdated(_that.brands);
      case InternalBrandsError():
        return internalBrandsError(_that.message);
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
    TResult? Function(bool activeOnly)? loadBrandsRequested,
    TResult? Function(bool activeOnly)? watchBrandsRequested,
    TResult? Function(String query)? searchBrandsRequested,
    TResult? Function(int id)? getBrandByIdRequested,
    TResult? Function(
            String name, String? description, String? imagePath, bool isActive)?
        createBrandRequested,
    TResult? Function(Brand brand)? updateBrandRequested,
    TResult? Function(int id)? deleteBrandRequested,
    TResult? Function(int id)? toggleBrandStatusRequested,
    TResult? Function(String name, int? excludeId)? checkBrandNameRequested,
    TResult? Function()? loadBrandsStatisticsRequested,
    TResult? Function()? clearBrandMessagesRequested,
    TResult? Function()? clearBrandSearchRequested,
    TResult? Function(List<Brand> brands)? internalBrandsUpdated,
    TResult? Function(String message)? internalBrandsError,
  }) {
    final _that = this;
    switch (_that) {
      case LoadBrandsRequested() when loadBrandsRequested != null:
        return loadBrandsRequested(_that.activeOnly);
      case WatchBrandsRequested() when watchBrandsRequested != null:
        return watchBrandsRequested(_that.activeOnly);
      case SearchBrandsRequested() when searchBrandsRequested != null:
        return searchBrandsRequested(_that.query);
      case GetBrandByIdRequested() when getBrandByIdRequested != null:
        return getBrandByIdRequested(_that.id);
      case CreateBrandRequested() when createBrandRequested != null:
        return createBrandRequested(
            _that.name, _that.description, _that.imagePath, _that.isActive);
      case UpdateBrandRequested() when updateBrandRequested != null:
        return updateBrandRequested(_that.brand);
      case DeleteBrandRequested() when deleteBrandRequested != null:
        return deleteBrandRequested(_that.id);
      case ToggleBrandStatusRequested() when toggleBrandStatusRequested != null:
        return toggleBrandStatusRequested(_that.id);
      case CheckBrandNameRequested() when checkBrandNameRequested != null:
        return checkBrandNameRequested(_that.name, _that.excludeId);
      case LoadBrandsStatisticsRequested()
          when loadBrandsStatisticsRequested != null:
        return loadBrandsStatisticsRequested();
      case ClearBrandMessagesRequested()
          when clearBrandMessagesRequested != null:
        return clearBrandMessagesRequested();
      case ClearBrandSearchRequested() when clearBrandSearchRequested != null:
        return clearBrandSearchRequested();
      case InternalBrandsUpdated() when internalBrandsUpdated != null:
        return internalBrandsUpdated(_that.brands);
      case InternalBrandsError() when internalBrandsError != null:
        return internalBrandsError(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadBrandsRequested implements BrandEvent {
  const LoadBrandsRequested({this.activeOnly = false});

  @JsonKey()
  final bool activeOnly;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadBrandsRequestedCopyWith<LoadBrandsRequested> get copyWith =>
      _$LoadBrandsRequestedCopyWithImpl<LoadBrandsRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadBrandsRequested &&
            (identical(other.activeOnly, activeOnly) ||
                other.activeOnly == activeOnly));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeOnly);

  @override
  String toString() {
    return 'BrandEvent.loadBrandsRequested(activeOnly: $activeOnly)';
  }
}

/// @nodoc
abstract mixin class $LoadBrandsRequestedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $LoadBrandsRequestedCopyWith(
          LoadBrandsRequested value, $Res Function(LoadBrandsRequested) _then) =
      _$LoadBrandsRequestedCopyWithImpl;
  @useResult
  $Res call({bool activeOnly});
}

/// @nodoc
class _$LoadBrandsRequestedCopyWithImpl<$Res>
    implements $LoadBrandsRequestedCopyWith<$Res> {
  _$LoadBrandsRequestedCopyWithImpl(this._self, this._then);

  final LoadBrandsRequested _self;
  final $Res Function(LoadBrandsRequested) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeOnly = null,
  }) {
    return _then(LoadBrandsRequested(
      activeOnly: null == activeOnly
          ? _self.activeOnly
          : activeOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class WatchBrandsRequested implements BrandEvent {
  const WatchBrandsRequested({this.activeOnly = false});

  @JsonKey()
  final bool activeOnly;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchBrandsRequestedCopyWith<WatchBrandsRequested> get copyWith =>
      _$WatchBrandsRequestedCopyWithImpl<WatchBrandsRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchBrandsRequested &&
            (identical(other.activeOnly, activeOnly) ||
                other.activeOnly == activeOnly));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeOnly);

  @override
  String toString() {
    return 'BrandEvent.watchBrandsRequested(activeOnly: $activeOnly)';
  }
}

/// @nodoc
abstract mixin class $WatchBrandsRequestedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $WatchBrandsRequestedCopyWith(WatchBrandsRequested value,
          $Res Function(WatchBrandsRequested) _then) =
      _$WatchBrandsRequestedCopyWithImpl;
  @useResult
  $Res call({bool activeOnly});
}

/// @nodoc
class _$WatchBrandsRequestedCopyWithImpl<$Res>
    implements $WatchBrandsRequestedCopyWith<$Res> {
  _$WatchBrandsRequestedCopyWithImpl(this._self, this._then);

  final WatchBrandsRequested _self;
  final $Res Function(WatchBrandsRequested) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeOnly = null,
  }) {
    return _then(WatchBrandsRequested(
      activeOnly: null == activeOnly
          ? _self.activeOnly
          : activeOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SearchBrandsRequested implements BrandEvent {
  const SearchBrandsRequested({required this.query});

  final String query;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchBrandsRequestedCopyWith<SearchBrandsRequested> get copyWith =>
      _$SearchBrandsRequestedCopyWithImpl<SearchBrandsRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchBrandsRequested &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'BrandEvent.searchBrandsRequested(query: $query)';
  }
}

/// @nodoc
abstract mixin class $SearchBrandsRequestedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $SearchBrandsRequestedCopyWith(SearchBrandsRequested value,
          $Res Function(SearchBrandsRequested) _then) =
      _$SearchBrandsRequestedCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SearchBrandsRequestedCopyWithImpl<$Res>
    implements $SearchBrandsRequestedCopyWith<$Res> {
  _$SearchBrandsRequestedCopyWithImpl(this._self, this._then);

  final SearchBrandsRequested _self;
  final $Res Function(SearchBrandsRequested) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(SearchBrandsRequested(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetBrandByIdRequested implements BrandEvent {
  const GetBrandByIdRequested({required this.id});

  final int id;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetBrandByIdRequestedCopyWith<GetBrandByIdRequested> get copyWith =>
      _$GetBrandByIdRequestedCopyWithImpl<GetBrandByIdRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetBrandByIdRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'BrandEvent.getBrandByIdRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetBrandByIdRequestedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $GetBrandByIdRequestedCopyWith(GetBrandByIdRequested value,
          $Res Function(GetBrandByIdRequested) _then) =
      _$GetBrandByIdRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$GetBrandByIdRequestedCopyWithImpl<$Res>
    implements $GetBrandByIdRequestedCopyWith<$Res> {
  _$GetBrandByIdRequestedCopyWithImpl(this._self, this._then);

  final GetBrandByIdRequested _self;
  final $Res Function(GetBrandByIdRequested) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetBrandByIdRequested(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CreateBrandRequested implements BrandEvent {
  const CreateBrandRequested(
      {required this.name,
      this.description,
      this.imagePath,
      this.isActive = true});

  final String name;
  final String? description;
  final String? imagePath;
  @JsonKey()
  final bool isActive;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateBrandRequestedCopyWith<CreateBrandRequested> get copyWith =>
      _$CreateBrandRequestedCopyWithImpl<CreateBrandRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateBrandRequested &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, imagePath, isActive);

  @override
  String toString() {
    return 'BrandEvent.createBrandRequested(name: $name, description: $description, imagePath: $imagePath, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class $CreateBrandRequestedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $CreateBrandRequestedCopyWith(CreateBrandRequested value,
          $Res Function(CreateBrandRequested) _then) =
      _$CreateBrandRequestedCopyWithImpl;
  @useResult
  $Res call(
      {String name, String? description, String? imagePath, bool isActive});
}

/// @nodoc
class _$CreateBrandRequestedCopyWithImpl<$Res>
    implements $CreateBrandRequestedCopyWith<$Res> {
  _$CreateBrandRequestedCopyWithImpl(this._self, this._then);

  final CreateBrandRequested _self;
  final $Res Function(CreateBrandRequested) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? isActive = null,
  }) {
    return _then(CreateBrandRequested(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class UpdateBrandRequested implements BrandEvent {
  const UpdateBrandRequested({required this.brand});

  final Brand brand;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateBrandRequestedCopyWith<UpdateBrandRequested> get copyWith =>
      _$UpdateBrandRequestedCopyWithImpl<UpdateBrandRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateBrandRequested &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brand);

  @override
  String toString() {
    return 'BrandEvent.updateBrandRequested(brand: $brand)';
  }
}

/// @nodoc
abstract mixin class $UpdateBrandRequestedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $UpdateBrandRequestedCopyWith(UpdateBrandRequested value,
          $Res Function(UpdateBrandRequested) _then) =
      _$UpdateBrandRequestedCopyWithImpl;
  @useResult
  $Res call({Brand brand});

  $BrandCopyWith<$Res> get brand;
}

/// @nodoc
class _$UpdateBrandRequestedCopyWithImpl<$Res>
    implements $UpdateBrandRequestedCopyWith<$Res> {
  _$UpdateBrandRequestedCopyWithImpl(this._self, this._then);

  final UpdateBrandRequested _self;
  final $Res Function(UpdateBrandRequested) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brand = null,
  }) {
    return _then(UpdateBrandRequested(
      brand: null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand,
    ));
  }

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandCopyWith<$Res> get brand {
    return $BrandCopyWith<$Res>(_self.brand, (value) {
      return _then(_self.copyWith(brand: value));
    });
  }
}

/// @nodoc

class DeleteBrandRequested implements BrandEvent {
  const DeleteBrandRequested({required this.id});

  final int id;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteBrandRequestedCopyWith<DeleteBrandRequested> get copyWith =>
      _$DeleteBrandRequestedCopyWithImpl<DeleteBrandRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteBrandRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'BrandEvent.deleteBrandRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteBrandRequestedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $DeleteBrandRequestedCopyWith(DeleteBrandRequested value,
          $Res Function(DeleteBrandRequested) _then) =
      _$DeleteBrandRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteBrandRequestedCopyWithImpl<$Res>
    implements $DeleteBrandRequestedCopyWith<$Res> {
  _$DeleteBrandRequestedCopyWithImpl(this._self, this._then);

  final DeleteBrandRequested _self;
  final $Res Function(DeleteBrandRequested) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteBrandRequested(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ToggleBrandStatusRequested implements BrandEvent {
  const ToggleBrandStatusRequested({required this.id});

  final int id;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleBrandStatusRequestedCopyWith<ToggleBrandStatusRequested>
      get copyWith =>
          _$ToggleBrandStatusRequestedCopyWithImpl<ToggleBrandStatusRequested>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleBrandStatusRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'BrandEvent.toggleBrandStatusRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $ToggleBrandStatusRequestedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $ToggleBrandStatusRequestedCopyWith(ToggleBrandStatusRequested value,
          $Res Function(ToggleBrandStatusRequested) _then) =
      _$ToggleBrandStatusRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ToggleBrandStatusRequestedCopyWithImpl<$Res>
    implements $ToggleBrandStatusRequestedCopyWith<$Res> {
  _$ToggleBrandStatusRequestedCopyWithImpl(this._self, this._then);

  final ToggleBrandStatusRequested _self;
  final $Res Function(ToggleBrandStatusRequested) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(ToggleBrandStatusRequested(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CheckBrandNameRequested implements BrandEvent {
  const CheckBrandNameRequested({required this.name, this.excludeId});

  final String name;
  final int? excludeId;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckBrandNameRequestedCopyWith<CheckBrandNameRequested> get copyWith =>
      _$CheckBrandNameRequestedCopyWithImpl<CheckBrandNameRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckBrandNameRequested &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.excludeId, excludeId) ||
                other.excludeId == excludeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, excludeId);

  @override
  String toString() {
    return 'BrandEvent.checkBrandNameRequested(name: $name, excludeId: $excludeId)';
  }
}

/// @nodoc
abstract mixin class $CheckBrandNameRequestedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $CheckBrandNameRequestedCopyWith(CheckBrandNameRequested value,
          $Res Function(CheckBrandNameRequested) _then) =
      _$CheckBrandNameRequestedCopyWithImpl;
  @useResult
  $Res call({String name, int? excludeId});
}

/// @nodoc
class _$CheckBrandNameRequestedCopyWithImpl<$Res>
    implements $CheckBrandNameRequestedCopyWith<$Res> {
  _$CheckBrandNameRequestedCopyWithImpl(this._self, this._then);

  final CheckBrandNameRequested _self;
  final $Res Function(CheckBrandNameRequested) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? excludeId = freezed,
  }) {
    return _then(CheckBrandNameRequested(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      excludeId: freezed == excludeId
          ? _self.excludeId
          : excludeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class LoadBrandsStatisticsRequested implements BrandEvent {
  const LoadBrandsStatisticsRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadBrandsStatisticsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandEvent.loadBrandsStatisticsRequested()';
  }
}

/// @nodoc

class ClearBrandMessagesRequested implements BrandEvent {
  const ClearBrandMessagesRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClearBrandMessagesRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandEvent.clearBrandMessagesRequested()';
  }
}

/// @nodoc

class ClearBrandSearchRequested implements BrandEvent {
  const ClearBrandSearchRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClearBrandSearchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BrandEvent.clearBrandSearchRequested()';
  }
}

/// @nodoc

class InternalBrandsUpdated implements BrandEvent {
  const InternalBrandsUpdated({required final List<Brand> brands})
      : _brands = brands;

  final List<Brand> _brands;
  List<Brand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InternalBrandsUpdatedCopyWith<InternalBrandsUpdated> get copyWith =>
      _$InternalBrandsUpdatedCopyWithImpl<InternalBrandsUpdated>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InternalBrandsUpdated &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_brands));

  @override
  String toString() {
    return 'BrandEvent.internalBrandsUpdated(brands: $brands)';
  }
}

/// @nodoc
abstract mixin class $InternalBrandsUpdatedCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $InternalBrandsUpdatedCopyWith(InternalBrandsUpdated value,
          $Res Function(InternalBrandsUpdated) _then) =
      _$InternalBrandsUpdatedCopyWithImpl;
  @useResult
  $Res call({List<Brand> brands});
}

/// @nodoc
class _$InternalBrandsUpdatedCopyWithImpl<$Res>
    implements $InternalBrandsUpdatedCopyWith<$Res> {
  _$InternalBrandsUpdatedCopyWithImpl(this._self, this._then);

  final InternalBrandsUpdated _self;
  final $Res Function(InternalBrandsUpdated) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brands = null,
  }) {
    return _then(InternalBrandsUpdated(
      brands: null == brands
          ? _self._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
    ));
  }
}

/// @nodoc

class InternalBrandsError implements BrandEvent {
  const InternalBrandsError({required this.message});

  final String message;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InternalBrandsErrorCopyWith<InternalBrandsError> get copyWith =>
      _$InternalBrandsErrorCopyWithImpl<InternalBrandsError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InternalBrandsError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'BrandEvent.internalBrandsError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $InternalBrandsErrorCopyWith<$Res>
    implements $BrandEventCopyWith<$Res> {
  factory $InternalBrandsErrorCopyWith(
          InternalBrandsError value, $Res Function(InternalBrandsError) _then) =
      _$InternalBrandsErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$InternalBrandsErrorCopyWithImpl<$Res>
    implements $InternalBrandsErrorCopyWith<$Res> {
  _$InternalBrandsErrorCopyWithImpl(this._self, this._then);

  final InternalBrandsError _self;
  final $Res Function(InternalBrandsError) _then;

  /// Create a copy of BrandEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(InternalBrandsError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
