// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'license_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LicenseDto _$LicenseDtoFromJson(Map<String, dynamic> json) {
  return _licenseDto.fromJson(json);
}

/// @nodoc
mixin _$LicenseDto {
  @JsonKey(name: 'licenceType')
  String get licenceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'licenseDescription')
  String get licenseDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'licenseNumber')
  String get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'validFrom', defaultValue: '', readValue: dateTimeStringFormatCheck)
  String get validFrom => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'validTo', defaultValue: '', readValue: dateTimeStringFormatCheck)
  String get validTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LicenseDtoCopyWith<LicenseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseDtoCopyWith<$Res> {
  factory $LicenseDtoCopyWith(
          LicenseDto value, $Res Function(LicenseDto) then) =
      _$LicenseDtoCopyWithImpl<$Res, LicenseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'licenceType')
          String licenceType,
      @JsonKey(name: 'licenseDescription')
          String licenseDescription,
      @JsonKey(name: 'licenseNumber')
          String licenseNumber,
      @JsonKey(name: 'validFrom', defaultValue: '', readValue: dateTimeStringFormatCheck)
          String validFrom,
      @JsonKey(name: 'validTo', defaultValue: '', readValue: dateTimeStringFormatCheck)
          String validTo});
}

/// @nodoc
class _$LicenseDtoCopyWithImpl<$Res, $Val extends LicenseDto>
    implements $LicenseDtoCopyWith<$Res> {
  _$LicenseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenceType = null,
    Object? licenseDescription = null,
    Object? licenseNumber = null,
    Object? validFrom = null,
    Object? validTo = null,
  }) {
    return _then(_value.copyWith(
      licenceType: null == licenceType
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      licenseDescription: null == licenseDescription
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as String,
      validTo: null == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_licenseDtoCopyWith<$Res>
    implements $LicenseDtoCopyWith<$Res> {
  factory _$$_licenseDtoCopyWith(
          _$_licenseDto value, $Res Function(_$_licenseDto) then) =
      __$$_licenseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'licenceType')
          String licenceType,
      @JsonKey(name: 'licenseDescription')
          String licenseDescription,
      @JsonKey(name: 'licenseNumber')
          String licenseNumber,
      @JsonKey(name: 'validFrom', defaultValue: '', readValue: dateTimeStringFormatCheck)
          String validFrom,
      @JsonKey(name: 'validTo', defaultValue: '', readValue: dateTimeStringFormatCheck)
          String validTo});
}

/// @nodoc
class __$$_licenseDtoCopyWithImpl<$Res>
    extends _$LicenseDtoCopyWithImpl<$Res, _$_licenseDto>
    implements _$$_licenseDtoCopyWith<$Res> {
  __$$_licenseDtoCopyWithImpl(
      _$_licenseDto _value, $Res Function(_$_licenseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenceType = null,
    Object? licenseDescription = null,
    Object? licenseNumber = null,
    Object? validFrom = null,
    Object? validTo = null,
  }) {
    return _then(_$_licenseDto(
      licenceType: null == licenceType
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      licenseDescription: null == licenseDescription
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as String,
      validTo: null == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_licenseDto extends _licenseDto {
  const _$_licenseDto(
      {@JsonKey(name: 'licenceType')
          required this.licenceType,
      @JsonKey(name: 'licenseDescription')
          required this.licenseDescription,
      @JsonKey(name: 'licenseNumber')
          required this.licenseNumber,
      @JsonKey(name: 'validFrom', defaultValue: '', readValue: dateTimeStringFormatCheck)
          required this.validFrom,
      @JsonKey(name: 'validTo', defaultValue: '', readValue: dateTimeStringFormatCheck)
          required this.validTo})
      : super._();

  factory _$_licenseDto.fromJson(Map<String, dynamic> json) =>
      _$$_licenseDtoFromJson(json);

  @override
  @JsonKey(name: 'licenceType')
  final String licenceType;
  @override
  @JsonKey(name: 'licenseDescription')
  final String licenseDescription;
  @override
  @JsonKey(name: 'licenseNumber')
  final String licenseNumber;
  @override
  @JsonKey(
      name: 'validFrom', defaultValue: '', readValue: dateTimeStringFormatCheck)
  final String validFrom;
  @override
  @JsonKey(
      name: 'validTo', defaultValue: '', readValue: dateTimeStringFormatCheck)
  final String validTo;

  @override
  String toString() {
    return 'LicenseDto(licenceType: $licenceType, licenseDescription: $licenseDescription, licenseNumber: $licenseNumber, validFrom: $validFrom, validTo: $validTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_licenseDto &&
            (identical(other.licenceType, licenceType) ||
                other.licenceType == licenceType) &&
            (identical(other.licenseDescription, licenseDescription) ||
                other.licenseDescription == licenseDescription) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, licenceType, licenseDescription,
      licenseNumber, validFrom, validTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_licenseDtoCopyWith<_$_licenseDto> get copyWith =>
      __$$_licenseDtoCopyWithImpl<_$_licenseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_licenseDtoToJson(
      this,
    );
  }
}

abstract class _licenseDto extends LicenseDto {
  const factory _licenseDto(
      {@JsonKey(name: 'licenceType')
          required final String licenceType,
      @JsonKey(name: 'licenseDescription')
          required final String licenseDescription,
      @JsonKey(name: 'licenseNumber')
          required final String licenseNumber,
      @JsonKey(name: 'validFrom', defaultValue: '', readValue: dateTimeStringFormatCheck)
          required final String validFrom,
      @JsonKey(name: 'validTo', defaultValue: '', readValue: dateTimeStringFormatCheck)
          required final String validTo}) = _$_licenseDto;
  const _licenseDto._() : super._();

  factory _licenseDto.fromJson(Map<String, dynamic> json) =
      _$_licenseDto.fromJson;

  @override
  @JsonKey(name: 'licenceType')
  String get licenceType;
  @override
  @JsonKey(name: 'licenseDescription')
  String get licenseDescription;
  @override
  @JsonKey(name: 'licenseNumber')
  String get licenseNumber;
  @override
  @JsonKey(
      name: 'validFrom', defaultValue: '', readValue: dateTimeStringFormatCheck)
  String get validFrom;
  @override
  @JsonKey(
      name: 'validTo', defaultValue: '', readValue: dateTimeStringFormatCheck)
  String get validTo;
  @override
  @JsonKey(ignore: true)
  _$$_licenseDtoCopyWith<_$_licenseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
