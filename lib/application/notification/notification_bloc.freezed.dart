// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() deleteAllNotifications,
    required TResult Function(int notificationId) readNotifications,
    required TResult Function() loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? deleteAllNotifications,
    TResult? Function(int notificationId)? readNotifications,
    TResult? Function()? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? deleteAllNotifications,
    TResult Function(int notificationId)? readNotifications,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DeleteAllNotifications value)
        deleteAllNotifications,
    required TResult Function(_ReadNotifications value) readNotifications,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult? Function(_ReadNotifications value)? readNotifications,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult Function(_ReadNotifications value)? readNotifications,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'NotificationEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() deleteAllNotifications,
    required TResult Function(int notificationId) readNotifications,
    required TResult Function() loadMore,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? deleteAllNotifications,
    TResult? Function(int notificationId)? readNotifications,
    TResult? Function()? loadMore,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? deleteAllNotifications,
    TResult Function(int notificationId)? readNotifications,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DeleteAllNotifications value)
        deleteAllNotifications,
    required TResult Function(_ReadNotifications value) readNotifications,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult? Function(_ReadNotifications value)? readNotifications,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult Function(_ReadNotifications value)? readNotifications,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements NotificationEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'NotificationEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() deleteAllNotifications,
    required TResult Function(int notificationId) readNotifications,
    required TResult Function() loadMore,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? deleteAllNotifications,
    TResult? Function(int notificationId)? readNotifications,
    TResult? Function()? loadMore,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? deleteAllNotifications,
    TResult Function(int notificationId)? readNotifications,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DeleteAllNotifications value)
        deleteAllNotifications,
    required TResult Function(_ReadNotifications value) readNotifications,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult? Function(_ReadNotifications value)? readNotifications,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult Function(_ReadNotifications value)? readNotifications,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements NotificationEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
