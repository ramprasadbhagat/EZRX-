// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_tc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingTc {
  bool get acceptTC => throw _privateConstructorUsedError;
  String get acceptTCTimestamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingTcCopyWith<SettingTc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingTcCopyWith<$Res> {
  factory $SettingTcCopyWith(SettingTc value, $Res Function(SettingTc) then) =
      _$SettingTcCopyWithImpl<$Res>;
  $Res call({bool acceptTC, String acceptTCTimestamp});
}

/// @nodoc
class _$SettingTcCopyWithImpl<$Res> implements $SettingTcCopyWith<$Res> {
  _$SettingTcCopyWithImpl(this._value, this._then);

  final SettingTc _value;
  // ignore: unused_field
  final $Res Function(SettingTc) _then;

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
abstract class _$$_SettingTcCopyWith<$Res> implements $SettingTcCopyWith<$Res> {
  factory _$$_SettingTcCopyWith(
          _$_SettingTc value, $Res Function(_$_SettingTc) then) =
      __$$_SettingTcCopyWithImpl<$Res>;
  @override
  $Res call({bool acceptTC, String acceptTCTimestamp});
}

/// @nodoc
class __$$_SettingTcCopyWithImpl<$Res> extends _$SettingTcCopyWithImpl<$Res>
    implements _$$_SettingTcCopyWith<$Res> {
  __$$_SettingTcCopyWithImpl(
      _$_SettingTc _value, $Res Function(_$_SettingTc) _then)
      : super(_value, (v) => _then(v as _$_SettingTc));

  @override
  _$_SettingTc get _value => super._value as _$_SettingTc;

  @override
  $Res call({
    Object? acceptTC = freezed,
    Object? acceptTCTimestamp = freezed,
  }) {
    return _then(_$_SettingTc(
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

class _$_SettingTc extends _SettingTc {
  const _$_SettingTc({required this.acceptTC, required this.acceptTCTimestamp})
      : super._();

  @override
  final bool acceptTC;
  @override
  final String acceptTCTimestamp;

  @override
  String toString() {
    return 'SettingTc(acceptTC: $acceptTC, acceptTCTimestamp: $acceptTCTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingTc &&
            const DeepCollectionEquality().equals(other.acceptTC, acceptTC) &&
            const DeepCollectionEquality()
                .equals(other.acceptTCTimestamp, acceptTCTimestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(acceptTC),
      const DeepCollectionEquality().hash(acceptTCTimestamp));

  @JsonKey(ignore: true)
  @override
  _$$_SettingTcCopyWith<_$_SettingTc> get copyWith =>
      __$$_SettingTcCopyWithImpl<_$_SettingTc>(this, _$identity);
}

abstract class _SettingTc extends SettingTc {
  const factory _SettingTc(
      {required final bool acceptTC,
      required final String acceptTCTimestamp}) = _$_SettingTc;
  const _SettingTc._() : super._();

  @override
  bool get acceptTC;
  @override
  String get acceptTCTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$_SettingTcCopyWith<_$_SettingTc> get copyWith =>
      throw _privateConstructorUsedError;
}
