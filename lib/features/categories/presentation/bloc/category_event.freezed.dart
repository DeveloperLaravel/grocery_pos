// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent()';
  }
}

/// @nodoc
class $CategoryEventCopyWith<$Res> {
  $CategoryEventCopyWith(CategoryEvent _, $Res Function(CategoryEvent) __);
}

/// Adds pattern-matching-related methods to [CategoryEvent].
extension CategoryEventPatterns on CategoryEvent {
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
    TResult Function(CategoryLoadRequested value)? loadRequested,
    TResult Function(CategoryWatchRequested value)? watchRequested,
    TResult Function(CategoriesUpdated value)? categoriesUpdated,
    TResult Function(CategoryWatchFailed value)? watchFailed,
    TResult Function(CategoryGetByIdRequested value)? getByIdRequested,
    TResult Function(CategoryChildrenRequested value)? childrenRequested,
    TResult Function(CategorySearchRequested value)? searchRequested,
    TResult Function(CategoryActiveRequested value)? activeRequested,
    TResult Function(CategoryAddRequested value)? addRequested,
    TResult Function(CategoryUpdateRequested value)? updateRequested,
    TResult Function(CategoryDeleteRequested value)? deleteRequested,
    TResult Function(CategoryToggleStatusRequested value)?
        toggleStatusRequested,
    TResult Function(CategorySelectionCleared value)? selectionCleared,
    TResult Function(CategoryWatchStopped value)? watchStopped,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CategoryLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case CategoryWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case CategoriesUpdated() when categoriesUpdated != null:
        return categoriesUpdated(_that);
      case CategoryWatchFailed() when watchFailed != null:
        return watchFailed(_that);
      case CategoryGetByIdRequested() when getByIdRequested != null:
        return getByIdRequested(_that);
      case CategoryChildrenRequested() when childrenRequested != null:
        return childrenRequested(_that);
      case CategorySearchRequested() when searchRequested != null:
        return searchRequested(_that);
      case CategoryActiveRequested() when activeRequested != null:
        return activeRequested(_that);
      case CategoryAddRequested() when addRequested != null:
        return addRequested(_that);
      case CategoryUpdateRequested() when updateRequested != null:
        return updateRequested(_that);
      case CategoryDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that);
      case CategoryToggleStatusRequested() when toggleStatusRequested != null:
        return toggleStatusRequested(_that);
      case CategorySelectionCleared() when selectionCleared != null:
        return selectionCleared(_that);
      case CategoryWatchStopped() when watchStopped != null:
        return watchStopped(_that);
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
    required TResult Function(CategoryLoadRequested value) loadRequested,
    required TResult Function(CategoryWatchRequested value) watchRequested,
    required TResult Function(CategoriesUpdated value) categoriesUpdated,
    required TResult Function(CategoryWatchFailed value) watchFailed,
    required TResult Function(CategoryGetByIdRequested value) getByIdRequested,
    required TResult Function(CategoryChildrenRequested value)
        childrenRequested,
    required TResult Function(CategorySearchRequested value) searchRequested,
    required TResult Function(CategoryActiveRequested value) activeRequested,
    required TResult Function(CategoryAddRequested value) addRequested,
    required TResult Function(CategoryUpdateRequested value) updateRequested,
    required TResult Function(CategoryDeleteRequested value) deleteRequested,
    required TResult Function(CategoryToggleStatusRequested value)
        toggleStatusRequested,
    required TResult Function(CategorySelectionCleared value) selectionCleared,
    required TResult Function(CategoryWatchStopped value) watchStopped,
  }) {
    final _that = this;
    switch (_that) {
      case CategoryLoadRequested():
        return loadRequested(_that);
      case CategoryWatchRequested():
        return watchRequested(_that);
      case CategoriesUpdated():
        return categoriesUpdated(_that);
      case CategoryWatchFailed():
        return watchFailed(_that);
      case CategoryGetByIdRequested():
        return getByIdRequested(_that);
      case CategoryChildrenRequested():
        return childrenRequested(_that);
      case CategorySearchRequested():
        return searchRequested(_that);
      case CategoryActiveRequested():
        return activeRequested(_that);
      case CategoryAddRequested():
        return addRequested(_that);
      case CategoryUpdateRequested():
        return updateRequested(_that);
      case CategoryDeleteRequested():
        return deleteRequested(_that);
      case CategoryToggleStatusRequested():
        return toggleStatusRequested(_that);
      case CategorySelectionCleared():
        return selectionCleared(_that);
      case CategoryWatchStopped():
        return watchStopped(_that);
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
    TResult? Function(CategoryLoadRequested value)? loadRequested,
    TResult? Function(CategoryWatchRequested value)? watchRequested,
    TResult? Function(CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(CategoryWatchFailed value)? watchFailed,
    TResult? Function(CategoryGetByIdRequested value)? getByIdRequested,
    TResult? Function(CategoryChildrenRequested value)? childrenRequested,
    TResult? Function(CategorySearchRequested value)? searchRequested,
    TResult? Function(CategoryActiveRequested value)? activeRequested,
    TResult? Function(CategoryAddRequested value)? addRequested,
    TResult? Function(CategoryUpdateRequested value)? updateRequested,
    TResult? Function(CategoryDeleteRequested value)? deleteRequested,
    TResult? Function(CategoryToggleStatusRequested value)?
        toggleStatusRequested,
    TResult? Function(CategorySelectionCleared value)? selectionCleared,
    TResult? Function(CategoryWatchStopped value)? watchStopped,
  }) {
    final _that = this;
    switch (_that) {
      case CategoryLoadRequested() when loadRequested != null:
        return loadRequested(_that);
      case CategoryWatchRequested() when watchRequested != null:
        return watchRequested(_that);
      case CategoriesUpdated() when categoriesUpdated != null:
        return categoriesUpdated(_that);
      case CategoryWatchFailed() when watchFailed != null:
        return watchFailed(_that);
      case CategoryGetByIdRequested() when getByIdRequested != null:
        return getByIdRequested(_that);
      case CategoryChildrenRequested() when childrenRequested != null:
        return childrenRequested(_that);
      case CategorySearchRequested() when searchRequested != null:
        return searchRequested(_that);
      case CategoryActiveRequested() when activeRequested != null:
        return activeRequested(_that);
      case CategoryAddRequested() when addRequested != null:
        return addRequested(_that);
      case CategoryUpdateRequested() when updateRequested != null:
        return updateRequested(_that);
      case CategoryDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that);
      case CategoryToggleStatusRequested() when toggleStatusRequested != null:
        return toggleStatusRequested(_that);
      case CategorySelectionCleared() when selectionCleared != null:
        return selectionCleared(_that);
      case CategoryWatchStopped() when watchStopped != null:
        return watchStopped(_that);
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
    TResult Function()? loadRequested,
    TResult Function()? watchRequested,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(String message)? watchFailed,
    TResult Function(int id)? getByIdRequested,
    TResult Function(int? parentId)? childrenRequested,
    TResult Function(String keyword)? searchRequested,
    TResult Function()? activeRequested,
    TResult Function(Category category)? addRequested,
    TResult Function(Category category)? updateRequested,
    TResult Function(int id)? deleteRequested,
    TResult Function(Category category)? toggleStatusRequested,
    TResult Function()? selectionCleared,
    TResult Function()? watchStopped,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CategoryLoadRequested() when loadRequested != null:
        return loadRequested();
      case CategoryWatchRequested() when watchRequested != null:
        return watchRequested();
      case CategoriesUpdated() when categoriesUpdated != null:
        return categoriesUpdated(_that.categories);
      case CategoryWatchFailed() when watchFailed != null:
        return watchFailed(_that.message);
      case CategoryGetByIdRequested() when getByIdRequested != null:
        return getByIdRequested(_that.id);
      case CategoryChildrenRequested() when childrenRequested != null:
        return childrenRequested(_that.parentId);
      case CategorySearchRequested() when searchRequested != null:
        return searchRequested(_that.keyword);
      case CategoryActiveRequested() when activeRequested != null:
        return activeRequested();
      case CategoryAddRequested() when addRequested != null:
        return addRequested(_that.category);
      case CategoryUpdateRequested() when updateRequested != null:
        return updateRequested(_that.category);
      case CategoryDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that.id);
      case CategoryToggleStatusRequested() when toggleStatusRequested != null:
        return toggleStatusRequested(_that.category);
      case CategorySelectionCleared() when selectionCleared != null:
        return selectionCleared();
      case CategoryWatchStopped() when watchStopped != null:
        return watchStopped();
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
    required TResult Function() loadRequested,
    required TResult Function() watchRequested,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(String message) watchFailed,
    required TResult Function(int id) getByIdRequested,
    required TResult Function(int? parentId) childrenRequested,
    required TResult Function(String keyword) searchRequested,
    required TResult Function() activeRequested,
    required TResult Function(Category category) addRequested,
    required TResult Function(Category category) updateRequested,
    required TResult Function(int id) deleteRequested,
    required TResult Function(Category category) toggleStatusRequested,
    required TResult Function() selectionCleared,
    required TResult Function() watchStopped,
  }) {
    final _that = this;
    switch (_that) {
      case CategoryLoadRequested():
        return loadRequested();
      case CategoryWatchRequested():
        return watchRequested();
      case CategoriesUpdated():
        return categoriesUpdated(_that.categories);
      case CategoryWatchFailed():
        return watchFailed(_that.message);
      case CategoryGetByIdRequested():
        return getByIdRequested(_that.id);
      case CategoryChildrenRequested():
        return childrenRequested(_that.parentId);
      case CategorySearchRequested():
        return searchRequested(_that.keyword);
      case CategoryActiveRequested():
        return activeRequested();
      case CategoryAddRequested():
        return addRequested(_that.category);
      case CategoryUpdateRequested():
        return updateRequested(_that.category);
      case CategoryDeleteRequested():
        return deleteRequested(_that.id);
      case CategoryToggleStatusRequested():
        return toggleStatusRequested(_that.category);
      case CategorySelectionCleared():
        return selectionCleared();
      case CategoryWatchStopped():
        return watchStopped();
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
    TResult? Function()? loadRequested,
    TResult? Function()? watchRequested,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(String message)? watchFailed,
    TResult? Function(int id)? getByIdRequested,
    TResult? Function(int? parentId)? childrenRequested,
    TResult? Function(String keyword)? searchRequested,
    TResult? Function()? activeRequested,
    TResult? Function(Category category)? addRequested,
    TResult? Function(Category category)? updateRequested,
    TResult? Function(int id)? deleteRequested,
    TResult? Function(Category category)? toggleStatusRequested,
    TResult? Function()? selectionCleared,
    TResult? Function()? watchStopped,
  }) {
    final _that = this;
    switch (_that) {
      case CategoryLoadRequested() when loadRequested != null:
        return loadRequested();
      case CategoryWatchRequested() when watchRequested != null:
        return watchRequested();
      case CategoriesUpdated() when categoriesUpdated != null:
        return categoriesUpdated(_that.categories);
      case CategoryWatchFailed() when watchFailed != null:
        return watchFailed(_that.message);
      case CategoryGetByIdRequested() when getByIdRequested != null:
        return getByIdRequested(_that.id);
      case CategoryChildrenRequested() when childrenRequested != null:
        return childrenRequested(_that.parentId);
      case CategorySearchRequested() when searchRequested != null:
        return searchRequested(_that.keyword);
      case CategoryActiveRequested() when activeRequested != null:
        return activeRequested();
      case CategoryAddRequested() when addRequested != null:
        return addRequested(_that.category);
      case CategoryUpdateRequested() when updateRequested != null:
        return updateRequested(_that.category);
      case CategoryDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that.id);
      case CategoryToggleStatusRequested() when toggleStatusRequested != null:
        return toggleStatusRequested(_that.category);
      case CategorySelectionCleared() when selectionCleared != null:
        return selectionCleared();
      case CategoryWatchStopped() when watchStopped != null:
        return watchStopped();
      case _:
        return null;
    }
  }
}

