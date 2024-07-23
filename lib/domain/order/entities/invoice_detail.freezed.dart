// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvoiceDetail {
  StringValue get invoiceNumber => throw _privateConstructorUsedError;
  DateTimeStringValue get invoiceDate => throw _privateConstructorUsedError;
  double get invoiceTotalPrice => throw _privateConstructorUsedError;
  int get invoiceTotalQty => throw _privateConstructorUsedError;
  StatusType get invoiceStatus => throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderItem> get orderItems =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceDetailCopyWith<InvoiceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailCopyWith<$Res> {
  factory $InvoiceDetailCopyWith(
          InvoiceDetail value, $Res Function(InvoiceDetail) then) =
      _$InvoiceDetailCopyWithImpl<$Res, InvoiceDetail>;
  @useResult
  $Res call(
      {StringValue invoiceNumber,
      DateTimeStringValue invoiceDate,
      double invoiceTotalPrice,
      int invoiceTotalQty,
      StatusType invoiceStatus,
      List<OrderHistoryDetailsOrderItem> orderItems});
}

/// @nodoc
class _$InvoiceDetailCopyWithImpl<$Res, $Val extends InvoiceDetail>
    implements $InvoiceDetailCopyWith<$Res> {
  _$InvoiceDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
    Object? invoiceTotalPrice = null,
    Object? invoiceTotalQty = null,
    Object? invoiceStatus = null,
    Object? orderItems = null,
  }) {
    return _then(_value.copyWith(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      invoiceTotalPrice: null == invoiceTotalPrice
          ? _value.invoiceTotalPrice
          : invoiceTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceTotalQty: null == invoiceTotalQty
          ? _value.invoiceTotalQty
          : invoiceTotalQty // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceStatus: null == invoiceStatus
          ? _value.invoiceStatus
          : invoiceStatus // ignore: cast_nullable_to_non_nullable
              as StatusType,
      orderItems: null == orderItems
          ? _value.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceDetailImplCopyWith<$Res>
    implements $InvoiceDetailCopyWith<$Res> {
  factory _$$InvoiceDetailImplCopyWith(
          _$InvoiceDetailImpl value, $Res Function(_$InvoiceDetailImpl) then) =
      __$$InvoiceDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringValue invoiceNumber,
      DateTimeStringValue invoiceDate,
      double invoiceTotalPrice,
      int invoiceTotalQty,
      StatusType invoiceStatus,
      List<OrderHistoryDetailsOrderItem> orderItems});
}

/// @nodoc
class __$$InvoiceDetailImplCopyWithImpl<$Res>
    extends _$InvoiceDetailCopyWithImpl<$Res, _$InvoiceDetailImpl>
    implements _$$InvoiceDetailImplCopyWith<$Res> {
  __$$InvoiceDetailImplCopyWithImpl(
      _$InvoiceDetailImpl _value, $Res Function(_$InvoiceDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
    Object? invoiceTotalPrice = null,
    Object? invoiceTotalQty = null,
    Object? invoiceStatus = null,
    Object? orderItems = null,
  }) {
    return _then(_$InvoiceDetailImpl(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      invoiceTotalPrice: null == invoiceTotalPrice
          ? _value.invoiceTotalPrice
          : invoiceTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceTotalQty: null == invoiceTotalQty
          ? _value.invoiceTotalQty
          : invoiceTotalQty // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceStatus: null == invoiceStatus
          ? _value.invoiceStatus
          : invoiceStatus // ignore: cast_nullable_to_non_nullable
              as StatusType,
      orderItems: null == orderItems
          ? _value._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
    ));
  }
}

/// @nodoc

class _$InvoiceDetailImpl extends _InvoiceDetail {
  const _$InvoiceDetailImpl(
      {required this.invoiceNumber,
      required this.invoiceDate,
      required this.invoiceTotalPrice,
      required this.invoiceTotalQty,
      required this.invoiceStatus,
      required final List<OrderHistoryDetailsOrderItem> orderItems})
      : _orderItems = orderItems,
        super._();

  @override
  final StringValue invoiceNumber;
  @override
  final DateTimeStringValue invoiceDate;
  @override
  final double invoiceTotalPrice;
  @override
  final int invoiceTotalQty;
  @override
  final StatusType invoiceStatus;
  final List<OrderHistoryDetailsOrderItem> _orderItems;
  @override
  List<OrderHistoryDetailsOrderItem> get orderItems {
    if (_orderItems is EqualUnmodifiableListView) return _orderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItems);
  }

  @override
  String toString() {
    return 'InvoiceDetail(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, invoiceTotalPrice: $invoiceTotalPrice, invoiceTotalQty: $invoiceTotalQty, invoiceStatus: $invoiceStatus, orderItems: $orderItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDetailImpl &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.invoiceTotalPrice, invoiceTotalPrice) ||
                other.invoiceTotalPrice == invoiceTotalPrice) &&
            (identical(other.invoiceTotalQty, invoiceTotalQty) ||
                other.invoiceTotalQty == invoiceTotalQty) &&
            (identical(other.invoiceStatus, invoiceStatus) ||
                other.invoiceStatus == invoiceStatus) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceNumber,
      invoiceDate,
      invoiceTotalPrice,
      invoiceTotalQty,
      invoiceStatus,
      const DeepCollectionEquality().hash(_orderItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDetailImplCopyWith<_$InvoiceDetailImpl> get copyWith =>
      __$$InvoiceDetailImplCopyWithImpl<_$InvoiceDetailImpl>(this, _$identity);
}

abstract class _InvoiceDetail extends InvoiceDetail {
  const factory _InvoiceDetail(
          {required final StringValue invoiceNumber,
          required final DateTimeStringValue invoiceDate,
          required final double invoiceTotalPrice,
          required final int invoiceTotalQty,
          required final StatusType invoiceStatus,
          required final List<OrderHistoryDetailsOrderItem> orderItems}) =
      _$InvoiceDetailImpl;
  const _InvoiceDetail._() : super._();

  @override
  StringValue get invoiceNumber;
  @override
  DateTimeStringValue get invoiceDate;
  @override
  double get invoiceTotalPrice;
  @override
  int get invoiceTotalQty;
  @override
  StatusType get invoiceStatus;
  @override
  List<OrderHistoryDetailsOrderItem> get orderItems;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceDetailImplCopyWith<_$InvoiceDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
