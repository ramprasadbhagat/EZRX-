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
      _$LicenseDtoCopyWithImpl<$Res>;
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
class _$LicenseDtoCopyWithImpl<$Res> implements $LicenseDtoCopyWith<$Res> {
  _$LicenseDtoCopyWithImpl(this._value, this._then);

  final LicenseDto _value;
  // ignore: unused_field
  final $Res Function(LicenseDto) _then;

  @override
  $Res call({
    Object? licenceType = freezed,
    Object? licenseDescription = freezed,
    Object? licenseNumber = freezed,
    Object? validFrom = freezed,
    Object? validTo = freezed,
  }) {
    return _then(_value.copyWith(
      licenceType: licenceType == freezed
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      licenseDescription: licenseDescription == freezed
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: licenseNumber == freezed
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: validFrom == freezed
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as String,
      validTo: validTo == freezed
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_licenseDtoCopyWith<$Res>
    implements $LicenseDtoCopyWith<$Res> {
  factory _$$_licenseDtoCopyWith(
          _$_licenseDto value, $Res Function(_$_licenseDto) then) =
      __$$_licenseDtoCopyWithImpl<$Res>;
  @override
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
class __$$_licenseDtoCopyWithImpl<$Res> extends _$LicenseDtoCopyWithImpl<$Res>
    implements _$$_licenseDtoCopyWith<$Res> {
  __$$_licenseDtoCopyWithImpl(
      _$_licenseDto _value, $Res Function(_$_licenseDto) _then)
      : super(_value, (v) => _then(v as _$_licenseDto));

  @override
  _$_licenseDto get _value => super._value as _$_licenseDto;

  @override
  $Res call({
    Object? licenceType = freezed,
    Object? licenseDescription = freezed,
    Object? licenseNumber = freezed,
    Object? validFrom = freezed,
    Object? validTo = freezed,
  }) {
    return _then(_$_licenseDto(
      licenceType: licenceType == freezed
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      licenseDescription: licenseDescription == freezed
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: licenseNumber == freezed
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: validFrom == freezed
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as String,
      validTo: validTo == freezed
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
            const DeepCollectionEquality()
                .equals(other.licenceType, licenceType) &&
            const DeepCollectionEquality()
                .equals(other.licenseDescription, licenseDescription) &&
            const DeepCollectionEquality()
                .equals(other.licenseNumber, licenseNumber) &&
            const DeepCollectionEquality().equals(other.validFrom, validFrom) &&
            const DeepCollectionEquality().equals(other.validTo, validTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(licenceType),
      const DeepCollectionEquality().hash(licenseDescription),
      const DeepCollectionEquality().hash(licenseNumber),
      const DeepCollectionEquality().hash(validFrom),
      const DeepCollectionEquality().hash(validTo));

  @JsonKey(ignore: true)
  @override
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