/// @nodoc

class CategoryLoadRequested implements CategoryEvent {
  const CategoryLoadRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryLoadRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent.loadRequested()';
  }
}

/// @nodoc

class CategoryWatchRequested implements CategoryEvent {
  const CategoryWatchRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryWatchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent.watchRequested()';
  }
}

/// @nodoc

class CategoriesUpdated implements CategoryEvent {
  const CategoriesUpdated(final List<Category> categories)
      : _categories = categories;

  final List<Category> _categories;
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of CategoryEvent
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
    return 'CategoryEvent.categoriesUpdated(categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $CategoriesUpdatedCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
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

  /// Create a copy of CategoryEvent
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

class CategoryWatchFailed implements CategoryEvent {
  const CategoryWatchFailed(this.message);

  final String message;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryWatchFailedCopyWith<CategoryWatchFailed> get copyWith =>
      _$CategoryWatchFailedCopyWithImpl<CategoryWatchFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryWatchFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CategoryEvent.watchFailed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CategoryWatchFailedCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory $CategoryWatchFailedCopyWith(
          CategoryWatchFailed value, $Res Function(CategoryWatchFailed) _then) =
      _$CategoryWatchFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CategoryWatchFailedCopyWithImpl<$Res>
    implements $CategoryWatchFailedCopyWith<$Res> {
  _$CategoryWatchFailedCopyWithImpl(this._self, this._then);

  final CategoryWatchFailed _self;
  final $Res Function(CategoryWatchFailed) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CategoryWatchFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CategoryGetByIdRequested implements CategoryEvent {
  const CategoryGetByIdRequested(this.id);

  final int id;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryGetByIdRequestedCopyWith<CategoryGetByIdRequested> get copyWith =>
      _$CategoryGetByIdRequestedCopyWithImpl<CategoryGetByIdRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryGetByIdRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CategoryEvent.getByIdRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $CategoryGetByIdRequestedCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory $CategoryGetByIdRequestedCopyWith(CategoryGetByIdRequested value,
          $Res Function(CategoryGetByIdRequested) _then) =
      _$CategoryGetByIdRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$CategoryGetByIdRequestedCopyWithImpl<$Res>
    implements $CategoryGetByIdRequestedCopyWith<$Res> {
  _$CategoryGetByIdRequestedCopyWithImpl(this._self, this._then);

  final CategoryGetByIdRequested _self;
  final $Res Function(CategoryGetByIdRequested) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(CategoryGetByIdRequested(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CategoryChildrenRequested implements CategoryEvent {
  const CategoryChildrenRequested(this.parentId);

  final int? parentId;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryChildrenRequestedCopyWith<CategoryChildrenRequested> get copyWith =>
      _$CategoryChildrenRequestedCopyWithImpl<CategoryChildrenRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryChildrenRequested &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parentId);

  @override
  String toString() {
    return 'CategoryEvent.childrenRequested(parentId: $parentId)';
  }
}

/// @nodoc
abstract mixin class $CategoryChildrenRequestedCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory $CategoryChildrenRequestedCopyWith(CategoryChildrenRequested value,
          $Res Function(CategoryChildrenRequested) _then) =
      _$CategoryChildrenRequestedCopyWithImpl;
  @useResult
  $Res call({int? parentId});
}

/// @nodoc
class _$CategoryChildrenRequestedCopyWithImpl<$Res>
    implements $CategoryChildrenRequestedCopyWith<$Res> {
  _$CategoryChildrenRequestedCopyWithImpl(this._self, this._then);

  final CategoryChildrenRequested _self;
  final $Res Function(CategoryChildrenRequested) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? parentId = freezed,
  }) {
    return _then(CategoryChildrenRequested(
      freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class CategorySearchRequested implements CategoryEvent {
  const CategorySearchRequested(this.keyword);

  final String keyword;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategorySearchRequestedCopyWith<CategorySearchRequested> get copyWith =>
      _$CategorySearchRequestedCopyWithImpl<CategorySearchRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategorySearchRequested &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @override
  String toString() {
    return 'CategoryEvent.searchRequested(keyword: $keyword)';
  }
}

/// @nodoc
abstract mixin class $CategorySearchRequestedCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory $CategorySearchRequestedCopyWith(CategorySearchRequested value,
          $Res Function(CategorySearchRequested) _then) =
      _$CategorySearchRequestedCopyWithImpl;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class _$CategorySearchRequestedCopyWithImpl<$Res>
    implements $CategorySearchRequestedCopyWith<$Res> {
  _$CategorySearchRequestedCopyWithImpl(this._self, this._then);

  final CategorySearchRequested _self;
  final $Res Function(CategorySearchRequested) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? keyword = null,
  }) {
    return _then(CategorySearchRequested(
      null == keyword
          ? _self.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CategoryActiveRequested implements CategoryEvent {
  const CategoryActiveRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryActiveRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent.activeRequested()';
  }
}

/// @nodoc

class CategoryAddRequested implements CategoryEvent {
  const CategoryAddRequested(this.category);

  final Category category;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryAddRequestedCopyWith<CategoryAddRequested> get copyWith =>
      _$CategoryAddRequestedCopyWithImpl<CategoryAddRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryAddRequested &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'CategoryEvent.addRequested(category: $category)';
  }
}

/// @nodoc
abstract mixin class $CategoryAddRequestedCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory $CategoryAddRequestedCopyWith(CategoryAddRequested value,
          $Res Function(CategoryAddRequested) _then) =
      _$CategoryAddRequestedCopyWithImpl;
  @useResult
  $Res call({Category category});
}

/// @nodoc
class _$CategoryAddRequestedCopyWithImpl<$Res>
    implements $CategoryAddRequestedCopyWith<$Res> {
  _$CategoryAddRequestedCopyWithImpl(this._self, this._then);

  final CategoryAddRequested _self;
  final $Res Function(CategoryAddRequested) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
  }) {
    return _then(CategoryAddRequested(
      null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class CategoryUpdateRequested implements CategoryEvent {
  const CategoryUpdateRequested(this.category);

  final Category category;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryUpdateRequestedCopyWith<CategoryUpdateRequested> get copyWith =>
      _$CategoryUpdateRequestedCopyWithImpl<CategoryUpdateRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryUpdateRequested &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'CategoryEvent.updateRequested(category: $category)';
  }
}

/// @nodoc
abstract mixin class $CategoryUpdateRequestedCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory $CategoryUpdateRequestedCopyWith(CategoryUpdateRequested value,
          $Res Function(CategoryUpdateRequested) _then) =
      _$CategoryUpdateRequestedCopyWithImpl;
  @useResult
  $Res call({Category category});
}

/// @nodoc
class _$CategoryUpdateRequestedCopyWithImpl<$Res>
    implements $CategoryUpdateRequestedCopyWith<$Res> {
  _$CategoryUpdateRequestedCopyWithImpl(this._self, this._then);

  final CategoryUpdateRequested _self;
  final $Res Function(CategoryUpdateRequested) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
  }) {
    return _then(CategoryUpdateRequested(
      null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class CategoryDeleteRequested implements CategoryEvent {
  const CategoryDeleteRequested(this.id);

  final int id;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryDeleteRequestedCopyWith<CategoryDeleteRequested> get copyWith =>
      _$CategoryDeleteRequestedCopyWithImpl<CategoryDeleteRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryDeleteRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CategoryEvent.deleteRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $CategoryDeleteRequestedCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory $CategoryDeleteRequestedCopyWith(CategoryDeleteRequested value,
          $Res Function(CategoryDeleteRequested) _then) =
      _$CategoryDeleteRequestedCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$CategoryDeleteRequestedCopyWithImpl<$Res>
    implements $CategoryDeleteRequestedCopyWith<$Res> {
  _$CategoryDeleteRequestedCopyWithImpl(this._self, this._then);

  final CategoryDeleteRequested _self;
  final $Res Function(CategoryDeleteRequested) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(CategoryDeleteRequested(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CategoryToggleStatusRequested implements CategoryEvent {
  const CategoryToggleStatusRequested(this.category);

  final Category category;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryToggleStatusRequestedCopyWith<CategoryToggleStatusRequested>
      get copyWith => _$CategoryToggleStatusRequestedCopyWithImpl<
          CategoryToggleStatusRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryToggleStatusRequested &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'CategoryEvent.toggleStatusRequested(category: $category)';
  }
}

/// @nodoc
abstract mixin class $CategoryToggleStatusRequestedCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory $CategoryToggleStatusRequestedCopyWith(
          CategoryToggleStatusRequested value,
          $Res Function(CategoryToggleStatusRequested) _then) =
      _$CategoryToggleStatusRequestedCopyWithImpl;
  @useResult
  $Res call({Category category});
}

/// @nodoc
class _$CategoryToggleStatusRequestedCopyWithImpl<$Res>
    implements $CategoryToggleStatusRequestedCopyWith<$Res> {
  _$CategoryToggleStatusRequestedCopyWithImpl(this._self, this._then);

  final CategoryToggleStatusRequested _self;
  final $Res Function(CategoryToggleStatusRequested) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
  }) {
    return _then(CategoryToggleStatusRequested(
      null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class CategorySelectionCleared implements CategoryEvent {
  const CategorySelectionCleared();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategorySelectionCleared);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent.selectionCleared()';
  }
}

/// @nodoc

class CategoryWatchStopped implements CategoryEvent {
  const CategoryWatchStopped();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryWatchStopped);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent.watchStopped()';
  }
}

// dart format on
