// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_tc_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingTcDto _$SettingTcDtoFromJson(Map<String, dynamic> json) {
  return _SettingTcDto.fromJson(json);
}

/// @nodoc
mixin _$SettingTcDto {
  @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
  bool get acceptPrivacyPolicy => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'acceptPrivacyPolicyTime',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptPrivacyPolicyTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
  String get privacyPolicyAcceptedPlatform =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingTcDtoCopyWith<SettingTcDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingTcDtoCopyWith<$Res> {
  factory $SettingTcDtoCopyWith(
          SettingTcDto value, $Res Function(SettingTcDto) then) =
      _$SettingTcDtoCopyWithImpl<$Res, SettingTcDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
          bool acceptPrivacyPolicy,
      @JsonKey(name: 'acceptPrivacyPolicyTime', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptPrivacyPolicyTime,
      @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
          String privacyPolicyAcceptedPlatform});
}

/// @nodoc
class _$SettingTcDtoCopyWithImpl<$Res, $Val extends SettingTcDto>
    implements $SettingTcDtoCopyWith<$Res> {
  _$SettingTcDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptPrivacyPolicy = null,
    Object? acceptPrivacyPolicyTime = null,
    Object? privacyPolicyAcceptedPlatform = null,
  }) {
    return _then(_value.copyWith(
      acceptPrivacyPolicy: null == acceptPrivacyPolicy
          ? _value.acceptPrivacyPolicy
          : acceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacyPolicyTime: null == acceptPrivacyPolicyTime
          ? _value.acceptPrivacyPolicyTime
          : acceptPrivacyPolicyTime // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyAcceptedPlatform: null == privacyPolicyAcceptedPlatform
          ? _value.privacyPolicyAcceptedPlatform
          : privacyPolicyAcceptedPlatform // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingTcDtoCopyWith<$Res>
    implements $SettingTcDtoCopyWith<$Res> {
  factory _$$_SettingTcDtoCopyWith(
          _$_SettingTcDto value, $Res Function(_$_SettingTcDto) then) =
      __$$_SettingTcDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
          bool acceptPrivacyPolicy,
      @JsonKey(name: 'acceptPrivacyPolicyTime', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptPrivacyPolicyTime,
      @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
          String privacyPolicyAcceptedPlatform});
}

/// @nodoc
class __$$_SettingTcDtoCopyWithImpl<$Res>
    extends _$SettingTcDtoCopyWithImpl<$Res, _$_SettingTcDto>
    implements _$$_SettingTcDtoCopyWith<$Res> {
  __$$_SettingTcDtoCopyWithImpl(
      _$_SettingTcDto _value, $Res Function(_$_SettingTcDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptPrivacyPolicy = null,
    Object? acceptPrivacyPolicyTime = null,
    Object? privacyPolicyAcceptedPlatform = null,
  }) {
    return _then(_$_SettingTcDto(
      acceptPrivacyPolicy: null == acceptPrivacyPolicy
          ? _value.acceptPrivacyPolicy
          : acceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacyPolicyTime: null == acceptPrivacyPolicyTime
          ? _value.acceptPrivacyPolicyTime
          : acceptPrivacyPolicyTime // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyAcceptedPlatform: null == privacyPolicyAcceptedPlatform
          ? _value.privacyPolicyAcceptedPlatform
          : privacyPolicyAcceptedPlatform // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_SettingTcDto extends _SettingTcDto {
  const _$_SettingTcDto(
      {@JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
          required this.acceptPrivacyPolicy,
      @JsonKey(name: 'acceptPrivacyPolicyTime', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required this.acceptPrivacyPolicyTime,
      @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
          required this.privacyPolicyAcceptedPlatform})
      : super._();

  factory _$_SettingTcDto.fromJson(Map<String, dynamic> json) =>
      _$$_SettingTcDtoFromJson(json);

  @override
  @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
  final bool acceptPrivacyPolicy;
  @override
  @JsonKey(
      name: 'acceptPrivacyPolicyTime',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  final String acceptPrivacyPolicyTime;
  @override
  @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
  final String privacyPolicyAcceptedPlatform;

  @override
  String toString() {
    return 'SettingTcDto(acceptPrivacyPolicy: $acceptPrivacyPolicy, acceptPrivacyPolicyTime: $acceptPrivacyPolicyTime, privacyPolicyAcceptedPlatform: $privacyPolicyAcceptedPlatform)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingTcDto &&
            (identical(other.acceptPrivacyPolicy, acceptPrivacyPolicy) ||
                other.acceptPrivacyPolicy == acceptPrivacyPolicy) &&
            (identical(
                    other.acceptPrivacyPolicyTime, acceptPrivacyPolicyTime) ||
                other.acceptPrivacyPolicyTime == acceptPrivacyPolicyTime) &&
            (identical(other.privacyPolicyAcceptedPlatform,
                    privacyPolicyAcceptedPlatform) ||
                other.privacyPolicyAcceptedPlatform ==
                    privacyPolicyAcceptedPlatform));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, acceptPrivacyPolicy,
      acceptPrivacyPolicyTime, privacyPolicyAcceptedPlatform);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingTcDtoCopyWith<_$_SettingTcDto> get copyWith =>
      __$$_SettingTcDtoCopyWithImpl<_$_SettingTcDto>(this, _$identity);
}

abstract class _SettingTcDto extends SettingTcDto {
  const factory _SettingTcDto(
      {@JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
          required final bool acceptPrivacyPolicy,
      @JsonKey(name: 'acceptPrivacyPolicyTime', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required final String acceptPrivacyPolicyTime,
      @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
          required final String privacyPolicyAcceptedPlatform}) = _$_SettingTcDto;
  const _SettingTcDto._() : super._();

  factory _SettingTcDto.fromJson(Map<String, dynamic> json) =
      _$_SettingTcDto.fromJson;

  @override
  @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
  bool get acceptPrivacyPolicy;
  @override
  @JsonKey(
      name: 'acceptPrivacyPolicyTime',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptPrivacyPolicyTime;
  @override
  @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
  String get privacyPolicyAcceptedPlatform;
  @override
  @JsonKey(ignore: true)
  _$$_SettingTcDtoCopyWith<_$_SettingTcDto> get copyWith =>
      throw _privateConstructorUsedError;
}
