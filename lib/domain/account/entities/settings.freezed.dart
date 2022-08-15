// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Settings {
  bool get emailNotifications => throw _privateConstructorUsedError;
  bool get mobileNotifications => throw _privateConstructorUsedError;
  String get languagePreference => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {bool emailNotifications,
      bool mobileNotifications,
      String languagePreference});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object? emailNotifications = freezed,
    Object? mobileNotifications = freezed,
    Object? languagePreference = freezed,
  }) {
    return _then(_value.copyWith(
      emailNotifications: emailNotifications == freezed
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: mobileNotifications == freezed
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      languagePreference: languagePreference == freezed
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool emailNotifications,
      bool mobileNotifications,
      String languagePreference});
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, (v) => _then(v as _$_Settings));

  @override
  _$_Settings get _value => super._value as _$_Settings;

  @override
  $Res call({
    Object? emailNotifications = freezed,
    Object? mobileNotifications = freezed,
    Object? languagePreference = freezed,
  }) {
    return _then(_$_Settings(
      emailNotifications: emailNotifications == freezed
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: mobileNotifications == freezed
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      languagePreference: languagePreference == freezed
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Settings extends _Settings {
  const _$_Settings(
      {required this.emailNotifications,
      required this.mobileNotifications,
      required this.languagePreference})
      : super._();

  @override
  final bool emailNotifications;
  @override
  final bool mobileNotifications;
  @override
  final String languagePreference;

  @override
  String toString() {
    return 'Settings(emailNotifications: $emailNotifications, mobileNotifications: $mobileNotifications, languagePreference: $languagePreference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            const DeepCollectionEquality()
                .equals(other.emailNotifications, emailNotifications) &&
            const DeepCollectionEquality()
                .equals(other.mobileNotifications, mobileNotifications) &&
            const DeepCollectionEquality()
                .equals(other.languagePreference, languagePreference));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailNotifications),
      const DeepCollectionEquality().hash(mobileNotifications),
      const DeepCollectionEquality().hash(languagePreference));

  @JsonKey(ignore: true)
  @override
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);
}

abstract class _Settings extends Settings {
  const factory _Settings(
      {required final bool emailNotifications,
      required final bool mobileNotifications,
      required final String languagePreference}) = _$_Settings;
  const _Settings._() : super._();

  @override
  bool get emailNotifications;
  @override
  bool get mobileNotifications;
  @override
  String get languagePreference;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
