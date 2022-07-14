// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function() serverError,
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
    required TResult Function() tokenExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
    required TResult Function(_TokenExpired value) tokenExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class _$$_OtherCopyWith<$Res> {
  factory _$$_OtherCopyWith(_$_Other value, $Res Function(_$_Other) then) =
      __$$_OtherCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_OtherCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_OtherCopyWith<$Res> {
  __$$_OtherCopyWithImpl(_$_Other _value, $Res Function(_$_Other) _then)
      : super(_value, (v) => _then(v as _$_Other));

  @override
  _$_Other get _value => super._value as _$_Other;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Other(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Other implements _Other {
  const _$_Other(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthFailure.other(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Other &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_OtherCopyWith<_$_Other> get copyWith =>
      __$$_OtherCopyWithImpl<_$_Other>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function() serverError,
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
    required TResult Function() tokenExpired,
  }) {
    return other(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
  }) {
    return other?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
    required TResult Function(_TokenExpired value) tokenExpired,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }
}

abstract class _Other implements AuthFailure {
  const factory _Other(final String message) = _$_Other;

  String get message;
  @JsonKey(ignore: true)
  _$$_OtherCopyWith<_$_Other> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ServerErrorCopyWith<$Res> {
  factory _$$_ServerErrorCopyWith(
          _$_ServerError value, $Res Function(_$_ServerError) then) =
      __$$_ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_ServerErrorCopyWith<$Res> {
  __$$_ServerErrorCopyWithImpl(
      _$_ServerError _value, $Res Function(_$_ServerError) _then)
      : super(_value, (v) => _then(v as _$_ServerError));

  @override
  _$_ServerError get _value => super._value as _$_ServerError;
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function() serverError,
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
    required TResult Function() tokenExpired,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
    required TResult Function(_TokenExpired value) tokenExpired,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements AuthFailure {
  const factory _ServerError() = _$_ServerError;
}

/// @nodoc
abstract class _$$_InvalidEmailAndPasswordCombinationCopyWith<$Res> {
  factory _$$_InvalidEmailAndPasswordCombinationCopyWith(
          _$_InvalidEmailAndPasswordCombination value,
          $Res Function(_$_InvalidEmailAndPasswordCombination) then) =
      __$$_InvalidEmailAndPasswordCombinationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InvalidEmailAndPasswordCombinationCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_InvalidEmailAndPasswordCombinationCopyWith<$Res> {
  __$$_InvalidEmailAndPasswordCombinationCopyWithImpl(
      _$_InvalidEmailAndPasswordCombination _value,
      $Res Function(_$_InvalidEmailAndPasswordCombination) _then)
      : super(_value, (v) => _then(v as _$_InvalidEmailAndPasswordCombination));

  @override
  _$_InvalidEmailAndPasswordCombination get _value =>
      super._value as _$_InvalidEmailAndPasswordCombination;
}

/// @nodoc

class _$_InvalidEmailAndPasswordCombination
    implements _InvalidEmailAndPasswordCombination {
  const _$_InvalidEmailAndPasswordCombination();

  @override
  String toString() {
    return 'AuthFailure.invalidEmailAndPasswordCombination()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidEmailAndPasswordCombination);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function() serverError,
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
    required TResult Function() tokenExpired,
  }) {
    return invalidEmailAndPasswordCombination();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
  }) {
    return invalidEmailAndPasswordCombination?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
    required TResult orElse(),
  }) {
    if (invalidEmailAndPasswordCombination != null) {
      return invalidEmailAndPasswordCombination();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
    required TResult Function(_TokenExpired value) tokenExpired,
  }) {
    return invalidEmailAndPasswordCombination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
  }) {
    return invalidEmailAndPasswordCombination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
    required TResult orElse(),
  }) {
    if (invalidEmailAndPasswordCombination != null) {
      return invalidEmailAndPasswordCombination(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmailAndPasswordCombination implements AuthFailure {
  const factory _InvalidEmailAndPasswordCombination() =
      _$_InvalidEmailAndPasswordCombination;
}

/// @nodoc
abstract class _$$_AccountLockedCopyWith<$Res> {
  factory _$$_AccountLockedCopyWith(
          _$_AccountLocked value, $Res Function(_$_AccountLocked) then) =
      __$$_AccountLockedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AccountLockedCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_AccountLockedCopyWith<$Res> {
  __$$_AccountLockedCopyWithImpl(
      _$_AccountLocked _value, $Res Function(_$_AccountLocked) _then)
      : super(_value, (v) => _then(v as _$_AccountLocked));

  @override
  _$_AccountLocked get _value => super._value as _$_AccountLocked;
}

/// @nodoc

class _$_AccountLocked implements _AccountLocked {
  const _$_AccountLocked();

  @override
  String toString() {
    return 'AuthFailure.accountLocked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AccountLocked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function() serverError,
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
    required TResult Function() tokenExpired,
  }) {
    return accountLocked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
  }) {
    return accountLocked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
    required TResult orElse(),
  }) {
    if (accountLocked != null) {
      return accountLocked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
    required TResult Function(_TokenExpired value) tokenExpired,
  }) {
    return accountLocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
  }) {
    return accountLocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
    required TResult orElse(),
  }) {
    if (accountLocked != null) {
      return accountLocked(this);
    }
    return orElse();
  }
}

abstract class _AccountLocked implements AuthFailure {
  const factory _AccountLocked() = _$_AccountLocked;
}

/// @nodoc
abstract class _$$_AccountExpiredCopyWith<$Res> {
  factory _$$_AccountExpiredCopyWith(
          _$_AccountExpired value, $Res Function(_$_AccountExpired) then) =
      __$$_AccountExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AccountExpiredCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_AccountExpiredCopyWith<$Res> {
  __$$_AccountExpiredCopyWithImpl(
      _$_AccountExpired _value, $Res Function(_$_AccountExpired) _then)
      : super(_value, (v) => _then(v as _$_AccountExpired));

  @override
  _$_AccountExpired get _value => super._value as _$_AccountExpired;
}

/// @nodoc

class _$_AccountExpired implements _AccountExpired {
  const _$_AccountExpired();

  @override
  String toString() {
    return 'AuthFailure.accountExpired()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AccountExpired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function() serverError,
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
    required TResult Function() tokenExpired,
  }) {
    return accountExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
  }) {
    return accountExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
    required TResult orElse(),
  }) {
    if (accountExpired != null) {
      return accountExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
    required TResult Function(_TokenExpired value) tokenExpired,
  }) {
    return accountExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
  }) {
    return accountExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
    required TResult orElse(),
  }) {
    if (accountExpired != null) {
      return accountExpired(this);
    }
    return orElse();
  }
}

