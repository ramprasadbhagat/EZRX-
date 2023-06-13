// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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

  @JsonKey(ignore: true)
  $SettingTcCopyWith<SettingTc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingTcCopyWith<$Res> {
  factory $SettingTcCopyWith(SettingTc value, $Res Function(SettingTc) then) =
      _$SettingTcCopyWithImpl<$Res, SettingTc>;
  @useResult
  $Res call({bool acceptTC});
}

/// @nodoc
class _$SettingTcCopyWithImpl<$Res, $Val extends SettingTc>
    implements $SettingTcCopyWith<$Res> {
  _$SettingTcCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptTC = null,
  }) {
    return _then(_value.copyWith(
      acceptTC: null == acceptTC
          ? _value.acceptTC
          : acceptTC // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingTcCopyWith<$Res> implements $SettingTcCopyWith<$Res> {
  factory _$$_SettingTcCopyWith(
          _$_SettingTc value, $Res Function(_$_SettingTc) then) =
      __$$_SettingTcCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool acceptTC});
}

/// @nodoc
class __$$_SettingTcCopyWithImpl<$Res>
    extends _$SettingTcCopyWithImpl<$Res, _$_SettingTc>
    implements _$$_SettingTcCopyWith<$Res> {
  __$$_SettingTcCopyWithImpl(
      _$_SettingTc _value, $Res Function(_$_SettingTc) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptTC = null,
  }) {
    return _then(_$_SettingTc(
      acceptTC: null == acceptTC
          ? _value.acceptTC
          : acceptTC // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SettingTc extends _SettingTc {
  const _$_SettingTc({required this.acceptTC}) : super._();

  @override
  final bool acceptTC;

  @override
  String toString() {
    return 'SettingTc(acceptTC: $acceptTC)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingTc &&
            (identical(other.acceptTC, acceptTC) ||
                other.acceptTC == acceptTC));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acceptTC);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingTcCopyWith<_$_SettingTc> get copyWith =>
      __$$_SettingTcCopyWithImpl<_$_SettingTc>(this, _$identity);
}

abstract class _SettingTc extends SettingTc {
  const factory _SettingTc({required final bool acceptTC}) = _$_SettingTc;
  const _SettingTc._() : super._();

  @override
  bool get acceptTC;
  @override
  @JsonKey(ignore: true)
  _$$_SettingTcCopyWith<_$_SettingTc> get copyWith =>
      throw _privateConstructorUsedError;
}
