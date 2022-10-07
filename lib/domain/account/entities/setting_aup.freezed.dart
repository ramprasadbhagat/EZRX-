// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_aup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingAup {
  bool get acceptAUP => throw _privateConstructorUsedError;
  DateTime get acceptAUPTimestamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingAupCopyWith<SettingAup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingAupCopyWith<$Res> {
  factory $SettingAupCopyWith(
          SettingAup value, $Res Function(SettingAup) then) =
      _$SettingAupCopyWithImpl<$Res>;
  $Res call({bool acceptAUP, DateTime acceptAUPTimestamp});
}

/// @nodoc
class _$SettingAupCopyWithImpl<$Res> implements $SettingAupCopyWith<$Res> {
  _$SettingAupCopyWithImpl(this._value, this._then);

  final SettingAup _value;
  // ignore: unused_field
  final $Res Function(SettingAup) _then;

  @override
  $Res call({
    Object? acceptAUP = freezed,
    Object? acceptAUPTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      acceptAUP: acceptAUP == freezed
          ? _value.acceptAUP
          : acceptAUP // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptAUPTimestamp: acceptAUPTimestamp == freezed
          ? _value.acceptAUPTimestamp
          : acceptAUPTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingAupCopyWith<$Res>
    implements $SettingAupCopyWith<$Res> {
  factory _$$_SettingAupCopyWith(
          _$_SettingAup value, $Res Function(_$_SettingAup) then) =
      __$$_SettingAupCopyWithImpl<$Res>;
  @override
  $Res call({bool acceptAUP, DateTime acceptAUPTimestamp});
}

/// @nodoc
class __$$_SettingAupCopyWithImpl<$Res> extends _$SettingAupCopyWithImpl<$Res>
    implements _$$_SettingAupCopyWith<$Res> {
  __$$_SettingAupCopyWithImpl(
      _$_SettingAup _value, $Res Function(_$_SettingAup) _then)
      : super(_value, (v) => _then(v as _$_SettingAup));

  @override
  _$_SettingAup get _value => super._value as _$_SettingAup;

  @override
  $Res call({
    Object? acceptAUP = freezed,
    Object? acceptAUPTimestamp = freezed,
  }) {
    return _then(_$_SettingAup(
      acceptAUP: acceptAUP == freezed
          ? _value.acceptAUP
          : acceptAUP // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptAUPTimestamp: acceptAUPTimestamp == freezed
          ? _value.acceptAUPTimestamp
          : acceptAUPTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_SettingAup extends _SettingAup {
  const _$_SettingAup(
      {required this.acceptAUP, required this.acceptAUPTimestamp})
      : super._();

  @override
  final bool acceptAUP;
  @override
  final DateTime acceptAUPTimestamp;

  @override
  String toString() {
    return 'SettingAup(acceptAUP: $acceptAUP, acceptAUPTimestamp: $acceptAUPTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingAup &&
            const DeepCollectionEquality().equals(other.acceptAUP, acceptAUP) &&
            const DeepCollectionEquality()
                .equals(other.acceptAUPTimestamp, acceptAUPTimestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(acceptAUP),
      const DeepCollectionEquality().hash(acceptAUPTimestamp));

  @JsonKey(ignore: true)
  @override
  _$$_SettingAupCopyWith<_$_SettingAup> get copyWith =>
      __$$_SettingAupCopyWithImpl<_$_SettingAup>(this, _$identity);
}

abstract class _SettingAup extends SettingAup {
  const factory _SettingAup(
      {required final bool acceptAUP,
      required final DateTime acceptAUPTimestamp}) = _$_SettingAup;
  const _SettingAup._() : super._();

  @override
  bool get acceptAUP;
  @override
  DateTime get acceptAUPTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$_SettingAupCopyWith<_$_SettingAup> get copyWith =>
      throw _privateConstructorUsedError;
}
