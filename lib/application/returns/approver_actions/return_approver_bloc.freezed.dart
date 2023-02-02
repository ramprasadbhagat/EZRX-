// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_approver_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnApproverEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnApproverEventCopyWith<$Res> {
  factory $ReturnApproverEventCopyWith(
          ReturnApproverEvent value, $Res Function(ReturnApproverEvent) then) =
      _$ReturnApproverEventCopyWithImpl<$Res, ReturnApproverEvent>;
}

/// @nodoc
class _$ReturnApproverEventCopyWithImpl<$Res, $Val extends ReturnApproverEvent>
    implements $ReturnApproverEventCopyWith<$Res> {
  _$ReturnApproverEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initializedCopyWith<$Res> {
  factory _$$_initializedCopyWith(
          _$_initialized value, $Res Function(_$_initialized) then) =
      __$$_initializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_initializedCopyWithImpl<$Res>
    extends _$ReturnApproverEventCopyWithImpl<$Res, _$_initialized>
    implements _$$_initializedCopyWith<$Res> {
  __$$_initializedCopyWithImpl(
      _$_initialized _value, $Res Function(_$_initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initialized implements _initialized {
  const _$_initialized();

  @override
  String toString() {
    return 'ReturnApproverEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user) fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user)? fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
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
    required TResult Function(_initialized value) initialized,
    required TResult Function(_fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements ReturnApproverEvent {
  const factory _initialized() = _$_initialized;
}

/// @nodoc
abstract class _$$_fetchCopyWith<$Res> {
  factory _$$_fetchCopyWith(_$_fetch value, $Res Function(_$_fetch) then) =
      __$$_fetchCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_fetchCopyWithImpl<$Res>
    extends _$ReturnApproverEventCopyWithImpl<$Res, _$_fetch>
    implements _$$_fetchCopyWith<$Res> {
  __$$_fetchCopyWithImpl(_$_fetch _value, $Res Function(_$_fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_fetch(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_fetch implements _fetch {
  const _$_fetch({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'ReturnApproverEvent.fetch(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_fetch &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_fetchCopyWith<_$_fetch> get copyWith =>
      __$$_fetchCopyWithImpl<_$_fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user) fetch,
  }) {
    return fetch(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user)? fetch,
  }) {
    return fetch?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _fetch implements ReturnApproverEvent {
  const factory _fetch({required final User user}) = _$_fetch;

  User get user;
  @JsonKey(ignore: true)
  _$$_fetchCopyWith<_$_fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnApproverState {
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<ApproverReturnRequest> get approverReturnRequests =>
      throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnApproverStateCopyWith<ReturnApproverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnApproverStateCopyWith<$Res> {
  factory $ReturnApproverStateCopyWith(
          ReturnApproverState value, $Res Function(ReturnApproverState) then) =
      _$ReturnApproverStateCopyWithImpl<$Res, ReturnApproverState>;
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<ApproverReturnRequest> approverReturnRequests,
      int page});
}

/// @nodoc
class _$ReturnApproverStateCopyWithImpl<$Res, $Val extends ReturnApproverState>
    implements $ReturnApproverStateCopyWith<$Res> {
  _$ReturnApproverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? approverReturnRequests = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      approverReturnRequests: null == approverReturnRequests
          ? _value.approverReturnRequests
          : approverReturnRequests // ignore: cast_nullable_to_non_nullable
              as List<ApproverReturnRequest>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnApproverStateCopyWith<$Res>
    implements $ReturnApproverStateCopyWith<$Res> {
  factory _$$_ReturnApproverStateCopyWith(_$_ReturnApproverState value,
          $Res Function(_$_ReturnApproverState) then) =
      __$$_ReturnApproverStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<ApproverReturnRequest> approverReturnRequests,
      int page});
}

/// @nodoc
class __$$_ReturnApproverStateCopyWithImpl<$Res>
    extends _$ReturnApproverStateCopyWithImpl<$Res, _$_ReturnApproverState>
    implements _$$_ReturnApproverStateCopyWith<$Res> {
  __$$_ReturnApproverStateCopyWithImpl(_$_ReturnApproverState _value,
      $Res Function(_$_ReturnApproverState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? approverReturnRequests = null,
    Object? page = null,
  }) {
    return _then(_$_ReturnApproverState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      approverReturnRequests: null == approverReturnRequests
          ? _value._approverReturnRequests
          : approverReturnRequests // ignore: cast_nullable_to_non_nullable
              as List<ApproverReturnRequest>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ReturnApproverState implements _ReturnApproverState {
  const _$_ReturnApproverState(
      {required this.isFetching,
      required this.failureOrSuccessOption,
      required final List<ApproverReturnRequest> approverReturnRequests,
      required this.page})
      : _approverReturnRequests = approverReturnRequests;

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<ApproverReturnRequest> _approverReturnRequests;
  @override
  List<ApproverReturnRequest> get approverReturnRequests {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approverReturnRequests);
  }

  @override
  final int page;

  @override
  String toString() {
    return 'ReturnApproverState(isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption, approverReturnRequests: $approverReturnRequests, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnApproverState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality().equals(
                other._approverReturnRequests, _approverReturnRequests) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_approverReturnRequests),
      page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnApproverStateCopyWith<_$_ReturnApproverState> get copyWith =>
      __$$_ReturnApproverStateCopyWithImpl<_$_ReturnApproverState>(
          this, _$identity);
}

abstract class _ReturnApproverState implements ReturnApproverState {
  const factory _ReturnApproverState(
      {required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<ApproverReturnRequest> approverReturnRequests,
      required final int page}) = _$_ReturnApproverState;

  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<ApproverReturnRequest> get approverReturnRequests;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnApproverStateCopyWith<_$_ReturnApproverState> get copyWith =>
      throw _privateConstructorUsedError;
}
