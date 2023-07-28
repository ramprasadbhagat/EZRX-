// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deduction_code_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeductionCodeDto _$DeductionCodeDtoFromJson(Map<String, dynamic> json) {
  return _DeductionCodeDto.fromJson(json);
}

/// @nodoc
mixin _$DeductionCodeDto {
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDistrict', defaultValue: '', toJson: valueToJson)
  String get salesDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: 'deductionCode', defaultValue: '')
  String get deductionCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'deductionDescription', defaultValue: '')
  String get deductionDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountType', defaultValue: '')
  String get amountType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeductionCodeDtoCopyWith<DeductionCodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeductionCodeDtoCopyWith<$Res> {
  factory $DeductionCodeDtoCopyWith(
          DeductionCodeDto value, $Res Function(DeductionCodeDto) then) =
      _$DeductionCodeDtoCopyWithImpl<$Res, DeductionCodeDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'salesDistrict', defaultValue: '', toJson: valueToJson)
      String salesDistrict,
      @JsonKey(name: 'deductionCode', defaultValue: '') String deductionCode,
      @JsonKey(name: 'deductionDescription', defaultValue: '')
      String deductionDescription,
      @JsonKey(name: 'amountType', defaultValue: '') String amountType});
}

/// @nodoc
class _$DeductionCodeDtoCopyWithImpl<$Res, $Val extends DeductionCodeDto>
    implements $DeductionCodeDtoCopyWith<$Res> {
  _$DeductionCodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? salesDistrict = null,
    Object? deductionCode = null,
    Object? deductionDescription = null,
    Object? amountType = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      deductionCode: null == deductionCode
          ? _value.deductionCode
          : deductionCode // ignore: cast_nullable_to_non_nullable
              as String,
      deductionDescription: null == deductionDescription
          ? _value.deductionDescription
          : deductionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeductionCodeDtoCopyWith<$Res>
    implements $DeductionCodeDtoCopyWith<$Res> {
  factory _$$_DeductionCodeDtoCopyWith(
          _$_DeductionCodeDto value, $Res Function(_$_DeductionCodeDto) then) =
      __$$_DeductionCodeDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'salesDistrict', defaultValue: '', toJson: valueToJson)
      String salesDistrict,
      @JsonKey(name: 'deductionCode', defaultValue: '') String deductionCode,
      @JsonKey(name: 'deductionDescription', defaultValue: '')
      String deductionDescription,
      @JsonKey(name: 'amountType', defaultValue: '') String amountType});
}

/// @nodoc
class __$$_DeductionCodeDtoCopyWithImpl<$Res>
    extends _$DeductionCodeDtoCopyWithImpl<$Res, _$_DeductionCodeDto>
    implements _$$_DeductionCodeDtoCopyWith<$Res> {
  __$$_DeductionCodeDtoCopyWithImpl(
      _$_DeductionCodeDto _value, $Res Function(_$_DeductionCodeDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? salesDistrict = null,
    Object? deductionCode = null,
    Object? deductionDescription = null,
    Object? amountType = null,
  }) {
    return _then(_$_DeductionCodeDto(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      deductionCode: null == deductionCode
          ? _value.deductionCode
          : deductionCode // ignore: cast_nullable_to_non_nullable
              as String,
      deductionDescription: null == deductionDescription
          ? _value.deductionDescription
          : deductionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeductionCodeDto extends _DeductionCodeDto {
  const _$_DeductionCodeDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '') required this.salesOrg,
      @JsonKey(name: 'salesDistrict', defaultValue: '', toJson: valueToJson)
      required this.salesDistrict,
      @JsonKey(name: 'deductionCode', defaultValue: '')
      required this.deductionCode,
      @JsonKey(name: 'deductionDescription', defaultValue: '')
      required this.deductionDescription,
      @JsonKey(name: 'amountType', defaultValue: '') required this.amountType})
      : super._();

  factory _$_DeductionCodeDto.fromJson(Map<String, dynamic> json) =>
      _$$_DeductionCodeDtoFromJson(json);

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  final String salesOrg;
  @override
  @JsonKey(name: 'salesDistrict', defaultValue: '', toJson: valueToJson)
  final String salesDistrict;
  @override
  @JsonKey(name: 'deductionCode', defaultValue: '')
  final String deductionCode;
  @override
  @JsonKey(name: 'deductionDescription', defaultValue: '')
  final String deductionDescription;
  @override
  @JsonKey(name: 'amountType', defaultValue: '')
  final String amountType;

  @override
  String toString() {
    return 'DeductionCodeDto(salesOrg: $salesOrg, salesDistrict: $salesDistrict, deductionCode: $deductionCode, deductionDescription: $deductionDescription, amountType: $amountType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeductionCodeDto &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.deductionCode, deductionCode) ||
                other.deductionCode == deductionCode) &&
            (identical(other.deductionDescription, deductionDescription) ||
                other.deductionDescription == deductionDescription) &&
            (identical(other.amountType, amountType) ||
                other.amountType == amountType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, salesDistrict,
      deductionCode, deductionDescription, amountType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeductionCodeDtoCopyWith<_$_DeductionCodeDto> get copyWith =>
      __$$_DeductionCodeDtoCopyWithImpl<_$_DeductionCodeDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeductionCodeDtoToJson(
      this,
    );
  }
}

abstract class _DeductionCodeDto extends DeductionCodeDto {
  const factory _DeductionCodeDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
      required final String salesOrg,
      @JsonKey(name: 'salesDistrict', defaultValue: '', toJson: valueToJson)
      required final String salesDistrict,
      @JsonKey(name: 'deductionCode', defaultValue: '')
      required final String deductionCode,
      @JsonKey(name: 'deductionDescription', defaultValue: '')
      required final String deductionDescription,
      @JsonKey(name: 'amountType', defaultValue: '')
      required final String amountType}) = _$_DeductionCodeDto;
  const _DeductionCodeDto._() : super._();

  factory _DeductionCodeDto.fromJson(Map<String, dynamic> json) =
      _$_DeductionCodeDto.fromJson;

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'salesDistrict', defaultValue: '', toJson: valueToJson)
  String get salesDistrict;
  @override
  @JsonKey(name: 'deductionCode', defaultValue: '')
  String get deductionCode;
  @override
  @JsonKey(name: 'deductionDescription', defaultValue: '')
  String get deductionDescription;
  @override
  @JsonKey(name: 'amountType', defaultValue: '')
  String get amountType;
  @override
  @JsonKey(ignore: true)
  _$$_DeductionCodeDtoCopyWith<_$_DeductionCodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}
