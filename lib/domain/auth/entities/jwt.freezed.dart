// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jwt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JWT {
  String get access => throw _privateConstructorUsedError;
  String get refresh => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JWTCopyWith<JWT> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JWTCopyWith<$Res> {
  factory $JWTCopyWith(JWT value, $Res Function(JWT) then) =
      _$JWTCopyWithImpl<$Res>;
  $Res call({String access, String refresh});
}

/// @nodoc
class _$JWTCopyWithImpl<$Res> implements $JWTCopyWith<$Res> {
  _$JWTCopyWithImpl(this._value, this._then);

  final JWT _value;
  // ignore: unused_field
  final $Res Function(JWT) _then;

  @override
  $Res call({
    Object? access = freezed,
    Object? refresh = freezed,
  }) {
    return _then(_value.copyWith(
      access: access == freezed
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: refresh == freezed
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_JWTCopyWith<$Res> implements $JWTCopyWith<$Res> {
  factory _$$_JWTCopyWith(_$_JWT value, $Res Function(_$_JWT) then) =
      __$$_JWTCopyWithImpl<$Res>;
  @override
  $Res call({String access, String refresh});
}

/// @nodoc
class __$$_JWTCopyWithImpl<$Res> extends _$JWTCopyWithImpl<$Res>
    implements _$$_JWTCopyWith<$Res> {
  __$$_JWTCopyWithImpl(_$_JWT _value, $Res Function(_$_JWT) _then)
      : super(_value, (v) => _then(v as _$_JWT));

  @override
  _$_JWT get _value => super._value as _$_JWT;

  @override
  $Res call({
    Object? access = freezed,
    Object? refresh = freezed,
  }) {
    return _then(_$_JWT(
      access: access == freezed
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: refresh == freezed
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_JWT extends _JWT {
  const _$_JWT({required this.access, required this.refresh}) : super._();

  @override
  final String access;
  @override
  final String refresh;

  @override
  String toString() {
    return 'JWT(access: $access, refresh: $refresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JWT &&
            const DeepCollectionEquality().equals(other.access, access) &&
            const DeepCollectionEquality().equals(other.refresh, refresh));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(access),
      const DeepCollectionEquality().hash(refresh));

  @JsonKey(ignore: true)
  @override
  _$$_JWTCopyWith<_$_JWT> get copyWith =>
      __$$_JWTCopyWithImpl<_$_JWT>(this, _$identity);
}

abstract class _JWT extends JWT {
  const factory _JWT(
      {required final String access, required final String refresh}) = _$_JWT;
  const _JWT._() : super._();

  @override
  String get access => throw _privateConstructorUsedError;
  @override
  String get refresh => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_JWTCopyWith<_$_JWT> get copyWith => throw _privateConstructorUsedError;
}
