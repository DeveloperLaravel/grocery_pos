// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackupEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BackupEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupEvent()';
  }
}

/// @nodoc
class $BackupEventCopyWith<$Res> {
  $BackupEventCopyWith(BackupEvent _, $Res Function(BackupEvent) __);
}

/// Adds pattern-matching-related methods to [BackupEvent].
extension BackupEventPatterns on BackupEvent {
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
    TResult Function(BackupStarted value)? started,
    TResult Function(BackupConnectRequested value)? connectRequested,
    TResult Function(BackupDisconnectRequested value)? disconnectRequested,
    TResult Function(BackupRefreshRequested value)? refreshRequested,
    TResult Function(BackupCreateRequested value)? createRequested,
    TResult Function(BackupRestoreRequested value)? restoreRequested,
    TResult Function(BackupDeleteRequested value)? deleteRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BackupStarted() when started != null:
        return started(_that);
      case BackupConnectRequested() when connectRequested != null:
        return connectRequested(_that);
      case BackupDisconnectRequested() when disconnectRequested != null:
        return disconnectRequested(_that);
      case BackupRefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
      case BackupCreateRequested() when createRequested != null:
        return createRequested(_that);
      case BackupRestoreRequested() when restoreRequested != null:
        return restoreRequested(_that);
      case BackupDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that);
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
    required TResult Function(BackupStarted value) started,
    required TResult Function(BackupConnectRequested value) connectRequested,
    required TResult Function(BackupDisconnectRequested value)
        disconnectRequested,
    required TResult Function(BackupRefreshRequested value) refreshRequested,
    required TResult Function(BackupCreateRequested value) createRequested,
    required TResult Function(BackupRestoreRequested value) restoreRequested,
    required TResult Function(BackupDeleteRequested value) deleteRequested,
  }) {
    final _that = this;
    switch (_that) {
      case BackupStarted():
        return started(_that);
      case BackupConnectRequested():
        return connectRequested(_that);
      case BackupDisconnectRequested():
        return disconnectRequested(_that);
      case BackupRefreshRequested():
        return refreshRequested(_that);
      case BackupCreateRequested():
        return createRequested(_that);
      case BackupRestoreRequested():
        return restoreRequested(_that);
      case BackupDeleteRequested():
        return deleteRequested(_that);
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
    TResult? Function(BackupStarted value)? started,
    TResult? Function(BackupConnectRequested value)? connectRequested,
    TResult? Function(BackupDisconnectRequested value)? disconnectRequested,
    TResult? Function(BackupRefreshRequested value)? refreshRequested,
    TResult? Function(BackupCreateRequested value)? createRequested,
    TResult? Function(BackupRestoreRequested value)? restoreRequested,
    TResult? Function(BackupDeleteRequested value)? deleteRequested,
  }) {
    final _that = this;
    switch (_that) {
      case BackupStarted() when started != null:
        return started(_that);
      case BackupConnectRequested() when connectRequested != null:
        return connectRequested(_that);
      case BackupDisconnectRequested() when disconnectRequested != null:
        return disconnectRequested(_that);
      case BackupRefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
      case BackupCreateRequested() when createRequested != null:
        return createRequested(_that);
      case BackupRestoreRequested() when restoreRequested != null:
        return restoreRequested(_that);
      case BackupDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that);
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
    TResult Function()? started,
    TResult Function()? connectRequested,
    TResult Function()? disconnectRequested,
    TResult Function()? refreshRequested,
    TResult Function()? createRequested,
    TResult Function(String id)? restoreRequested,
    TResult Function(String id)? deleteRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BackupStarted() when started != null:
        return started();
      case BackupConnectRequested() when connectRequested != null:
        return connectRequested();
      case BackupDisconnectRequested() when disconnectRequested != null:
        return disconnectRequested();
      case BackupRefreshRequested() when refreshRequested != null:
        return refreshRequested();
      case BackupCreateRequested() when createRequested != null:
        return createRequested();
      case BackupRestoreRequested() when restoreRequested != null:
        return restoreRequested(_that.id);
      case BackupDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that.id);
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
    required TResult Function() started,
    required TResult Function() connectRequested,
    required TResult Function() disconnectRequested,
    required TResult Function() refreshRequested,
    required TResult Function() createRequested,
    required TResult Function(String id) restoreRequested,
    required TResult Function(String id) deleteRequested,
  }) {
    final _that = this;
    switch (_that) {
      case BackupStarted():
        return started();
      case BackupConnectRequested():
        return connectRequested();
      case BackupDisconnectRequested():
        return disconnectRequested();
      case BackupRefreshRequested():
        return refreshRequested();
      case BackupCreateRequested():
        return createRequested();
      case BackupRestoreRequested():
        return restoreRequested(_that.id);
      case BackupDeleteRequested():
        return deleteRequested(_that.id);
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
    TResult? Function()? started,
    TResult? Function()? connectRequested,
    TResult? Function()? disconnectRequested,
    TResult? Function()? refreshRequested,
    TResult? Function()? createRequested,
    TResult? Function(String id)? restoreRequested,
    TResult? Function(String id)? deleteRequested,
  }) {
    final _that = this;
    switch (_that) {
      case BackupStarted() when started != null:
        return started();
      case BackupConnectRequested() when connectRequested != null:
        return connectRequested();
      case BackupDisconnectRequested() when disconnectRequested != null:
        return disconnectRequested();
      case BackupRefreshRequested() when refreshRequested != null:
        return refreshRequested();
      case BackupCreateRequested() when createRequested != null:
        return createRequested();
      case BackupRestoreRequested() when restoreRequested != null:
        return restoreRequested(_that.id);
      case BackupDeleteRequested() when deleteRequested != null:
        return deleteRequested(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

class BackupStarted implements BackupEvent {
  const BackupStarted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BackupStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupEvent.started()';
  }
}

/// @nodoc

class BackupConnectRequested implements BackupEvent {
  const BackupConnectRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BackupConnectRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupEvent.connectRequested()';
  }
}

/// @nodoc

class BackupDisconnectRequested implements BackupEvent {
  const BackupDisconnectRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupDisconnectRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupEvent.disconnectRequested()';
  }
}

