// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_payment_advice_footer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPaymentAdviceFooterResponse {
  StringValue get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPaymentAdviceFooterResponseCopyWith<AddPaymentAdviceFooterResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPaymentAdviceFooterResponseCopyWith<$Res> {
  factory $AddPaymentAdviceFooterResponseCopyWith(
          AddPaymentAdviceFooterResponse value,
          $Res Function(AddPaymentAdviceFooterResponse) then) =
      _$AddPaymentAdviceFooterResponseCopyWithImpl<$Res,
          AddPaymentAdviceFooterResponse>;
  @useResult
  $Res call({StringValue message});
}

/// @nodoc
class _$AddPaymentAdviceFooterResponseCopyWithImpl<$Res,
        $Val extends AddPaymentAdviceFooterResponse>
    implements $AddPaymentAdviceFooterResponseCopyWith<$Res> {
  _$AddPaymentAdviceFooterResponseCopyWithImpl(this._value, this._then);

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
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddPaymentAdviceFooterResponseCopyWith<$Res>
    implements $AddPaymentAdviceFooterResponseCopyWith<$Res> {
  factory _$$_AddPaymentAdviceFooterResponseCopyWith(
          _$_AddPaymentAdviceFooterResponse value,
          $Res Function(_$_AddPaymentAdviceFooterResponse) then) =
      __$$_AddPaymentAdviceFooterResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StringValue message});
}

/// @nodoc
class __$$_AddPaymentAdviceFooterResponseCopyWithImpl<$Res>
    extends _$AddPaymentAdviceFooterResponseCopyWithImpl<$Res,
        _$_AddPaymentAdviceFooterResponse>
    implements _$$_AddPaymentAdviceFooterResponseCopyWith<$Res> {
  __$$_AddPaymentAdviceFooterResponseCopyWithImpl(
      _$_AddPaymentAdviceFooterResponse _value,
      $Res Function(_$_AddPaymentAdviceFooterResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_AddPaymentAdviceFooterResponse(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_AddPaymentAdviceFooterResponse
    extends _AddPaymentAdviceFooterResponse {
  _$_AddPaymentAdviceFooterResponse({required this.message}) : super._();

  @override
  final StringValue message;

  @override
  String toString() {
    return 'AddPaymentAdviceFooterResponse(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPaymentAdviceFooterResponse &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPaymentAdviceFooterResponseCopyWith<_$_AddPaymentAdviceFooterResponse>
      get copyWith => __$$_AddPaymentAdviceFooterResponseCopyWithImpl<
          _$_AddPaymentAdviceFooterResponse>(this, _$identity);
}

abstract class _AddPaymentAdviceFooterResponse
    extends AddPaymentAdviceFooterResponse {
  factory _AddPaymentAdviceFooterResponse(
      {required final StringValue message}) = _$_AddPaymentAdviceFooterResponse;
  _AddPaymentAdviceFooterResponse._() : super._();

  @override
  StringValue get message;
  @override
  @JsonKey(ignore: true)
  _$$_AddPaymentAdviceFooterResponseCopyWith<_$_AddPaymentAdviceFooterResponse>
      get copyWith => throw _privateConstructorUsedError;
}