abstract class _$$_DeleteAllNotificationsCopyWith<$Res> {
  factory _$$_DeleteAllNotificationsCopyWith(_$_DeleteAllNotifications value,
          $Res Function(_$_DeleteAllNotifications) then) =
      __$$_DeleteAllNotificationsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteAllNotificationsCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$_DeleteAllNotifications>
    implements _$$_DeleteAllNotificationsCopyWith<$Res> {
  __$$_DeleteAllNotificationsCopyWithImpl(_$_DeleteAllNotifications _value,
      $Res Function(_$_DeleteAllNotifications) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteAllNotifications implements _DeleteAllNotifications {
  const _$_DeleteAllNotifications();

  @override
  String toString() {
    return 'NotificationEvent.deleteAllNotifications()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteAllNotifications);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() deleteAllNotifications,
    required TResult Function(int notificationId) readNotifications,
    required TResult Function() loadMore,
  }) {
    return deleteAllNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? deleteAllNotifications,
    TResult? Function(int notificationId)? readNotifications,
    TResult? Function()? loadMore,
  }) {
    return deleteAllNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? deleteAllNotifications,
    TResult Function(int notificationId)? readNotifications,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (deleteAllNotifications != null) {
      return deleteAllNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DeleteAllNotifications value)
        deleteAllNotifications,
    required TResult Function(_ReadNotifications value) readNotifications,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return deleteAllNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult? Function(_ReadNotifications value)? readNotifications,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return deleteAllNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult Function(_ReadNotifications value)? readNotifications,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (deleteAllNotifications != null) {
      return deleteAllNotifications(this);
    }
    return orElse();
  }
}

abstract class _DeleteAllNotifications implements NotificationEvent {
  const factory _DeleteAllNotifications() = _$_DeleteAllNotifications;
}

/// @nodoc
abstract class _$$_ReadNotificationsCopyWith<$Res> {
  factory _$$_ReadNotificationsCopyWith(_$_ReadNotifications value,
          $Res Function(_$_ReadNotifications) then) =
      __$$_ReadNotificationsCopyWithImpl<$Res>;
  @useResult
  $Res call({int notificationId});
}

/// @nodoc
class __$$_ReadNotificationsCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$_ReadNotifications>
    implements _$$_ReadNotificationsCopyWith<$Res> {
  __$$_ReadNotificationsCopyWithImpl(
      _$_ReadNotifications _value, $Res Function(_$_ReadNotifications) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
  }) {
    return _then(_$_ReadNotifications(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ReadNotifications implements _ReadNotifications {
  const _$_ReadNotifications({required this.notificationId});

  @override
  final int notificationId;

  @override
  String toString() {
    return 'NotificationEvent.readNotifications(notificationId: $notificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadNotifications &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadNotificationsCopyWith<_$_ReadNotifications> get copyWith =>
      __$$_ReadNotificationsCopyWithImpl<_$_ReadNotifications>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() deleteAllNotifications,
    required TResult Function(int notificationId) readNotifications,
    required TResult Function() loadMore,
  }) {
    return readNotifications(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? deleteAllNotifications,
    TResult? Function(int notificationId)? readNotifications,
    TResult? Function()? loadMore,
  }) {
    return readNotifications?.call(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? deleteAllNotifications,
    TResult Function(int notificationId)? readNotifications,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (readNotifications != null) {
      return readNotifications(notificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DeleteAllNotifications value)
        deleteAllNotifications,
    required TResult Function(_ReadNotifications value) readNotifications,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return readNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult? Function(_ReadNotifications value)? readNotifications,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return readNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult Function(_ReadNotifications value)? readNotifications,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (readNotifications != null) {
      return readNotifications(this);
    }
    return orElse();
  }
}

abstract class _ReadNotifications implements NotificationEvent {
  const factory _ReadNotifications({required final int notificationId}) =
      _$_ReadNotifications;

  int get notificationId;
  @JsonKey(ignore: true)
  _$$_ReadNotificationsCopyWith<_$_ReadNotifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore();

  @override
  String toString() {
    return 'NotificationEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() deleteAllNotifications,
    required TResult Function(int notificationId) readNotifications,
    required TResult Function() loadMore,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? deleteAllNotifications,
    TResult? Function(int notificationId)? readNotifications,
    TResult? Function()? loadMore,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? deleteAllNotifications,
    TResult Function(int notificationId)? readNotifications,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DeleteAllNotifications value)
        deleteAllNotifications,
    required TResult Function(_ReadNotifications value) readNotifications,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult? Function(_ReadNotifications value)? readNotifications,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteAllNotifications value)? deleteAllNotifications,
    TResult Function(_ReadNotifications value)? readNotifications,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements NotificationEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
mixin _$NotificationState {
  Notifications get notificationList => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  int get nextPageIndex => throw _privateConstructorUsedError;
  bool get isDeletedAllSuccess => throw _privateConstructorUsedError;
  bool get isReadNotification => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get notificationFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {Notifications notificationList,
      bool isFetching,
      bool canLoadMore,
      int nextPageIndex,
      bool isDeletedAllSuccess,
      bool isReadNotification,
      Option<Either<ApiFailure, dynamic>> notificationFailureOrSuccessOption});

  $NotificationsCopyWith<$Res> get notificationList;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationList = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? nextPageIndex = null,
    Object? isDeletedAllSuccess = null,
    Object? isReadNotification = null,
    Object? notificationFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      notificationList: null == notificationList
          ? _value.notificationList
          : notificationList // ignore: cast_nullable_to_non_nullable
              as Notifications,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isDeletedAllSuccess: null == isDeletedAllSuccess
          ? _value.isDeletedAllSuccess
          : isDeletedAllSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadNotification: null == isReadNotification
          ? _value.isReadNotification
          : isReadNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationFailureOrSuccessOption: null ==
              notificationFailureOrSuccessOption
          ? _value.notificationFailureOrSuccessOption
          : notificationFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationsCopyWith<$Res> get notificationList {
    return $NotificationsCopyWith<$Res>(_value.notificationList, (value) {
      return _then(_value.copyWith(notificationList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationStateCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$_NotificationStateCopyWith(_$_NotificationState value,
          $Res Function(_$_NotificationState) then) =
      __$$_NotificationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Notifications notificationList,
      bool isFetching,
      bool canLoadMore,
      int nextPageIndex,
      bool isDeletedAllSuccess,
      bool isReadNotification,
      Option<Either<ApiFailure, dynamic>> notificationFailureOrSuccessOption});

  @override
  $NotificationsCopyWith<$Res> get notificationList;
}

/// @nodoc
class __$$_NotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$_NotificationState>
    implements _$$_NotificationStateCopyWith<$Res> {
  __$$_NotificationStateCopyWithImpl(
      _$_NotificationState _value, $Res Function(_$_NotificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationList = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? nextPageIndex = null,
    Object? isDeletedAllSuccess = null,
    Object? isReadNotification = null,
    Object? notificationFailureOrSuccessOption = null,
  }) {
    return _then(_$_NotificationState(
      notificationList: null == notificationList
          ? _value.notificationList
          : notificationList // ignore: cast_nullable_to_non_nullable
              as Notifications,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isDeletedAllSuccess: null == isDeletedAllSuccess
          ? _value.isDeletedAllSuccess
          : isDeletedAllSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadNotification: null == isReadNotification
          ? _value.isReadNotification
          : isReadNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationFailureOrSuccessOption: null ==
              notificationFailureOrSuccessOption
          ? _value.notificationFailureOrSuccessOption
          : notificationFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_NotificationState implements _NotificationState {
  const _$_NotificationState(
      {required this.notificationList,
      required this.isFetching,
      required this.canLoadMore,
      required this.nextPageIndex,
      required this.isDeletedAllSuccess,
      required this.isReadNotification,
      required this.notificationFailureOrSuccessOption});

  @override
  final Notifications notificationList;
  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final int nextPageIndex;
  @override
  final bool isDeletedAllSuccess;
  @override
  final bool isReadNotification;
  @override
  final Option<Either<ApiFailure, dynamic>> notificationFailureOrSuccessOption;

  @override
  String toString() {
    return 'NotificationState(notificationList: $notificationList, isFetching: $isFetching, canLoadMore: $canLoadMore, nextPageIndex: $nextPageIndex, isDeletedAllSuccess: $isDeletedAllSuccess, isReadNotification: $isReadNotification, notificationFailureOrSuccessOption: $notificationFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationState &&
            (identical(other.notificationList, notificationList) ||
                other.notificationList == notificationList) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.nextPageIndex, nextPageIndex) ||
                other.nextPageIndex == nextPageIndex) &&
            (identical(other.isDeletedAllSuccess, isDeletedAllSuccess) ||
                other.isDeletedAllSuccess == isDeletedAllSuccess) &&
            (identical(other.isReadNotification, isReadNotification) ||
                other.isReadNotification == isReadNotification) &&
            (identical(other.notificationFailureOrSuccessOption,
                    notificationFailureOrSuccessOption) ||
                other.notificationFailureOrSuccessOption ==
                    notificationFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationList,
      isFetching,
      canLoadMore,
      nextPageIndex,
      isDeletedAllSuccess,
      isReadNotification,
      notificationFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationStateCopyWith<_$_NotificationState> get copyWith =>
      __$$_NotificationStateCopyWithImpl<_$_NotificationState>(
          this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
      {required final Notifications notificationList,
      required final bool isFetching,
      required final bool canLoadMore,
      required final int nextPageIndex,
      required final bool isDeletedAllSuccess,
      required final bool isReadNotification,
      required final Option<Either<ApiFailure, dynamic>>
          notificationFailureOrSuccessOption}) = _$_NotificationState;

  @override
  Notifications get notificationList;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  int get nextPageIndex;
  @override
  bool get isDeletedAllSuccess;
  @override
  bool get isReadNotification;
  @override
  Option<Either<ApiFailure, dynamic>> get notificationFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationStateCopyWith<_$_NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}
