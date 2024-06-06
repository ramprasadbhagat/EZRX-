// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistoryDetailsDto _$OrderHistoryDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsDto {
  @JsonKey(name: 'OrderValue', defaultValue: 0.0)
  double get orderValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalTax', defaultValue: 0)
  double get totalTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeliveryFee', defaultValue: 0)
  double get deliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManualFee', defaultValue: 0)
  double get manualFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalValue', defaultValue: 0)
  double get totalValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDiscount', defaultValue: 0)
  double get totalDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProcessingStatus', defaultValue: '')
  String get processingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpectedDeliveryDate', defaultValue: '')
  String get expectedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'TelephoneNumber', defaultValue: '')
  String get telephoneNumber => throw _privateConstructorUsedError;
  @JsonKey(readValue: _createdDateTimeReadValue)
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EZRXNumber', defaultValue: '')
  String get eZRXNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderBy', defaultValue: '')
  String get orderBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReferenceNotes', defaultValue: '')
  String get referenceNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyName', defaultValue: '')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'POReference', defaultValue: '')
  String get pOReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShipTo', defaultValue: '')
  String get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'SoldTo', defaultValue: '')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShipToAddres', defaultValue: '')
  String get shipToAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'SoldToAddress', defaultValue: '')
  String get soldToAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvoiceNumber', defaultValue: '')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderReason', defaultValue: '')
  String get orderReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderItems', readValue: orderItemOverride)
  List<OrderHistoryDetailsOrderItemDto> get orderHistoryDetailsOrderItem =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
  OrderHistoryDetailsPaymentTermDto get orderHistoryDetailsPaymentTerm =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'SpecialInstructions', readValue: specialInstructionOverride)
  String get orderHistoryDetailsSpecialInstructions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'PODocuments', readValue: poDocumentOverride)
  List<PoDocumentsDto> get orderHistoryDetailsPoDocuments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ItmCount', defaultValue: 0)
  int get itemCount => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxRate', readValue: handleTax)
  double get taxRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsDtoCopyWith<OrderHistoryDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsDtoCopyWith(OrderHistoryDetailsDto value,
          $Res Function(OrderHistoryDetailsDto) then) =
      _$OrderHistoryDetailsDtoCopyWithImpl<$Res, OrderHistoryDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderValue', defaultValue: 0.0) double orderValue,
      @JsonKey(name: 'TotalTax', defaultValue: 0) double totalTax,
      @JsonKey(name: 'DeliveryFee', defaultValue: 0) double deliveryFee,
      @JsonKey(name: 'ManualFee', defaultValue: 0) double manualFee,
      @JsonKey(name: 'TotalValue', defaultValue: 0) double totalValue,
      @JsonKey(name: 'TotalDiscount', defaultValue: 0) double totalDiscount,
      @JsonKey(name: 'ProcessingStatus', defaultValue: '')
      String processingStatus,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'ExpectedDeliveryDate', defaultValue: '')
      String expectedDeliveryDate,
      @JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
      String telephoneNumber,
      @JsonKey(readValue: _createdDateTimeReadValue) String createdDate,
      @JsonKey(name: 'EZRXNumber', defaultValue: '') String eZRXNumber,
      @JsonKey(name: 'OrderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'ReferenceNotes', defaultValue: '') String referenceNotes,
      @JsonKey(name: 'CompanyName', defaultValue: '') String companyName,
      @JsonKey(name: 'OrderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'POReference', defaultValue: '') String pOReference,
      @JsonKey(name: 'ShipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'SoldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'ShipToAddres', defaultValue: '') String shipToAddress,
      @JsonKey(name: 'SoldToAddress', defaultValue: '') String soldToAddress,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'OrderReason', defaultValue: '') String orderReason,
      @JsonKey(name: 'OrderItems', readValue: orderItemOverride)
      List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
      @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
      OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm,
      @JsonKey(
          name: 'SpecialInstructions', readValue: specialInstructionOverride)
      String orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'PODocuments', readValue: poDocumentOverride)
      List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'ItmCount', defaultValue: 0) int itemCount,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'TaxRate', readValue: handleTax) double taxRate});

  $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class _$OrderHistoryDetailsDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsDto>
    implements $OrderHistoryDetailsDtoCopyWith<$Res> {
  _$OrderHistoryDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderValue = null,
    Object? totalTax = null,
    Object? deliveryFee = null,
    Object? manualFee = null,
    Object? totalValue = null,
    Object? totalDiscount = null,
    Object? processingStatus = null,
    Object? requestedDeliveryDate = null,
    Object? expectedDeliveryDate = null,
    Object? type = null,
    Object? telephoneNumber = null,
    Object? createdDate = null,
    Object? eZRXNumber = null,
    Object? orderBy = null,
    Object? referenceNotes = null,
    Object? companyName = null,
    Object? orderNumber = null,
    Object? pOReference = null,
    Object? shipTo = null,
    Object? soldTo = null,
    Object? shipToAddress = null,
    Object? soldToAddress = null,
    Object? invoiceNumber = null,
    Object? orderReason = null,
    Object? orderHistoryDetailsOrderItem = null,
    Object? orderHistoryDetailsPaymentTerm = null,
    Object? orderHistoryDetailsSpecialInstructions = null,
    Object? orderHistoryDetailsPoDocuments = null,
    Object? itemCount = null,
    Object? isMarketPlace = null,
    Object? taxRate = null,
  }) {
    return _then(_value.copyWith(
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
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
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      expectedDeliveryDate: null == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
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
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryDetailsOrderItem: null == orderHistoryDetailsOrderItem
          ? _value.orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDto>,
      orderHistoryDetailsPaymentTerm: null == orderHistoryDetailsPaymentTerm
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTermDto,
      orderHistoryDetailsSpecialInstructions: null ==
              orderHistoryDetailsSpecialInstructions
          ? _value.orderHistoryDetailsSpecialInstructions
          : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryDetailsPoDocuments: null == orderHistoryDetailsPoDocuments
          ? _value.orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm {
    return $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>(
        _value.orderHistoryDetailsPaymentTerm, (value) {
      return _then(
          _value.copyWith(orderHistoryDetailsPaymentTerm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsDtoImplCopyWith<$Res>
    implements $OrderHistoryDetailsDtoCopyWith<$Res> {
  factory _$$OrderHistoryDetailsDtoImplCopyWith(
          _$OrderHistoryDetailsDtoImpl value,
          $Res Function(_$OrderHistoryDetailsDtoImpl) then) =
      __$$OrderHistoryDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderValue', defaultValue: 0.0) double orderValue,
      @JsonKey(name: 'TotalTax', defaultValue: 0) double totalTax,
      @JsonKey(name: 'DeliveryFee', defaultValue: 0) double deliveryFee,
      @JsonKey(name: 'ManualFee', defaultValue: 0) double manualFee,
      @JsonKey(name: 'TotalValue', defaultValue: 0) double totalValue,
      @JsonKey(name: 'TotalDiscount', defaultValue: 0) double totalDiscount,
      @JsonKey(name: 'ProcessingStatus', defaultValue: '')
      String processingStatus,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'ExpectedDeliveryDate', defaultValue: '')
      String expectedDeliveryDate,
      @JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
      String telephoneNumber,
      @JsonKey(readValue: _createdDateTimeReadValue) String createdDate,
      @JsonKey(name: 'EZRXNumber', defaultValue: '') String eZRXNumber,
      @JsonKey(name: 'OrderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'ReferenceNotes', defaultValue: '') String referenceNotes,
      @JsonKey(name: 'CompanyName', defaultValue: '') String companyName,
      @JsonKey(name: 'OrderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'POReference', defaultValue: '') String pOReference,
      @JsonKey(name: 'ShipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'SoldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'ShipToAddres', defaultValue: '') String shipToAddress,
      @JsonKey(name: 'SoldToAddress', defaultValue: '') String soldToAddress,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'OrderReason', defaultValue: '') String orderReason,
      @JsonKey(name: 'OrderItems', readValue: orderItemOverride)
      List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
      @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
      OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm,
      @JsonKey(
          name: 'SpecialInstructions', readValue: specialInstructionOverride)
      String orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'PODocuments', readValue: poDocumentOverride)
      List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'ItmCount', defaultValue: 0) int itemCount,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'TaxRate', readValue: handleTax) double taxRate});

  @override
  $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class __$$OrderHistoryDetailsDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsDtoCopyWithImpl<$Res,
        _$OrderHistoryDetailsDtoImpl>
    implements _$$OrderHistoryDetailsDtoImplCopyWith<$Res> {
  __$$OrderHistoryDetailsDtoImplCopyWithImpl(
      _$OrderHistoryDetailsDtoImpl _value,
      $Res Function(_$OrderHistoryDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderValue = null,
    Object? totalTax = null,
    Object? deliveryFee = null,
    Object? manualFee = null,
    Object? totalValue = null,
    Object? totalDiscount = null,
    Object? processingStatus = null,
    Object? requestedDeliveryDate = null,
    Object? expectedDeliveryDate = null,
    Object? type = null,
    Object? telephoneNumber = null,
    Object? createdDate = null,
    Object? eZRXNumber = null,
    Object? orderBy = null,
    Object? referenceNotes = null,
    Object? companyName = null,
    Object? orderNumber = null,
    Object? pOReference = null,
    Object? shipTo = null,
    Object? soldTo = null,
    Object? shipToAddress = null,
    Object? soldToAddress = null,
    Object? invoiceNumber = null,
    Object? orderReason = null,
    Object? orderHistoryDetailsOrderItem = null,
    Object? orderHistoryDetailsPaymentTerm = null,
    Object? orderHistoryDetailsSpecialInstructions = null,
    Object? orderHistoryDetailsPoDocuments = null,
    Object? itemCount = null,
    Object? isMarketPlace = null,
    Object? taxRate = null,
  }) {
    return _then(_$OrderHistoryDetailsDtoImpl(
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
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
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      expectedDeliveryDate: null == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
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
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryDetailsOrderItem: null == orderHistoryDetailsOrderItem
          ? _value._orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDto>,
      orderHistoryDetailsPaymentTerm: null == orderHistoryDetailsPaymentTerm
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTermDto,
      orderHistoryDetailsSpecialInstructions: null ==
              orderHistoryDetailsSpecialInstructions
          ? _value.orderHistoryDetailsSpecialInstructions
          : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryDetailsPoDocuments: null == orderHistoryDetailsPoDocuments
          ? _value._orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryDetailsDtoImpl extends _OrderHistoryDetailsDto {
  const _$OrderHistoryDetailsDtoImpl(
      {@JsonKey(name: 'OrderValue', defaultValue: 0.0) required this.orderValue,
      @JsonKey(name: 'TotalTax', defaultValue: 0) required this.totalTax,
      @JsonKey(name: 'DeliveryFee', defaultValue: 0) required this.deliveryFee,
      @JsonKey(name: 'ManualFee', defaultValue: 0) required this.manualFee,
      @JsonKey(name: 'TotalValue', defaultValue: 0) required this.totalValue,
      @JsonKey(name: 'TotalDiscount', defaultValue: 0)
      required this.totalDiscount,
      @JsonKey(name: 'ProcessingStatus', defaultValue: '')
      required this.processingStatus,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      required this.requestedDeliveryDate,
      @JsonKey(name: 'ExpectedDeliveryDate', defaultValue: '')
      required this.expectedDeliveryDate,
      @JsonKey(name: 'Type', defaultValue: '') required this.type,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
      required this.telephoneNumber,
      @JsonKey(readValue: _createdDateTimeReadValue) required this.createdDate,
      @JsonKey(name: 'EZRXNumber', defaultValue: '') required this.eZRXNumber,
      @JsonKey(name: 'OrderBy', defaultValue: '') required this.orderBy,
      @JsonKey(name: 'ReferenceNotes', defaultValue: '')
      required this.referenceNotes,
      @JsonKey(name: 'CompanyName', defaultValue: '') required this.companyName,
      @JsonKey(name: 'OrderNumber', defaultValue: '') required this.orderNumber,
      @JsonKey(name: 'POReference', defaultValue: '') required this.pOReference,
      @JsonKey(name: 'ShipTo', defaultValue: '') required this.shipTo,
      @JsonKey(name: 'SoldTo', defaultValue: '') required this.soldTo,
      @JsonKey(name: 'ShipToAddres', defaultValue: '')
      required this.shipToAddress,
      @JsonKey(name: 'SoldToAddress', defaultValue: '')
      required this.soldToAddress,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '')
      required this.invoiceNumber,
      @JsonKey(name: 'OrderReason', defaultValue: '') required this.orderReason,
      @JsonKey(name: 'OrderItems', readValue: orderItemOverride)
      required final List<OrderHistoryDetailsOrderItemDto>
          orderHistoryDetailsOrderItem,
      @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
      required this.orderHistoryDetailsPaymentTerm,
      @JsonKey(
          name: 'SpecialInstructions', readValue: specialInstructionOverride)
      required this.orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'PODocuments', readValue: poDocumentOverride)
      required final List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'ItmCount', defaultValue: 0) required this.itemCount,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
      required this.isMarketPlace,
      @JsonKey(name: 'TaxRate', readValue: handleTax) required this.taxRate})
      : _orderHistoryDetailsOrderItem = orderHistoryDetailsOrderItem,
        _orderHistoryDetailsPoDocuments = orderHistoryDetailsPoDocuments,
        super._();

  factory _$OrderHistoryDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'OrderValue', defaultValue: 0.0)
  final double orderValue;
  @override
  @JsonKey(name: 'TotalTax', defaultValue: 0)
  final double totalTax;
  @override
  @JsonKey(name: 'DeliveryFee', defaultValue: 0)
  final double deliveryFee;
  @override
  @JsonKey(name: 'ManualFee', defaultValue: 0)
  final double manualFee;
  @override
  @JsonKey(name: 'TotalValue', defaultValue: 0)
  final double totalValue;
  @override
  @JsonKey(name: 'TotalDiscount', defaultValue: 0)
  final double totalDiscount;
  @override
  @JsonKey(name: 'ProcessingStatus', defaultValue: '')
  final String processingStatus;
  @override
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  final String requestedDeliveryDate;
  @override
  @JsonKey(name: 'ExpectedDeliveryDate', defaultValue: '')
  final String expectedDeliveryDate;
  @override
  @JsonKey(name: 'Type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'TelephoneNumber', defaultValue: '')
  final String telephoneNumber;
  @override
  @JsonKey(readValue: _createdDateTimeReadValue)
  final String createdDate;
  @override
  @JsonKey(name: 'EZRXNumber', defaultValue: '')
  final String eZRXNumber;
  @override
  @JsonKey(name: 'OrderBy', defaultValue: '')
  final String orderBy;
  @override
  @JsonKey(name: 'ReferenceNotes', defaultValue: '')
  final String referenceNotes;
  @override
  @JsonKey(name: 'CompanyName', defaultValue: '')
  final String companyName;
  @override
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  final String orderNumber;
  @override
  @JsonKey(name: 'POReference', defaultValue: '')
  final String pOReference;
  @override
  @JsonKey(name: 'ShipTo', defaultValue: '')
  final String shipTo;
  @override
  @JsonKey(name: 'SoldTo', defaultValue: '')
  final String soldTo;
  @override
  @JsonKey(name: 'ShipToAddres', defaultValue: '')
  final String shipToAddress;
  @override
  @JsonKey(name: 'SoldToAddress', defaultValue: '')
  final String soldToAddress;
  @override
  @JsonKey(name: 'InvoiceNumber', defaultValue: '')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'OrderReason', defaultValue: '')
  final String orderReason;
  final List<OrderHistoryDetailsOrderItemDto> _orderHistoryDetailsOrderItem;
  @override
  @JsonKey(name: 'OrderItems', readValue: orderItemOverride)
  List<OrderHistoryDetailsOrderItemDto> get orderHistoryDetailsOrderItem {
    if (_orderHistoryDetailsOrderItem is EqualUnmodifiableListView)
      return _orderHistoryDetailsOrderItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsOrderItem);
  }

  @override
  @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
  final OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm;
  @override
  @JsonKey(name: 'SpecialInstructions', readValue: specialInstructionOverride)
  final String orderHistoryDetailsSpecialInstructions;
  final List<PoDocumentsDto> _orderHistoryDetailsPoDocuments;
  @override
  @JsonKey(name: 'PODocuments', readValue: poDocumentOverride)
  List<PoDocumentsDto> get orderHistoryDetailsPoDocuments {
    if (_orderHistoryDetailsPoDocuments is EqualUnmodifiableListView)
      return _orderHistoryDetailsPoDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsPoDocuments);
  }

  @override
  @JsonKey(name: 'ItmCount', defaultValue: 0)
  final int itemCount;
  @override
  @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
  final bool isMarketPlace;
  @override
  @JsonKey(name: 'TaxRate', readValue: handleTax)
  final double taxRate;

  @override
  String toString() {
    return 'OrderHistoryDetailsDto(orderValue: $orderValue, totalTax: $totalTax, deliveryFee: $deliveryFee, manualFee: $manualFee, totalValue: $totalValue, totalDiscount: $totalDiscount, processingStatus: $processingStatus, requestedDeliveryDate: $requestedDeliveryDate, expectedDeliveryDate: $expectedDeliveryDate, type: $type, telephoneNumber: $telephoneNumber, createdDate: $createdDate, eZRXNumber: $eZRXNumber, orderBy: $orderBy, referenceNotes: $referenceNotes, companyName: $companyName, orderNumber: $orderNumber, pOReference: $pOReference, shipTo: $shipTo, soldTo: $soldTo, shipToAddress: $shipToAddress, soldToAddress: $soldToAddress, invoiceNumber: $invoiceNumber, orderReason: $orderReason, orderHistoryDetailsOrderItem: $orderHistoryDetailsOrderItem, orderHistoryDetailsPaymentTerm: $orderHistoryDetailsPaymentTerm, orderHistoryDetailsSpecialInstructions: $orderHistoryDetailsSpecialInstructions, orderHistoryDetailsPoDocuments: $orderHistoryDetailsPoDocuments, itemCount: $itemCount, isMarketPlace: $isMarketPlace, taxRate: $taxRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsDtoImpl &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
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
            (identical(other.expectedDeliveryDate, expectedDeliveryDate) ||
                other.expectedDeliveryDate == expectedDeliveryDate) &&
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
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.pOReference, pOReference) ||
                other.pOReference == pOReference) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipToAddress, shipToAddress) ||
                other.shipToAddress == shipToAddress) &&
            (identical(other.soldToAddress, soldToAddress) ||
                other.soldToAddress == soldToAddress) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.orderReason, orderReason) ||
                other.orderReason == orderReason) &&
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
                _orderHistoryDetailsPoDocuments) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        orderValue,
        totalTax,
        deliveryFee,
        manualFee,
        totalValue,
        totalDiscount,
        processingStatus,
        requestedDeliveryDate,
        expectedDeliveryDate,
        type,
        telephoneNumber,
        createdDate,
        eZRXNumber,
        orderBy,
        referenceNotes,
        companyName,
        orderNumber,
        pOReference,
        shipTo,
        soldTo,
        shipToAddress,
        soldToAddress,
        invoiceNumber,
        orderReason,
        const DeepCollectionEquality().hash(_orderHistoryDetailsOrderItem),
        orderHistoryDetailsPaymentTerm,
        orderHistoryDetailsSpecialInstructions,
        const DeepCollectionEquality().hash(_orderHistoryDetailsPoDocuments),
        itemCount,
        isMarketPlace,
        taxRate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsDtoImplCopyWith<_$OrderHistoryDetailsDtoImpl>
      get copyWith => __$$OrderHistoryDetailsDtoImplCopyWithImpl<
          _$OrderHistoryDetailsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsDto extends OrderHistoryDetailsDto {
  const factory _OrderHistoryDetailsDto(
      {@JsonKey(name: 'OrderValue', defaultValue: 0.0)
      required final double orderValue,
      @JsonKey(name: 'TotalTax', defaultValue: 0)
      required final double totalTax,
      @JsonKey(name: 'DeliveryFee', defaultValue: 0)
      required final double deliveryFee,
      @JsonKey(name: 'ManualFee', defaultValue: 0)
      required final double manualFee,
      @JsonKey(name: 'TotalValue', defaultValue: 0)
      required final double totalValue,
      @JsonKey(name: 'TotalDiscount', defaultValue: 0)
      required final double totalDiscount,
      @JsonKey(name: 'ProcessingStatus', defaultValue: '')
      required final String processingStatus,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      required final String requestedDeliveryDate,
      @JsonKey(name: 'ExpectedDeliveryDate', defaultValue: '')
      required final String expectedDeliveryDate,
      @JsonKey(name: 'Type', defaultValue: '') required final String type,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
      required final String telephoneNumber,
      @JsonKey(readValue: _createdDateTimeReadValue)
      required final String createdDate,
      @JsonKey(name: 'EZRXNumber', defaultValue: '')
      required final String eZRXNumber,
      @JsonKey(name: 'OrderBy', defaultValue: '') required final String orderBy,
      @JsonKey(name: 'ReferenceNotes', defaultValue: '')
      required final String referenceNotes,
      @JsonKey(name: 'CompanyName', defaultValue: '')
      required final String companyName,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
      required final String orderNumber,
      @JsonKey(name: 'POReference', defaultValue: '')
      required final String pOReference,
      @JsonKey(name: 'ShipTo', defaultValue: '') required final String shipTo,
      @JsonKey(name: 'SoldTo', defaultValue: '') required final String soldTo,
      @JsonKey(name: 'ShipToAddres', defaultValue: '')
      required final String shipToAddress,
      @JsonKey(name: 'SoldToAddress', defaultValue: '')
      required final String soldToAddress,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '')
      required final String invoiceNumber,
      @JsonKey(name: 'OrderReason', defaultValue: '')
      required final String orderReason,
      @JsonKey(name: 'OrderItems', readValue: orderItemOverride)
      required final List<OrderHistoryDetailsOrderItemDto>
          orderHistoryDetailsOrderItem,
      @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
      required final OrderHistoryDetailsPaymentTermDto
          orderHistoryDetailsPaymentTerm,
      @JsonKey(
          name: 'SpecialInstructions', readValue: specialInstructionOverride)
      required final String orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'PODocuments', readValue: poDocumentOverride)
      required final List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'ItmCount', defaultValue: 0) required final int itemCount,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
      required final bool isMarketPlace,
      @JsonKey(name: 'TaxRate', readValue: handleTax)
      required final double taxRate}) = _$OrderHistoryDetailsDtoImpl;
  const _OrderHistoryDetailsDto._() : super._();

  factory _OrderHistoryDetailsDto.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'OrderValue', defaultValue: 0.0)
  double get orderValue;
  @override
  @JsonKey(name: 'TotalTax', defaultValue: 0)
  double get totalTax;
  @override
  @JsonKey(name: 'DeliveryFee', defaultValue: 0)
  double get deliveryFee;
  @override
  @JsonKey(name: 'ManualFee', defaultValue: 0)
  double get manualFee;
  @override
  @JsonKey(name: 'TotalValue', defaultValue: 0)
  double get totalValue;
  @override
  @JsonKey(name: 'TotalDiscount', defaultValue: 0)
  double get totalDiscount;
  @override
  @JsonKey(name: 'ProcessingStatus', defaultValue: '')
  String get processingStatus;
  @override
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate;
  @override
  @JsonKey(name: 'ExpectedDeliveryDate', defaultValue: '')
  String get expectedDeliveryDate;
  @override
  @JsonKey(name: 'Type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'TelephoneNumber', defaultValue: '')
  String get telephoneNumber;
  @override
  @JsonKey(readValue: _createdDateTimeReadValue)
  String get createdDate;
  @override
  @JsonKey(name: 'EZRXNumber', defaultValue: '')
  String get eZRXNumber;
  @override
  @JsonKey(name: 'OrderBy', defaultValue: '')
  String get orderBy;
  @override
  @JsonKey(name: 'ReferenceNotes', defaultValue: '')
  String get referenceNotes;
  @override
  @JsonKey(name: 'CompanyName', defaultValue: '')
  String get companyName;
  @override
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(name: 'POReference', defaultValue: '')
  String get pOReference;
  @override
  @JsonKey(name: 'ShipTo', defaultValue: '')
  String get shipTo;
  @override
  @JsonKey(name: 'SoldTo', defaultValue: '')
  String get soldTo;
  @override
  @JsonKey(name: 'ShipToAddres', defaultValue: '')
  String get shipToAddress;
  @override
  @JsonKey(name: 'SoldToAddress', defaultValue: '')
  String get soldToAddress;
  @override
  @JsonKey(name: 'InvoiceNumber', defaultValue: '')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'OrderReason', defaultValue: '')
  String get orderReason;
  @override
  @JsonKey(name: 'OrderItems', readValue: orderItemOverride)
  List<OrderHistoryDetailsOrderItemDto> get orderHistoryDetailsOrderItem;
  @override
  @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
  OrderHistoryDetailsPaymentTermDto get orderHistoryDetailsPaymentTerm;
  @override
  @JsonKey(name: 'SpecialInstructions', readValue: specialInstructionOverride)
  String get orderHistoryDetailsSpecialInstructions;
  @override
  @JsonKey(name: 'PODocuments', readValue: poDocumentOverride)
  List<PoDocumentsDto> get orderHistoryDetailsPoDocuments;
  @override
  @JsonKey(name: 'ItmCount', defaultValue: 0)
  int get itemCount;
  @override
  @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(name: 'TaxRate', readValue: handleTax)
  double get taxRate;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsDtoImplCopyWith<_$OrderHistoryDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
