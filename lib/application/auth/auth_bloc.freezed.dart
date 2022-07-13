// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() authCheck,
    required TResult Function() refreshOktaToken,
    required TResult Function(JWT oktaAccessToken) refreshEZRXToken,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshOktaToken value) refreshOktaToken,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class _$$_AuthInitCopyWith<$Res> {
  factory _$$_AuthInitCopyWith(
          _$_AuthInit value, $Res Function(_$_AuthInit) then) =
      __$$_AuthInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthInitCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_AuthInitCopyWith<$Res> {
  __$$_AuthInitCopyWithImpl(
      _$_AuthInit _value, $Res Function(_$_AuthInit) _then)
      : super(_value, (v) => _then(v as _$_AuthInit));

  @override
  _$_AuthInit get _value => super._value as _$_AuthInit;
}

/// @nodoc

class _$_AuthInit implements _AuthInit {
  const _$_AuthInit();

  @override
  String toString() {
    return 'AuthEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() authCheck,
    required TResult Function() refreshOktaToken,
    required TResult Function(JWT oktaAccessToken) refreshEZRXToken,
    required TResult Function() logout,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshOktaToken value) refreshOktaToken,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _AuthInit implements AuthEvent {
  const factory _AuthInit() = _$_AuthInit;
}

/// @nodoc
abstract class _$$_AuthCheckCopyWith<$Res> {
  factory _$$_AuthCheckCopyWith(
          _$_AuthCheck value, $Res Function(_$_AuthCheck) then) =
      __$$_AuthCheckCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthCheckCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_AuthCheckCopyWith<$Res> {
  __$$_AuthCheckCopyWithImpl(
      _$_AuthCheck _value, $Res Function(_$_AuthCheck) _then)
      : super(_value, (v) => _then(v as _$_AuthCheck));

  @override
  _$_AuthCheck get _value => super._value as _$_AuthCheck;
}

/// @nodoc

class _$_AuthCheck implements _AuthCheck {
  const _$_AuthCheck();

  @override
  String toString() {
    return 'AuthEvent.authCheck()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthCheck);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() authCheck,
    required TResult Function() refreshOktaToken,
    required TResult Function(JWT oktaAccessToken) refreshEZRXToken,
    required TResult Function() logout,
  }) {
    return authCheck();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
  }) {
    return authCheck?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (authCheck != null) {
      return authCheck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshOktaToken value) refreshOktaToken,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
  }) {
    return authCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
  }) {
    return authCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (authCheck != null) {
      return authCheck(this);
    }
    return orElse();
  }
}

abstract class _AuthCheck implements AuthEvent {
  const factory _AuthCheck() = _$_AuthCheck;
}

/// @nodoc
abstract class _$$_RefreshOktaTokenCopyWith<$Res> {
  factory _$$_RefreshOktaTokenCopyWith(
          _$_RefreshOktaToken value, $Res Function(_$_RefreshOktaToken) then) =
      __$$_RefreshOktaTokenCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshOktaTokenCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_RefreshOktaTokenCopyWith<$Res> {
  __$$_RefreshOktaTokenCopyWithImpl(
      _$_RefreshOktaToken _value, $Res Function(_$_RefreshOktaToken) _then)
      : super(_value, (v) => _then(v as _$_RefreshOktaToken));

  @override
  _$_RefreshOktaToken get _value => super._value as _$_RefreshOktaToken;
}

/// @nodoc

class _$_RefreshOktaToken implements _RefreshOktaToken {
  const _$_RefreshOktaToken();

  @override
  String toString() {
    return 'AuthEvent.refreshOktaToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RefreshOktaToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() authCheck,
    required TResult Function() refreshOktaToken,
    required TResult Function(JWT oktaAccessToken) refreshEZRXToken,
    required TResult Function() logout,
  }) {
    return refreshOktaToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
  }) {
    return refreshOktaToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (refreshOktaToken != null) {
      return refreshOktaToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshOktaToken value) refreshOktaToken,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
  }) {
    return refreshOktaToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
  }) {
    return refreshOktaToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (refreshOktaToken != null) {
      return refreshOktaToken(this);
    }
    return orElse();
  }
}

abstract class _RefreshOktaToken implements AuthEvent {
  const factory _RefreshOktaToken() = _$_RefreshOktaToken;
}

/// @nodoc
abstract class _$$_RefreshEZRXTokenCopyWith<$Res> {
  factory _$$_RefreshEZRXTokenCopyWith(
          _$_RefreshEZRXToken value, $Res Function(_$_RefreshEZRXToken) then) =
      __$$_RefreshEZRXTokenCopyWithImpl<$Res>;
  $Res call({JWT oktaAccessToken});
}

