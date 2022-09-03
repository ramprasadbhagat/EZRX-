// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loginv2_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginV2Dto _$LoginV2DtoFromJson(Map<String, dynamic> json) {
  return _LoginV2Dto.fromJson(json);
}

/// @nodoc
mixin _$LoginV2Dto {
  @JsonKey(name: 'eZRxJWT')
  String get access => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginV2DtoCopyWith<LoginV2Dto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginV2DtoCopyWith<$Res> {
  factory $LoginV2DtoCopyWith(
          LoginV2Dto value, $Res Function(LoginV2Dto) then) =
      _$LoginV2DtoCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'eZRxJWT') String access});
}

/// @nodoc
class _$LoginV2DtoCopyWithImpl<$Res> implements $LoginV2DtoCopyWith<$Res> {
  _$LoginV2DtoCopyWithImpl(this._value, this._then);

  final LoginV2Dto _value;
  // ignore: unused_field
  final $Res Function(LoginV2Dto) _then;

  @override
  $Res call({
    Object? access = freezed,
  }) {
    return _then(_value.copyWith(
      access: access == freezed
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginV2DtoCopyWith<$Res>
    implements $LoginV2DtoCopyWith<$Res> {
  factory _$$_LoginV2DtoCopyWith(
          _$_LoginV2Dto value, $Res Function(_$_LoginV2Dto) then) =
      __$$_LoginV2DtoCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'eZRxJWT') String access});
}

/// @nodoc
class __$$_LoginV2DtoCopyWithImpl<$Res> extends _$LoginV2DtoCopyWithImpl<$Res>
    implements _$$_LoginV2DtoCopyWith<$Res> {
  __$$_LoginV2DtoCopyWithImpl(
      _$_LoginV2Dto _value, $Res Function(_$_LoginV2Dto) _then)
      : super(_value, (v) => _then(v as _$_LoginV2Dto));

  @override
  _$_LoginV2Dto get _value => super._value as _$_LoginV2Dto;

  @override
  $Res call({
    Object? access = freezed,
  }) {
    return _then(_$_LoginV2Dto(
      access: access == freezed
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginV2Dto extends _LoginV2Dto {
  const _$_LoginV2Dto({@JsonKey(name: 'eZRxJWT') required this.access})
      : super._();

  factory _$_LoginV2Dto.fromJson(Map<String, dynamic> json) =>
      _$$_LoginV2DtoFromJson(json);

  @override
  @JsonKey(name: 'eZRxJWT')
  final String access;

  @override
  String toString() {
    return 'LoginV2Dto(access: $access)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginV2Dto &&
            const DeepCollectionEquality().equals(other.access, access));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(access));

  @JsonKey(ignore: true)
  @override
  _$$_LoginV2DtoCopyWith<_$_LoginV2Dto> get copyWith =>
      __$$_LoginV2DtoCopyWithImpl<_$_LoginV2Dto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginV2DtoToJson(
      this,
    );
  }
}

abstract class _LoginV2Dto extends LoginV2Dto {
  const factory _LoginV2Dto(
      {@JsonKey(name: 'eZRxJWT') required final String access}) = _$_LoginV2Dto;
  const _LoginV2Dto._() : super._();

  factory _LoginV2Dto.fromJson(Map<String, dynamic> json) =
      _$_LoginV2Dto.fromJson;

  @override
  @JsonKey(name: 'eZRxJWT')
  String get access;
  @override
  @JsonKey(ignore: true)
  _$$_LoginV2DtoCopyWith<_$_LoginV2Dto> get copyWith =>
      throw _privateConstructorUsedError;
}
