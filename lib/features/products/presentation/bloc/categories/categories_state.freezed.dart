// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesState {
// حالة تحميل البيانات
  CategoriesStatus get status; // جميع التصنيفات القادمة من قاعدة البيانات
  List<Category> get allCategories; // التصنيفات المعروضة بعد تطبيق البحث
  List<Category> get categories; // التصنيفات الرئيسية
  List<Category> get rootCategories; // التصنيفات الفرعية للأب المحدد
  List<Category> get childCategories; // التصنيف الأب المحدد حالياً
  int? get selectedParentId; // نص البحث
  String get searchQuery; // حالة تنفيذ عمليات الإضافة والتعديل والحذف
  bool get isOperationInProgress; // هل Stream المراقبة يعمل؟
  bool get isWatching; // رسالة الخطأ
  String? get errorMessage; // رسالة النجاح
  String? get successMessage; // آخر تصنيف تم تنفيذ عملية عليه
  int? get lastAffectedCategoryId;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesStateCopyWith<CategoriesState> get copyWith =>
      _$CategoriesStateCopyWithImpl<CategoriesState>(
          this as CategoriesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.allCategories, allCategories) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.rootCategories, rootCategories) &&
            const DeepCollectionEquality()
                .equals(other.childCategories, childCategories) &&
            (identical(other.selectedParentId, selectedParentId) ||
                other.selectedParentId == selectedParentId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isOperationInProgress, isOperationInProgress) ||
                other.isOperationInProgress == isOperationInProgress) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.lastAffectedCategoryId, lastAffectedCategoryId) ||
                other.lastAffectedCategoryId == lastAffectedCategoryId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(allCategories),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(rootCategories),
      const DeepCollectionEquality().hash(childCategories),
      selectedParentId,
      searchQuery,
      isOperationInProgress,
      isWatching,
      errorMessage,
      successMessage,
      lastAffectedCategoryId);

  @override
  String toString() {
    return 'CategoriesState(status: $status, allCategories: $allCategories, categories: $categories, rootCategories: $rootCategories, childCategories: $childCategories, selectedParentId: $selectedParentId, searchQuery: $searchQuery, isOperationInProgress: $isOperationInProgress, isWatching: $isWatching, errorMessage: $errorMessage, successMessage: $successMessage, lastAffectedCategoryId: $lastAffectedCategoryId)';
  }
}

