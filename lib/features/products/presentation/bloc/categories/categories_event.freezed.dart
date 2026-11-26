// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoriesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoriesEvent()';
  }
}

/// @nodoc
class $CategoriesEventCopyWith<$Res> {
  $CategoriesEventCopyWith(
      CategoriesEvent _, $Res Function(CategoriesEvent) __);
}

/// Adds pattern-matching-related methods to [CategoriesEvent].
extension CategoriesEventPatterns on CategoriesEvent {
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
    TResult Function(LoadCategories value)? load,
    TResult Function(WatchCategories value)? watch,
    TResult Function(CategoriesUpdated value)? categoriesUpdated,
    TResult Function(CategoriesWatchFailed value)? watchFailed,
    TResult Function(LoadRootCategories value)? loadRoots,
    TResult Function(LoadChildCategories value)? loadChildren,
    TResult Function(SearchCategories value)? search,
    TResult Function(ClearCategorySearch value)? clearSearch,
    TResult Function(CreateCategory value)? create,
    TResult Function(UpdateCategory value)? update,
    TResult Function(DeleteCategory value)? delete,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadCategories() when load != null:
        return load(_that);
      case WatchCategories() when watch != null:
        return watch(_that);
      case CategoriesUpdated() when categoriesUpdated != null:
        return categoriesUpdated(_that);
      case CategoriesWatchFailed() when watchFailed != null:
        return watchFailed(_that);
      case LoadRootCategories() when loadRoots != null:
        return loadRoots(_that);
      case LoadChildCategories() when loadChildren != null:
        return loadChildren(_that);
      case SearchCategories() when search != null:
        return search(_that);
      case ClearCategorySearch() when clearSearch != null:
        return clearSearch(_that);
      case CreateCategory() when create != null:
        return create(_that);
      case UpdateCategory() when update != null:
        return update(_that);
      case DeleteCategory() when delete != null:
        return delete(_that);
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
    required TResult Function(LoadCategories value) load,
    required TResult Function(WatchCategories value) watch,
    required TResult Function(CategoriesUpdated value) categoriesUpdated,
    required TResult Function(CategoriesWatchFailed value) watchFailed,
    required TResult Function(LoadRootCategories value) loadRoots,
    required TResult Function(LoadChildCategories value) loadChildren,
    required TResult Function(SearchCategories value) search,
    required TResult Function(ClearCategorySearch value) clearSearch,
    required TResult Function(CreateCategory value) create,
    required TResult Function(UpdateCategory value) update,
    required TResult Function(DeleteCategory value) delete,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCategories():
        return load(_that);
      case WatchCategories():
        return watch(_that);
      case CategoriesUpdated():
        return categoriesUpdated(_that);
      case CategoriesWatchFailed():
        return watchFailed(_that);
      case LoadRootCategories():
        return loadRoots(_that);
      case LoadChildCategories():
        return loadChildren(_that);
      case SearchCategories():
        return search(_that);
      case ClearCategorySearch():
        return clearSearch(_that);
      case CreateCategory():
        return create(_that);
      case UpdateCategory():
        return update(_that);
      case DeleteCategory():
        return delete(_that);
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
    TResult? Function(LoadCategories value)? load,
    TResult? Function(WatchCategories value)? watch,
    TResult? Function(CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(CategoriesWatchFailed value)? watchFailed,
    TResult? Function(LoadRootCategories value)? loadRoots,
    TResult? Function(LoadChildCategories value)? loadChildren,
    TResult? Function(SearchCategories value)? search,
    TResult? Function(ClearCategorySearch value)? clearSearch,
    TResult? Function(CreateCategory value)? create,
    TResult? Function(UpdateCategory value)? update,
    TResult? Function(DeleteCategory value)? delete,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCategories() when load != null:
        return load(_that);
      case WatchCategories() when watch != null:
        return watch(_that);
      case CategoriesUpdated() when categoriesUpdated != null:
        return categoriesUpdated(_that);
      case CategoriesWatchFailed() when watchFailed != null:
        return watchFailed(_that);
      case LoadRootCategories() when loadRoots != null:
        return loadRoots(_that);
      case LoadChildCategories() when loadChildren != null:
        return loadChildren(_that);
      case SearchCategories() when search != null:
        return search(_that);
      case ClearCategorySearch() when clearSearch != null:
        return clearSearch(_that);
      case CreateCategory() when create != null:
        return create(_that);
      case UpdateCategory() when update != null:
        return update(_that);
      case DeleteCategory() when delete != null:
        return delete(_that);
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
    TResult Function()? load,
    TResult Function()? watch,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(String message)? watchFailed,
    TResult Function()? loadRoots,
    TResult Function(int parentId)? loadChildren,
    TResult Function(String query)? search,
    TResult Function()? clearSearch,
    TResult Function(Category category)? create,
    TResult Function(int id, Category category)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadCategories() when load != null:
        return load();
      case WatchCategories() when watch != null:
        return watch();
      case CategoriesUpdated() when categoriesUpdated != null:
        return categoriesUpdated(_that.categories);
      case CategoriesWatchFailed() when watchFailed != null:
        return watchFailed(_that.message);
      case LoadRootCategories() when loadRoots != null:
        return loadRoots();
      case LoadChildCategories() when loadChildren != null:
        return loadChildren(_that.parentId);
      case SearchCategories() when search != null:
        return search(_that.query);
      case ClearCategorySearch() when clearSearch != null:
        return clearSearch();
      case CreateCategory() when create != null:
        return create(_that.category);
      case UpdateCategory() when update != null:
        return update(_that.id, _that.category);
      case DeleteCategory() when delete != null:
        return delete(_that.id);
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
    required TResult Function() load,
    required TResult Function() watch,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(String message) watchFailed,
    required TResult Function() loadRoots,
    required TResult Function(int parentId) loadChildren,
    required TResult Function(String query) search,
    required TResult Function() clearSearch,
    required TResult Function(Category category) create,
    required TResult Function(int id, Category category) update,
    required TResult Function(int id) delete,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCategories():
        return load();
      case WatchCategories():
        return watch();
      case CategoriesUpdated():
        return categoriesUpdated(_that.categories);
      case CategoriesWatchFailed():
        return watchFailed(_that.message);
      case LoadRootCategories():
        return loadRoots();
      case LoadChildCategories():
        return loadChildren(_that.parentId);
      case SearchCategories():
        return search(_that.query);
      case ClearCategorySearch():
        return clearSearch();
      case CreateCategory():
        return create(_that.category);
      case UpdateCategory():
        return update(_that.id, _that.category);
      case DeleteCategory():
        return delete(_that.id);
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
    TResult? Function()? load,
    TResult? Function()? watch,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(String message)? watchFailed,
    TResult? Function()? loadRoots,
    TResult? Function(int parentId)? loadChildren,
    TResult? Function(String query)? search,
    TResult? Function()? clearSearch,
    TResult? Function(Category category)? create,
    TResult? Function(int id, Category category)? update,
    TResult? Function(int id)? delete,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCategories() when load != null:
        return load();
      case WatchCategories() when watch != null:
        return watch();
      case CategoriesUpdated() when categoriesUpdated != null:
        return categoriesUpdated(_that.categories);
      case CategoriesWatchFailed() when watchFailed != null:
        return watchFailed(_that.message);
      case LoadRootCategories() when loadRoots != null:
        return loadRoots();
      case LoadChildCategories() when loadChildren != null:
        return loadChildren(_that.parentId);
      case SearchCategories() when search != null:
        return search(_that.query);
      case ClearCategorySearch() when clearSearch != null:
        return clearSearch();
      case CreateCategory() when create != null:
        return create(_that.category);
      case UpdateCategory() when update != null:
        return update(_that.id, _that.category);
      case DeleteCategory() when delete != null:
        return delete(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadCategories implements CategoriesEvent {
  const LoadCategories();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoriesEvent.load()';
  }
}

/// @nodoc

class WatchCategories implements CategoriesEvent {
  const WatchCategories();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WatchCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoriesEvent.watch()';
  }
}

/// @nodoc

class CategoriesUpdated implements CategoriesEvent {
  const CategoriesUpdated(final List<Category> categories)
      : _categories = categories;

