// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryItemDto _$OrderHistoryItemDtoFromJson(Map<String, dynamic> json) {
  return _OrderHistoryItemDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryItemDto {
  @JsonKey(name: 'MaterialCode', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'Qty', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'mrp', defaultValue: 0.0)
  double get originPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeliveryDate', defaultValue: '')
  String get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(readValue: _createdDateTimeReadValue)
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderBy', defaultValue: '')
  String get orderBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderType', defaultValue: '')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Batch', defaultValue: '')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
  bool get isBonusMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'TelephoneNumber', defaultValue: '')
  String get telephoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvoiceNumber', defaultValue: '')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'POReference', defaultValue: '')
  String get pOReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManufactureName', defaultValue: '')
  String get manufactureName => throw _privateConstructorUsedError;
  @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  String get specialInstruction => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'EZRXNumber', defaultValue: '')
  String get eZRXNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get orderHistoryItemPoAttachments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promoStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  bool get isCounterOffer => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsBundle', defaultValue: false)
  bool get isBundle => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineNumber', defaultValue: '')
  String get lineNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'HidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryItemDtoCopyWith<OrderHistoryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryItemDtoCopyWith<$Res> {
  factory $OrderHistoryItemDtoCopyWith(
          OrderHistoryItemDto value, $Res Function(OrderHistoryItemDto) then) =
      _$OrderHistoryItemDtoCopyWithImpl<$Res, OrderHistoryItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0)
          int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0)
          double originPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          double totalPrice,
      @JsonKey(name: 'Status', defaultValue: '')
          String status,
      @JsonKey(name: 'DeliveryDate', defaultValue: '')
          String deliveryDate,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
          String orderNumber,
      @JsonKey(readValue: _createdDateTimeReadValue)
          String createdDate,
      @JsonKey(name: 'OrderBy', defaultValue: '')
          String orderBy,
      @JsonKey(name: 'OrderType', defaultValue: '')
          String orderType,
      @JsonKey(name: 'Batch', defaultValue: '')
          String batch,
      @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
          bool isBonusMaterial,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
          String telephoneNumber,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '')
          String invoiceNumber,
      @JsonKey(name: 'POReference', defaultValue: '')
          String pOReference,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
          String manufactureName,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
          String governmentMaterialCode,
      @JsonKey(name: 'ExpiryDate', defaultValue: '')
          String expiryDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
          String requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
          String specialInstruction,
      @JsonKey(name: 'Tax', defaultValue: 0.0)
          double tax,
      @JsonKey(name: 'EZRXNumber', defaultValue: '')
          String eZRXNumber,
      @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
          List<PoDocumentsDto> orderHistoryItemPoAttachments,
      @JsonKey(name: 'promoStatus', defaultValue: false)
          bool promoStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
          bool isCounterOffer,
      @JsonKey(name: 'IsBundle', defaultValue: false)
          bool isBundle,
      @JsonKey(name: 'LineNumber', defaultValue: '')
          String lineNumber,
      @JsonKey(name: 'PrincipalCode', defaultValue: '')
          String principalCode,
      @JsonKey(name: 'HidePrice', defaultValue: false)
          bool hidePrice});
}

