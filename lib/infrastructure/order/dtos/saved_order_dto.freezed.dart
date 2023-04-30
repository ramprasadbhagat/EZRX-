// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedOrderDto _$SavedOrderDtoFromJson(Map<String, dynamic> json) {
  return _SavedOrderDto.fromJson(json);
}

/// @nodoc
mixin _$SavedOrderDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @_OrderProductItemListConverter()
  @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
  List<MaterialItemDto> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'draftorder', defaultValue: false)
  bool get isDraftOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'BillingDocument', defaultValue: '')
  String get billingDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'eZRxNumber', defaultValue: '')
  String get eZRxNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'SoldToParty', defaultValue: '')
  String get soldToParty => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShipToParty', defaultValue: '')
  String get shipToParty => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyName', defaultValue: '')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
  double get totalOrderValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeliveryDocument', defaultValue: '')
  String get deliveryDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesOrganization', defaultValue: '')
  String get salesOrganization => throw _privateConstructorUsedError;
  @JsonKey(name: 'Principal', defaultValue: '')
  String get principal => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProcessingStatus', defaultValue: '')
  String get processingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'country', defaultValue: '')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_code1', defaultValue: '')
  String get postCode1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderRequest', defaultValue: '')
  String get specialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'POReference', defaultValue: '')
  String get poReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTerm', defaultValue: '')
  String get payTerm => throw _privateConstructorUsedError;
  @JsonKey(name: 'collectiveNumber', defaultValue: '')
  String get collectiveNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity', defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'address1', defaultValue: '')
  String get address1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address2', defaultValue: '')
  String get address2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'city', defaultValue: '')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'fax', defaultValue: '')
  String get fax => throw _privateConstructorUsedError;
  @JsonKey(name: 'phonenumber', defaultValue: '')
  String get phonenumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderReason', defaultValue: '')
  String get orderReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'shippingCondition', defaultValue: '')
  String get shippingCondition => throw _privateConstructorUsedError;
  @JsonKey(name: 'user', defaultValue: '')
  String get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'contactPerson', defaultValue: '')
  String get contactPerson => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceNote', defaultValue: '')
  String get referenceNotes => throw _privateConstructorUsedError;
  @_PoDocumentsListConverter()
  @JsonKey(name: 'POAttachent', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get poAttachent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedOrderDtoCopyWith<SavedOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedOrderDtoCopyWith<$Res> {
  factory $SavedOrderDtoCopyWith(
          SavedOrderDto value, $Res Function(SavedOrderDto) then) =
      _$SavedOrderDtoCopyWithImpl<$Res, SavedOrderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @_OrderProductItemListConverter()
      @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
          List<MaterialItemDto> items,
      @JsonKey(name: 'draftorder', defaultValue: false)
          bool isDraftOrder,
      @JsonKey(name: 'BillingDocument', defaultValue: '')
          String billingDocument,
      @JsonKey(name: 'eZRxNumber', defaultValue: '')
          String eZRxNumber,
      @JsonKey(name: 'SoldToParty', defaultValue: '')
          String soldToParty,
      @JsonKey(name: 'ShipToParty', defaultValue: '')
          String shipToParty,
      @JsonKey(name: 'CompanyName', defaultValue: '')
          String companyName,
      @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
          double totalOrderValue,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
          String requestedDeliveryDate,
      @JsonKey(name: 'DeliveryDocument', defaultValue: '')
          String deliveryDocument,
      @JsonKey(name: 'SalesOrganization', defaultValue: '')
          String salesOrganization,
      @JsonKey(name: 'Principal', defaultValue: '')
          String principal,
      @JsonKey(name: 'ProcessingStatus', defaultValue: '')
          String processingStatus,
      @JsonKey(name: 'country', defaultValue: '')
          String country,
      @JsonKey(name: 'post_code1', defaultValue: '')
          String postCode1,
      @JsonKey(name: 'orderRequest', defaultValue: '')
          String specialInstructions,
      @JsonKey(name: 'POReference', defaultValue: '')
          String poReference,
      @JsonKey(name: 'paymentTerm', defaultValue: '')
          String payTerm,
      @JsonKey(name: 'collectiveNumber', defaultValue: '')
          String collectiveNo,
      @JsonKey(name: 'Quantity', defaultValue: 0)
          int quantity,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          double totalPrice,
      @JsonKey(name: 'address1', defaultValue: '')
          String address1,
      @JsonKey(name: 'address2', defaultValue: '')
          String address2,
      @JsonKey(name: 'city', defaultValue: '')
          String city,
      @JsonKey(name: 'fax', defaultValue: '')
          String fax,
      @JsonKey(name: 'phonenumber', defaultValue: '')
          String phonenumber,
      @JsonKey(name: 'orderType', defaultValue: '')
          String orderType,
      @JsonKey(name: 'orderReason', defaultValue: '')
          String orderReason,
      @JsonKey(name: 'shippingCondition', defaultValue: '')
          String shippingCondition,
      @JsonKey(name: 'user', defaultValue: '')
          String user,
      @JsonKey(name: 'contactPerson', defaultValue: '')
          String contactPerson,
      @JsonKey(name: 'referenceNote', defaultValue: '')
          String referenceNotes,
      @_PoDocumentsListConverter()
      @JsonKey(name: 'POAttachent', defaultValue: <PoDocumentsDto>[])
          List<PoDocumentsDto> poAttachent});
}

