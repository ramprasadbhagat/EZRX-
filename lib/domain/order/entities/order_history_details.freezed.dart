// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryDetails {
  double get totalTax => throw _privateConstructorUsedError;
  double get orderValue => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get manualFee => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  double get totalDiscount => throw _privateConstructorUsedError;
  StatusType get processingStatus => throw _privateConstructorUsedError;
  DateTimeStringValue get requestedDeliveryDate =>
      throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  PhoneNumber get telephoneNumber => throw _privateConstructorUsedError;
  DateTimeStringValue get createdDate => throw _privateConstructorUsedError;
  String get eZRXNumber => throw _privateConstructorUsedError;
  String get orderBy => throw _privateConstructorUsedError;
  String get referenceNotes => throw _privateConstructorUsedError;
  OrderNumber get orderNumber =>
      throw _privateConstructorUsedError; //used for orderHistory api in view vy order section
  String get soldTo => throw _privateConstructorUsedError;
  String get shipTo => throw _privateConstructorUsedError;
  CompanyName get companyName => throw _privateConstructorUsedError;
  POReference get pOReference => throw _privateConstructorUsedError;
  String get shipToAddress => throw _privateConstructorUsedError;
  String get soldToAddress => throw _privateConstructorUsedError;
  StringValue get invoiceNumber => throw _privateConstructorUsedError;
  String get orderReason => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderItem> get orderHistoryDetailsOrderItem =>
      throw _privateConstructorUsedError;
  OrderHistoryDetailsPaymentTerm get orderHistoryDetailsPaymentTerm =>
      throw _privateConstructorUsedError;
  SpecialInstructions get orderHistoryDetailsSpecialInstructions =>
      throw _privateConstructorUsedError;
  List<PoDocuments> get orderHistoryDetailsPoDocuments =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsCopyWith<OrderHistoryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsCopyWith<$Res> {
  factory $OrderHistoryDetailsCopyWith(
          OrderHistoryDetails value, $Res Function(OrderHistoryDetails) then) =
      _$OrderHistoryDetailsCopyWithImpl<$Res, OrderHistoryDetails>;
  @useResult
  $Res call(
      {double totalTax,
      double orderValue,
      double deliveryFee,
      double manualFee,
      double totalValue,
      double totalDiscount,
      StatusType processingStatus,
      DateTimeStringValue requestedDeliveryDate,
      String type,
      PhoneNumber telephoneNumber,
      DateTimeStringValue createdDate,
      String eZRXNumber,
      String orderBy,
      String referenceNotes,
      OrderNumber orderNumber,
      String soldTo,
      String shipTo,
      CompanyName companyName,
      POReference pOReference,
      String shipToAddress,
      String soldToAddress,
      StringValue invoiceNumber,
      String orderReason,
      int itemCount,
      List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItem,
      OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm,
      SpecialInstructions orderHistoryDetailsSpecialInstructions,
      List<PoDocuments> orderHistoryDetailsPoDocuments});

  $OrderHistoryDetailsPaymentTermCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class _$OrderHistoryDetailsCopyWithImpl<$Res, $Val extends OrderHistoryDetails>
    implements $OrderHistoryDetailsCopyWith<$Res> {
  _$OrderHistoryDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTax = null,
    Object? orderValue = null,
    Object? deliveryFee = null,
    Object? manualFee = null,
    Object? totalValue = null,
    Object? totalDiscount = null,
    Object? processingStatus = null,
    Object? requestedDeliveryDate = null,
    Object? type = null,
    Object? telephoneNumber = null,
    Object? createdDate = null,
    Object? eZRXNumber = null,
    Object? orderBy = null,
    Object? referenceNotes = null,
    Object? orderNumber = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? pOReference = null,
    Object? shipToAddress = null,
    Object? soldToAddress = null,
    Object? invoiceNumber = null,
    Object? orderReason = null,
    Object? itemCount = null,
    Object? orderHistoryDetailsOrderItem = null,
    Object? orderHistoryDetailsPaymentTerm = null,
    Object? orderHistoryDetailsSpecialInstructions = null,
    Object? orderHistoryDetailsPoDocuments = null,
  }) {
    return _then(_value.copyWith(
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      manualFee: null == manualFee
          ? _value.manualFee
          : manualFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscount: null == totalDiscount
          ? _value.totalDiscount
          : totalDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      processingStatus: null == processingStatus
          ? _value.processingStatus
          : processingStatus // ignore: cast_nullable_to_non_nullable
              as StatusType,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as CompanyName,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as POReference,
      shipToAddress: null == shipToAddress
          ? _value.shipToAddress
          : shipToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      soldToAddress: null == soldToAddress
          ? _value.soldToAddress
          : soldToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      orderHistoryDetailsOrderItem: null == orderHistoryDetailsOrderItem
          ? _value.orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
      orderHistoryDetailsPaymentTerm: null == orderHistoryDetailsPaymentTerm
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTerm,
      orderHistoryDetailsSpecialInstructions: null ==
              orderHistoryDetailsSpecialInstructions
          ? _value.orderHistoryDetailsSpecialInstructions
          : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as SpecialInstructions,
      orderHistoryDetailsPoDocuments: null == orderHistoryDetailsPoDocuments
          ? _value.orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsPaymentTermCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm {
    return $OrderHistoryDetailsPaymentTermCopyWith<$Res>(
        _value.orderHistoryDetailsPaymentTerm, (value) {
      return _then(
          _value.copyWith(orderHistoryDetailsPaymentTerm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsCopyWith<$Res>
    implements $OrderHistoryDetailsCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsCopyWith(_$_OrderHistoryDetails value,
          $Res Function(_$_OrderHistoryDetails) then) =
      __$$_OrderHistoryDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalTax,
      double orderValue,
      double deliveryFee,
      double manualFee,
      double totalValue,
      double totalDiscount,
      StatusType processingStatus,
      DateTimeStringValue requestedDeliveryDate,
      String type,
      PhoneNumber telephoneNumber,
      DateTimeStringValue createdDate,
      String eZRXNumber,
      String orderBy,
      String referenceNotes,
      OrderNumber orderNumber,
      String soldTo,
      String shipTo,
      CompanyName companyName,
      POReference pOReference,
      String shipToAddress,
      String soldToAddress,
      StringValue invoiceNumber,
      String orderReason,
      int itemCount,
      List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItem,
      OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm,
      SpecialInstructions orderHistoryDetailsSpecialInstructions,
      List<PoDocuments> orderHistoryDetailsPoDocuments});

  @override
  $OrderHistoryDetailsPaymentTermCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class __$$_OrderHistoryDetailsCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsCopyWithImpl<$Res, _$_OrderHistoryDetails>
    implements _$$_OrderHistoryDetailsCopyWith<$Res> {
  __$$_OrderHistoryDetailsCopyWithImpl(_$_OrderHistoryDetails _value,
      $Res Function(_$_OrderHistoryDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTax = null,
    Object? orderValue = null,
    Object? deliveryFee = null,
    Object? manualFee = null,
    Object? totalValue = null,
    Object? totalDiscount = null,
    Object? processingStatus = null,
    Object? requestedDeliveryDate = null,
    Object? type = null,
    Object? telephoneNumber = null,
    Object? createdDate = null,
    Object? eZRXNumber = null,
    Object? orderBy = null,
    Object? referenceNotes = null,
    Object? orderNumber = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? pOReference = null,
    Object? shipToAddress = null,
    Object? soldToAddress = null,
    Object? invoiceNumber = null,
    Object? orderReason = null,
    Object? itemCount = null,
    Object? orderHistoryDetailsOrderItem = null,
    Object? orderHistoryDetailsPaymentTerm = null,
    Object? orderHistoryDetailsSpecialInstructions = null,
    Object? orderHistoryDetailsPoDocuments = null,
  }) {
    return _then(_$_OrderHistoryDetails(
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      manualFee: null == manualFee
          ? _value.manualFee
          : manualFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscount: null == totalDiscount
          ? _value.totalDiscount
          : totalDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      processingStatus: null == processingStatus
          ? _value.processingStatus
          : processingStatus // ignore: cast_nullable_to_non_nullable
              as StatusType,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as CompanyName,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as POReference,
      shipToAddress: null == shipToAddress
          ? _value.shipToAddress
          : shipToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      soldToAddress: null == soldToAddress
          ? _value.soldToAddress
          : soldToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      orderHistoryDetailsOrderItem: null == orderHistoryDetailsOrderItem
          ? _value._orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
      orderHistoryDetailsPaymentTerm: null == orderHistoryDetailsPaymentTerm
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTerm,
      orderHistoryDetailsSpecialInstructions: null ==
              orderHistoryDetailsSpecialInstructions
          ? _value.orderHistoryDetailsSpecialInstructions
          : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as SpecialInstructions,
      orderHistoryDetailsPoDocuments: null == orderHistoryDetailsPoDocuments
          ? _value._orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryDetails extends _OrderHistoryDetails {
  _$_OrderHistoryDetails(
      {required this.totalTax,
      required this.orderValue,
      required this.deliveryFee,
      required this.manualFee,
      required this.totalValue,
      required this.totalDiscount,
      required this.processingStatus,
      required this.requestedDeliveryDate,
      required this.type,
      required this.telephoneNumber,
      required this.createdDate,
      required this.eZRXNumber,
      required this.orderBy,
      required this.referenceNotes,
      required this.orderNumber,
      required this.soldTo,
      required this.shipTo,
      required this.companyName,
      required this.pOReference,
      required this.shipToAddress,
      required this.soldToAddress,
      required this.invoiceNumber,
      required this.orderReason,
      required this.itemCount,
      required final List<OrderHistoryDetailsOrderItem>
          orderHistoryDetailsOrderItem,
      required this.orderHistoryDetailsPaymentTerm,
      required this.orderHistoryDetailsSpecialInstructions,
      required final List<PoDocuments> orderHistoryDetailsPoDocuments})
      : _orderHistoryDetailsOrderItem = orderHistoryDetailsOrderItem,
        _orderHistoryDetailsPoDocuments = orderHistoryDetailsPoDocuments,
        super._();

  @override
  final double totalTax;
  @override
  final double orderValue;
  @override
  final double deliveryFee;
  @override
  final double manualFee;
  @override
  final double totalValue;
  @override
  final double totalDiscount;
  @override
  final StatusType processingStatus;
  @override
  final DateTimeStringValue requestedDeliveryDate;
  @override
  final String type;
  @override
  final PhoneNumber telephoneNumber;
  @override
  final DateTimeStringValue createdDate;
  @override
  final String eZRXNumber;
  @override
  final String orderBy;
  @override
  final String referenceNotes;
  @override
  final OrderNumber orderNumber;
//used for orderHistory api in view vy order section
  @override
  final String soldTo;
  @override
  final String shipTo;
  @override
  final CompanyName companyName;
  @override
  final POReference pOReference;
  @override
  final String shipToAddress;
  @override
  final String soldToAddress;
  @override
  final StringValue invoiceNumber;
  @override
  final String orderReason;
  @override
  final int itemCount;
  final List<OrderHistoryDetailsOrderItem> _orderHistoryDetailsOrderItem;
  @override
  List<OrderHistoryDetailsOrderItem> get orderHistoryDetailsOrderItem {
    if (_orderHistoryDetailsOrderItem is EqualUnmodifiableListView)
      return _orderHistoryDetailsOrderItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsOrderItem);
  }

  @override
  final OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm;
  @override
  final SpecialInstructions orderHistoryDetailsSpecialInstructions;
  final List<PoDocuments> _orderHistoryDetailsPoDocuments;
  @override
  List<PoDocuments> get orderHistoryDetailsPoDocuments {
    if (_orderHistoryDetailsPoDocuments is EqualUnmodifiableListView)
      return _orderHistoryDetailsPoDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsPoDocuments);
  }

  @override
  String toString() {
    return 'OrderHistoryDetails(totalTax: $totalTax, orderValue: $orderValue, deliveryFee: $deliveryFee, manualFee: $manualFee, totalValue: $totalValue, totalDiscount: $totalDiscount, processingStatus: $processingStatus, requestedDeliveryDate: $requestedDeliveryDate, type: $type, telephoneNumber: $telephoneNumber, createdDate: $createdDate, eZRXNumber: $eZRXNumber, orderBy: $orderBy, referenceNotes: $referenceNotes, orderNumber: $orderNumber, soldTo: $soldTo, shipTo: $shipTo, companyName: $companyName, pOReference: $pOReference, shipToAddress: $shipToAddress, soldToAddress: $soldToAddress, invoiceNumber: $invoiceNumber, orderReason: $orderReason, itemCount: $itemCount, orderHistoryDetailsOrderItem: $orderHistoryDetailsOrderItem, orderHistoryDetailsPaymentTerm: $orderHistoryDetailsPaymentTerm, orderHistoryDetailsSpecialInstructions: $orderHistoryDetailsSpecialInstructions, orderHistoryDetailsPoDocuments: $orderHistoryDetailsPoDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetails &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.manualFee, manualFee) ||
                other.manualFee == manualFee) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.totalDiscount, totalDiscount) ||
                other.totalDiscount == totalDiscount) &&
            (identical(other.processingStatus, processingStatus) ||
                other.processingStatus == processingStatus) &&
            (identical(other.requestedDeliveryDate, requestedDeliveryDate) ||
                other.requestedDeliveryDate == requestedDeliveryDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.telephoneNumber, telephoneNumber) ||
                other.telephoneNumber == telephoneNumber) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.eZRXNumber, eZRXNumber) ||
                other.eZRXNumber == eZRXNumber) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.referenceNotes, referenceNotes) ||
                other.referenceNotes == referenceNotes) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.pOReference, pOReference) ||
                other.pOReference == pOReference) &&
            (identical(other.shipToAddress, shipToAddress) ||
                other.shipToAddress == shipToAddress) &&
            (identical(other.soldToAddress, soldToAddress) ||
                other.soldToAddress == soldToAddress) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.orderReason, orderReason) ||
                other.orderReason == orderReason) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsOrderItem,
                _orderHistoryDetailsOrderItem) &&
            (identical(other.orderHistoryDetailsPaymentTerm,
                    orderHistoryDetailsPaymentTerm) ||
                other.orderHistoryDetailsPaymentTerm ==
                    orderHistoryDetailsPaymentTerm) &&
            (identical(other.orderHistoryDetailsSpecialInstructions,
                    orderHistoryDetailsSpecialInstructions) ||
                other.orderHistoryDetailsSpecialInstructions ==
                    orderHistoryDetailsSpecialInstructions) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsPoDocuments,
                _orderHistoryDetailsPoDocuments));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalTax,
        orderValue,
        deliveryFee,
        manualFee,
        totalValue,
        totalDiscount,
        processingStatus,
        requestedDeliveryDate,
        type,
        telephoneNumber,
        createdDate,
        eZRXNumber,
        orderBy,
        referenceNotes,
        orderNumber,
        soldTo,
        shipTo,
        companyName,
        pOReference,
        shipToAddress,
        soldToAddress,
        invoiceNumber,
        orderReason,
        itemCount,
        const DeepCollectionEquality().hash(_orderHistoryDetailsOrderItem),
        orderHistoryDetailsPaymentTerm,
        orderHistoryDetailsSpecialInstructions,
        const DeepCollectionEquality().hash(_orderHistoryDetailsPoDocuments)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailsCopyWith<_$_OrderHistoryDetails> get copyWith =>
      __$$_OrderHistoryDetailsCopyWithImpl<_$_OrderHistoryDetails>(
          this, _$identity);
}