/// @nodoc
class __$$_RefreshEZRXTokenCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_RefreshEZRXTokenCopyWith<$Res> {
  __$$_RefreshEZRXTokenCopyWithImpl(
      _$_RefreshEZRXToken _value, $Res Function(_$_RefreshEZRXToken) _then)
      : super(_value, (v) => _then(v as _$_RefreshEZRXToken));

  @override
  _$_RefreshEZRXToken get _value => super._value as _$_RefreshEZRXToken;

  @override
  $Res call({
    Object? oktaAccessToken = freezed,
  }) {
    return _then(_$_RefreshEZRXToken(
      oktaAccessToken == freezed
          ? _value.oktaAccessToken
          : oktaAccessToken // ignore: cast_nullable_to_non_nullable
              as JWT,
    ));
  }
}

/// @nodoc

class _$_RefreshEZRXToken implements _RefreshEZRXToken {
  const _$_RefreshEZRXToken(this.oktaAccessToken);

  @override
  final JWT oktaAccessToken;

  @override
  String toString() {
    return 'AuthEvent.refreshEZRXToken(oktaAccessToken: $oktaAccessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshEZRXToken &&
            const DeepCollectionEquality()
                .equals(other.oktaAccessToken, oktaAccessToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(oktaAccessToken));

  @JsonKey(ignore: true)
  @override
  _$$_RefreshEZRXTokenCopyWith<_$_RefreshEZRXToken> get copyWith =>
      __$$_RefreshEZRXTokenCopyWithImpl<_$_RefreshEZRXToken>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() authCheck,
    required TResult Function() refreshOktaToken,
    required TResult Function(JWT oktaAccessToken) refreshEZRXToken,
    required TResult Function() logout,
  }) {
    return refreshEZRXToken(oktaAccessToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
  }) {
    return refreshEZRXToken?.call(oktaAccessToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (refreshEZRXToken != null) {
      return refreshEZRXToken(oktaAccessToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshOktaToken value) refreshOktaToken,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
  }) {
    return refreshEZRXToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
  }) {
    return refreshEZRXToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (refreshEZRXToken != null) {
      return refreshEZRXToken(this);
    }
    return orElse();
  }
}

abstract class _RefreshEZRXToken implements AuthEvent {
  const factory _RefreshEZRXToken(final JWT oktaAccessToken) =
      _$_RefreshEZRXToken;

  JWT get oktaAccessToken;
  @JsonKey(ignore: true)
  _$$_RefreshEZRXTokenCopyWith<_$_RefreshEZRXToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LogoutCopyWith<$Res> {
  factory _$$_LogoutCopyWith(_$_Logout value, $Res Function(_$_Logout) then) =
      __$$_LogoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogoutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_LogoutCopyWith<$Res> {
  __$$_LogoutCopyWithImpl(_$_Logout _value, $Res Function(_$_Logout) _then)
      : super(_value, (v) => _then(v as _$_Logout));

  @override
  _$_Logout get _value => super._value as _$_Logout;
}

/// @nodoc

class _$_Logout implements _Logout {
  const _$_Logout();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() authCheck,
    required TResult Function() refreshOktaToken,
    required TResult Function(JWT oktaAccessToken) refreshEZRXToken,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? authCheck,
    TResult Function()? refreshOktaToken,
    TResult Function(JWT oktaAccessToken)? refreshEZRXToken,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshOktaToken value) refreshOktaToken,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshOktaToken value)? refreshOktaToken,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$_Logout;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_AuthenticatedCopyWith<$Res> {
  factory _$$_AuthenticatedCopyWith(
          _$_Authenticated value, $Res Function(_$_Authenticated) then) =
      __$$_AuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthenticatedCopyWith<$Res> {
  __$$_AuthenticatedCopyWithImpl(
      _$_Authenticated _value, $Res Function(_$_Authenticated) _then)
      : super(_value, (v) => _then(v as _$_Authenticated));

  @override
  _$_Authenticated get _value => super._value as _$_Authenticated;
}

/// @nodoc

class _$_Authenticated implements _Authenticated {
  const _$_Authenticated();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthState {
  const factory _Authenticated() = _$_Authenticated;
}

/// @nodoc
abstract class _$$_UnauthenticatedCopyWith<$Res> {
  factory _$$_UnauthenticatedCopyWith(
          _$_Unauthenticated value, $Res Function(_$_Unauthenticated) then) =
      __$$_UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_UnauthenticatedCopyWith<$Res> {
  __$$_UnauthenticatedCopyWithImpl(
      _$_Unauthenticated _value, $Res Function(_$_Unauthenticated) _then)
      : super(_value, (v) => _then(v as _$_Unauthenticated));

  @override
  _$_Unauthenticated get _value => super._value as _$_Unauthenticated;
}

/// @nodoc

class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthState {
  const factory _Unauthenticated() = _$_Unauthenticated;
}
