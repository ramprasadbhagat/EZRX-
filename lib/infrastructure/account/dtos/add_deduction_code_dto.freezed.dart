// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_deduction_code_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddDeductionCodeDto _$AddDeductionCodeDtoFromJson(Map<String, dynamic> json) {
  return _AddDeductionCodeDto.fromJson(json);
}

/// @nodoc
mixin _$AddDeductionCodeDto {
  @JsonKey(name: 'success', defaultValue: false)
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'info', defaultValue: '')
  String get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddDeductionCodeDtoCopyWith<AddDeductionCodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeductionCodeDtoCopyWith<$Res> {
  factory $AddDeductionCodeDtoCopyWith(
          AddDeductionCodeDto value, $Res Function(AddDeductionCodeDto) then) =
      _$AddDeductionCodeDtoCopyWithImpl<$Res, AddDeductionCodeDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success', defaultValue: false) bool success,
      @JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class _$AddDeductionCodeDtoCopyWithImpl<$Res, $Val extends AddDeductionCodeDto>
    implements $AddDeductionCodeDtoCopyWith<$Res> {
  _$AddDeductionCodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddDeductionCodeDtoCopyWith<$Res>
    implements $AddDeductionCodeDtoCopyWith<$Res> {
  factory _$$_AddDeductionCodeDtoCopyWith(_$_AddDeductionCodeDto value,
          $Res Function(_$_AddDeductionCodeDto) then) =
      __$$_AddDeductionCodeDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success', defaultValue: false) bool success,
      @JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class __$$_AddDeductionCodeDtoCopyWithImpl<$Res>
    extends _$AddDeductionCodeDtoCopyWithImpl<$Res, _$_AddDeductionCodeDto>
    implements _$$_AddDeductionCodeDtoCopyWith<$Res> {
  __$$_AddDeductionCodeDtoCopyWithImpl(_$_AddDeductionCodeDto _value,
      $Res Function(_$_AddDeductionCodeDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? info = null,
  }) {
    return _then(_$_AddDeductionCodeDto(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddDeductionCodeDto extends _AddDeductionCodeDto {
  const _$_AddDeductionCodeDto(
      {@JsonKey(name: 'success', defaultValue: false) required this.success,
      @JsonKey(name: 'info', defaultValue: '') required this.info})
      : super._();

  factory _$_AddDeductionCodeDto.fromJson(Map<String, dynamic> json) =>
      _$$_AddDeductionCodeDtoFromJson(json);

  @override
  @JsonKey(name: 'success', defaultValue: false)
  final bool success;
  @override
  @JsonKey(name: 'info', defaultValue: '')
  final String info;

  @override
  String toString() {
    return 'AddDeductionCodeDto(success: $success, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddDeductionCodeDto &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddDeductionCodeDtoCopyWith<_$_AddDeductionCodeDto> get copyWith =>
      __$$_AddDeductionCodeDtoCopyWithImpl<_$_AddDeductionCodeDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddDeductionCodeDtoToJson(
      this,
    );
  }
}

abstract class _AddDeductionCodeDto extends AddDeductionCodeDto {
  const factory _AddDeductionCodeDto(
      {@JsonKey(name: 'success', defaultValue: false)
          required final bool success,
      @JsonKey(name: 'info', defaultValue: '')
          required final String info}) = _$_AddDeductionCodeDto;
  const _AddDeductionCodeDto._() : super._();

  factory _AddDeductionCodeDto.fromJson(Map<String, dynamic> json) =
      _$_AddDeductionCodeDto.fromJson;

  @override
  @JsonKey(name: 'success', defaultValue: false)
  bool get success;
  @override
  @JsonKey(name: 'info', defaultValue: '')
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_AddDeductionCodeDtoCopyWith<_$_AddDeductionCodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}