abstract class _OrderHistoryDetails extends OrderHistoryDetails {
  factory _OrderHistoryDetails(
      {required final double totalTax,
      required final double orderValue,
      required final double deliveryFee,
      required final double manualFee,
      required final double totalValue,
      required final double totalDiscount,
      required final StatusType processingStatus,
      required final DateTimeStringValue requestedDeliveryDate,
      required final String type,
      required final PhoneNumber telephoneNumber,
      required final DateTimeStringValue createdDate,
      required final String eZRXNumber,
      required final String orderBy,
      required final String referenceNotes,
      required final OrderNumber orderNumber,
      required final String soldTo,
      required final String shipTo,
      required final CompanyName companyName,
      required final POReference pOReference,
      required final String shipToAddress,
      required final String soldToAddress,
      required final StringValue invoiceNumber,
      required final String orderReason,
      required final int itemCount,
      required final List<OrderHistoryDetailsOrderItem>
          orderHistoryDetailsOrderItem,
      required final OrderHistoryDetailsPaymentTerm
          orderHistoryDetailsPaymentTerm,
      required final SpecialInstructions orderHistoryDetailsSpecialInstructions,
      required final List<PoDocuments>
          orderHistoryDetailsPoDocuments}) = _$_OrderHistoryDetails;
  _OrderHistoryDetails._() : super._();

