// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentNotification {
  bool get disablePaymentNotification => throw _privateConstructorUsedError;
  List<PaymentAdviceExpiryNotification>
      get paymentAdviceExpiryNotificationList =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentNotificationCopyWith<PaymentNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentNotificationCopyWith<$Res> {
  factory $PaymentNotificationCopyWith(
          PaymentNotification value, $Res Function(PaymentNotification) then) =
      _$PaymentNotificationCopyWithImpl<$Res, PaymentNotification>;
  @useResult
  $Res call(
      {bool disablePaymentNotification,
      List<PaymentAdviceExpiryNotification>
          paymentAdviceExpiryNotificationList});
}

/// @nodoc
class _$PaymentNotificationCopyWithImpl<$Res, $Val extends PaymentNotification>
    implements $PaymentNotificationCopyWith<$Res> {
  _$PaymentNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disablePaymentNotification = null,
    Object? paymentAdviceExpiryNotificationList = null,
  }) {
    return _then(_value.copyWith(
      disablePaymentNotification: null == disablePaymentNotification
          ? _value.disablePaymentNotification
          : disablePaymentNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentAdviceExpiryNotificationList: null ==
              paymentAdviceExpiryNotificationList
          ? _value.paymentAdviceExpiryNotificationList
          : paymentAdviceExpiryNotificationList // ignore: cast_nullable_to_non_nullable
              as List<PaymentAdviceExpiryNotification>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentNotificationCopyWith<$Res>
    implements $PaymentNotificationCopyWith<$Res> {
  factory _$$_PaymentNotificationCopyWith(_$_PaymentNotification value,
          $Res Function(_$_PaymentNotification) then) =
      __$$_PaymentNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool disablePaymentNotification,
      List<PaymentAdviceExpiryNotification>
          paymentAdviceExpiryNotificationList});
}

/// @nodoc
class __$$_PaymentNotificationCopyWithImpl<$Res>
    extends _$PaymentNotificationCopyWithImpl<$Res, _$_PaymentNotification>
    implements _$$_PaymentNotificationCopyWith<$Res> {
  __$$_PaymentNotificationCopyWithImpl(_$_PaymentNotification _value,
      $Res Function(_$_PaymentNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disablePaymentNotification = null,
    Object? paymentAdviceExpiryNotificationList = null,
  }) {
    return _then(_$_PaymentNotification(
      disablePaymentNotification: null == disablePaymentNotification
          ? _value.disablePaymentNotification
          : disablePaymentNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentAdviceExpiryNotificationList: null ==
              paymentAdviceExpiryNotificationList
          ? _value._paymentAdviceExpiryNotificationList
          : paymentAdviceExpiryNotificationList // ignore: cast_nullable_to_non_nullable
              as List<PaymentAdviceExpiryNotification>,
    ));
  }
}

/// @nodoc

class _$_PaymentNotification extends _PaymentNotification {
  const _$_PaymentNotification(
      {required this.disablePaymentNotification,
      required final List<PaymentAdviceExpiryNotification>
          paymentAdviceExpiryNotificationList})
      : _paymentAdviceExpiryNotificationList =
            paymentAdviceExpiryNotificationList,
        super._();

  @override
  final bool disablePaymentNotification;
  final List<PaymentAdviceExpiryNotification>
      _paymentAdviceExpiryNotificationList;
  @override
  List<PaymentAdviceExpiryNotification>
      get paymentAdviceExpiryNotificationList {
    if (_paymentAdviceExpiryNotificationList is EqualUnmodifiableListView)
      return _paymentAdviceExpiryNotificationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentAdviceExpiryNotificationList);
  }

  @override
  String toString() {
    return 'PaymentNotification(disablePaymentNotification: $disablePaymentNotification, paymentAdviceExpiryNotificationList: $paymentAdviceExpiryNotificationList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentNotification &&
            (identical(other.disablePaymentNotification,
                    disablePaymentNotification) ||
                other.disablePaymentNotification ==
                    disablePaymentNotification) &&
            const DeepCollectionEquality().equals(
                other._paymentAdviceExpiryNotificationList,
                _paymentAdviceExpiryNotificationList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      disablePaymentNotification,
      const DeepCollectionEquality()
          .hash(_paymentAdviceExpiryNotificationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentNotificationCopyWith<_$_PaymentNotification> get copyWith =>
      __$$_PaymentNotificationCopyWithImpl<_$_PaymentNotification>(
          this, _$identity);
}

abstract class _PaymentNotification extends PaymentNotification {
  const factory _PaymentNotification(
      {required final bool disablePaymentNotification,
      required final List<PaymentAdviceExpiryNotification>
          paymentAdviceExpiryNotificationList}) = _$_PaymentNotification;
  const _PaymentNotification._() : super._();

  @override
  bool get disablePaymentNotification;
  @override
  List<PaymentAdviceExpiryNotification> get paymentAdviceExpiryNotificationList;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentNotificationCopyWith<_$_PaymentNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
