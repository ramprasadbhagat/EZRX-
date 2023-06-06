// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_sales_district_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ManageSalesDistrictDto _$ManageSalesDistrictDtoFromJson(
    Map<String, dynamic> json) {
  return _ManageSalesDistrictDto.fromJson(json);
}

/// @nodoc
mixin _$ManageSalesDistrictDto {
  @JsonKey(name: 'message', defaultValue: '')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManageSalesDistrictDtoCopyWith<ManageSalesDistrictDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageSalesDistrictDtoCopyWith<$Res> {
  factory $ManageSalesDistrictDtoCopyWith(ManageSalesDistrictDto value,
          $Res Function(ManageSalesDistrictDto) then) =
      _$ManageSalesDistrictDtoCopyWithImpl<$Res, ManageSalesDistrictDto>;
  @useResult
  $Res call({@JsonKey(name: 'message', defaultValue: '') String message});
}

/// @nodoc
class _$ManageSalesDistrictDtoCopyWithImpl<$Res,
        $Val extends ManageSalesDistrictDto>
    implements $ManageSalesDistrictDtoCopyWith<$Res> {
  _$ManageSalesDistrictDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ManageSalesDistrictDtoCopyWith<$Res>
    implements $ManageSalesDistrictDtoCopyWith<$Res> {
  factory _$$_ManageSalesDistrictDtoCopyWith(_$_ManageSalesDistrictDto value,
          $Res Function(_$_ManageSalesDistrictDto) then) =
      __$$_ManageSalesDistrictDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'message', defaultValue: '') String message});
}

/// @nodoc
class __$$_ManageSalesDistrictDtoCopyWithImpl<$Res>
    extends _$ManageSalesDistrictDtoCopyWithImpl<$Res,
        _$_ManageSalesDistrictDto>
    implements _$$_ManageSalesDistrictDtoCopyWith<$Res> {
  __$$_ManageSalesDistrictDtoCopyWithImpl(_$_ManageSalesDistrictDto _value,
      $Res Function(_$_ManageSalesDistrictDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ManageSalesDistrictDto(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManageSalesDistrictDto extends _ManageSalesDistrictDto {
  const _$_ManageSalesDistrictDto(
      {@JsonKey(name: 'message', defaultValue: '') required this.message})
      : super._();

  factory _$_ManageSalesDistrictDto.fromJson(Map<String, dynamic> json) =>
      _$$_ManageSalesDistrictDtoFromJson(json);

  @override
  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @override
  String toString() {
    return 'ManageSalesDistrictDto(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManageSalesDistrictDto &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManageSalesDistrictDtoCopyWith<_$_ManageSalesDistrictDto> get copyWith =>
      __$$_ManageSalesDistrictDtoCopyWithImpl<_$_ManageSalesDistrictDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManageSalesDistrictDtoToJson(
      this,
    );
  }
}

abstract class _ManageSalesDistrictDto extends ManageSalesDistrictDto {
  const factory _ManageSalesDistrictDto(
      {@JsonKey(name: 'message', defaultValue: '')
          required final String message}) = _$_ManageSalesDistrictDto;
  const _ManageSalesDistrictDto._() : super._();

  factory _ManageSalesDistrictDto.fromJson(Map<String, dynamic> json) =
      _$_ManageSalesDistrictDto.fromJson;

  @override
  @JsonKey(name: 'message', defaultValue: '')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ManageSalesDistrictDtoCopyWith<_$_ManageSalesDistrictDto> get copyWith =>
      throw _privateConstructorUsedError;
}
