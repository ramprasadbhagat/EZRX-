// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentInfo {
  String get paymentID => throw _privateConstructorUsedError;
  String get paymentBatchAdditionalInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentInfoCopyWith<PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoCopyWith<$Res> {
  factory $PaymentInfoCopyWith(
          PaymentInfo value, $Res Function(PaymentInfo) then) =
      _$PaymentInfoCopyWithImpl<$Res, PaymentInfo>;
  @useResult
  $Res call({String paymentID, String paymentBatchAdditionalInfo});
}

/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res, $Val extends PaymentInfo>
    implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentID = null,
    Object? paymentBatchAdditionalInfo = null,
  }) {
    return _then(_value.copyWith(
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentInfoCopyWith<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  factory _$$_PaymentInfoCopyWith(
          _$_PaymentInfo value, $Res Function(_$_PaymentInfo) then) =
      __$$_PaymentInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String paymentID, String paymentBatchAdditionalInfo});
}

/// @nodoc
class __$$_PaymentInfoCopyWithImpl<$Res>
    extends _$PaymentInfoCopyWithImpl<$Res, _$_PaymentInfo>
    implements _$$_PaymentInfoCopyWith<$Res> {
  __$$_PaymentInfoCopyWithImpl(
      _$_PaymentInfo _value, $Res Function(_$_PaymentInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentID = null,
    Object? paymentBatchAdditionalInfo = null,
  }) {
    return _then(_$_PaymentInfo(
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PaymentInfo extends _PaymentInfo {
  const _$_PaymentInfo(
      {required this.paymentID, required this.paymentBatchAdditionalInfo})
      : super._();

  @override
  final String paymentID;
  @override
  final String paymentBatchAdditionalInfo;

  @override
  String toString() {
    return 'PaymentInfo(paymentID: $paymentID, paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentInfo &&
            (identical(other.paymentID, paymentID) ||
                other.paymentID == paymentID) &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentID, paymentBatchAdditionalInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentInfoCopyWith<_$_PaymentInfo> get copyWith =>
      __$$_PaymentInfoCopyWithImpl<_$_PaymentInfo>(this, _$identity);
}

abstract class _PaymentInfo extends PaymentInfo {
  const factory _PaymentInfo(
      {required final String paymentID,
      required final String paymentBatchAdditionalInfo}) = _$_PaymentInfo;
  const _PaymentInfo._() : super._();

  @override
  String get paymentID;
  @override
  String get paymentBatchAdditionalInfo;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentInfoCopyWith<_$_PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
