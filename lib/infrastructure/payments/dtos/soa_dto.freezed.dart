// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soa_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SoaDto _$SoaDtoFromJson(Map<String, dynamic> json) {
  return _SoaDto.fromJson(json);
}

/// @nodoc
mixin _$SoaDto {
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SoaDtoCopyWith<SoaDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoaDtoCopyWith<$Res> {
  factory $SoaDtoCopyWith(SoaDto value, $Res Function(SoaDto) then) =
      _$SoaDtoCopyWithImpl<$Res, SoaDto>;
  @useResult
  $Res call({@JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class _$SoaDtoCopyWithImpl<$Res, $Val extends SoaDto>
    implements $SoaDtoCopyWith<$Res> {
  _$SoaDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SoaDtoCopyWith<$Res> implements $SoaDtoCopyWith<$Res> {
  factory _$$_SoaDtoCopyWith(_$_SoaDto value, $Res Function(_$_SoaDto) then) =
      __$$_SoaDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class __$$_SoaDtoCopyWithImpl<$Res>
    extends _$SoaDtoCopyWithImpl<$Res, _$_SoaDto>
    implements _$$_SoaDtoCopyWith<$Res> {
  __$$_SoaDtoCopyWithImpl(_$_SoaDto _value, $Res Function(_$_SoaDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_SoaDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SoaDto extends _SoaDto {
  _$_SoaDto({@JsonKey(name: 'name', defaultValue: '') required this.name})
      : super._();

  factory _$_SoaDto.fromJson(Map<String, dynamic> json) =>
      _$$_SoaDtoFromJson(json);

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @override
  String toString() {
    return 'SoaDto(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SoaDto &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SoaDtoCopyWith<_$_SoaDto> get copyWith =>
      __$$_SoaDtoCopyWithImpl<_$_SoaDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SoaDtoToJson(
      this,
    );
  }
}

abstract class _SoaDto extends SoaDto {
  factory _SoaDto(
      {@JsonKey(name: 'name', defaultValue: '')
          required final String name}) = _$_SoaDto;
  _SoaDto._() : super._();

  factory _SoaDto.fromJson(Map<String, dynamic> json) = _$_SoaDto.fromJson;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SoaDtoCopyWith<_$_SoaDto> get copyWith =>
      throw _privateConstructorUsedError;
}
