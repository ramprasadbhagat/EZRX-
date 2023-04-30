// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmailAndPasswordCombination,
    TResult? Function()? accountLocked,
    TResult? Function()? accountExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_AccountExpired value)? accountExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthExceptionCopyWith<$Res> {
  factory $AuthExceptionCopyWith(
          AuthException value, $Res Function(AuthException) then) =
      _$AuthExceptionCopyWithImpl<$Res, AuthException>;
}

/// @nodoc
class _$AuthExceptionCopyWithImpl<$Res, $Val extends AuthException>
    implements $AuthExceptionCopyWith<$Res> {
  _$AuthExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$AuthExceptionCopyWithImpl<$Res,
        _$_InvalidEmailAndPasswordCombination>
    implements _$$_InvalidEmailAndPasswordCombinationCopyWith<$Res> {
  __$$_InvalidEmailAndPasswordCombinationCopyWithImpl(
      _$_InvalidEmailAndPasswordCombination _value,
      $Res Function(_$_InvalidEmailAndPasswordCombination) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InvalidEmailAndPasswordCombination
    implements _InvalidEmailAndPasswordCombination {
  const _$_InvalidEmailAndPasswordCombination();

  @override
  String toString() {
    return 'AuthException.invalidEmailAndPasswordCombination()';
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
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
  }) {
    return invalidEmailAndPasswordCombination();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmailAndPasswordCombination,
    TResult? Function()? accountLocked,
    TResult? Function()? accountExpired,
  }) {
    return invalidEmailAndPasswordCombination?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
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
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
  }) {
    return invalidEmailAndPasswordCombination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_AccountExpired value)? accountExpired,
  }) {
    return invalidEmailAndPasswordCombination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    required TResult orElse(),
  }) {
    if (invalidEmailAndPasswordCombination != null) {
      return invalidEmailAndPasswordCombination(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmailAndPasswordCombination implements AuthException {
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
    extends _$AuthExceptionCopyWithImpl<$Res, _$_AccountLocked>
    implements _$$_AccountLockedCopyWith<$Res> {
  __$$_AccountLockedCopyWithImpl(
      _$_AccountLocked _value, $Res Function(_$_AccountLocked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AccountLocked implements _AccountLocked {
  const _$_AccountLocked();

  @override
  String toString() {
    return 'AuthException.accountLocked()';
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
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
  }) {
    return accountLocked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmailAndPasswordCombination,
    TResult? Function()? accountLocked,
    TResult? Function()? accountExpired,
  }) {
    return accountLocked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
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
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
  }) {
    return accountLocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_AccountExpired value)? accountExpired,
  }) {
    return accountLocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    required TResult orElse(),
  }) {
    if (accountLocked != null) {
      return accountLocked(this);
    }
    return orElse();
  }
}

abstract class _AccountLocked implements AuthException {
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
    extends _$AuthExceptionCopyWithImpl<$Res, _$_AccountExpired>
    implements _$$_AccountExpiredCopyWith<$Res> {
  __$$_AccountExpiredCopyWithImpl(
      _$_AccountExpired _value, $Res Function(_$_AccountExpired) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AccountExpired implements _AccountExpired {
  const _$_AccountExpired();

  @override
  String toString() {
    return 'AuthException.accountExpired()';
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
    required TResult Function() invalidEmailAndPasswordCombination,
    required TResult Function() accountLocked,
    required TResult Function() accountExpired,
  }) {
    return accountExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidEmailAndPasswordCombination,
    TResult? Function()? accountLocked,
    TResult? Function()? accountExpired,
  }) {
    return accountExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmailAndPasswordCombination,
    TResult Function()? accountLocked,
    TResult Function()? accountExpired,
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
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
    required TResult Function(_AccountLocked value) accountLocked,
    required TResult Function(_AccountExpired value) accountExpired,
  }) {
    return accountExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult? Function(_AccountLocked value)? accountLocked,
    TResult? Function(_AccountExpired value)? accountExpired,
  }) {
    return accountExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    TResult Function(_AccountLocked value)? accountLocked,
    TResult Function(_AccountExpired value)? accountExpired,
    required TResult orElse(),
  }) {
    if (accountExpired != null) {
      return accountExpired(this);
    }
    return orElse();
  }
}

abstract class _AccountExpired implements AuthException {
  const factory _AccountExpired() = _$_AccountExpired;
}
