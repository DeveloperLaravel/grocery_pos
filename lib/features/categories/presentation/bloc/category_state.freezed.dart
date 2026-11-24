// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryState {
  CategoryStatus get status;
  List<Category> get categories;
  List<Category> get children;
  List<Category> get searchResults;
  List<Category> get activeCategories;
  Category? get selectedCategory;
  bool get isSaving;
  bool get isDeleting;
  String? get errorMessage;
  String? get successMessage;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      _$CategoryStateCopyWithImpl<CategoryState>(
          this as CategoryState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.children, children) &&
            const DeepCollectionEquality()
                .equals(other.searchResults, searchResults) &&
            const DeepCollectionEquality()
                .equals(other.activeCategories, activeCategories) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(children),
      const DeepCollectionEquality().hash(searchResults),
      const DeepCollectionEquality().hash(activeCategories),
      selectedCategory,
      isSaving,
      isDeleting,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'CategoryState(status: $status, categories: $categories, children: $children, searchResults: $searchResults, activeCategories: $activeCategories, selectedCategory: $selectedCategory, isSaving: $isSaving, isDeleting: $isDeleting, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) _then) =
      _$CategoryStateCopyWithImpl;
  @useResult
  $Res call(
      {CategoryStatus status,
      List<Category> categories,
      List<Category> children,
      List<Category> searchResults,
      List<Category> activeCategories,
      Category? selectedCategory,
      bool isSaving,
      bool isDeleting,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._self, this._then);

  final CategoryState _self;
  final $Res Function(CategoryState) _then;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categories = null,
    Object? children = null,
    Object? searchResults = null,
    Object? activeCategories = null,
    Object? selectedCategory = freezed,
    Object? isSaving = null,
    Object? isDeleting = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CategoryStatus,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      children: null == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      searchResults: null == searchResults
          ? _self.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      activeCategories: null == activeCategories
          ? _self.activeCategories
          : activeCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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
    TResult Function(_CategoryState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryState() when $default != null:
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
    TResult Function(_CategoryState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryState():
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
    TResult? Function(_CategoryState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryState() when $default != null:
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
            CategoryStatus status,
            List<Category> categories,
            List<Category> children,
            List<Category> searchResults,
            List<Category> activeCategories,
            Category? selectedCategory,
            bool isSaving,
            bool isDeleting,
            String? errorMessage,
            String? successMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryState() when $default != null:
        return $default(
            _that.status,
            _that.categories,
            _that.children,
            _that.searchResults,
            _that.activeCategories,
            _that.selectedCategory,
            _that.isSaving,
            _that.isDeleting,
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
            CategoryStatus status,
            List<Category> categories,
            List<Category> children,
            List<Category> searchResults,
            List<Category> activeCategories,
            Category? selectedCategory,
            bool isSaving,
            bool isDeleting,
            String? errorMessage,
            String? successMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryState():
        return $default(
            _that.status,
            _that.categories,
            _that.children,
            _that.searchResults,
            _that.activeCategories,
            _that.selectedCategory,
            _that.isSaving,
            _that.isDeleting,
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
            CategoryStatus status,
            List<Category> categories,
            List<Category> children,
            List<Category> searchResults,
            List<Category> activeCategories,
            Category? selectedCategory,
            bool isSaving,
            bool isDeleting,
            String? errorMessage,
            String? successMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryState() when $default != null:
        return $default(
            _that.status,
            _that.categories,
            _that.children,
            _that.searchResults,
            _that.activeCategories,
            _that.selectedCategory,
            _that.isSaving,
            _that.isDeleting,
            _that.errorMessage,
            _that.successMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryState implements CategoryState {
  const _CategoryState(
      {this.status = CategoryStatus.initial,
      final List<Category> categories = const [],
      final List<Category> children = const [],
      final List<Category> searchResults = const [],
      final List<Category> activeCategories = const [],
      this.selectedCategory,
      this.isSaving = false,
      this.isDeleting = false,
      this.errorMessage,
      this.successMessage})
      : _categories = categories,
        _children = children,
        _searchResults = searchResults,
        _activeCategories = activeCategories;

  @override
  @JsonKey()
  final CategoryStatus status;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Category> _children;
  @override
  @JsonKey()
  List<Category> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  final List<Category> _searchResults;
  @override
  @JsonKey()
  List<Category> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  final List<Category> _activeCategories;
  @override
  @JsonKey()
  List<Category> get activeCategories {
    if (_activeCategories is EqualUnmodifiableListView)
      return _activeCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeCategories);
  }

  @override
  final Category? selectedCategory;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryStateCopyWith<_CategoryState> get copyWith =>
      __$CategoryStateCopyWithImpl<_CategoryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            const DeepCollectionEquality()
                .equals(other._activeCategories, _activeCategories) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_children),
      const DeepCollectionEquality().hash(_searchResults),
      const DeepCollectionEquality().hash(_activeCategories),
      selectedCategory,
      isSaving,
      isDeleting,
      errorMessage,
      successMessage);

  @override
  String toString() {
    return 'CategoryState(status: $status, categories: $categories, children: $children, searchResults: $searchResults, activeCategories: $activeCategories, selectedCategory: $selectedCategory, isSaving: $isSaving, isDeleting: $isDeleting, errorMessage: $errorMessage, successMessage: $successMessage)';
  }
}

/// @nodoc
abstract mixin class _$CategoryStateCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$CategoryStateCopyWith(
          _CategoryState value, $Res Function(_CategoryState) _then) =
      __$CategoryStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CategoryStatus status,
      List<Category> categories,
      List<Category> children,
      List<Category> searchResults,
      List<Category> activeCategories,
      Category? selectedCategory,
      bool isSaving,
      bool isDeleting,
      String? errorMessage,
      String? successMessage});
}

/// @nodoc
class __$CategoryStateCopyWithImpl<$Res>
    implements _$CategoryStateCopyWith<$Res> {
  __$CategoryStateCopyWithImpl(this._self, this._then);

  final _CategoryState _self;
  final $Res Function(_CategoryState) _then;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? categories = null,
    Object? children = null,
    Object? searchResults = null,
    Object? activeCategories = null,
    Object? selectedCategory = freezed,
    Object? isSaving = null,
    Object? isDeleting = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_CategoryState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CategoryStatus,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      children: null == children
          ? _self._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      searchResults: null == searchResults
          ? _self._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      activeCategories: null == activeCategories
          ? _self._activeCategories
          : activeCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
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
