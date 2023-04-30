// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LicenseInfo {
  String get licenceType => throw _privateConstructorUsedError;
  String get licenseDescription => throw _privateConstructorUsedError;
  String get licenseNumber => throw _privateConstructorUsedError;
  String get validFrom => throw _privateConstructorUsedError;
  String get validTo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LicenseInfoCopyWith<LicenseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseInfoCopyWith<$Res> {
  factory $LicenseInfoCopyWith(
          LicenseInfo value, $Res Function(LicenseInfo) then) =
      _$LicenseInfoCopyWithImpl<$Res, LicenseInfo>;
  @useResult
  $Res call(
      {String licenceType,
      String licenseDescription,
      String licenseNumber,
      String validFrom,
      String validTo});
}

/// @nodoc
class _$LicenseInfoCopyWithImpl<$Res, $Val extends LicenseInfo>
    implements $LicenseInfoCopyWith<$Res> {
  _$LicenseInfoCopyWithImpl(this._value, this._then);

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
abstract class _$$_LicenseInfoCopyWith<$Res>
    implements $LicenseInfoCopyWith<$Res> {
  factory _$$_LicenseInfoCopyWith(
          _$_LicenseInfo value, $Res Function(_$_LicenseInfo) then) =
      __$$_LicenseInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String licenceType,
      String licenseDescription,
      String licenseNumber,
      String validFrom,
      String validTo});
}

/// @nodoc
class __$$_LicenseInfoCopyWithImpl<$Res>
    extends _$LicenseInfoCopyWithImpl<$Res, _$_LicenseInfo>
    implements _$$_LicenseInfoCopyWith<$Res> {
  __$$_LicenseInfoCopyWithImpl(
      _$_LicenseInfo _value, $Res Function(_$_LicenseInfo) _then)
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
    return _then(_$_LicenseInfo(
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

class _$_LicenseInfo extends _LicenseInfo {
  const _$_LicenseInfo(
      {required this.licenceType,
      required this.licenseDescription,
      required this.licenseNumber,
      required this.validFrom,
      required this.validTo})
      : super._();

  @override
  final String licenceType;
  @override
  final String licenseDescription;
  @override
  final String licenseNumber;
  @override
  final String validFrom;
  @override
  final String validTo;

  @override
  String toString() {
    return 'LicenseInfo(licenceType: $licenceType, licenseDescription: $licenseDescription, licenseNumber: $licenseNumber, validFrom: $validFrom, validTo: $validTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LicenseInfo &&
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

  @override
  int get hashCode => Object.hash(runtimeType, licenceType, licenseDescription,
      licenseNumber, validFrom, validTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LicenseInfoCopyWith<_$_LicenseInfo> get copyWith =>
      __$$_LicenseInfoCopyWithImpl<_$_LicenseInfo>(this, _$identity);
}

abstract class _LicenseInfo extends LicenseInfo {
  const factory _LicenseInfo(
      {required final String licenceType,
      required final String licenseDescription,
      required final String licenseNumber,
      required final String validFrom,
      required final String validTo}) = _$_LicenseInfo;
  const _LicenseInfo._() : super._();

  @override
  String get licenceType;
  @override
  String get licenseDescription;
  @override
  String get licenseNumber;
  @override
  String get validFrom;
  @override
  String get validTo;
  @override
  @JsonKey(ignore: true)
  _$$_LicenseInfoCopyWith<_$_LicenseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
