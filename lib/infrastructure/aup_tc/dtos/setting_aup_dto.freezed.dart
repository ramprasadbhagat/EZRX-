// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_aup_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingAupDto _$SettingAupDtoFromJson(Map<String, dynamic> json) {
  return _SettingAupDto.fromJson(json);
}

/// @nodoc
mixin _$SettingAupDto {
  @JsonKey(name: 'acceptAUP')
  bool get acceptAUP => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'acceptAUPTC',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptAUPTimestamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingAupDtoCopyWith<SettingAupDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingAupDtoCopyWith<$Res> {
  factory $SettingAupDtoCopyWith(
          SettingAupDto value, $Res Function(SettingAupDto) then) =
      _$SettingAupDtoCopyWithImpl<$Res, SettingAupDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'acceptAUP')
          bool acceptAUP,
      @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptAUPTimestamp});
}

/// @nodoc
class _$SettingAupDtoCopyWithImpl<$Res, $Val extends SettingAupDto>
    implements $SettingAupDtoCopyWith<$Res> {
  _$SettingAupDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptAUP = null,
    Object? acceptAUPTimestamp = null,
  }) {
    return _then(_value.copyWith(
      acceptAUP: null == acceptAUP
          ? _value.acceptAUP
          : acceptAUP // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptAUPTimestamp: null == acceptAUPTimestamp
          ? _value.acceptAUPTimestamp
          : acceptAUPTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingAupDtoCopyWith<$Res>
    implements $SettingAupDtoCopyWith<$Res> {
  factory _$$_SettingAupDtoCopyWith(
          _$_SettingAupDto value, $Res Function(_$_SettingAupDto) then) =
      __$$_SettingAupDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'acceptAUP')
          bool acceptAUP,
      @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptAUPTimestamp});
}

/// @nodoc
class __$$_SettingAupDtoCopyWithImpl<$Res>
    extends _$SettingAupDtoCopyWithImpl<$Res, _$_SettingAupDto>
    implements _$$_SettingAupDtoCopyWith<$Res> {
  __$$_SettingAupDtoCopyWithImpl(
      _$_SettingAupDto _value, $Res Function(_$_SettingAupDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptAUP = null,
    Object? acceptAUPTimestamp = null,
  }) {
    return _then(_$_SettingAupDto(
      acceptAUP: null == acceptAUP
          ? _value.acceptAUP
          : acceptAUP // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptAUPTimestamp: null == acceptAUPTimestamp
          ? _value.acceptAUPTimestamp
          : acceptAUPTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_SettingAupDto extends _SettingAupDto {
  const _$_SettingAupDto(
      {@JsonKey(name: 'acceptAUP')
          required this.acceptAUP,
      @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required this.acceptAUPTimestamp})
      : super._();

  factory _$_SettingAupDto.fromJson(Map<String, dynamic> json) =>
      _$$_SettingAupDtoFromJson(json);

  @override
  @JsonKey(name: 'acceptAUP')
  final bool acceptAUP;
  @override
  @JsonKey(
      name: 'acceptAUPTC',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  final String acceptAUPTimestamp;

  @override
  String toString() {
    return 'SettingAupDto(acceptAUP: $acceptAUP, acceptAUPTimestamp: $acceptAUPTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingAupDto &&
            (identical(other.acceptAUP, acceptAUP) ||
                other.acceptAUP == acceptAUP) &&
            (identical(other.acceptAUPTimestamp, acceptAUPTimestamp) ||
                other.acceptAUPTimestamp == acceptAUPTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, acceptAUP, acceptAUPTimestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingAupDtoCopyWith<_$_SettingAupDto> get copyWith =>
      __$$_SettingAupDtoCopyWithImpl<_$_SettingAupDto>(this, _$identity);
}

abstract class _SettingAupDto extends SettingAupDto {
  const factory _SettingAupDto(
      {@JsonKey(name: 'acceptAUP')
          required final bool acceptAUP,
      @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required final String acceptAUPTimestamp}) = _$_SettingAupDto;
  const _SettingAupDto._() : super._();

  factory _SettingAupDto.fromJson(Map<String, dynamic> json) =
      _$_SettingAupDto.fromJson;

  @override
  @JsonKey(name: 'acceptAUP')
  bool get acceptAUP;
  @override
  @JsonKey(
      name: 'acceptAUPTC',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptAUPTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$_SettingAupDtoCopyWith<_$_SettingAupDto> get copyWith =>
      throw _privateConstructorUsedError;
}
