// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) {
  return _LoginDto.fromJson(json);
}

/// @nodoc
mixin _$LoginDto {
  @JsonKey(name: 'eZRxJWT')
  String get access => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDtoCopyWith<LoginDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDtoCopyWith<$Res> {
  factory $LoginDtoCopyWith(LoginDto value, $Res Function(LoginDto) then) =
      _$LoginDtoCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'eZRxJWT') String access});
}

/// @nodoc
class _$LoginDtoCopyWithImpl<$Res> implements $LoginDtoCopyWith<$Res> {
  _$LoginDtoCopyWithImpl(this._value, this._then);

  final LoginDto _value;
  // ignore: unused_field
  final $Res Function(LoginDto) _then;

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
abstract class _$$_LoginDtoCopyWith<$Res> implements $LoginDtoCopyWith<$Res> {
  factory _$$_LoginDtoCopyWith(
          _$_LoginDto value, $Res Function(_$_LoginDto) then) =
      __$$_LoginDtoCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'eZRxJWT') String access});
}

/// @nodoc
class __$$_LoginDtoCopyWithImpl<$Res> extends _$LoginDtoCopyWithImpl<$Res>
    implements _$$_LoginDtoCopyWith<$Res> {
  __$$_LoginDtoCopyWithImpl(
      _$_LoginDto _value, $Res Function(_$_LoginDto) _then)
      : super(_value, (v) => _then(v as _$_LoginDto));

  @override
  _$_LoginDto get _value => super._value as _$_LoginDto;

  @override
  $Res call({
    Object? access = freezed,
  }) {
    return _then(_$_LoginDto(
      access: access == freezed
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginDto extends _LoginDto {
  const _$_LoginDto({@JsonKey(name: 'eZRxJWT') required this.access})
      : super._();

  factory _$_LoginDto.fromJson(Map<String, dynamic> json) =>
      _$$_LoginDtoFromJson(json);

  @override
  @JsonKey(name: 'eZRxJWT')
  final String access;

  @override
  String toString() {
    return 'LoginDto(access: $access)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginDto &&
            const DeepCollectionEquality().equals(other.access, access));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(access));

  @JsonKey(ignore: true)
  @override
  _$$_LoginDtoCopyWith<_$_LoginDto> get copyWith =>
      __$$_LoginDtoCopyWithImpl<_$_LoginDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginDtoToJson(
      this,
    );
  }
}

abstract class _LoginDto extends LoginDto {
  const factory _LoginDto(
      {@JsonKey(name: 'eZRxJWT') required final String access}) = _$_LoginDto;
  const _LoginDto._() : super._();

  factory _LoginDto.fromJson(Map<String, dynamic> json) = _$_LoginDto.fromJson;

  @override
  @JsonKey(name: 'eZRxJWT')
  String get access;
  @override
  @JsonKey(ignore: true)
  _$$_LoginDtoCopyWith<_$_LoginDto> get copyWith =>
      throw _privateConstructorUsedError;
}
