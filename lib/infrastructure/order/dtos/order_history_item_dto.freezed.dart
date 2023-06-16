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
  @JsonKey(name: 'MaterialCode')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialDescription')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'Qty')
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeliveryDate')
  String get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeliveryTime')
  String get deliveryTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineNumber')
  String get lineNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderType')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'EZRXNumber')
  String get ezrxNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedTime')
  String get createdTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderBy')
  String get orderBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'PurchaseOrderType')
  String get purchaseOrderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'DefaultMaterialDescription')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'WarehouseStorageCondition')
  String get warehouseStorageCondition => throw _privateConstructorUsedError;
  @JsonKey(name: 'Batch')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'Available')
  bool get available => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsMarketplace')
  bool get isMarketplace => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsBonusMaterial')
  bool get isBonusMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'GovernmentMaterialCode')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'TelephoneNumber')
  String get telephoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Seller')
  String get seller => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvoiceNumber')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'POReference')
  String get pOReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManufactureName')
  String get manufactureName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate')
  String get expiryDate => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'MaterialCode')
          String materialNumber,
      @JsonKey(name: 'MaterialDescription')
          String materialDescription,
      @JsonKey(name: 'Qty')
          int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          double totalPrice,
      @JsonKey(name: 'Status', defaultValue: '')
          String status,
      @JsonKey(name: 'DeliveryDate')
          String deliveryDate,
      @JsonKey(name: 'DeliveryTime')
          String deliveryTime,
      @JsonKey(name: 'LineNumber')
          String lineNumber,
      @JsonKey(name: 'Tax', defaultValue: 0.0)
          double tax,
      @JsonKey(name: 'OrderType')
          String orderType,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
          String orderNumber,
      @JsonKey(name: 'EZRXNumber')
          String ezrxNumber,
      @JsonKey(name: 'CreatedDate')
          String createdDate,
      @JsonKey(name: 'CreatedTime')
          String createdTime,
      @JsonKey(name: 'OrderBy')
          String orderBy,
      @JsonKey(name: 'PurchaseOrderType')
          String purchaseOrderType,
      @JsonKey(name: 'DefaultMaterialDescription')
          String defaultMaterialDescription,
      @JsonKey(name: 'WarehouseStorageCondition')
          String warehouseStorageCondition,
      @JsonKey(name: 'Batch')
          String batch,
      @JsonKey(name: 'Available')
          bool available,
      @JsonKey(name: 'IsMarketplace')
          bool isMarketplace,
      @JsonKey(name: 'IsBonusMaterial')
          bool isBonusMaterial,
      @JsonKey(name: 'GovernmentMaterialCode')
          String governmentMaterialCode,
      @JsonKey(name: 'TelephoneNumber')
          String telephoneNumber,
      @JsonKey(name: 'Seller')
          String seller,
      @JsonKey(name: 'InvoiceNumber')
          String invoiceNumber,
      @JsonKey(name: 'POReference')
          String pOReference,
      @JsonKey(name: 'ManufactureName')
          String manufactureName,
      @JsonKey(name: 'ExpiryDate')
          String expiryDate});
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
    Object? totalPrice = null,
    Object? status = null,
    Object? deliveryDate = null,
    Object? deliveryTime = null,
    Object? lineNumber = null,
    Object? tax = null,
    Object? orderType = null,
    Object? orderNumber = null,
    Object? ezrxNumber = null,
    Object? createdDate = null,
    Object? createdTime = null,
    Object? orderBy = null,
    Object? purchaseOrderType = null,
    Object? defaultMaterialDescription = null,
    Object? warehouseStorageCondition = null,
    Object? batch = null,
    Object? available = null,
    Object? isMarketplace = null,
    Object? isBonusMaterial = null,
    Object? governmentMaterialCode = null,
    Object? telephoneNumber = null,
    Object? seller = null,
    Object? invoiceNumber = null,
    Object? pOReference = null,
    Object? manufactureName = null,
    Object? expiryDate = null,
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
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ezrxNumber: null == ezrxNumber
          ? _value.ezrxNumber
          : ezrxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderType: null == purchaseOrderType
          ? _value.purchaseOrderType
          : purchaseOrderType // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseStorageCondition: null == warehouseStorageCondition
          ? _value.warehouseStorageCondition
          : warehouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketplace: null == isMarketplace
          ? _value.isMarketplace
          : isMarketplace // ignore: cast_nullable_to_non_nullable
              as bool,
      isBonusMaterial: null == isBonusMaterial
          ? _value.isBonusMaterial
          : isBonusMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
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
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: 'MaterialCode')
          String materialNumber,
      @JsonKey(name: 'MaterialDescription')
          String materialDescription,
      @JsonKey(name: 'Qty')
          int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          double totalPrice,
      @JsonKey(name: 'Status', defaultValue: '')
          String status,
      @JsonKey(name: 'DeliveryDate')
          String deliveryDate,
      @JsonKey(name: 'DeliveryTime')
          String deliveryTime,
      @JsonKey(name: 'LineNumber')
          String lineNumber,
      @JsonKey(name: 'Tax', defaultValue: 0.0)
          double tax,
      @JsonKey(name: 'OrderType')
          String orderType,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
          String orderNumber,
      @JsonKey(name: 'EZRXNumber')
          String ezrxNumber,
      @JsonKey(name: 'CreatedDate')
          String createdDate,
      @JsonKey(name: 'CreatedTime')
          String createdTime,
      @JsonKey(name: 'OrderBy')
          String orderBy,
      @JsonKey(name: 'PurchaseOrderType')
          String purchaseOrderType,
      @JsonKey(name: 'DefaultMaterialDescription')
          String defaultMaterialDescription,
      @JsonKey(name: 'WarehouseStorageCondition')
          String warehouseStorageCondition,
      @JsonKey(name: 'Batch')
          String batch,
      @JsonKey(name: 'Available')
          bool available,
      @JsonKey(name: 'IsMarketplace')
          bool isMarketplace,
      @JsonKey(name: 'IsBonusMaterial')
          bool isBonusMaterial,
      @JsonKey(name: 'GovernmentMaterialCode')
          String governmentMaterialCode,
      @JsonKey(name: 'TelephoneNumber')
          String telephoneNumber,
      @JsonKey(name: 'Seller')
          String seller,
      @JsonKey(name: 'InvoiceNumber')
          String invoiceNumber,
      @JsonKey(name: 'POReference')
          String pOReference,
      @JsonKey(name: 'ManufactureName')
          String manufactureName,
      @JsonKey(name: 'ExpiryDate')
          String expiryDate});
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
    Object? totalPrice = null,
    Object? status = null,
    Object? deliveryDate = null,
    Object? deliveryTime = null,
    Object? lineNumber = null,
    Object? tax = null,
    Object? orderType = null,
    Object? orderNumber = null,
    Object? ezrxNumber = null,
    Object? createdDate = null,
    Object? createdTime = null,
    Object? orderBy = null,
    Object? purchaseOrderType = null,
    Object? defaultMaterialDescription = null,
    Object? warehouseStorageCondition = null,
    Object? batch = null,
    Object? available = null,
    Object? isMarketplace = null,
    Object? isBonusMaterial = null,
    Object? governmentMaterialCode = null,
    Object? telephoneNumber = null,
    Object? seller = null,
    Object? invoiceNumber = null,
    Object? pOReference = null,
    Object? manufactureName = null,
    Object? expiryDate = null,
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
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ezrxNumber: null == ezrxNumber
          ? _value.ezrxNumber
          : ezrxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderType: null == purchaseOrderType
          ? _value.purchaseOrderType
          : purchaseOrderType // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseStorageCondition: null == warehouseStorageCondition
          ? _value.warehouseStorageCondition
          : warehouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketplace: null == isMarketplace
          ? _value.isMarketplace
          : isMarketplace // ignore: cast_nullable_to_non_nullable
              as bool,
      isBonusMaterial: null == isBonusMaterial
          ? _value.isBonusMaterial
          : isBonusMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
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
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryItemDto extends _OrderHistoryItemDto {
  const _$_OrderHistoryItemDto(
      {@JsonKey(name: 'MaterialCode')
          required this.materialNumber,
      @JsonKey(name: 'MaterialDescription')
          required this.materialDescription,
      @JsonKey(name: 'Qty')
          required this.qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          required this.unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          required this.totalPrice,
      @JsonKey(name: 'Status', defaultValue: '')
          required this.status,
      @JsonKey(name: 'DeliveryDate')
          required this.deliveryDate,
      @JsonKey(name: 'DeliveryTime')
          required this.deliveryTime,
      @JsonKey(name: 'LineNumber')
          required this.lineNumber,
      @JsonKey(name: 'Tax', defaultValue: 0.0)
          required this.tax,
      @JsonKey(name: 'OrderType')
          required this.orderType,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
          required this.orderNumber,
      @JsonKey(name: 'EZRXNumber')
          required this.ezrxNumber,
      @JsonKey(name: 'CreatedDate')
          required this.createdDate,
      @JsonKey(name: 'CreatedTime')
          required this.createdTime,
      @JsonKey(name: 'OrderBy')
          required this.orderBy,
      @JsonKey(name: 'PurchaseOrderType')
          required this.purchaseOrderType,
      @JsonKey(name: 'DefaultMaterialDescription')
          required this.defaultMaterialDescription,
      @JsonKey(name: 'WarehouseStorageCondition')
          required this.warehouseStorageCondition,
      @JsonKey(name: 'Batch')
          required this.batch,
      @JsonKey(name: 'Available')
          required this.available,
      @JsonKey(name: 'IsMarketplace')
          required this.isMarketplace,
      @JsonKey(name: 'IsBonusMaterial')
          required this.isBonusMaterial,
      @JsonKey(name: 'GovernmentMaterialCode')
          required this.governmentMaterialCode,
      @JsonKey(name: 'TelephoneNumber')
          required this.telephoneNumber,
      @JsonKey(name: 'Seller')
          required this.seller,
      @JsonKey(name: 'InvoiceNumber')
          required this.invoiceNumber,
      @JsonKey(name: 'POReference')
          required this.pOReference,
      @JsonKey(name: 'ManufactureName')
          required this.manufactureName,
      @JsonKey(name: 'ExpiryDate')
          required this.expiryDate})
      : super._();

  factory _$_OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderHistoryItemDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialCode')
  final String materialNumber;
  @override
  @JsonKey(name: 'MaterialDescription')
  final String materialDescription;
  @override
  @JsonKey(name: 'Qty')
  final int qty;
  @override
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  final double unitPrice;
  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  final double totalPrice;
  @override
  @JsonKey(name: 'Status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'DeliveryDate')
  final String deliveryDate;
  @override
  @JsonKey(name: 'DeliveryTime')
  final String deliveryTime;
  @override
  @JsonKey(name: 'LineNumber')
  final String lineNumber;
  @override
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  final double tax;
  @override
  @JsonKey(name: 'OrderType')
  final String orderType;
  @override
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  final String orderNumber;
  @override
  @JsonKey(name: 'EZRXNumber')
  final String ezrxNumber;
  @override
  @JsonKey(name: 'CreatedDate')
  final String createdDate;
  @override
  @JsonKey(name: 'CreatedTime')
  final String createdTime;
  @override
  @JsonKey(name: 'OrderBy')
  final String orderBy;
  @override
  @JsonKey(name: 'PurchaseOrderType')
  final String purchaseOrderType;
  @override
  @JsonKey(name: 'DefaultMaterialDescription')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'WarehouseStorageCondition')
  final String warehouseStorageCondition;
  @override
  @JsonKey(name: 'Batch')
  final String batch;
  @override
  @JsonKey(name: 'Available')
  final bool available;
  @override
  @JsonKey(name: 'IsMarketplace')
  final bool isMarketplace;
  @override
  @JsonKey(name: 'IsBonusMaterial')
  final bool isBonusMaterial;
  @override
  @JsonKey(name: 'GovernmentMaterialCode')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'TelephoneNumber')
  final String telephoneNumber;
  @override
  @JsonKey(name: 'Seller')
  final String seller;
  @override
  @JsonKey(name: 'InvoiceNumber')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'POReference')
  final String pOReference;
  @override
  @JsonKey(name: 'ManufactureName')
  final String manufactureName;
  @override
  @JsonKey(name: 'ExpiryDate')
  final String expiryDate;

  @override
  String toString() {
    return 'OrderHistoryItemDto(materialNumber: $materialNumber, materialDescription: $materialDescription, qty: $qty, unitPrice: $unitPrice, totalPrice: $totalPrice, status: $status, deliveryDate: $deliveryDate, deliveryTime: $deliveryTime, lineNumber: $lineNumber, tax: $tax, orderType: $orderType, orderNumber: $orderNumber, ezrxNumber: $ezrxNumber, createdDate: $createdDate, createdTime: $createdTime, orderBy: $orderBy, purchaseOrderType: $purchaseOrderType, defaultMaterialDescription: $defaultMaterialDescription, warehouseStorageCondition: $warehouseStorageCondition, batch: $batch, available: $available, isMarketplace: $isMarketplace, isBonusMaterial: $isBonusMaterial, governmentMaterialCode: $governmentMaterialCode, telephoneNumber: $telephoneNumber, seller: $seller, invoiceNumber: $invoiceNumber, pOReference: $pOReference, manufactureName: $manufactureName, expiryDate: $expiryDate)';
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
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.ezrxNumber, ezrxNumber) ||
                other.ezrxNumber == ezrxNumber) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.purchaseOrderType, purchaseOrderType) ||
                other.purchaseOrderType == purchaseOrderType) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.warehouseStorageCondition,
                    warehouseStorageCondition) ||
                other.warehouseStorageCondition == warehouseStorageCondition) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.isMarketplace, isMarketplace) ||
                other.isMarketplace == isMarketplace) &&
            (identical(other.isBonusMaterial, isBonusMaterial) ||
                other.isBonusMaterial == isBonusMaterial) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.telephoneNumber, telephoneNumber) ||
                other.telephoneNumber == telephoneNumber) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.pOReference, pOReference) ||
                other.pOReference == pOReference) &&
            (identical(other.manufactureName, manufactureName) ||
                other.manufactureName == manufactureName) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        materialNumber,
        materialDescription,
        qty,
        unitPrice,
        totalPrice,
        status,
        deliveryDate,
        deliveryTime,
        lineNumber,
        tax,
        orderType,
        orderNumber,
        ezrxNumber,
        createdDate,
        createdTime,
        orderBy,
        purchaseOrderType,
        defaultMaterialDescription,
        warehouseStorageCondition,
        batch,
        available,
        isMarketplace,
        isBonusMaterial,
        governmentMaterialCode,
        telephoneNumber,
        seller,
        invoiceNumber,
        pOReference,
        manufactureName,
        expiryDate
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
      {@JsonKey(name: 'MaterialCode')
          required final String materialNumber,
      @JsonKey(name: 'MaterialDescription')
          required final String materialDescription,
      @JsonKey(name: 'Qty')
          required final int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
          required final double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
          required final double totalPrice,
      @JsonKey(name: 'Status', defaultValue: '')
          required final String status,
      @JsonKey(name: 'DeliveryDate')
          required final String deliveryDate,
      @JsonKey(name: 'DeliveryTime')
          required final String deliveryTime,
      @JsonKey(name: 'LineNumber')
          required final String lineNumber,
      @JsonKey(name: 'Tax', defaultValue: 0.0)
          required final double tax,
      @JsonKey(name: 'OrderType')
          required final String orderType,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
          required final String orderNumber,
      @JsonKey(name: 'EZRXNumber')
          required final String ezrxNumber,
      @JsonKey(name: 'CreatedDate')
          required final String createdDate,
      @JsonKey(name: 'CreatedTime')
          required final String createdTime,
      @JsonKey(name: 'OrderBy')
          required final String orderBy,
      @JsonKey(name: 'PurchaseOrderType')
          required final String purchaseOrderType,
      @JsonKey(name: 'DefaultMaterialDescription')
          required final String defaultMaterialDescription,
      @JsonKey(name: 'WarehouseStorageCondition')
          required final String warehouseStorageCondition,
      @JsonKey(name: 'Batch')
          required final String batch,
      @JsonKey(name: 'Available')
          required final bool available,
      @JsonKey(name: 'IsMarketplace')
          required final bool isMarketplace,
      @JsonKey(name: 'IsBonusMaterial')
          required final bool isBonusMaterial,
      @JsonKey(name: 'GovernmentMaterialCode')
          required final String governmentMaterialCode,
      @JsonKey(name: 'TelephoneNumber')
          required final String telephoneNumber,
      @JsonKey(name: 'Seller')
          required final String seller,
      @JsonKey(name: 'InvoiceNumber')
          required final String invoiceNumber,
      @JsonKey(name: 'POReference')
          required final String pOReference,
      @JsonKey(name: 'ManufactureName')
          required final String manufactureName,
      @JsonKey(name: 'ExpiryDate')
          required final String expiryDate}) = _$_OrderHistoryItemDto;
  const _OrderHistoryItemDto._() : super._();

  factory _OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryItemDto.fromJson;

  @override
  @JsonKey(name: 'MaterialCode')
  String get materialNumber;
  @override
  @JsonKey(name: 'MaterialDescription')
  String get materialDescription;
  @override
  @JsonKey(name: 'Qty')
  int get qty;
  @override
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  double get unitPrice;
  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice;
  @override
  @JsonKey(name: 'Status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'DeliveryDate')
  String get deliveryDate;
  @override
  @JsonKey(name: 'DeliveryTime')
  String get deliveryTime;
  @override
  @JsonKey(name: 'LineNumber')
  String get lineNumber;
  @override
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  double get tax;
  @override
  @JsonKey(name: 'OrderType')
  String get orderType;
  @override
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(name: 'EZRXNumber')
  String get ezrxNumber;
  @override
  @JsonKey(name: 'CreatedDate')
  String get createdDate;
  @override
  @JsonKey(name: 'CreatedTime')
  String get createdTime;
  @override
  @JsonKey(name: 'OrderBy')
  String get orderBy;
  @override
  @JsonKey(name: 'PurchaseOrderType')
  String get purchaseOrderType;
  @override
  @JsonKey(name: 'DefaultMaterialDescription')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'WarehouseStorageCondition')
  String get warehouseStorageCondition;
  @override
  @JsonKey(name: 'Batch')
  String get batch;
  @override
  @JsonKey(name: 'Available')
  bool get available;
  @override
  @JsonKey(name: 'IsMarketplace')
  bool get isMarketplace;
  @override
  @JsonKey(name: 'IsBonusMaterial')
  bool get isBonusMaterial;
  @override
  @JsonKey(name: 'GovernmentMaterialCode')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'TelephoneNumber')
  String get telephoneNumber;
  @override
  @JsonKey(name: 'Seller')
  String get seller;
  @override
  @JsonKey(name: 'InvoiceNumber')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'POReference')
  String get pOReference;
  @override
  @JsonKey(name: 'ManufactureName')
  String get manufactureName;
  @override
  @JsonKey(name: 'ExpiryDate')
  String get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryItemDtoCopyWith<_$_OrderHistoryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