  @override
  double get totalTax;
  @override
  double get orderValue;
  @override
  double get deliveryFee;
  @override
  double get manualFee;
  @override
  double get totalValue;
  @override
  double get totalDiscount;
  @override
  StatusType get processingStatus;
  @override
  DateTimeStringValue get requestedDeliveryDate;
  @override
  String get type;
  @override
  PhoneNumber get telephoneNumber;
  @override
  DateTimeStringValue get createdDate;
  @override
  String get eZRXNumber;
  @override
  String get orderBy;
  @override
  String get referenceNotes;
  @override
  OrderNumber get orderNumber;
  @override //used for orderHistory api in view vy order section
  String get soldTo;
  @override
  String get shipTo;
  @override
  CompanyName get companyName;
  @override
  POReference get pOReference;
  @override
  String get shipToAddress;
  @override
  String get soldToAddress;
  @override
  StringValue get invoiceNumber;
  @override
  String get orderReason;
  @override
  int get itemCount;
  @override
  List<OrderHistoryDetailsOrderItem> get orderHistoryDetailsOrderItem;
  @override
  OrderHistoryDetailsPaymentTerm get orderHistoryDetailsPaymentTerm;
  @override
  SpecialInstructions get orderHistoryDetailsSpecialInstructions;
  @override
  List<PoDocuments> get orderHistoryDetailsPoDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsCopyWith<_$_OrderHistoryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