/// @nodoc
class _$SavedOrderDtoCopyWithImpl<$Res, $Val extends SavedOrderDto>
    implements $SavedOrderDtoCopyWith<$Res> {
  _$SavedOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? isDraftOrder = null,
    Object? billingDocument = null,
    Object? eZRxNumber = null,
    Object? soldToParty = null,
    Object? shipToParty = null,
    Object? companyName = null,
    Object? totalOrderValue = null,
    Object? requestedDeliveryDate = null,
    Object? deliveryDocument = null,
    Object? salesOrganization = null,
    Object? principal = null,
    Object? processingStatus = null,
    Object? country = null,
    Object? postCode1 = null,
    Object? specialInstructions = null,
    Object? poReference = null,
    Object? payTerm = null,
    Object? collectiveNo = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? address1 = null,
    Object? address2 = null,
    Object? city = null,
    Object? fax = null,
    Object? phonenumber = null,
    Object? orderType = null,
    Object? orderReason = null,
    Object? shippingCondition = null,
    Object? user = null,
    Object? contactPerson = null,
    Object? referenceNotes = null,
    Object? poAttachent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemDto>,
      isDraftOrder: null == isDraftOrder
          ? _value.isDraftOrder
          : isDraftOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      billingDocument: null == billingDocument
          ? _value.billingDocument
          : billingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      eZRxNumber: null == eZRxNumber
          ? _value.eZRxNumber
          : eZRxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      soldToParty: null == soldToParty
          ? _value.soldToParty
          : soldToParty // ignore: cast_nullable_to_non_nullable
              as String,
      shipToParty: null == shipToParty
          ? _value.shipToParty
          : shipToParty // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      totalOrderValue: null == totalOrderValue
          ? _value.totalOrderValue
          : totalOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDocument: null == deliveryDocument
          ? _value.deliveryDocument
          : deliveryDocument // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as String,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as String,
      processingStatus: null == processingStatus
          ? _value.processingStatus
          : processingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postCode1: null == postCode1
          ? _value.postCode1
          : postCode1 // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      poReference: null == poReference
          ? _value.poReference
          : poReference // ignore: cast_nullable_to_non_nullable
              as String,
      payTerm: null == payTerm
          ? _value.payTerm
          : payTerm // ignore: cast_nullable_to_non_nullable
              as String,
      collectiveNo: null == collectiveNo
          ? _value.collectiveNo
          : collectiveNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      address1: null == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      fax: null == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String,
      phonenumber: null == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCondition: null == shippingCondition
          ? _value.shippingCondition
          : shippingCondition // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      poAttachent: null == poAttachent
          ? _value.poAttachent
          : poAttachent // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedOrderDtoCopyWith<$Res>
    implements $SavedOrderDtoCopyWith<$Res> {
  factory _$$_SavedOrderDtoCopyWith(
          _$_SavedOrderDto value, $Res Function(_$_SavedOrderDto) then) =
      __$$_SavedOrderDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @_OrderProductItemListConverter()
      @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
          List<MaterialItemDto> items,
      @JsonKey(name: 'draftorder', defaultValue: false)
          bool isDraftOrder,
      @JsonKey(name: 'BillingDocument', defaultValue: '')
          String billingDocument,
      @JsonKey(name: 'eZRxNumber', defaultValue: '')
          String eZRxNumber,
      @JsonKey(name: 'SoldToParty', defaultValue: '')
          String soldToParty,
      @JsonKey(name: 'ShipToParty', defaultValue: '')
          String shipToParty,
      @JsonKey(name: 'CompanyName', defaultValue: '')
          String companyName,
      @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
          double totalOrderValue,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
          String requestedDeliveryDate,
      @JsonKey(name: 'DeliveryDocument', defaultValue: '')
          String deliveryDocument,
      @JsonKey(name: 'SalesOrganization', defaultValue: '')
          String salesOrganization,
      @JsonKey(name: 'Principal', defaultValue: '')
          String principal,
      @JsonKey(name: 'ProcessingStatus', defaultValue: '')
          String processingStatus,
      @JsonKey(name: 'country', defaultValue: '')
          String country,
      @JsonKey(name: 'post_code1', defaultValue: '')
          String postCode1,
      @JsonKey(name: 'orderRequest', defaultValue: '')
          String specialInstructions,
      @JsonKey(name: 'POReference', defaultValue: '')
          String poReference,
      @JsonKey(name: 'paymentTerm', defaultValue: '')
          String payTerm,
      @JsonKey(name: 'collectiveNumber', defaultValue: '')
          String collectiveNo,
      @JsonKey(name: 'Quantity', defaultValue: 0)
          int quantity,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          double totalPrice,
      @JsonKey(name: 'address1', defaultValue: '')
          String address1,
      @JsonKey(name: 'address2', defaultValue: '')
          String address2,
      @JsonKey(name: 'city', defaultValue: '')
          String city,
      @JsonKey(name: 'fax', defaultValue: '')
          String fax,
      @JsonKey(name: 'phonenumber', defaultValue: '')
          String phonenumber,
      @JsonKey(name: 'orderType', defaultValue: '')
          String orderType,
      @JsonKey(name: 'orderReason', defaultValue: '')
          String orderReason,
      @JsonKey(name: 'shippingCondition', defaultValue: '')
          String shippingCondition,
      @JsonKey(name: 'user', defaultValue: '')
          String user,
      @JsonKey(name: 'contactPerson', defaultValue: '')
          String contactPerson,
      @JsonKey(name: 'referenceNote', defaultValue: '')
          String referenceNotes,
      @_PoDocumentsListConverter()
      @JsonKey(name: 'POAttachent', defaultValue: <PoDocumentsDto>[])
          List<PoDocumentsDto> poAttachent});
}

