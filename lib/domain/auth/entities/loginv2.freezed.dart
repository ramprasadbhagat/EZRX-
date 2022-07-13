// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loginv2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginV2 {
  JWT get jwt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginV2CopyWith<LoginV2> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginV2CopyWith<$Res> {
  factory $LoginV2CopyWith(LoginV2 value, $Res Function(LoginV2) then) =
      _$LoginV2CopyWithImpl<$Res>;
  $Res call({JWT jwt});
}

/// @nodoc
class _$LoginV2CopyWithImpl<$Res> implements $LoginV2CopyWith<$Res> {
  _$LoginV2CopyWithImpl(this._value, this._then);

  final LoginV2 _value;
  // ignore: unused_field
  final $Res Function(LoginV2) _then;

  @override
  $Res call({
    Object? jwt = freezed,
  }) {
    return _then(_value.copyWith(
      jwt: jwt == freezed
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as JWT,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginV2CopyWith<$Res> implements $LoginV2CopyWith<$Res> {
  factory _$$_LoginV2CopyWith(
          _$_LoginV2 value, $Res Function(_$_LoginV2) then) =
      __$$_LoginV2CopyWithImpl<$Res>;
  @override
  $Res call({JWT jwt});
}

/// @nodoc
class __$$_LoginV2CopyWithImpl<$Res> extends _$LoginV2CopyWithImpl<$Res>
    implements _$$_LoginV2CopyWith<$Res> {
  __$$_LoginV2CopyWithImpl(_$_LoginV2 _value, $Res Function(_$_LoginV2) _then)
      : super(_value, (v) => _then(v as _$_LoginV2));

  @override
  _$_LoginV2 get _value => super._value as _$_LoginV2;

  @override
  $Res call({
    Object? jwt = freezed,
  }) {
    return _then(_$_LoginV2(
      jwt: jwt == freezed
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as JWT,
    ));
  }
}

/// @nodoc

class _$_LoginV2 extends _LoginV2 {
  const _$_LoginV2({required this.jwt}) : super._();

  @override
  final JWT jwt;

  @override
  String toString() {
    return 'LoginV2(jwt: $jwt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginV2 &&
            const DeepCollectionEquality().equals(other.jwt, jwt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(jwt));

  @JsonKey(ignore: true)
  @override
  _$$_LoginV2CopyWith<_$_LoginV2> get copyWith =>
      __$$_LoginV2CopyWithImpl<_$_LoginV2>(this, _$identity);
}

abstract class _LoginV2 extends LoginV2 {
  const factory _LoginV2({required final JWT jwt}) = _$_LoginV2;
  const _LoginV2._() : super._();

  @override
  JWT get jwt;
  @override
  @JsonKey(ignore: true)
  _$$_LoginV2CopyWith<_$_LoginV2> get copyWith =>
      throw _privateConstructorUsedError;
}
