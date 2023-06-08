// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_payment_advice_footer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ManagePaymentAdviceFooterResponse {
  PaymentAdviceResponseMessage get message =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManagePaymentAdviceFooterResponseCopyWith<ManagePaymentAdviceFooterResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagePaymentAdviceFooterResponseCopyWith<$Res> {
  factory $ManagePaymentAdviceFooterResponseCopyWith(
          ManagePaymentAdviceFooterResponse value,
          $Res Function(ManagePaymentAdviceFooterResponse) then) =
      _$ManagePaymentAdviceFooterResponseCopyWithImpl<$Res,
          ManagePaymentAdviceFooterResponse>;
  @useResult
  $Res call({PaymentAdviceResponseMessage message});
}

/// @nodoc
class _$ManagePaymentAdviceFooterResponseCopyWithImpl<$Res,
        $Val extends ManagePaymentAdviceFooterResponse>
    implements $ManagePaymentAdviceFooterResponseCopyWith<$Res> {
  _$ManagePaymentAdviceFooterResponseCopyWithImpl(this._value, this._then);

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
              as PaymentAdviceResponseMessage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ManagePaymentAdviceFooterResponseCopyWith<$Res>
    implements $ManagePaymentAdviceFooterResponseCopyWith<$Res> {
  factory _$$_ManagePaymentAdviceFooterResponseCopyWith(
          _$_ManagePaymentAdviceFooterResponse value,
          $Res Function(_$_ManagePaymentAdviceFooterResponse) then) =
      __$$_ManagePaymentAdviceFooterResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentAdviceResponseMessage message});
}

/// @nodoc
class __$$_ManagePaymentAdviceFooterResponseCopyWithImpl<$Res>
    extends _$ManagePaymentAdviceFooterResponseCopyWithImpl<$Res,
        _$_ManagePaymentAdviceFooterResponse>
    implements _$$_ManagePaymentAdviceFooterResponseCopyWith<$Res> {
  __$$_ManagePaymentAdviceFooterResponseCopyWithImpl(
      _$_ManagePaymentAdviceFooterResponse _value,
      $Res Function(_$_ManagePaymentAdviceFooterResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ManagePaymentAdviceFooterResponse(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as PaymentAdviceResponseMessage,
    ));
  }
}

/// @nodoc

class _$_ManagePaymentAdviceFooterResponse
    extends _ManagePaymentAdviceFooterResponse {
  _$_ManagePaymentAdviceFooterResponse({required this.message}) : super._();

  @override
  final PaymentAdviceResponseMessage message;

  @override
  String toString() {
    return 'ManagePaymentAdviceFooterResponse(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManagePaymentAdviceFooterResponse &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManagePaymentAdviceFooterResponseCopyWith<
          _$_ManagePaymentAdviceFooterResponse>
      get copyWith => __$$_ManagePaymentAdviceFooterResponseCopyWithImpl<
          _$_ManagePaymentAdviceFooterResponse>(this, _$identity);
}

abstract class _ManagePaymentAdviceFooterResponse
    extends ManagePaymentAdviceFooterResponse {
  factory _ManagePaymentAdviceFooterResponse(
          {required final PaymentAdviceResponseMessage message}) =
      _$_ManagePaymentAdviceFooterResponse;
  _ManagePaymentAdviceFooterResponse._() : super._();

  @override
  PaymentAdviceResponseMessage get message;
  @override
  @JsonKey(ignore: true)
  _$$_ManagePaymentAdviceFooterResponseCopyWith<
          _$_ManagePaymentAdviceFooterResponse>
      get copyWith => throw _privateConstructorUsedError;
}
