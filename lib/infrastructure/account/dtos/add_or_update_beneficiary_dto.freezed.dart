// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_or_update_beneficiary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddOrUpdateBeneficiaryDto _$AddOrUpdateBeneficiaryDtoFromJson(
    Map<String, dynamic> json) {
  return _AddOrUpdateBeneficiaryDto.fromJson(json);
}

/// @nodoc
mixin _$AddOrUpdateBeneficiaryDto {
  @JsonKey(name: 'info', defaultValue: '')
  String get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddOrUpdateBeneficiaryDtoCopyWith<AddOrUpdateBeneficiaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOrUpdateBeneficiaryDtoCopyWith<$Res> {
  factory $AddOrUpdateBeneficiaryDtoCopyWith(AddOrUpdateBeneficiaryDto value,
          $Res Function(AddOrUpdateBeneficiaryDto) then) =
      _$AddOrUpdateBeneficiaryDtoCopyWithImpl<$Res, AddOrUpdateBeneficiaryDto>;
  @useResult
  $Res call({@JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class _$AddOrUpdateBeneficiaryDtoCopyWithImpl<$Res,
        $Val extends AddOrUpdateBeneficiaryDto>
    implements $AddOrUpdateBeneficiaryDtoCopyWith<$Res> {
  _$AddOrUpdateBeneficiaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddOrUpdateBeneficiaryDtoCopyWith<$Res>
    implements $AddOrUpdateBeneficiaryDtoCopyWith<$Res> {
  factory _$$_AddOrUpdateBeneficiaryDtoCopyWith(
          _$_AddOrUpdateBeneficiaryDto value,
          $Res Function(_$_AddOrUpdateBeneficiaryDto) then) =
      __$$_AddOrUpdateBeneficiaryDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class __$$_AddOrUpdateBeneficiaryDtoCopyWithImpl<$Res>
    extends _$AddOrUpdateBeneficiaryDtoCopyWithImpl<$Res,
        _$_AddOrUpdateBeneficiaryDto>
    implements _$$_AddOrUpdateBeneficiaryDtoCopyWith<$Res> {
  __$$_AddOrUpdateBeneficiaryDtoCopyWithImpl(
      _$_AddOrUpdateBeneficiaryDto _value,
      $Res Function(_$_AddOrUpdateBeneficiaryDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$_AddOrUpdateBeneficiaryDto(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddOrUpdateBeneficiaryDto extends _AddOrUpdateBeneficiaryDto {
  const _$_AddOrUpdateBeneficiaryDto(
      {@JsonKey(name: 'info', defaultValue: '') required this.info})
      : super._();

  factory _$_AddOrUpdateBeneficiaryDto.fromJson(Map<String, dynamic> json) =>
      _$$_AddOrUpdateBeneficiaryDtoFromJson(json);

  @override
  @JsonKey(name: 'info', defaultValue: '')
  final String info;

  @override
  String toString() {
    return 'AddOrUpdateBeneficiaryDto(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddOrUpdateBeneficiaryDto &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddOrUpdateBeneficiaryDtoCopyWith<_$_AddOrUpdateBeneficiaryDto>
      get copyWith => __$$_AddOrUpdateBeneficiaryDtoCopyWithImpl<
          _$_AddOrUpdateBeneficiaryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddOrUpdateBeneficiaryDtoToJson(
      this,
    );
  }
}

abstract class _AddOrUpdateBeneficiaryDto extends AddOrUpdateBeneficiaryDto {
  const factory _AddOrUpdateBeneficiaryDto(
      {@JsonKey(name: 'info', defaultValue: '')
          required final String info}) = _$_AddOrUpdateBeneficiaryDto;
  const _AddOrUpdateBeneficiaryDto._() : super._();

  factory _AddOrUpdateBeneficiaryDto.fromJson(Map<String, dynamic> json) =
      _$_AddOrUpdateBeneficiaryDto.fromJson;

  @override
  @JsonKey(name: 'info', defaultValue: '')
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_AddOrUpdateBeneficiaryDtoCopyWith<_$_AddOrUpdateBeneficiaryDto>
      get copyWith => throw _privateConstructorUsedError;
}
