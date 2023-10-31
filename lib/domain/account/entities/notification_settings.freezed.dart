// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationSettings {
  NotificationSetting get orderConfirmation =>
      throw _privateConstructorUsedError;
  NotificationSetting get paymentConfirmation =>
      throw _privateConstructorUsedError;
  NotificationSetting get ereturnConfirmation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call(
      {NotificationSetting orderConfirmation,
      NotificationSetting paymentConfirmation,
      NotificationSetting ereturnConfirmation});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res,
        $Val extends NotificationSettings>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderConfirmation = null,
    Object? paymentConfirmation = null,
    Object? ereturnConfirmation = null,
  }) {
    return _then(_value.copyWith(
      orderConfirmation: null == orderConfirmation
          ? _value.orderConfirmation
          : orderConfirmation // ignore: cast_nullable_to_non_nullable
              as NotificationSetting,
      paymentConfirmation: null == paymentConfirmation
          ? _value.paymentConfirmation
          : paymentConfirmation // ignore: cast_nullable_to_non_nullable
              as NotificationSetting,
      ereturnConfirmation: null == ereturnConfirmation
          ? _value.ereturnConfirmation
          : ereturnConfirmation // ignore: cast_nullable_to_non_nullable
              as NotificationSetting,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationSettingsCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$_NotificationSettingsCopyWith(_$_NotificationSettings value,
          $Res Function(_$_NotificationSettings) then) =
      __$$_NotificationSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NotificationSetting orderConfirmation,
      NotificationSetting paymentConfirmation,
      NotificationSetting ereturnConfirmation});
}

/// @nodoc
class __$$_NotificationSettingsCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$_NotificationSettings>
    implements _$$_NotificationSettingsCopyWith<$Res> {
  __$$_NotificationSettingsCopyWithImpl(_$_NotificationSettings _value,
      $Res Function(_$_NotificationSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderConfirmation = null,
    Object? paymentConfirmation = null,
    Object? ereturnConfirmation = null,
  }) {
    return _then(_$_NotificationSettings(
      orderConfirmation: null == orderConfirmation
          ? _value.orderConfirmation
          : orderConfirmation // ignore: cast_nullable_to_non_nullable
              as NotificationSetting,
      paymentConfirmation: null == paymentConfirmation
          ? _value.paymentConfirmation
          : paymentConfirmation // ignore: cast_nullable_to_non_nullable
              as NotificationSetting,
      ereturnConfirmation: null == ereturnConfirmation
          ? _value.ereturnConfirmation
          : ereturnConfirmation // ignore: cast_nullable_to_non_nullable
              as NotificationSetting,
    ));
  }
}

/// @nodoc

class _$_NotificationSettings extends _NotificationSettings {
  const _$_NotificationSettings(
      {required this.orderConfirmation,
      required this.paymentConfirmation,
      required this.ereturnConfirmation})
      : super._();

  @override
  final NotificationSetting orderConfirmation;
  @override
  final NotificationSetting paymentConfirmation;
  @override
  final NotificationSetting ereturnConfirmation;

  @override
  String toString() {
    return 'NotificationSettings(orderConfirmation: $orderConfirmation, paymentConfirmation: $paymentConfirmation, ereturnConfirmation: $ereturnConfirmation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationSettings &&
            (identical(other.orderConfirmation, orderConfirmation) ||
                other.orderConfirmation == orderConfirmation) &&
            (identical(other.paymentConfirmation, paymentConfirmation) ||
                other.paymentConfirmation == paymentConfirmation) &&
            (identical(other.ereturnConfirmation, ereturnConfirmation) ||
                other.ereturnConfirmation == ereturnConfirmation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, orderConfirmation, paymentConfirmation, ereturnConfirmation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationSettingsCopyWith<_$_NotificationSettings> get copyWith =>
      __$$_NotificationSettingsCopyWithImpl<_$_NotificationSettings>(
          this, _$identity);
}

abstract class _NotificationSettings extends NotificationSettings {
  const factory _NotificationSettings(
          {required final NotificationSetting orderConfirmation,
          required final NotificationSetting paymentConfirmation,
          required final NotificationSetting ereturnConfirmation}) =
      _$_NotificationSettings;
  const _NotificationSettings._() : super._();

  @override
  NotificationSetting get orderConfirmation;
  @override
  NotificationSetting get paymentConfirmation;
  @override
  NotificationSetting get ereturnConfirmation;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationSettingsCopyWith<_$_NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