/// @nodoc
class _$OrderHistoryItemDtoCopyWithImpl<$Res, $Val extends OrderHistoryItemDto>
    implements $OrderHistoryItemDtoCopyWith<$Res> {
  _$OrderHistoryItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? originPrice = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? deliveryDate = null,
    Object? orderNumber = null,
    Object? createdDate = null,
    Object? orderBy = null,
    Object? orderType = null,
    Object? batch = null,
    Object? isBonusMaterial = null,
    Object? telephoneNumber = null,
    Object? invoiceNumber = null,
    Object? pOReference = null,
    Object? manufactureName = null,
    Object? governmentMaterialCode = null,
    Object? expiryDate = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstruction = null,
    Object? tax = null,
    Object? eZRXNumber = null,
    Object? orderHistoryItemPoAttachments = null,
    Object? promoStatus = null,
    Object? isCounterOffer = null,
    Object? isBundle = null,
    Object? lineNumber = null,
    Object? principalCode = null,
    Object? hidePrice = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      originPrice: null == originPrice
          ? _value.originPrice
          : originPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      isBonusMaterial: null == isBonusMaterial
          ? _value.isBonusMaterial
          : isBonusMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as String,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryItemPoAttachments: null == orderHistoryItemPoAttachments
          ? _value.orderHistoryItemPoAttachments
          : orderHistoryItemPoAttachments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      isBundle: null == isBundle
          ? _value.isBundle
          : isBundle // ignore: cast_nullable_to_non_nullable
              as bool,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderHistoryItemDtoCopyWith<$Res>
    implements $OrderHistoryItemDtoCopyWith<$Res> {
  factory _$$_OrderHistoryItemDtoCopyWith(_$_OrderHistoryItemDto value,
          $Res Function(_$_OrderHistoryItemDto) then) =
      __$$_OrderHistoryItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0)
          int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0)
          double originPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          double totalPrice,
      @JsonKey(name: 'Status', defaultValue: '')
          String status,
      @JsonKey(name: 'DeliveryDate', defaultValue: '')
          String deliveryDate,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
          String orderNumber,
      @JsonKey(readValue: _createdDateTimeReadValue)
          String createdDate,
      @JsonKey(name: 'OrderBy', defaultValue: '')
          String orderBy,
      @JsonKey(name: 'OrderType', defaultValue: '')
          String orderType,
      @JsonKey(name: 'Batch', defaultValue: '')
          String batch,
      @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
          bool isBonusMaterial,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
          String telephoneNumber,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '')
          String invoiceNumber,
      @JsonKey(name: 'POReference', defaultValue: '')
          String pOReference,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
          String manufactureName,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
          String governmentMaterialCode,
      @JsonKey(name: 'ExpiryDate', defaultValue: '')
          String expiryDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
          String requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
          String specialInstruction,
      @JsonKey(name: 'Tax', defaultValue: 0.0)
          double tax,
      @JsonKey(name: 'EZRXNumber', defaultValue: '')
          String eZRXNumber,
      @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
          List<PoDocumentsDto> orderHistoryItemPoAttachments,
      @JsonKey(name: 'promoStatus', defaultValue: false)
          bool promoStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
          bool isCounterOffer,
      @JsonKey(name: 'IsBundle', defaultValue: false)
          bool isBundle,
      @JsonKey(name: 'LineNumber', defaultValue: '')
          String lineNumber,
      @JsonKey(name: 'PrincipalCode', defaultValue: '')
          String principalCode,
      @JsonKey(name: 'HidePrice', defaultValue: false)
          bool hidePrice});
}