/// @nodoc
class __$$_SavedOrderDtoCopyWithImpl<$Res>
    extends _$SavedOrderDtoCopyWithImpl<$Res, _$_SavedOrderDto>
    implements _$$_SavedOrderDtoCopyWith<$Res> {
  __$$_SavedOrderDtoCopyWithImpl(
      _$_SavedOrderDto _value, $Res Function(_$_SavedOrderDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? isDraftOrder = null,
    Object? billingDocument = null,
    Object? eZRxNumber = null,
    Object? soldToParty = null,
    Object? shipToParty = null,
    Object? companyName = null,
    Object? totalOrderValue = null,
    Object? requestedDeliveryDate = null,
    Object? deliveryDocument = null,
    Object? salesOrganization = null,
    Object? principal = null,
    Object? processingStatus = null,
    Object? country = null,
    Object? postCode1 = null,
    Object? specialInstructions = null,
    Object? poReference = null,
    Object? payTerm = null,
    Object? collectiveNo = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? address1 = null,
    Object? address2 = null,
    Object? city = null,
    Object? fax = null,
    Object? phonenumber = null,
    Object? orderType = null,
    Object? orderReason = null,
    Object? shippingCondition = null,
    Object? user = null,
    Object? contactPerson = null,
    Object? referenceNotes = null,
    Object? poAttachent = null,
  }) {
    return _then(_$_SavedOrderDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemDto>,
      isDraftOrder: null == isDraftOrder
          ? _value.isDraftOrder
          : isDraftOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      billingDocument: null == billingDocument
          ? _value.billingDocument
          : billingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      eZRxNumber: null == eZRxNumber
          ? _value.eZRxNumber
          : eZRxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      soldToParty: null == soldToParty
          ? _value.soldToParty
          : soldToParty // ignore: cast_nullable_to_non_nullable
              as String,
      shipToParty: null == shipToParty
          ? _value.shipToParty
          : shipToParty // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      totalOrderValue: null == totalOrderValue
          ? _value.totalOrderValue
          : totalOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDocument: null == deliveryDocument
          ? _value.deliveryDocument
          : deliveryDocument // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as String,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as String,
      processingStatus: null == processingStatus
          ? _value.processingStatus
          : processingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postCode1: null == postCode1
          ? _value.postCode1
          : postCode1 // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      poReference: null == poReference
          ? _value.poReference
          : poReference // ignore: cast_nullable_to_non_nullable
              as String,
      payTerm: null == payTerm
          ? _value.payTerm
          : payTerm // ignore: cast_nullable_to_non_nullable
              as String,
      collectiveNo: null == collectiveNo
          ? _value.collectiveNo
          : collectiveNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      address1: null == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      fax: null == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String,
      phonenumber: null == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCondition: null == shippingCondition
          ? _value.shippingCondition
          : shippingCondition // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      poAttachent: null == poAttachent
          ? _value._poAttachent
          : poAttachent // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedOrderDto extends _SavedOrderDto {
  const _$_SavedOrderDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required this.id,
      @_OrderProductItemListConverter()
      @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
          required final List<MaterialItemDto> items,
      @JsonKey(name: 'draftorder', defaultValue: false)
          required this.isDraftOrder,
      @JsonKey(name: 'BillingDocument', defaultValue: '')
          required this.billingDocument,
      @JsonKey(name: 'eZRxNumber', defaultValue: '')
          required this.eZRxNumber,
      @JsonKey(name: 'SoldToParty', defaultValue: '')
          required this.soldToParty,
      @JsonKey(name: 'ShipToParty', defaultValue: '')
          required this.shipToParty,
      @JsonKey(name: 'CompanyName', defaultValue: '')
          required this.companyName,
      @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
          required this.totalOrderValue,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
          required this.requestedDeliveryDate,
      @JsonKey(name: 'DeliveryDocument', defaultValue: '')
          required this.deliveryDocument,
      @JsonKey(name: 'SalesOrganization', defaultValue: '')
          required this.salesOrganization,
      @JsonKey(name: 'Principal', defaultValue: '')
          required this.principal,
      @JsonKey(name: 'ProcessingStatus', defaultValue: '')
          required this.processingStatus,
      @JsonKey(name: 'country', defaultValue: '')
          required this.country,
      @JsonKey(name: 'post_code1', defaultValue: '')
          required this.postCode1,
      @JsonKey(name: 'orderRequest', defaultValue: '')
          required this.specialInstructions,
      @JsonKey(name: 'POReference', defaultValue: '')
          required this.poReference,
      @JsonKey(name: 'paymentTerm', defaultValue: '')
          required this.payTerm,
      @JsonKey(name: 'collectiveNumber', defaultValue: '')
          required this.collectiveNo,
      @JsonKey(name: 'Quantity', defaultValue: 0)
          required this.quantity,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          required this.unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          required this.totalPrice,
      @JsonKey(name: 'address1', defaultValue: '')
          required this.address1,
      @JsonKey(name: 'address2', defaultValue: '')
          required this.address2,
      @JsonKey(name: 'city', defaultValue: '')
          required this.city,
      @JsonKey(name: 'fax', defaultValue: '')
          required this.fax,
      @JsonKey(name: 'phonenumber', defaultValue: '')
          required this.phonenumber,
      @JsonKey(name: 'orderType', defaultValue: '')
          required this.orderType,
      @JsonKey(name: 'orderReason', defaultValue: '')
          required this.orderReason,
      @JsonKey(name: 'shippingCondition', defaultValue: '')
          required this.shippingCondition,
      @JsonKey(name: 'user', defaultValue: '')
          required this.user,
      @JsonKey(name: 'contactPerson', defaultValue: '')
          required this.contactPerson,
      @JsonKey(name: 'referenceNote', defaultValue: '')
          required this.referenceNotes,
      @_PoDocumentsListConverter()
      @JsonKey(name: 'POAttachent', defaultValue: <PoDocumentsDto>[])
          required final List<PoDocumentsDto> poAttachent})
      : _items = items,
        _poAttachent = poAttachent,
        super._();

  factory _$_SavedOrderDto.fromJson(Map<String, dynamic> json) =>
      _$$_SavedOrderDtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  final List<MaterialItemDto> _items;
  @override
  @_OrderProductItemListConverter()
  @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
  List<MaterialItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'draftorder', defaultValue: false)
  final bool isDraftOrder;
  @override
  @JsonKey(name: 'BillingDocument', defaultValue: '')
  final String billingDocument;
  @override
  @JsonKey(name: 'eZRxNumber', defaultValue: '')
  final String eZRxNumber;
  @override
  @JsonKey(name: 'SoldToParty', defaultValue: '')
  final String soldToParty;
  @override
  @JsonKey(name: 'ShipToParty', defaultValue: '')
  final String shipToParty;
  @override
  @JsonKey(name: 'CompanyName', defaultValue: '')
  final String companyName;
  @override
  @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
  final double totalOrderValue;
  @override
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  final String requestedDeliveryDate;
  @override
  @JsonKey(name: 'DeliveryDocument', defaultValue: '')
  final String deliveryDocument;
  @override
  @JsonKey(name: 'SalesOrganization', defaultValue: '')
  final String salesOrganization;
  @override
  @JsonKey(name: 'Principal', defaultValue: '')
  final String principal;
  @override
  @JsonKey(name: 'ProcessingStatus', defaultValue: '')
  final String processingStatus;
  @override
  @JsonKey(name: 'country', defaultValue: '')
  final String country;
  @override
  @JsonKey(name: 'post_code1', defaultValue: '')
  final String postCode1;
  @override
  @JsonKey(name: 'orderRequest', defaultValue: '')
  final String specialInstructions;
  @override
  @JsonKey(name: 'POReference', defaultValue: '')
  final String poReference;
  @override
  @JsonKey(name: 'paymentTerm', defaultValue: '')
  final String payTerm;
  @override
  @JsonKey(name: 'collectiveNumber', defaultValue: '')
  final String collectiveNo;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  final int quantity;
  @override
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  final double unitPrice;
  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  final double totalPrice;
  @override
  @JsonKey(name: 'address1', defaultValue: '')
  final String address1;
  @override
  @JsonKey(name: 'address2', defaultValue: '')
  final String address2;
  @override
  @JsonKey(name: 'city', defaultValue: '')
  final String city;
  @override
  @JsonKey(name: 'fax', defaultValue: '')
  final String fax;
  @override
  @JsonKey(name: 'phonenumber', defaultValue: '')
  final String phonenumber;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  final String orderType;
  @override
  @JsonKey(name: 'orderReason', defaultValue: '')
  final String orderReason;
  @override
  @JsonKey(name: 'shippingCondition', defaultValue: '')
  final String shippingCondition;
  @override
  @JsonKey(name: 'user', defaultValue: '')
  final String user;
  @override
  @JsonKey(name: 'contactPerson', defaultValue: '')
  final String contactPerson;
  @override
  @JsonKey(name: 'referenceNote', defaultValue: '')
  final String referenceNotes;
  final List<PoDocumentsDto> _poAttachent;
  @override
  @_PoDocumentsListConverter()
  @JsonKey(name: 'POAttachent', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get poAttachent {
    if (_poAttachent is EqualUnmodifiableListView) return _poAttachent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poAttachent);
  }

  @override
  String toString() {
    return 'SavedOrderDto(id: $id, items: $items, isDraftOrder: $isDraftOrder, billingDocument: $billingDocument, eZRxNumber: $eZRxNumber, soldToParty: $soldToParty, shipToParty: $shipToParty, companyName: $companyName, totalOrderValue: $totalOrderValue, requestedDeliveryDate: $requestedDeliveryDate, deliveryDocument: $deliveryDocument, salesOrganization: $salesOrganization, principal: $principal, processingStatus: $processingStatus, country: $country, postCode1: $postCode1, specialInstructions: $specialInstructions, poReference: $poReference, payTerm: $payTerm, collectiveNo: $collectiveNo, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, address1: $address1, address2: $address2, city: $city, fax: $fax, phonenumber: $phonenumber, orderType: $orderType, orderReason: $orderReason, shippingCondition: $shippingCondition, user: $user, contactPerson: $contactPerson, referenceNotes: $referenceNotes, poAttachent: $poAttachent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedOrderDto &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isDraftOrder, isDraftOrder) ||
                other.isDraftOrder == isDraftOrder) &&
            (identical(other.billingDocument, billingDocument) ||
                other.billingDocument == billingDocument) &&
            (identical(other.eZRxNumber, eZRxNumber) ||
                other.eZRxNumber == eZRxNumber) &&
            (identical(other.soldToParty, soldToParty) ||
                other.soldToParty == soldToParty) &&
            (identical(other.shipToParty, shipToParty) ||
                other.shipToParty == shipToParty) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.totalOrderValue, totalOrderValue) ||
                other.totalOrderValue == totalOrderValue) &&
            (identical(other.requestedDeliveryDate, requestedDeliveryDate) ||
                other.requestedDeliveryDate == requestedDeliveryDate) &&
            (identical(other.deliveryDocument, deliveryDocument) ||
                other.deliveryDocument == deliveryDocument) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.processingStatus, processingStatus) ||
                other.processingStatus == processingStatus) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postCode1, postCode1) ||
                other.postCode1 == postCode1) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.poReference, poReference) ||
                other.poReference == poReference) &&
            (identical(other.payTerm, payTerm) || other.payTerm == payTerm) &&
            (identical(other.collectiveNo, collectiveNo) ||
                other.collectiveNo == collectiveNo) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.phonenumber, phonenumber) ||
                other.phonenumber == phonenumber) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.orderReason, orderReason) ||
                other.orderReason == orderReason) &&
            (identical(other.shippingCondition, shippingCondition) ||
                other.shippingCondition == shippingCondition) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.referenceNotes, referenceNotes) ||
                other.referenceNotes == referenceNotes) &&
            const DeepCollectionEquality()
                .equals(other._poAttachent, _poAttachent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_items),
        isDraftOrder,
        billingDocument,
        eZRxNumber,
        soldToParty,
        shipToParty,
        companyName,
        totalOrderValue,
        requestedDeliveryDate,
        deliveryDocument,
        salesOrganization,
        principal,
        processingStatus,
        country,
        postCode1,
        specialInstructions,
        poReference,
        payTerm,
        collectiveNo,
        quantity,
        unitPrice,
        totalPrice,
        address1,
        address2,
        city,
        fax,
        phonenumber,
        orderType,
        orderReason,
        shippingCondition,
        user,
        contactPerson,
        referenceNotes,
        const DeepCollectionEquality().hash(_poAttachent)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedOrderDtoCopyWith<_$_SavedOrderDto> get copyWith =>
      __$$_SavedOrderDtoCopyWithImpl<_$_SavedOrderDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedOrderDtoToJson(
      this,
    );
  }
}

