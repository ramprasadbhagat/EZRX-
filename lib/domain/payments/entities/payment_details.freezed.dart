// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentDetails {
  StringValue get vaNumber => throw _privateConstructorUsedError;
  StringValue get vaName => throw _privateConstructorUsedError;
  DateTimeStringValue get expiresAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentDetailsCopyWith<PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsCopyWith<$Res> {
  factory $PaymentDetailsCopyWith(
          PaymentDetails value, $Res Function(PaymentDetails) then) =
      _$PaymentDetailsCopyWithImpl<$Res, PaymentDetails>;
  @useResult
  $Res call(
      {StringValue vaNumber,
      StringValue vaName,
      DateTimeStringValue expiresAt});
}

/// @nodoc
class _$PaymentDetailsCopyWithImpl<$Res, $Val extends PaymentDetails>
    implements $PaymentDetailsCopyWith<$Res> {
  _$PaymentDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaNumber = null,
    Object? vaName = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      vaNumber: null == vaNumber
          ? _value.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      vaName: null == vaName
          ? _value.vaName
          : vaName // ignore: cast_nullable_to_non_nullable
              as StringValue,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentDetailsCopyWith<$Res>
    implements $PaymentDetailsCopyWith<$Res> {
  factory _$$_PaymentDetailsCopyWith(
          _$_PaymentDetails value, $Res Function(_$_PaymentDetails) then) =
      __$$_PaymentDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringValue vaNumber,
      StringValue vaName,
      DateTimeStringValue expiresAt});
}

/// @nodoc
class __$$_PaymentDetailsCopyWithImpl<$Res>
    extends _$PaymentDetailsCopyWithImpl<$Res, _$_PaymentDetails>
    implements _$$_PaymentDetailsCopyWith<$Res> {
  __$$_PaymentDetailsCopyWithImpl(
      _$_PaymentDetails _value, $Res Function(_$_PaymentDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaNumber = null,
    Object? vaName = null,
    Object? expiresAt = null,
  }) {
    return _then(_$_PaymentDetails(
      vaNumber: null == vaNumber
          ? _value.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      vaName: null == vaName
          ? _value.vaName
          : vaName // ignore: cast_nullable_to_non_nullable
              as StringValue,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ));
  }
}

/// @nodoc

class _$_PaymentDetails extends _PaymentDetails {
  const _$_PaymentDetails(
      {required this.vaNumber, required this.vaName, required this.expiresAt})
      : super._();

  @override
  final StringValue vaNumber;
  @override
  final StringValue vaName;
  @override
  final DateTimeStringValue expiresAt;

  @override
  String toString() {
    return 'PaymentDetails(vaNumber: $vaNumber, vaName: $vaName, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentDetails &&
            (identical(other.vaNumber, vaNumber) ||
                other.vaNumber == vaNumber) &&
            (identical(other.vaName, vaName) || other.vaName == vaName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vaNumber, vaName, expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentDetailsCopyWith<_$_PaymentDetails> get copyWith =>
      __$$_PaymentDetailsCopyWithImpl<_$_PaymentDetails>(this, _$identity);
}

abstract class _PaymentDetails extends PaymentDetails {
  const factory _PaymentDetails(
      {required final StringValue vaNumber,
      required final StringValue vaName,
      required final DateTimeStringValue expiresAt}) = _$_PaymentDetails;
  const _PaymentDetails._() : super._();

  @override
  StringValue get vaNumber;
  @override
  StringValue get vaName;
  @override
  DateTimeStringValue get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentDetailsCopyWith<_$_PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
