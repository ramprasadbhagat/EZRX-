// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'submit_order_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitOrderCustomer {
  String get customerNumber => throw _privateConstructorUsedError;
  String get customerNumberShipTo => throw _privateConstructorUsedError;
  String get salesOrganisation => throw _privateConstructorUsedError;
  String get division => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitOrderCustomerCopyWith<SubmitOrderCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOrderCustomerCopyWith<$Res> {
  factory $SubmitOrderCustomerCopyWith(
          SubmitOrderCustomer value, $Res Function(SubmitOrderCustomer) then) =
      _$SubmitOrderCustomerCopyWithImpl<$Res, SubmitOrderCustomer>;
  @useResult
  $Res call(
      {String customerNumber,
      String customerNumberShipTo,
      String salesOrganisation,
      String division});
}

/// @nodoc
class _$SubmitOrderCustomerCopyWithImpl<$Res, $Val extends SubmitOrderCustomer>
    implements $SubmitOrderCustomerCopyWith<$Res> {
  _$SubmitOrderCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerNumber = null,
    Object? customerNumberShipTo = null,
    Object? salesOrganisation = null,
    Object? division = null,
  }) {
    return _then(_value.copyWith(
      customerNumber: null == customerNumber
          ? _value.customerNumber
          : customerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerNumberShipTo: null == customerNumberShipTo
          ? _value.customerNumberShipTo
          : customerNumberShipTo // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as String,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitOrderCustomerCopyWith<$Res>
    implements $SubmitOrderCustomerCopyWith<$Res> {
  factory _$$_SubmitOrderCustomerCopyWith(_$_SubmitOrderCustomer value,
          $Res Function(_$_SubmitOrderCustomer) then) =
      __$$_SubmitOrderCustomerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerNumber,
      String customerNumberShipTo,
      String salesOrganisation,
      String division});
}

/// @nodoc
class __$$_SubmitOrderCustomerCopyWithImpl<$Res>
    extends _$SubmitOrderCustomerCopyWithImpl<$Res, _$_SubmitOrderCustomer>
    implements _$$_SubmitOrderCustomerCopyWith<$Res> {
  __$$_SubmitOrderCustomerCopyWithImpl(_$_SubmitOrderCustomer _value,
      $Res Function(_$_SubmitOrderCustomer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerNumber = null,
    Object? customerNumberShipTo = null,
    Object? salesOrganisation = null,
    Object? division = null,
  }) {
    return _then(_$_SubmitOrderCustomer(
      customerNumber: null == customerNumber
          ? _value.customerNumber
          : customerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerNumberShipTo: null == customerNumberShipTo
          ? _value.customerNumberShipTo
          : customerNumberShipTo // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as String,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SubmitOrderCustomer extends _SubmitOrderCustomer {
  const _$_SubmitOrderCustomer(
      {required this.customerNumber,
      required this.customerNumberShipTo,
      required this.salesOrganisation,
      required this.division})
      : super._();

  @override
  final String customerNumber;
  @override
  final String customerNumberShipTo;
  @override
  final String salesOrganisation;
  @override
  final String division;

  @override
  String toString() {
    return 'SubmitOrderCustomer(customerNumber: $customerNumber, customerNumberShipTo: $customerNumberShipTo, salesOrganisation: $salesOrganisation, division: $division)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitOrderCustomer &&
            (identical(other.customerNumber, customerNumber) ||
                other.customerNumber == customerNumber) &&
            (identical(other.customerNumberShipTo, customerNumberShipTo) ||
                other.customerNumberShipTo == customerNumberShipTo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.division, division) ||
                other.division == division));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerNumber,
      customerNumberShipTo, salesOrganisation, division);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitOrderCustomerCopyWith<_$_SubmitOrderCustomer> get copyWith =>
      __$$_SubmitOrderCustomerCopyWithImpl<_$_SubmitOrderCustomer>(
          this, _$identity);
}

abstract class _SubmitOrderCustomer extends SubmitOrderCustomer {
  const factory _SubmitOrderCustomer(
      {required final String customerNumber,
      required final String customerNumberShipTo,
      required final String salesOrganisation,
      required final String division}) = _$_SubmitOrderCustomer;
  const _SubmitOrderCustomer._() : super._();

  @override
  String get customerNumber;
  @override
  String get customerNumberShipTo;
  @override
  String get salesOrganisation;
  @override
  String get division;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitOrderCustomerCopyWith<_$_SubmitOrderCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}
