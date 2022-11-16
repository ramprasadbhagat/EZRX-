// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_customer_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentCustomerInformation {
  String get paymentTerm => throw _privateConstructorUsedError;
  List<ShipToInfo> get shipToInfoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentCustomerInformationCopyWith<PaymentCustomerInformation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCustomerInformationCopyWith<$Res> {
  factory $PaymentCustomerInformationCopyWith(PaymentCustomerInformation value,
          $Res Function(PaymentCustomerInformation) then) =
      _$PaymentCustomerInformationCopyWithImpl<$Res>;
  $Res call({String paymentTerm, List<ShipToInfo> shipToInfoList});
}

/// @nodoc
class _$PaymentCustomerInformationCopyWithImpl<$Res>
    implements $PaymentCustomerInformationCopyWith<$Res> {
  _$PaymentCustomerInformationCopyWithImpl(this._value, this._then);

  final PaymentCustomerInformation _value;
  // ignore: unused_field
  final $Res Function(PaymentCustomerInformation) _then;

  @override
  $Res call({
    Object? paymentTerm = freezed,
    Object? shipToInfoList = freezed,
  }) {
    return _then(_value.copyWith(
      paymentTerm: paymentTerm == freezed
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      shipToInfoList: shipToInfoList == freezed
          ? _value.shipToInfoList
          : shipToInfoList // ignore: cast_nullable_to_non_nullable
              as List<ShipToInfo>,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentCustomerInformationCopyWith<$Res>
    implements $PaymentCustomerInformationCopyWith<$Res> {
  factory _$$_PaymentCustomerInformationCopyWith(
          _$_PaymentCustomerInformation value,
          $Res Function(_$_PaymentCustomerInformation) then) =
      __$$_PaymentCustomerInformationCopyWithImpl<$Res>;
  @override
  $Res call({String paymentTerm, List<ShipToInfo> shipToInfoList});
}

/// @nodoc
class __$$_PaymentCustomerInformationCopyWithImpl<$Res>
    extends _$PaymentCustomerInformationCopyWithImpl<$Res>
    implements _$$_PaymentCustomerInformationCopyWith<$Res> {
  __$$_PaymentCustomerInformationCopyWithImpl(
      _$_PaymentCustomerInformation _value,
      $Res Function(_$_PaymentCustomerInformation) _then)
      : super(_value, (v) => _then(v as _$_PaymentCustomerInformation));

  @override
  _$_PaymentCustomerInformation get _value =>
      super._value as _$_PaymentCustomerInformation;

  @override
  $Res call({
    Object? paymentTerm = freezed,
    Object? shipToInfoList = freezed,
  }) {
    return _then(_$_PaymentCustomerInformation(
      paymentTerm: paymentTerm == freezed
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      shipToInfoList: shipToInfoList == freezed
          ? _value._shipToInfoList
          : shipToInfoList // ignore: cast_nullable_to_non_nullable
              as List<ShipToInfo>,
    ));
  }
}

/// @nodoc

class _$_PaymentCustomerInformation extends _PaymentCustomerInformation {
  const _$_PaymentCustomerInformation(
      {required this.paymentTerm,
      required final List<ShipToInfo> shipToInfoList})
      : _shipToInfoList = shipToInfoList,
        super._();

  @override
  final String paymentTerm;
  final List<ShipToInfo> _shipToInfoList;
  @override
  List<ShipToInfo> get shipToInfoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipToInfoList);
  }

  @override
  String toString() {
    return 'PaymentCustomerInformation(paymentTerm: $paymentTerm, shipToInfoList: $shipToInfoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentCustomerInformation &&
            const DeepCollectionEquality()
                .equals(other.paymentTerm, paymentTerm) &&
            const DeepCollectionEquality()
                .equals(other._shipToInfoList, _shipToInfoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(paymentTerm),
      const DeepCollectionEquality().hash(_shipToInfoList));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentCustomerInformationCopyWith<_$_PaymentCustomerInformation>
      get copyWith => __$$_PaymentCustomerInformationCopyWithImpl<
          _$_PaymentCustomerInformation>(this, _$identity);
}

abstract class _PaymentCustomerInformation extends PaymentCustomerInformation {
  const factory _PaymentCustomerInformation(
          {required final String paymentTerm,
          required final List<ShipToInfo> shipToInfoList}) =
      _$_PaymentCustomerInformation;
  const _PaymentCustomerInformation._() : super._();

  @override
  String get paymentTerm;
  @override
  List<ShipToInfo> get shipToInfoList;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentCustomerInformationCopyWith<_$_PaymentCustomerInformation>
      get copyWith => throw _privateConstructorUsedError;
}
