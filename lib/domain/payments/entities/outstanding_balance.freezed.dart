// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outstanding_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OutstandingBalance {
  CustomerCode get customerCode => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get overdue => throw _privateConstructorUsedError;
  String get checkDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OutstandingBalanceCopyWith<OutstandingBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingBalanceCopyWith<$Res> {
  factory $OutstandingBalanceCopyWith(
          OutstandingBalance value, $Res Function(OutstandingBalance) then) =
      _$OutstandingBalanceCopyWithImpl<$Res, OutstandingBalance>;
  @useResult
  $Res call(
      {CustomerCode customerCode,
      Currency currency,
      String amount,
      String overdue,
      String checkDate});
}

/// @nodoc
class _$OutstandingBalanceCopyWithImpl<$Res, $Val extends OutstandingBalance>
    implements $OutstandingBalanceCopyWith<$Res> {
  _$OutstandingBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? currency = null,
    Object? amount = null,
    Object? overdue = null,
    Object? checkDate = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      overdue: null == overdue
          ? _value.overdue
          : overdue // ignore: cast_nullable_to_non_nullable
              as String,
      checkDate: null == checkDate
          ? _value.checkDate
          : checkDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OutstandingBalanceCopyWith<$Res>
    implements $OutstandingBalanceCopyWith<$Res> {
  factory _$$_OutstandingBalanceCopyWith(_$_OutstandingBalance value,
          $Res Function(_$_OutstandingBalance) then) =
      __$$_OutstandingBalanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerCode customerCode,
      Currency currency,
      String amount,
      String overdue,
      String checkDate});
}

/// @nodoc
class __$$_OutstandingBalanceCopyWithImpl<$Res>
    extends _$OutstandingBalanceCopyWithImpl<$Res, _$_OutstandingBalance>
    implements _$$_OutstandingBalanceCopyWith<$Res> {
  __$$_OutstandingBalanceCopyWithImpl(
      _$_OutstandingBalance _value, $Res Function(_$_OutstandingBalance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? currency = null,
    Object? amount = null,
    Object? overdue = null,
    Object? checkDate = null,
  }) {
    return _then(_$_OutstandingBalance(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      overdue: null == overdue
          ? _value.overdue
          : overdue // ignore: cast_nullable_to_non_nullable
              as String,
      checkDate: null == checkDate
          ? _value.checkDate
          : checkDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OutstandingBalance extends _OutstandingBalance {
  const _$_OutstandingBalance(
      {required this.customerCode,
      required this.currency,
      required this.amount,
      required this.overdue,
      required this.checkDate})
      : super._();

  @override
  final CustomerCode customerCode;
  @override
  final Currency currency;
  @override
  final String amount;
  @override
  final String overdue;
  @override
  final String checkDate;

  @override
  String toString() {
    return 'OutstandingBalance(customerCode: $customerCode, currency: $currency, amount: $amount, overdue: $overdue, checkDate: $checkDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OutstandingBalance &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.overdue, overdue) || other.overdue == overdue) &&
            (identical(other.checkDate, checkDate) ||
                other.checkDate == checkDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, customerCode, currency, amount, overdue, checkDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OutstandingBalanceCopyWith<_$_OutstandingBalance> get copyWith =>
      __$$_OutstandingBalanceCopyWithImpl<_$_OutstandingBalance>(
          this, _$identity);
}

abstract class _OutstandingBalance extends OutstandingBalance {
  const factory _OutstandingBalance(
      {required final CustomerCode customerCode,
      required final Currency currency,
      required final String amount,
      required final String overdue,
      required final String checkDate}) = _$_OutstandingBalance;
  const _OutstandingBalance._() : super._();

  @override
  CustomerCode get customerCode;
  @override
  Currency get currency;
  @override
  String get amount;
  @override
  String get overdue;
  @override
  String get checkDate;
  @override
  @JsonKey(ignore: true)
  _$$_OutstandingBalanceCopyWith<_$_OutstandingBalance> get copyWith =>
      throw _privateConstructorUsedError;
}
