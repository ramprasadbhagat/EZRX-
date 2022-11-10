// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_payment_term.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryDetailsPaymentTerm {
  String get paymentTermCode => throw _privateConstructorUsedError;
  String get paymentTermDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsPaymentTermCopyWith<OrderHistoryDetailsPaymentTerm>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsPaymentTermCopyWith<$Res> {
  factory $OrderHistoryDetailsPaymentTermCopyWith(
          OrderHistoryDetailsPaymentTerm value,
          $Res Function(OrderHistoryDetailsPaymentTerm) then) =
      _$OrderHistoryDetailsPaymentTermCopyWithImpl<$Res>;
  $Res call({String paymentTermCode, String paymentTermDescription});
}

/// @nodoc
class _$OrderHistoryDetailsPaymentTermCopyWithImpl<$Res>
    implements $OrderHistoryDetailsPaymentTermCopyWith<$Res> {
  _$OrderHistoryDetailsPaymentTermCopyWithImpl(this._value, this._then);

  final OrderHistoryDetailsPaymentTerm _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsPaymentTerm) _then;

  @override
  $Res call({
    Object? paymentTermCode = freezed,
    Object? paymentTermDescription = freezed,
  }) {
    return _then(_value.copyWith(
      paymentTermCode: paymentTermCode == freezed
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermDescription: paymentTermDescription == freezed
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsPaymentTermCopyWith<$Res>
    implements $OrderHistoryDetailsPaymentTermCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsPaymentTermCopyWith(
          _$_OrderHistoryDetailsPaymentTerm value,
          $Res Function(_$_OrderHistoryDetailsPaymentTerm) then) =
      __$$_OrderHistoryDetailsPaymentTermCopyWithImpl<$Res>;
  @override
  $Res call({String paymentTermCode, String paymentTermDescription});
}

/// @nodoc
class __$$_OrderHistoryDetailsPaymentTermCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsPaymentTermCopyWithImpl<$Res>
    implements _$$_OrderHistoryDetailsPaymentTermCopyWith<$Res> {
  __$$_OrderHistoryDetailsPaymentTermCopyWithImpl(
      _$_OrderHistoryDetailsPaymentTerm _value,
      $Res Function(_$_OrderHistoryDetailsPaymentTerm) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryDetailsPaymentTerm));

  @override
  _$_OrderHistoryDetailsPaymentTerm get _value =>
      super._value as _$_OrderHistoryDetailsPaymentTerm;

  @override
  $Res call({
    Object? paymentTermCode = freezed,
    Object? paymentTermDescription = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsPaymentTerm(
      paymentTermCode: paymentTermCode == freezed
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermDescription: paymentTermDescription == freezed
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryDetailsPaymentTerm
    extends _OrderHistoryDetailsPaymentTerm {
  _$_OrderHistoryDetailsPaymentTerm(
      {required this.paymentTermCode, required this.paymentTermDescription})
      : super._();

  @override
  final String paymentTermCode;
  @override
  final String paymentTermDescription;

  @override
  String toString() {
    return 'OrderHistoryDetailsPaymentTerm(paymentTermCode: $paymentTermCode, paymentTermDescription: $paymentTermDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsPaymentTerm &&
            const DeepCollectionEquality()
                .equals(other.paymentTermCode, paymentTermCode) &&
            const DeepCollectionEquality()
                .equals(other.paymentTermDescription, paymentTermDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(paymentTermCode),
      const DeepCollectionEquality().hash(paymentTermDescription));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryDetailsPaymentTermCopyWith<_$_OrderHistoryDetailsPaymentTerm>
      get copyWith => __$$_OrderHistoryDetailsPaymentTermCopyWithImpl<
          _$_OrderHistoryDetailsPaymentTerm>(this, _$identity);
}

abstract class _OrderHistoryDetailsPaymentTerm
    extends OrderHistoryDetailsPaymentTerm {
  factory _OrderHistoryDetailsPaymentTerm(
          {required final String paymentTermCode,
          required final String paymentTermDescription}) =
      _$_OrderHistoryDetailsPaymentTerm;
  _OrderHistoryDetailsPaymentTerm._() : super._();

  @override
  String get paymentTermCode;
  @override
  String get paymentTermDescription;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsPaymentTermCopyWith<_$_OrderHistoryDetailsPaymentTerm>
      get copyWith => throw _privateConstructorUsedError;
}