abstract class _AccountExpired implements AuthFailure {
  const factory _AccountExpired() = _$_AccountExpired;
}

/// @nodoc
abstract class _$$_TokenExpiredCopyWith<$Res> {
  factory _$$_TokenExpiredCopyWith(
          _$_TokenExpired value, $Res Function(_$_TokenExpired) then) =
      __$$_TokenExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TokenExpiredCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_TokenExpiredCopyWith<$Res> {
  __$$_TokenExpiredCopyWithImpl(
      _$_TokenExpired _value, $Res Function(_$_TokenExpired) _then)
      : super(_value, (v) => _then(v as _$_TokenExpired));

  @override
  _$_TokenExpired get _value => super._value as _$_TokenExpired;
}

/// @nodoc

class _$_TokenExpired implements _TokenExpired {
  const _$_TokenExpired();

  @override
  String toString() {
    return 'AuthFailure.tokenExpired()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TokenExpired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function() serverError,
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
    required TResult Function() tokenExpired,
  }) {
    return tokenExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
  }) {
    return tokenExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function()? serverError,
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    TResult Function()? tokenExpired,
    required TResult orElse(),
  }) {
    if (tokenExpired != null) {
      return tokenExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
    required TResult Function(_TokenExpired value) tokenExpired,
  }) {
    return tokenExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
  }) {
    return tokenExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    TResult Function(_TokenExpired value)? tokenExpired,
    required TResult orElse(),
  }) {
    if (tokenExpired != null) {
      return tokenExpired(this);
    }
    return orElse();
  }
}

abstract class _TokenExpired implements AuthFailure {
  const factory _TokenExpired() = _$_TokenExpired;
}
