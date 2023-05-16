// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AvailablePaymentMethod {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvailablePaymentMethodCopyWith<AvailablePaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailablePaymentMethodCopyWith<$Res> {
  factory $AvailablePaymentMethodCopyWith(AvailablePaymentMethod value,
          $Res Function(AvailablePaymentMethod) then) =
      _$AvailablePaymentMethodCopyWithImpl<$Res, AvailablePaymentMethod>;
  @useResult
  $Res call({SalesOrg salesOrg, PaymentMethod paymentMethod});
}

/// @nodoc
class _$AvailablePaymentMethodCopyWithImpl<$Res,
        $Val extends AvailablePaymentMethod>
    implements $AvailablePaymentMethodCopyWith<$Res> {
  _$AvailablePaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvailablePaymentMethodCopyWith<$Res>
    implements $AvailablePaymentMethodCopyWith<$Res> {
  factory _$$_AvailablePaymentMethodCopyWith(_$_AvailablePaymentMethod value,
          $Res Function(_$_AvailablePaymentMethod) then) =
      __$$_AvailablePaymentMethodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrg salesOrg, PaymentMethod paymentMethod});
}

/// @nodoc
class __$$_AvailablePaymentMethodCopyWithImpl<$Res>
    extends _$AvailablePaymentMethodCopyWithImpl<$Res,
        _$_AvailablePaymentMethod>
    implements _$$_AvailablePaymentMethodCopyWith<$Res> {
  __$$_AvailablePaymentMethodCopyWithImpl(_$_AvailablePaymentMethod _value,
      $Res Function(_$_AvailablePaymentMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$_AvailablePaymentMethod(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ));
  }
}

/// @nodoc

class _$_AvailablePaymentMethod extends _AvailablePaymentMethod {
  const _$_AvailablePaymentMethod(
      {required this.salesOrg, required this.paymentMethod})
      : super._();

  @override
  final SalesOrg salesOrg;
  @override
  final PaymentMethod paymentMethod;

  @override
  String toString() {
    return 'AvailablePaymentMethod(salesOrg: $salesOrg, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvailablePaymentMethod &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailablePaymentMethodCopyWith<_$_AvailablePaymentMethod> get copyWith =>
      __$$_AvailablePaymentMethodCopyWithImpl<_$_AvailablePaymentMethod>(
          this, _$identity);
}

abstract class _AvailablePaymentMethod extends AvailablePaymentMethod {
  const factory _AvailablePaymentMethod(
      {required final SalesOrg salesOrg,
      required final PaymentMethod paymentMethod}) = _$_AvailablePaymentMethod;
  const _AvailablePaymentMethod._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  PaymentMethod get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$_AvailablePaymentMethodCopyWith<_$_AvailablePaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}