/// @nodoc
abstract mixin class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) _then) =
      _$CategoriesStateCopyWithImpl;
  @useResult
  $Res call(
      {CategoriesStatus status,
      List<Category> allCategories,
      List<Category> categories,
      List<Category> rootCategories,
      List<Category> childCategories,
      int? selectedParentId,
      String searchQuery,
      bool isOperationInProgress,
      bool isWatching,
      String? errorMessage,
      String? successMessage,
      int? lastAffectedCategoryId});
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._self, this._then);

  final CategoriesState _self;
  final $Res Function(CategoriesState) _then;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? allCategories = null,
    Object? categories = null,
    Object? rootCategories = null,
    Object? childCategories = null,
    Object? selectedParentId = freezed,
    Object? searchQuery = null,
    Object? isOperationInProgress = null,
    Object? isWatching = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? lastAffectedCategoryId = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CategoriesStatus,
      allCategories: null == allCategories
          ? _self.allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      rootCategories: null == rootCategories
          ? _self.rootCategories
          : rootCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      childCategories: null == childCategories
          ? _self.childCategories
          : childCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedParentId: freezed == selectedParentId
          ? _self.selectedParentId
          : selectedParentId // ignore: cast_nullable_to_non_nullable
              as int?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isOperationInProgress: null == isOperationInProgress
          ? _self.isOperationInProgress
          : isOperationInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastAffectedCategoryId: freezed == lastAffectedCategoryId
          ? _self.lastAffectedCategoryId
          : lastAffectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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
    TResult Function(_CategoriesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoriesState() when $default != null:
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
    TResult Function(_CategoriesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesState():
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
    TResult? Function(_CategoriesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesState() when $default != null:
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
            CategoriesStatus status,
            List<Category> allCategories,
            List<Category> categories,
            List<Category> rootCategories,
            List<Category> childCategories,
            int? selectedParentId,
            String searchQuery,
            bool isOperationInProgress,
            bool isWatching,
            String? errorMessage,
            String? successMessage,
            int? lastAffectedCategoryId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoriesState() when $default != null:
        return $default(
            _that.status,
            _that.allCategories,
            _that.categories,
            _that.rootCategories,
            _that.childCategories,
            _that.selectedParentId,
            _that.searchQuery,
            _that.isOperationInProgress,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage,
            _that.lastAffectedCategoryId);
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
            CategoriesStatus status,
            List<Category> allCategories,
            List<Category> categories,
            List<Category> rootCategories,
            List<Category> childCategories,
            int? selectedParentId,
            String searchQuery,
            bool isOperationInProgress,
            bool isWatching,
            String? errorMessage,
            String? successMessage,
            int? lastAffectedCategoryId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesState():
        return $default(
            _that.status,
            _that.allCategories,
            _that.categories,
            _that.rootCategories,
            _that.childCategories,
            _that.selectedParentId,
            _that.searchQuery,
            _that.isOperationInProgress,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage,
            _that.lastAffectedCategoryId);
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
            CategoriesStatus status,
            List<Category> allCategories,
            List<Category> categories,
            List<Category> rootCategories,
            List<Category> childCategories,
            int? selectedParentId,
            String searchQuery,
            bool isOperationInProgress,
            bool isWatching,
            String? errorMessage,
            String? successMessage,
            int? lastAffectedCategoryId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesState() when $default != null:
        return $default(
            _that.status,
            _that.allCategories,
            _that.categories,
            _that.rootCategories,
            _that.childCategories,
            _that.selectedParentId,
            _that.searchQuery,
            _that.isOperationInProgress,
            _that.isWatching,
            _that.errorMessage,
            _that.successMessage,
            _that.lastAffectedCategoryId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoriesState extends CategoriesState {
  const _CategoriesState(
      {this.status = CategoriesStatus.initial,
      final List<Category> allCategories = const <Category>[],
      final List<Category> categories = const <Category>[],
      final List<Category> rootCategories = const <Category>[],
      final List<Category> childCategories = const <Category>[],
      this.selectedParentId,
      this.searchQuery = '',
      this.isOperationInProgress = false,
      this.isWatching = false,
      this.errorMessage,
      this.successMessage,
      this.lastAffectedCategoryId})
      : _allCategories = allCategories,
        _categories = categories,
        _rootCategories = rootCategories,
        _childCategories = childCategories,
        super._();

// حالة تحميل البيانات
  @override
  @JsonKey()
  final CategoriesStatus status;
// جميع التصنيفات القادمة من قاعدة البيانات
  final List<Category> _allCategories;
// جميع التصنيفات القادمة من قاعدة البيانات
  @override
  @JsonKey()
  List<Category> get allCategories {
    if (_allCategories is EqualUnmodifiableListView) return _allCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCategories);
  }

// التصنيفات المعروضة بعد تطبيق البحث
  final List<Category> _categories;
// التصنيفات المعروضة بعد تطبيق البحث
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

// التصنيفات الرئيسية
  final List<Category> _rootCategories;
// التصنيفات الرئيسية
  @override
  @JsonKey()
  List<Category> get rootCategories {
    if (_rootCategories is EqualUnmodifiableListView) return _rootCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rootCategories);
  }

// التصنيفات الفرعية للأب المحدد
  final List<Category> _childCategories;
// التصنيفات الفرعية للأب المحدد
  @override
  @JsonKey()
  List<Category> get childCategories {
    if (_childCategories is EqualUnmodifiableListView) return _childCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_childCategories);
  }

// التصنيف الأب المحدد حالياً
  @override
  final int? selectedParentId;
// نص البحث
  @override
  @JsonKey()
  final String searchQuery;
// حالة تنفيذ عمليات الإضافة والتعديل والحذف
  @override
  @JsonKey()
  final bool isOperationInProgress;
// هل Stream المراقبة يعمل؟
  @override
  @JsonKey()
  final bool isWatching;
// رسالة الخطأ
  @override
  final String? errorMessage;
// رسالة النجاح
  @override
  final String? successMessage;
// آخر تصنيف تم تنفيذ عملية عليه
  @override
  final int? lastAffectedCategoryId;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoriesStateCopyWith<_CategoriesState> get copyWith =>
      __$CategoriesStateCopyWithImpl<_CategoriesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoriesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._allCategories, _allCategories) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._rootCategories, _rootCategories) &&
            const DeepCollectionEquality()
                .equals(other._childCategories, _childCategories) &&
            (identical(other.selectedParentId, selectedParentId) ||
                other.selectedParentId == selectedParentId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isOperationInProgress, isOperationInProgress) ||
                other.isOperationInProgress == isOperationInProgress) &&
            (identical(other.isWatching, isWatching) ||
                other.isWatching == isWatching) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.lastAffectedCategoryId, lastAffectedCategoryId) ||
                other.lastAffectedCategoryId == lastAffectedCategoryId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_allCategories),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_rootCategories),
      const DeepCollectionEquality().hash(_childCategories),
      selectedParentId,
      searchQuery,
      isOperationInProgress,
      isWatching,
      errorMessage,
      successMessage,
      lastAffectedCategoryId);

  @override
  String toString() {
    return 'CategoriesState(status: $status, allCategories: $allCategories, categories: $categories, rootCategories: $rootCategories, childCategories: $childCategories, selectedParentId: $selectedParentId, searchQuery: $searchQuery, isOperationInProgress: $isOperationInProgress, isWatching: $isWatching, errorMessage: $errorMessage, successMessage: $successMessage, lastAffectedCategoryId: $lastAffectedCategoryId)';
  }
}