/// @nodoc
class __$$_OrderHistoryItemDtoCopyWithImpl<$Res>
    extends _$OrderHistoryItemDtoCopyWithImpl<$Res, _$_OrderHistoryItemDto>
    implements _$$_OrderHistoryItemDtoCopyWith<$Res> {
  __$$_OrderHistoryItemDtoCopyWithImpl(_$_OrderHistoryItemDto _value,
      $Res Function(_$_OrderHistoryItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? originPrice = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? deliveryDate = null,
    Object? orderNumber = null,
    Object? createdDate = null,
    Object? orderBy = null,
    Object? orderType = null,
    Object? batch = null,
    Object? isBonusMaterial = null,
    Object? telephoneNumber = null,
    Object? invoiceNumber = null,
    Object? pOReference = null,
    Object? manufactureName = null,
    Object? governmentMaterialCode = null,
    Object? expiryDate = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstruction = null,
    Object? tax = null,
    Object? eZRXNumber = null,
    Object? orderHistoryItemPoAttachments = null,
    Object? promoStatus = null,
    Object? isCounterOffer = null,
    Object? isBundle = null,
    Object? lineNumber = null,
    Object? principalCode = null,
    Object? hidePrice = null,
  }) {
    return _then(_$_OrderHistoryItemDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      originPrice: null == originPrice
          ? _value.originPrice
          : originPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      isBonusMaterial: null == isBonusMaterial
          ? _value.isBonusMaterial
          : isBonusMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as String,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryItemPoAttachments: null == orderHistoryItemPoAttachments
          ? _value._orderHistoryItemPoAttachments
          : orderHistoryItemPoAttachments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      isBundle: null == isBundle
          ? _value.isBundle
          : isBundle // ignore: cast_nullable_to_non_nullable
              as bool,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryItemDto extends _OrderHistoryItemDto {
  const _$_OrderHistoryItemDto(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0)
          required this.qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          required this.unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0)
          required this.originPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          required this.totalPrice,
      @JsonKey(name: 'Status', defaultValue: '')
          required this.status,
      @JsonKey(name: 'DeliveryDate', defaultValue: '')
          required this.deliveryDate,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
          required this.orderNumber,
      @JsonKey(readValue: _createdDateTimeReadValue)
          required this.createdDate,
      @JsonKey(name: 'OrderBy', defaultValue: '')
          required this.orderBy,
      @JsonKey(name: 'OrderType', defaultValue: '')
          required this.orderType,
      @JsonKey(name: 'Batch', defaultValue: '')
          required this.batch,
      @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
          required this.isBonusMaterial,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
          required this.telephoneNumber,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '')
          required this.invoiceNumber,
      @JsonKey(name: 'POReference', defaultValue: '')
          required this.pOReference,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
          required this.manufactureName,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
          required this.governmentMaterialCode,
      @JsonKey(name: 'ExpiryDate', defaultValue: '')
          required this.expiryDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
          required this.requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
          required this.specialInstruction,
      @JsonKey(name: 'Tax', defaultValue: 0.0)
          required this.tax,
      @JsonKey(name: 'EZRXNumber', defaultValue: '')
          required this.eZRXNumber,
      @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
          required final List<PoDocumentsDto> orderHistoryItemPoAttachments,
      @JsonKey(name: 'promoStatus', defaultValue: false)
          required this.promoStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
          required this.isCounterOffer,
      @JsonKey(name: 'IsBundle', defaultValue: false)
          required this.isBundle,
      @JsonKey(name: 'LineNumber', defaultValue: '')
          required this.lineNumber,
      @JsonKey(name: 'PrincipalCode', defaultValue: '')
          required this.principalCode,
      @JsonKey(name: 'HidePrice', defaultValue: false)
          required this.hidePrice})
      : _orderHistoryItemPoAttachments = orderHistoryItemPoAttachments,
        super._();

  factory _$_OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderHistoryItemDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialCode', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'Qty', defaultValue: 0)
  final int qty;
  @override
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  final double unitPrice;
  @override
  @JsonKey(name: 'mrp', defaultValue: 0.0)
  final double originPrice;
  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  final double totalPrice;
  @override
  @JsonKey(name: 'Status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'DeliveryDate', defaultValue: '')
  final String deliveryDate;
  @override
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  final String orderNumber;
  @override
  @JsonKey(readValue: _createdDateTimeReadValue)
  final String createdDate;
  @override
  @JsonKey(name: 'OrderBy', defaultValue: '')
  final String orderBy;
  @override
  @JsonKey(name: 'OrderType', defaultValue: '')
  final String orderType;
  @override
  @JsonKey(name: 'Batch', defaultValue: '')
  final String batch;
  @override
  @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
  final bool isBonusMaterial;
  @override
  @JsonKey(name: 'TelephoneNumber', defaultValue: '')
  final String telephoneNumber;
  @override
  @JsonKey(name: 'InvoiceNumber', defaultValue: '')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'POReference', defaultValue: '')
  final String pOReference;
  @override
  @JsonKey(name: 'ManufactureName', defaultValue: '')
  final String manufactureName;
  @override
  @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  final String expiryDate;
  @override
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  final String requestedDeliveryDate;
  @override
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  final String specialInstruction;
  @override
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  final double tax;
  @override
  @JsonKey(name: 'EZRXNumber', defaultValue: '')
  final String eZRXNumber;
  final List<PoDocumentsDto> _orderHistoryItemPoAttachments;
  @override
  @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get orderHistoryItemPoAttachments {
    if (_orderHistoryItemPoAttachments is EqualUnmodifiableListView)
      return _orderHistoryItemPoAttachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryItemPoAttachments);
  }

  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  final bool promoStatus;
  @override
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  final bool isCounterOffer;
  @override
  @JsonKey(name: 'IsBundle', defaultValue: false)
  final bool isBundle;
  @override
  @JsonKey(name: 'LineNumber', defaultValue: '')
  final String lineNumber;
  @override
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'HidePrice', defaultValue: false)
  final bool hidePrice;

  @override
  String toString() {
    return 'OrderHistoryItemDto(materialNumber: $materialNumber, materialDescription: $materialDescription, qty: $qty, unitPrice: $unitPrice, originPrice: $originPrice, totalPrice: $totalPrice, status: $status, deliveryDate: $deliveryDate, orderNumber: $orderNumber, createdDate: $createdDate, orderBy: $orderBy, orderType: $orderType, batch: $batch, isBonusMaterial: $isBonusMaterial, telephoneNumber: $telephoneNumber, invoiceNumber: $invoiceNumber, pOReference: $pOReference, manufactureName: $manufactureName, governmentMaterialCode: $governmentMaterialCode, expiryDate: $expiryDate, requestedDeliveryDate: $requestedDeliveryDate, specialInstruction: $specialInstruction, tax: $tax, eZRXNumber: $eZRXNumber, orderHistoryItemPoAttachments: $orderHistoryItemPoAttachments, promoStatus: $promoStatus, isCounterOffer: $isCounterOffer, isBundle: $isBundle, lineNumber: $lineNumber, principalCode: $principalCode, hidePrice: $hidePrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryItemDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.originPrice, originPrice) ||
                other.originPrice == originPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.isBonusMaterial, isBonusMaterial) ||
                other.isBonusMaterial == isBonusMaterial) &&
            (identical(other.telephoneNumber, telephoneNumber) ||
                other.telephoneNumber == telephoneNumber) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.pOReference, pOReference) ||
                other.pOReference == pOReference) &&
            (identical(other.manufactureName, manufactureName) ||
                other.manufactureName == manufactureName) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.requestedDeliveryDate, requestedDeliveryDate) ||
                other.requestedDeliveryDate == requestedDeliveryDate) &&
            (identical(other.specialInstruction, specialInstruction) ||
                other.specialInstruction == specialInstruction) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.eZRXNumber, eZRXNumber) ||
                other.eZRXNumber == eZRXNumber) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryItemPoAttachments,
                _orderHistoryItemPoAttachments) &&
            (identical(other.promoStatus, promoStatus) ||
                other.promoStatus == promoStatus) &&
            (identical(other.isCounterOffer, isCounterOffer) ||
                other.isCounterOffer == isCounterOffer) &&
            (identical(other.isBundle, isBundle) ||
                other.isBundle == isBundle) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        materialNumber,
        materialDescription,
        qty,
        unitPrice,
        originPrice,
        totalPrice,
        status,
        deliveryDate,
        orderNumber,
        createdDate,
        orderBy,
        orderType,
        batch,
        isBonusMaterial,
        telephoneNumber,
        invoiceNumber,
        pOReference,
        manufactureName,
        governmentMaterialCode,
        expiryDate,
        requestedDeliveryDate,
        specialInstruction,
        tax,
        eZRXNumber,
        const DeepCollectionEquality().hash(_orderHistoryItemPoAttachments),
        promoStatus,
        isCounterOffer,
        isBundle,
        lineNumber,
        principalCode,
        hidePrice
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryItemDtoCopyWith<_$_OrderHistoryItemDto> get copyWith =>
      __$$_OrderHistoryItemDtoCopyWithImpl<_$_OrderHistoryItemDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryItemDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryItemDto extends OrderHistoryItemDto {
  const factory _OrderHistoryItemDto(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0)
          required final int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          required final double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0)
          required final double originPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          required final double totalPrice,
      @JsonKey(name: 'Status', defaultValue: '')
          required final String status,
      @JsonKey(name: 'DeliveryDate', defaultValue: '')
          required final String deliveryDate,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
          required final String orderNumber,
      @JsonKey(readValue: _createdDateTimeReadValue)
          required final String createdDate,
      @JsonKey(name: 'OrderBy', defaultValue: '')
          required final String orderBy,
      @JsonKey(name: 'OrderType', defaultValue: '')
          required final String orderType,
      @JsonKey(name: 'Batch', defaultValue: '')
          required final String batch,
      @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
          required final bool isBonusMaterial,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
          required final String telephoneNumber,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '')
          required final String invoiceNumber,
      @JsonKey(name: 'POReference', defaultValue: '')
          required final String pOReference,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
          required final String manufactureName,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
          required final String governmentMaterialCode,
      @JsonKey(name: 'ExpiryDate', defaultValue: '')
          required final String expiryDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
          required final String requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
          required final String specialInstruction,
      @JsonKey(name: 'Tax', defaultValue: 0.0)
          required final double tax,
      @JsonKey(name: 'EZRXNumber', defaultValue: '')
          required final String eZRXNumber,
      @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
          required final List<PoDocumentsDto> orderHistoryItemPoAttachments,
      @JsonKey(name: 'promoStatus', defaultValue: false)
          required final bool promoStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
          required final bool isCounterOffer,
      @JsonKey(name: 'IsBundle', defaultValue: false)
          required final bool isBundle,
      @JsonKey(name: 'LineNumber', defaultValue: '')
          required final String lineNumber,
      @JsonKey(name: 'PrincipalCode', defaultValue: '')
          required final String principalCode,
      @JsonKey(name: 'HidePrice', defaultValue: false)
          required final bool hidePrice}) = _$_OrderHistoryItemDto;
  const _OrderHistoryItemDto._() : super._();

  factory _OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryItemDto.fromJson;

  @override
  @JsonKey(name: 'MaterialCode', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'Qty', defaultValue: 0)
  int get qty;
  @override
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  double get unitPrice;
  @override
  @JsonKey(name: 'mrp', defaultValue: 0.0)
  double get originPrice;
  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice;
  @override
  @JsonKey(name: 'Status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'DeliveryDate', defaultValue: '')
  String get deliveryDate;
  @override
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(readValue: _createdDateTimeReadValue)
  String get createdDate;
  @override
  @JsonKey(name: 'OrderBy', defaultValue: '')
  String get orderBy;
  @override
  @JsonKey(name: 'OrderType', defaultValue: '')
  String get orderType;
  @override
  @JsonKey(name: 'Batch', defaultValue: '')
  String get batch;
  @override
  @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
  bool get isBonusMaterial;
  @override
  @JsonKey(name: 'TelephoneNumber', defaultValue: '')
  String get telephoneNumber;
  @override
  @JsonKey(name: 'InvoiceNumber', defaultValue: '')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'POReference', defaultValue: '')
  String get pOReference;
  @override
  @JsonKey(name: 'ManufactureName', defaultValue: '')
  String get manufactureName;
  @override
  @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  String get expiryDate;
  @override
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate;
  @override
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  String get specialInstruction;
  @override
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  double get tax;
  @override
  @JsonKey(name: 'EZRXNumber', defaultValue: '')
  String get eZRXNumber;
  @override
  @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get orderHistoryItemPoAttachments;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promoStatus;
  @override
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  bool get isCounterOffer;
  @override
  @JsonKey(name: 'IsBundle', defaultValue: false)
  bool get isBundle;
  @override
  @JsonKey(name: 'LineNumber', defaultValue: '')
  String get lineNumber;
  @override
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'HidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryItemDtoCopyWith<_$_OrderHistoryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
