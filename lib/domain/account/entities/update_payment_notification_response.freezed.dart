// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_payment_notification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdatePaymentNotificationResponse {
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdatePaymentNotificationResponseCopyWith<UpdatePaymentNotificationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePaymentNotificationResponseCopyWith<$Res> {
  factory $UpdatePaymentNotificationResponseCopyWith(
          UpdatePaymentNotificationResponse value,
          $Res Function(UpdatePaymentNotificationResponse) then) =
      _$UpdatePaymentNotificationResponseCopyWithImpl<$Res,
          UpdatePaymentNotificationResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UpdatePaymentNotificationResponseCopyWithImpl<$Res,
        $Val extends UpdatePaymentNotificationResponse>
    implements $UpdatePaymentNotificationResponseCopyWith<$Res> {
  _$UpdatePaymentNotificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdatePaymentNotificationResponseCopyWith<$Res>
    implements $UpdatePaymentNotificationResponseCopyWith<$Res> {
  factory _$$_UpdatePaymentNotificationResponseCopyWith(
          _$_UpdatePaymentNotificationResponse value,
          $Res Function(_$_UpdatePaymentNotificationResponse) then) =
      __$$_UpdatePaymentNotificationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_UpdatePaymentNotificationResponseCopyWithImpl<$Res>
    extends _$UpdatePaymentNotificationResponseCopyWithImpl<$Res,
        _$_UpdatePaymentNotificationResponse>
    implements _$$_UpdatePaymentNotificationResponseCopyWith<$Res> {
  __$$_UpdatePaymentNotificationResponseCopyWithImpl(
      _$_UpdatePaymentNotificationResponse _value,
      $Res Function(_$_UpdatePaymentNotificationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_UpdatePaymentNotificationResponse(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdatePaymentNotificationResponse
    extends _UpdatePaymentNotificationResponse {
  const _$_UpdatePaymentNotificationResponse({required this.message})
      : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'UpdatePaymentNotificationResponse(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePaymentNotificationResponse &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePaymentNotificationResponseCopyWith<
          _$_UpdatePaymentNotificationResponse>
      get copyWith => __$$_UpdatePaymentNotificationResponseCopyWithImpl<
          _$_UpdatePaymentNotificationResponse>(this, _$identity);
}

abstract class _UpdatePaymentNotificationResponse
    extends UpdatePaymentNotificationResponse {
  const factory _UpdatePaymentNotificationResponse(
      {required final String message}) = _$_UpdatePaymentNotificationResponse;
  const _UpdatePaymentNotificationResponse._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatePaymentNotificationResponseCopyWith<
          _$_UpdatePaymentNotificationResponse>
      get copyWith => throw _privateConstructorUsedError;
}
