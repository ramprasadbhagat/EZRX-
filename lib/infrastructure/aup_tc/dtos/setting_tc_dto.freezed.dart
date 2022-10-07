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
  @JsonKey(name: 'acceptTC')
  bool get acceptTC => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'acceptTCTimestamp',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptTCTimestamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingTcDtoCopyWith<SettingTcDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingTcDtoCopyWith<$Res> {
  factory $SettingTcDtoCopyWith(
          SettingTcDto value, $Res Function(SettingTcDto) then) =
      _$SettingTcDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'acceptTC')
          bool acceptTC,
      @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptTCTimestamp});
}

/// @nodoc
class _$SettingTcDtoCopyWithImpl<$Res> implements $SettingTcDtoCopyWith<$Res> {
  _$SettingTcDtoCopyWithImpl(this._value, this._then);

  final SettingTcDto _value;
  // ignore: unused_field
  final $Res Function(SettingTcDto) _then;

  @override
  $Res call({
    Object? acceptTC = freezed,
    Object? acceptTCTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      acceptTC: acceptTC == freezed
          ? _value.acceptTC
          : acceptTC // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptTCTimestamp: acceptTCTimestamp == freezed
          ? _value.acceptTCTimestamp
          : acceptTCTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingTcDtoCopyWith<$Res>
    implements $SettingTcDtoCopyWith<$Res> {
  factory _$$_SettingTcDtoCopyWith(
          _$_SettingTcDto value, $Res Function(_$_SettingTcDto) then) =
      __$$_SettingTcDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'acceptTC')
          bool acceptTC,
      @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptTCTimestamp});
}

/// @nodoc
class __$$_SettingTcDtoCopyWithImpl<$Res>
    extends _$SettingTcDtoCopyWithImpl<$Res>
    implements _$$_SettingTcDtoCopyWith<$Res> {
  __$$_SettingTcDtoCopyWithImpl(
      _$_SettingTcDto _value, $Res Function(_$_SettingTcDto) _then)
      : super(_value, (v) => _then(v as _$_SettingTcDto));

  @override
  _$_SettingTcDto get _value => super._value as _$_SettingTcDto;

  @override
  $Res call({
    Object? acceptTC = freezed,
    Object? acceptTCTimestamp = freezed,
  }) {
    return _then(_$_SettingTcDto(
      acceptTC: acceptTC == freezed
          ? _value.acceptTC
          : acceptTC // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptTCTimestamp: acceptTCTimestamp == freezed
          ? _value.acceptTCTimestamp
          : acceptTCTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_SettingTcDto extends _SettingTcDto {
  const _$_SettingTcDto(
      {@JsonKey(name: 'acceptTC')
          required this.acceptTC,
      @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required this.acceptTCTimestamp})
      : super._();

  factory _$_SettingTcDto.fromJson(Map<String, dynamic> json) =>
      _$$_SettingTcDtoFromJson(json);

  @override
  @JsonKey(name: 'acceptTC')
  final bool acceptTC;
  @override
  @JsonKey(
      name: 'acceptTCTimestamp',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  final String acceptTCTimestamp;

  @override
  String toString() {
    return 'SettingTcDto(acceptTC: $acceptTC, acceptTCTimestamp: $acceptTCTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingTcDto &&
            const DeepCollectionEquality().equals(other.acceptTC, acceptTC) &&
            const DeepCollectionEquality()
                .equals(other.acceptTCTimestamp, acceptTCTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(acceptTC),
      const DeepCollectionEquality().hash(acceptTCTimestamp));

  @JsonKey(ignore: true)
  @override
  _$$_SettingTcDtoCopyWith<_$_SettingTcDto> get copyWith =>
      __$$_SettingTcDtoCopyWithImpl<_$_SettingTcDto>(this, _$identity);
}

abstract class _SettingTcDto extends SettingTcDto {
  const factory _SettingTcDto(
      {@JsonKey(name: 'acceptTC')
          required final bool acceptTC,
      @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required final String acceptTCTimestamp}) = _$_SettingTcDto;
  const _SettingTcDto._() : super._();

  factory _SettingTcDto.fromJson(Map<String, dynamic> json) =
      _$_SettingTcDto.fromJson;

  @override
  @JsonKey(name: 'acceptTC')
  bool get acceptTC;
  @override
  @JsonKey(
      name: 'acceptTCTimestamp',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptTCTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$_SettingTcDtoCopyWith<_$_SettingTcDto> get copyWith =>
      throw _privateConstructorUsedError;
}
