// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sales_org_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesOrgFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function(String message) serverError,
    required TResult Function() poorConnection,
    required TResult Function() serverTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_PoorConnection value) poorConnection,
    required TResult Function(_ServerTimeout value) serverTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgFailureCopyWith<$Res> {
  factory $SalesOrgFailureCopyWith(
          SalesOrgFailure value, $Res Function(SalesOrgFailure) then) =
      _$SalesOrgFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$SalesOrgFailureCopyWithImpl<$Res>
    implements $SalesOrgFailureCopyWith<$Res> {
  _$SalesOrgFailureCopyWithImpl(this._value, this._then);

  final SalesOrgFailure _value;
  // ignore: unused_field
  final $Res Function(SalesOrgFailure) _then;
}

/// @nodoc
abstract class _$$_OtherCopyWith<$Res> {
  factory _$$_OtherCopyWith(_$_Other value, $Res Function(_$_Other) then) =
      __$$_OtherCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_OtherCopyWithImpl<$Res> extends _$SalesOrgFailureCopyWithImpl<$Res>
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
    return 'SalesOrgFailure.other(message: $message)';
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
    required TResult Function(String message) serverError,
    required TResult Function() poorConnection,
    required TResult Function() serverTimeout,
  }) {
    return other(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
  }) {
    return other?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
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
    required TResult Function(_PoorConnection value) poorConnection,
    required TResult Function(_ServerTimeout value) serverTimeout,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }
}

abstract class _Other implements SalesOrgFailure {
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
  $Res call({String message});
}

/// @nodoc
class __$$_ServerErrorCopyWithImpl<$Res>
    extends _$SalesOrgFailureCopyWithImpl<$Res>
    implements _$$_ServerErrorCopyWith<$Res> {
  __$$_ServerErrorCopyWithImpl(
      _$_ServerError _value, $Res Function(_$_ServerError) _then)
      : super(_value, (v) => _then(v as _$_ServerError));

  @override
  _$_ServerError get _value => super._value as _$_ServerError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_ServerError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SalesOrgFailure.serverError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ServerErrorCopyWith<_$_ServerError> get copyWith =>
      __$$_ServerErrorCopyWithImpl<_$_ServerError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function(String message) serverError,
    required TResult Function() poorConnection,
    required TResult Function() serverTimeout,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_PoorConnection value) poorConnection,
    required TResult Function(_ServerTimeout value) serverTimeout,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements SalesOrgFailure {
  const factory _ServerError(final String message) = _$_ServerError;

  String get message;
  @JsonKey(ignore: true)
  _$$_ServerErrorCopyWith<_$_ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PoorConnectionCopyWith<$Res> {
  factory _$$_PoorConnectionCopyWith(
          _$_PoorConnection value, $Res Function(_$_PoorConnection) then) =
      __$$_PoorConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PoorConnectionCopyWithImpl<$Res>
    extends _$SalesOrgFailureCopyWithImpl<$Res>
    implements _$$_PoorConnectionCopyWith<$Res> {
  __$$_PoorConnectionCopyWithImpl(
      _$_PoorConnection _value, $Res Function(_$_PoorConnection) _then)
      : super(_value, (v) => _then(v as _$_PoorConnection));

  @override
  _$_PoorConnection get _value => super._value as _$_PoorConnection;
}

/// @nodoc

class _$_PoorConnection implements _PoorConnection {
  const _$_PoorConnection();

  @override
  String toString() {
    return 'SalesOrgFailure.poorConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PoorConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function(String message) serverError,
    required TResult Function() poorConnection,
    required TResult Function() serverTimeout,
  }) {
    return poorConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
  }) {
    return poorConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
    required TResult orElse(),
  }) {
    if (poorConnection != null) {
      return poorConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_PoorConnection value) poorConnection,
    required TResult Function(_ServerTimeout value) serverTimeout,
  }) {
    return poorConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
  }) {
    return poorConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
    required TResult orElse(),
  }) {
    if (poorConnection != null) {
      return poorConnection(this);
    }
    return orElse();
  }
}

abstract class _PoorConnection implements SalesOrgFailure {
  const factory _PoorConnection() = _$_PoorConnection;
}

/// @nodoc
abstract class _$$_ServerTimeoutCopyWith<$Res> {
  factory _$$_ServerTimeoutCopyWith(
          _$_ServerTimeout value, $Res Function(_$_ServerTimeout) then) =
      __$$_ServerTimeoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ServerTimeoutCopyWithImpl<$Res>
    extends _$SalesOrgFailureCopyWithImpl<$Res>
    implements _$$_ServerTimeoutCopyWith<$Res> {
  __$$_ServerTimeoutCopyWithImpl(
      _$_ServerTimeout _value, $Res Function(_$_ServerTimeout) _then)
      : super(_value, (v) => _then(v as _$_ServerTimeout));

  @override
  _$_ServerTimeout get _value => super._value as _$_ServerTimeout;
}

/// @nodoc

class _$_ServerTimeout implements _ServerTimeout {
  const _$_ServerTimeout();

  @override
  String toString() {
    return 'SalesOrgFailure.serverTimeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ServerTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) other,
    required TResult Function(String message) serverError,
    required TResult Function() poorConnection,
    required TResult Function() serverTimeout,
  }) {
    return serverTimeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
  }) {
    return serverTimeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? other,
    TResult Function(String message)? serverError,
    TResult Function()? poorConnection,
    TResult Function()? serverTimeout,
    required TResult orElse(),
  }) {
    if (serverTimeout != null) {
      return serverTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Other value) other,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_PoorConnection value) poorConnection,
    required TResult Function(_ServerTimeout value) serverTimeout,
  }) {
    return serverTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
  }) {
    return serverTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Other value)? other,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_PoorConnection value)? poorConnection,
    TResult Function(_ServerTimeout value)? serverTimeout,
    required TResult orElse(),
  }) {
    if (serverTimeout != null) {
      return serverTimeout(this);
    }
    return orElse();
  }
}

abstract class _ServerTimeout implements SalesOrgFailure {
  const factory _ServerTimeout() = _$_ServerTimeout;
}