/// @nodoc
abstract mixin class _$CategoriesStateCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$CategoriesStateCopyWith(
          _CategoriesState value, $Res Function(_CategoriesState) _then) =
      __$CategoriesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CategoriesStatus status,
      List<Category> allCategories,
      List<Category> categories,
      List<Category> rootCategories,
      List<Category> childCategories,
      int? selectedParentId,
      String searchQuery,
      bool isOperationInProgress,
      bool isWatching,
      String? errorMessage,
      String? successMessage,
      int? lastAffectedCategoryId});
}

/// @nodoc
class __$CategoriesStateCopyWithImpl<$Res>
    implements _$CategoriesStateCopyWith<$Res> {
  __$CategoriesStateCopyWithImpl(this._self, this._then);

  final _CategoriesState _self;
  final $Res Function(_CategoriesState) _then;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? allCategories = null,
    Object? categories = null,
    Object? rootCategories = null,
    Object? childCategories = null,
    Object? selectedParentId = freezed,
    Object? searchQuery = null,
    Object? isOperationInProgress = null,
    Object? isWatching = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? lastAffectedCategoryId = freezed,
  }) {
    return _then(_CategoriesState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CategoriesStatus,
      allCategories: null == allCategories
          ? _self._allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      rootCategories: null == rootCategories
          ? _self._rootCategories
          : rootCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      childCategories: null == childCategories
          ? _self._childCategories
          : childCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedParentId: freezed == selectedParentId
          ? _self.selectedParentId
          : selectedParentId // ignore: cast_nullable_to_non_nullable
              as int?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isOperationInProgress: null == isOperationInProgress
          ? _self.isOperationInProgress
          : isOperationInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatching: null == isWatching
          ? _self.isWatching
          : isWatching // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastAffectedCategoryId: freezed == lastAffectedCategoryId
          ? _self.lastAffectedCategoryId
          : lastAffectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