/// @nodoc

class BackupRefreshRequested implements BackupEvent {
  const BackupRefreshRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BackupRefreshRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupEvent.refreshRequested()';
  }
}

/// @nodoc

class BackupCreateRequested implements BackupEvent {
  const BackupCreateRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BackupCreateRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupEvent.createRequested()';
  }
}

/// @nodoc

class BackupRestoreRequested implements BackupEvent {
  const BackupRestoreRequested(this.id);

  final String id;

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BackupRestoreRequestedCopyWith<BackupRestoreRequested> get copyWith =>
      _$BackupRestoreRequestedCopyWithImpl<BackupRestoreRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupRestoreRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'BackupEvent.restoreRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $BackupRestoreRequestedCopyWith<$Res>
    implements $BackupEventCopyWith<$Res> {
  factory $BackupRestoreRequestedCopyWith(BackupRestoreRequested value,
          $Res Function(BackupRestoreRequested) _then) =
      _$BackupRestoreRequestedCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$BackupRestoreRequestedCopyWithImpl<$Res>
    implements $BackupRestoreRequestedCopyWith<$Res> {
  _$BackupRestoreRequestedCopyWithImpl(this._self, this._then);

  final BackupRestoreRequested _self;
  final $Res Function(BackupRestoreRequested) _then;

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(BackupRestoreRequested(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class BackupDeleteRequested implements BackupEvent {
  const BackupDeleteRequested(this.id);

  final String id;

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BackupDeleteRequestedCopyWith<BackupDeleteRequested> get copyWith =>
      _$BackupDeleteRequestedCopyWithImpl<BackupDeleteRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupDeleteRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'BackupEvent.deleteRequested(id: $id)';
  }
}

/// @nodoc
abstract mixin class $BackupDeleteRequestedCopyWith<$Res>
    implements $BackupEventCopyWith<$Res> {
  factory $BackupDeleteRequestedCopyWith(BackupDeleteRequested value,
          $Res Function(BackupDeleteRequested) _then) =
      _$BackupDeleteRequestedCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$BackupDeleteRequestedCopyWithImpl<$Res>
    implements $BackupDeleteRequestedCopyWith<$Res> {
  _$BackupDeleteRequestedCopyWithImpl(this._self, this._then);

  final BackupDeleteRequested _self;
  final $Res Function(BackupDeleteRequested) _then;

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(BackupDeleteRequested(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