abstract class _SavedOrderDto extends SavedOrderDto {
  const factory _SavedOrderDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required final String id,
      @_OrderProductItemListConverter()
      @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
          required final List<MaterialItemDto> items,
      @JsonKey(name: 'draftorder', defaultValue: false)
          required final bool isDraftOrder,
      @JsonKey(name: 'BillingDocument', defaultValue: '')
          required final String billingDocument,
      @JsonKey(name: 'eZRxNumber', defaultValue: '')
          required final String eZRxNumber,
      @JsonKey(name: 'SoldToParty', defaultValue: '')
          required final String soldToParty,
      @JsonKey(name: 'ShipToParty', defaultValue: '')
          required final String shipToParty,
      @JsonKey(name: 'CompanyName', defaultValue: '')
          required final String companyName,
      @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
          required final double totalOrderValue,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
          required final String requestedDeliveryDate,
      @JsonKey(name: 'DeliveryDocument', defaultValue: '')
          required final String deliveryDocument,
      @JsonKey(name: 'SalesOrganization', defaultValue: '')
          required final String salesOrganization,
      @JsonKey(name: 'Principal', defaultValue: '')
          required final String principal,
      @JsonKey(name: 'ProcessingStatus', defaultValue: '')
          required final String processingStatus,
      @JsonKey(name: 'country', defaultValue: '')
          required final String country,
      @JsonKey(name: 'post_code1', defaultValue: '')
          required final String postCode1,
      @JsonKey(name: 'orderRequest', defaultValue: '')
          required final String specialInstructions,
      @JsonKey(name: 'POReference', defaultValue: '')
          required final String poReference,
      @JsonKey(name: 'paymentTerm', defaultValue: '')
          required final String payTerm,
      @JsonKey(name: 'collectiveNumber', defaultValue: '')
          required final String collectiveNo,
      @JsonKey(name: 'Quantity', defaultValue: 0)
          required final int quantity,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          required final double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          required final double totalPrice,
      @JsonKey(name: 'address1', defaultValue: '')
          required final String address1,
      @JsonKey(name: 'address2', defaultValue: '')
          required final String address2,
      @JsonKey(name: 'city', defaultValue: '')
          required final String city,
      @JsonKey(name: 'fax', defaultValue: '')
          required final String fax,
      @JsonKey(name: 'phonenumber', defaultValue: '')
          required final String phonenumber,
      @JsonKey(name: 'orderType', defaultValue: '')
          required final String orderType,
      @JsonKey(name: 'orderReason', defaultValue: '')
          required final String orderReason,
      @JsonKey(name: 'shippingCondition', defaultValue: '')
          required final String shippingCondition,
      @JsonKey(name: 'user', defaultValue: '')
          required final String user,
      @JsonKey(name: 'contactPerson', defaultValue: '')
          required final String contactPerson,
      @JsonKey(name: 'referenceNote', defaultValue: '')
          required final String referenceNotes,
      @_PoDocumentsListConverter()
      @JsonKey(name: 'POAttachent', defaultValue: <PoDocumentsDto>[])
          required final List<PoDocumentsDto> poAttachent}) = _$_SavedOrderDto;
  const _SavedOrderDto._() : super._();

  factory _SavedOrderDto.fromJson(Map<String, dynamic> json) =
      _$_SavedOrderDto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @_OrderProductItemListConverter()
  @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
  List<MaterialItemDto> get items;
  @override
  @JsonKey(name: 'draftorder', defaultValue: false)
  bool get isDraftOrder;
  @override
  @JsonKey(name: 'BillingDocument', defaultValue: '')
  String get billingDocument;
  @override
  @JsonKey(name: 'eZRxNumber', defaultValue: '')
  String get eZRxNumber;
  @override
  @JsonKey(name: 'SoldToParty', defaultValue: '')
  String get soldToParty;
  @override
  @JsonKey(name: 'ShipToParty', defaultValue: '')
  String get shipToParty;
  @override
  @JsonKey(name: 'CompanyName', defaultValue: '')
  String get companyName;
  @override
  @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
  double get totalOrderValue;
  @override
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate;
  @override
  @JsonKey(name: 'DeliveryDocument', defaultValue: '')
  String get deliveryDocument;
  @override
  @JsonKey(name: 'SalesOrganization', defaultValue: '')
  String get salesOrganization;
  @override
  @JsonKey(name: 'Principal', defaultValue: '')
  String get principal;
  @override
  @JsonKey(name: 'ProcessingStatus', defaultValue: '')
  String get processingStatus;
  @override
  @JsonKey(name: 'country', defaultValue: '')
  String get country;
  @override
  @JsonKey(name: 'post_code1', defaultValue: '')
  String get postCode1;
  @override
  @JsonKey(name: 'orderRequest', defaultValue: '')
  String get specialInstructions;
  @override
  @JsonKey(name: 'POReference', defaultValue: '')
  String get poReference;
  @override
  @JsonKey(name: 'paymentTerm', defaultValue: '')
  String get payTerm;
  @override
  @JsonKey(name: 'collectiveNumber', defaultValue: '')
  String get collectiveNo;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  int get quantity;
  @override
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  double get unitPrice;
  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice;
  @override
  @JsonKey(name: 'address1', defaultValue: '')
  String get address1;
  @override
  @JsonKey(name: 'address2', defaultValue: '')
  String get address2;
  @override
  @JsonKey(name: 'city', defaultValue: '')
  String get city;
  @override
  @JsonKey(name: 'fax', defaultValue: '')
  String get fax;
  @override
  @JsonKey(name: 'phonenumber', defaultValue: '')
  String get phonenumber;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType;
  @override
  @JsonKey(name: 'orderReason', defaultValue: '')
  String get orderReason;
  @override
  @JsonKey(name: 'shippingCondition', defaultValue: '')
  String get shippingCondition;
  @override
  @JsonKey(name: 'user', defaultValue: '')
  String get user;
  @override
  @JsonKey(name: 'contactPerson', defaultValue: '')
  String get contactPerson;
  @override
  @JsonKey(name: 'referenceNote', defaultValue: '')
  String get referenceNotes;
  @override
  @_PoDocumentsListConverter()
  @JsonKey(name: 'POAttachent', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get poAttachent;
  @override
  @JsonKey(ignore: true)
  _$$_SavedOrderDtoCopyWith<_$_SavedOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}
