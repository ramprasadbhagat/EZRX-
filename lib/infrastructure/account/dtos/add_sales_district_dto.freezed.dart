// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_sales_district_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddSalesDistrictDto _$AddSalesDistrictDtoFromJson(Map<String, dynamic> json) {
  return _AddSalesDistrictDto.fromJson(json);
}

/// @nodoc
mixin _$AddSalesDistrictDto {
  @JsonKey(name: 'message', defaultValue: '')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddSalesDistrictDtoCopyWith<AddSalesDistrictDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSalesDistrictDtoCopyWith<$Res> {
  factory $AddSalesDistrictDtoCopyWith(
          AddSalesDistrictDto value, $Res Function(AddSalesDistrictDto) then) =
      _$AddSalesDistrictDtoCopyWithImpl<$Res, AddSalesDistrictDto>;
  @useResult
  $Res call({@JsonKey(name: 'message', defaultValue: '') String message});
}

/// @nodoc
class _$AddSalesDistrictDtoCopyWithImpl<$Res, $Val extends AddSalesDistrictDto>
    implements $AddSalesDistrictDtoCopyWith<$Res> {
  _$AddSalesDistrictDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_AddSalesDistrictDtoCopyWith<$Res>
    implements $AddSalesDistrictDtoCopyWith<$Res> {
  factory _$$_AddSalesDistrictDtoCopyWith(_$_AddSalesDistrictDto value,
          $Res Function(_$_AddSalesDistrictDto) then) =
      __$$_AddSalesDistrictDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'message', defaultValue: '') String message});
}

/// @nodoc
class __$$_AddSalesDistrictDtoCopyWithImpl<$Res>
    extends _$AddSalesDistrictDtoCopyWithImpl<$Res, _$_AddSalesDistrictDto>
    implements _$$_AddSalesDistrictDtoCopyWith<$Res> {
  __$$_AddSalesDistrictDtoCopyWithImpl(_$_AddSalesDistrictDto _value,
      $Res Function(_$_AddSalesDistrictDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_AddSalesDistrictDto(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddSalesDistrictDto extends _AddSalesDistrictDto {
  const _$_AddSalesDistrictDto(
      {@JsonKey(name: 'message', defaultValue: '') required this.message})
      : super._();

  factory _$_AddSalesDistrictDto.fromJson(Map<String, dynamic> json) =>
      _$$_AddSalesDistrictDtoFromJson(json);

  @override
  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @override
  String toString() {
    return 'AddSalesDistrictDto(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddSalesDistrictDto &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddSalesDistrictDtoCopyWith<_$_AddSalesDistrictDto> get copyWith =>
      __$$_AddSalesDistrictDtoCopyWithImpl<_$_AddSalesDistrictDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddSalesDistrictDtoToJson(
      this,
    );
  }
}

abstract class _AddSalesDistrictDto extends AddSalesDistrictDto {
  const factory _AddSalesDistrictDto(
      {@JsonKey(name: 'message', defaultValue: '')
          required final String message}) = _$_AddSalesDistrictDto;
  const _AddSalesDistrictDto._() : super._();

  factory _AddSalesDistrictDto.fromJson(Map<String, dynamic> json) =
      _$_AddSalesDistrictDto.fromJson;

  @override
  @JsonKey(name: 'message', defaultValue: '')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_AddSalesDistrictDtoCopyWith<_$_AddSalesDistrictDto> get copyWith =>
      throw _privateConstructorUsedError;
}