  final List<Category> _categories;
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesUpdatedCopyWith<CategoriesUpdated> get copyWith =>
      _$CategoriesUpdatedCopyWithImpl<CategoriesUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesUpdated &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'CategoriesEvent.categoriesUpdated(categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $CategoriesUpdatedCopyWith<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  factory $CategoriesUpdatedCopyWith(
          CategoriesUpdated value, $Res Function(CategoriesUpdated) _then) =
      _$CategoriesUpdatedCopyWithImpl;
  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class _$CategoriesUpdatedCopyWithImpl<$Res>
    implements $CategoriesUpdatedCopyWith<$Res> {
  _$CategoriesUpdatedCopyWithImpl(this._self, this._then);

  final CategoriesUpdated _self;
  final $Res Function(CategoriesUpdated) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = null,
  }) {
    return _then(CategoriesUpdated(
      null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class CategoriesWatchFailed implements CategoriesEvent {
  const CategoriesWatchFailed(this.message);

  final String message;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesWatchFailedCopyWith<CategoriesWatchFailed> get copyWith =>
      _$CategoriesWatchFailedCopyWithImpl<CategoriesWatchFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesWatchFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CategoriesEvent.watchFailed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CategoriesWatchFailedCopyWith<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  factory $CategoriesWatchFailedCopyWith(CategoriesWatchFailed value,
          $Res Function(CategoriesWatchFailed) _then) =
      _$CategoriesWatchFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CategoriesWatchFailedCopyWithImpl<$Res>
    implements $CategoriesWatchFailedCopyWith<$Res> {
  _$CategoriesWatchFailedCopyWithImpl(this._self, this._then);

  final CategoriesWatchFailed _self;
  final $Res Function(CategoriesWatchFailed) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CategoriesWatchFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LoadRootCategories implements CategoriesEvent {
  const LoadRootCategories();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadRootCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoriesEvent.loadRoots()';
  }
}

/// @nodoc

class LoadChildCategories implements CategoriesEvent {
  const LoadChildCategories(this.parentId);

  final int parentId;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadChildCategoriesCopyWith<LoadChildCategories> get copyWith =>
      _$LoadChildCategoriesCopyWithImpl<LoadChildCategories>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadChildCategories &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parentId);

  @override
  String toString() {
    return 'CategoriesEvent.loadChildren(parentId: $parentId)';
  }
}

/// @nodoc
abstract mixin class $LoadChildCategoriesCopyWith<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  factory $LoadChildCategoriesCopyWith(
          LoadChildCategories value, $Res Function(LoadChildCategories) _then) =
      _$LoadChildCategoriesCopyWithImpl;
  @useResult
  $Res call({int parentId});
}

/// @nodoc
class _$LoadChildCategoriesCopyWithImpl<$Res>
    implements $LoadChildCategoriesCopyWith<$Res> {
  _$LoadChildCategoriesCopyWithImpl(this._self, this._then);

  final LoadChildCategories _self;
  final $Res Function(LoadChildCategories) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? parentId = null,
  }) {
    return _then(LoadChildCategories(
      null == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SearchCategories implements CategoriesEvent {
  const SearchCategories(this.query);

  final String query;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchCategoriesCopyWith<SearchCategories> get copyWith =>
      _$SearchCategoriesCopyWithImpl<SearchCategories>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchCategories &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'CategoriesEvent.search(query: $query)';
  }
}

/// @nodoc
abstract mixin class $SearchCategoriesCopyWith<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  factory $SearchCategoriesCopyWith(
          SearchCategories value, $Res Function(SearchCategories) _then) =
      _$SearchCategoriesCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SearchCategoriesCopyWithImpl<$Res>
    implements $SearchCategoriesCopyWith<$Res> {
  _$SearchCategoriesCopyWithImpl(this._self, this._then);

  final SearchCategories _self;
  final $Res Function(SearchCategories) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(SearchCategories(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ClearCategorySearch implements CategoriesEvent {
  const ClearCategorySearch();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearCategorySearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoriesEvent.clearSearch()';
  }
}

/// @nodoc

class CreateCategory implements CategoriesEvent {
  const CreateCategory(this.category);

  final Category category;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateCategoryCopyWith<CreateCategory> get copyWith =>
      _$CreateCategoryCopyWithImpl<CreateCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCategory &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'CategoriesEvent.create(category: $category)';
  }
}

/// @nodoc
abstract mixin class $CreateCategoryCopyWith<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  factory $CreateCategoryCopyWith(
          CreateCategory value, $Res Function(CreateCategory) _then) =
      _$CreateCategoryCopyWithImpl;
  @useResult
  $Res call({Category category});
}

/// @nodoc
class _$CreateCategoryCopyWithImpl<$Res>
    implements $CreateCategoryCopyWith<$Res> {
  _$CreateCategoryCopyWithImpl(this._self, this._then);

  final CreateCategory _self;
  final $Res Function(CreateCategory) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
  }) {
    return _then(CreateCategory(
      null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class UpdateCategory implements CategoriesEvent {
  const UpdateCategory({required this.id, required this.category});

  final int id;
  final Category category;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCategoryCopyWith<UpdateCategory> get copyWith =>
      _$UpdateCategoryCopyWithImpl<UpdateCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, category);

  @override
  String toString() {
    return 'CategoriesEvent.update(id: $id, category: $category)';
  }
}

/// @nodoc
abstract mixin class $UpdateCategoryCopyWith<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  factory $UpdateCategoryCopyWith(
          UpdateCategory value, $Res Function(UpdateCategory) _then) =
      _$UpdateCategoryCopyWithImpl;
  @useResult
  $Res call({int id, Category category});
}

/// @nodoc
class _$UpdateCategoryCopyWithImpl<$Res>
    implements $UpdateCategoryCopyWith<$Res> {
  _$UpdateCategoryCopyWithImpl(this._self, this._then);

  final UpdateCategory _self;
  final $Res Function(UpdateCategory) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? category = null,
  }) {
    return _then(UpdateCategory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class DeleteCategory implements CategoriesEvent {
  const DeleteCategory(this.id);

  final int id;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteCategoryCopyWith<DeleteCategory> get copyWith =>
      _$DeleteCategoryCopyWithImpl<DeleteCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteCategory &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CategoriesEvent.delete(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteCategoryCopyWith<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  factory $DeleteCategoryCopyWith(
          DeleteCategory value, $Res Function(DeleteCategory) _then) =
      _$DeleteCategoryCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteCategoryCopyWithImpl<$Res>
    implements $DeleteCategoryCopyWith<$Res> {
  _$DeleteCategoryCopyWithImpl(this._self, this._then);

  final DeleteCategory _self;
  final $Res Function(DeleteCategory) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteCategory(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
