// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_items_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDetailsOrderItemDto _$OrderHistoryDetailsOrderItemDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsOrderItemDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsOrderItemDto {
  @JsonKey(name: 'Type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialCode')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'Qty', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'SAPStatus', defaultValue: '')
  String get sAPStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlannedDeliveryDate', defaultValue: '')
  String get plannedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PickedQuantity', defaultValue: 0)
  int get pickedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Batch', defaultValue: '')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineReferenceNotes', defaultValue: '')
  String get lineReferenceNotes => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'IsTenderContractMaterial',
      defaultValue: false,
      readValue: boolStringFormatCheck)
  bool get isTenderContractMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID', defaultValue: '')
  String get parentId => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'Details', defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
  List<OrderHistoryDetailsOrderItemDetailsDto> get details =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'TenderContractDetails',
      readValue: orderHistoryDetailsOrderItemTenderContractDetailsOverride)
  OrderHistoryDetailsOrderItemTenderContractDetailsDto
      get tenderContractDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrincipalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductType', readValue: _getProductType)
  String get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promosStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsOrderItemDtoCopyWith<OrderHistoryDetailsOrderItemDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsOrderItemDtoCopyWith(
          OrderHistoryDetailsOrderItemDto value,
          $Res Function(OrderHistoryDetailsOrderItemDto) then) =
      _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res,
          OrderHistoryDetailsOrderItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'MaterialCode') String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'Tax', defaultValue: 0.0) double tax,
      @JsonKey(name: 'SAPStatus', defaultValue: '') String sAPStatus,
      @JsonKey(name: 'PlannedDeliveryDate', defaultValue: '')
      String plannedDeliveryDate,
      @JsonKey(name: 'PickedQuantity', defaultValue: 0) int pickedQuantity,
      @JsonKey(name: 'Batch', defaultValue: '') String batch,
      @JsonKey(name: 'ExpiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'LineReferenceNotes', defaultValue: '')
      String lineReferenceNotes,
      @JsonKey(
          name: 'IsTenderContractMaterial',
          defaultValue: false,
          readValue: boolStringFormatCheck)
      bool isTenderContractMaterial,
      @JsonKey(name: 'ParentID', defaultValue: '') String parentId,
      @JsonKey(
          name: 'Details',
          defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
      List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(
          name: 'TenderContractDetails',
          readValue: orderHistoryDetailsOrderItemTenderContractDetailsOverride)
      OrderHistoryDetailsOrderItemTenderContractDetailsDto
          tenderContractDetails,
      @JsonKey(name: 'PrincipalName', defaultValue: '') String principalName,
      @JsonKey(name: 'PrincipalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'ProductType', readValue: _getProductType)
      String productType,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promosStatus});

  $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res>
      get tenderContractDetails;
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsOrderItemDto>
    implements $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? tax = null,
    Object? sAPStatus = null,
    Object? plannedDeliveryDate = null,
    Object? pickedQuantity = null,
    Object? batch = null,
    Object? expiryDate = null,
    Object? lineReferenceNotes = null,
    Object? isTenderContractMaterial = null,
    Object? parentId = null,
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? governmentMaterialCode = null,
    Object? productType = null,
    Object? promosStatus = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      sAPStatus: null == sAPStatus
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as String,
      plannedDeliveryDate: null == plannedDeliveryDate
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      pickedQuantity: null == pickedQuantity
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      isTenderContractMaterial: null == isTenderContractMaterial
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetailsDto>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItemTenderContractDetailsDto,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      promosStatus: null == promosStatus
          ? _value.promosStatus
          : promosStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res>
      get tenderContractDetails {
    return $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res>(
        _value.tenderContractDetails, (value) {
      return _then(_value.copyWith(tenderContractDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsOrderItemDtoCopyWith<$Res>
    implements $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsOrderItemDtoCopyWith(
          _$_OrderHistoryDetailsOrderItemDto value,
          $Res Function(_$_OrderHistoryDetailsOrderItemDto) then) =
      __$$_OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'MaterialCode') String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'Tax', defaultValue: 0.0) double tax,
      @JsonKey(name: 'SAPStatus', defaultValue: '') String sAPStatus,
      @JsonKey(name: 'PlannedDeliveryDate', defaultValue: '')
      String plannedDeliveryDate,
      @JsonKey(name: 'PickedQuantity', defaultValue: 0) int pickedQuantity,
      @JsonKey(name: 'Batch', defaultValue: '') String batch,
      @JsonKey(name: 'ExpiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'LineReferenceNotes', defaultValue: '')
      String lineReferenceNotes,
      @JsonKey(
          name: 'IsTenderContractMaterial',
          defaultValue: false,
          readValue: boolStringFormatCheck)
      bool isTenderContractMaterial,
      @JsonKey(name: 'ParentID', defaultValue: '') String parentId,
      @JsonKey(
          name: 'Details',
          defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
      List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(
          name: 'TenderContractDetails',
          readValue: orderHistoryDetailsOrderItemTenderContractDetailsOverride)
      OrderHistoryDetailsOrderItemTenderContractDetailsDto
          tenderContractDetails,
      @JsonKey(name: 'PrincipalName', defaultValue: '') String principalName,
      @JsonKey(name: 'PrincipalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'ProductType', readValue: _getProductType)
      String productType,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promosStatus});

  @override
  $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res>
      get tenderContractDetails;
}

/// @nodoc
class __$$_OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res,
        _$_OrderHistoryDetailsOrderItemDto>
    implements _$$_OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsOrderItemDtoCopyWithImpl(
      _$_OrderHistoryDetailsOrderItemDto _value,
      $Res Function(_$_OrderHistoryDetailsOrderItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? tax = null,
    Object? sAPStatus = null,
    Object? plannedDeliveryDate = null,
    Object? pickedQuantity = null,
    Object? batch = null,
    Object? expiryDate = null,
    Object? lineReferenceNotes = null,
    Object? isTenderContractMaterial = null,
    Object? parentId = null,
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? governmentMaterialCode = null,
    Object? productType = null,
    Object? promosStatus = null,
  }) {
    return _then(_$_OrderHistoryDetailsOrderItemDto(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      sAPStatus: null == sAPStatus
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as String,
      plannedDeliveryDate: null == plannedDeliveryDate
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      pickedQuantity: null == pickedQuantity
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      isTenderContractMaterial: null == isTenderContractMaterial
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetailsDto>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItemTenderContractDetailsDto,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      promosStatus: null == promosStatus
          ? _value.promosStatus
          : promosStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryDetailsOrderItemDto
    extends _OrderHistoryDetailsOrderItemDto {
  const _$_OrderHistoryDetailsOrderItemDto(
      {@JsonKey(name: 'Type', defaultValue: '') required this.type,
      @JsonKey(name: 'MaterialCode') required this.materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) required this.qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) required this.unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) required this.totalPrice,
      @JsonKey(name: 'Tax', defaultValue: 0.0) required this.tax,
      @JsonKey(name: 'SAPStatus', defaultValue: '') required this.sAPStatus,
      @JsonKey(name: 'PlannedDeliveryDate', defaultValue: '')
      required this.plannedDeliveryDate,
      @JsonKey(name: 'PickedQuantity', defaultValue: 0)
      required this.pickedQuantity,
      @JsonKey(name: 'Batch', defaultValue: '') required this.batch,
      @JsonKey(name: 'ExpiryDate', defaultValue: '') required this.expiryDate,
      @JsonKey(name: 'LineReferenceNotes', defaultValue: '')
      required this.lineReferenceNotes,
      @JsonKey(
          name: 'IsTenderContractMaterial',
          defaultValue: false,
          readValue: boolStringFormatCheck)
      required this.isTenderContractMaterial,
      @JsonKey(name: 'ParentID', defaultValue: '') required this.parentId,
      @JsonKey(
          name: 'Details',
          defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
      required final List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(
          name: 'TenderContractDetails',
          readValue: orderHistoryDetailsOrderItemTenderContractDetailsOverride)
      required this.tenderContractDetails,
      @JsonKey(name: 'PrincipalName', defaultValue: '')
      required this.principalName,
      @JsonKey(
          name: 'PrincipalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
      required this.governmentMaterialCode,
      @JsonKey(name: 'ProductType', readValue: _getProductType)
      required this.productType,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required this.promosStatus})
      : _details = details,
        super._();

  factory _$_OrderHistoryDetailsOrderItemDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsOrderItemDtoFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'MaterialCode')
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
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  final double totalPrice;
  @override
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  final double tax;
  @override
  @JsonKey(name: 'SAPStatus', defaultValue: '')
  final String sAPStatus;
  @override
  @JsonKey(name: 'PlannedDeliveryDate', defaultValue: '')
  final String plannedDeliveryDate;
  @override
  @JsonKey(name: 'PickedQuantity', defaultValue: 0)
  final int pickedQuantity;
  @override
  @JsonKey(name: 'Batch', defaultValue: '')
  final String batch;
  @override
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  final String expiryDate;
  @override
  @JsonKey(name: 'LineReferenceNotes', defaultValue: '')
  final String lineReferenceNotes;
  @override
  @JsonKey(
      name: 'IsTenderContractMaterial',
      defaultValue: false,
      readValue: boolStringFormatCheck)
  final bool isTenderContractMaterial;
  @override
  @JsonKey(name: 'ParentID', defaultValue: '')
  final String parentId;
  final List<OrderHistoryDetailsOrderItemDetailsDto> _details;
  @override
  @JsonKey(
      name: 'Details', defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
  List<OrderHistoryDetailsOrderItemDetailsDto> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  @JsonKey(
      name: 'TenderContractDetails',
      readValue: orderHistoryDetailsOrderItemTenderContractDetailsOverride)
  final OrderHistoryDetailsOrderItemTenderContractDetailsDto
      tenderContractDetails;
  @override
  @JsonKey(name: 'PrincipalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'ProductType', readValue: _getProductType)
  final String productType;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  final bool promosStatus;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItemDto(type: $type, materialNumber: $materialNumber, materialDescription: $materialDescription, qty: $qty, unitPrice: $unitPrice, totalPrice: $totalPrice, tax: $tax, sAPStatus: $sAPStatus, plannedDeliveryDate: $plannedDeliveryDate, pickedQuantity: $pickedQuantity, batch: $batch, expiryDate: $expiryDate, lineReferenceNotes: $lineReferenceNotes, isTenderContractMaterial: $isTenderContractMaterial, parentId: $parentId, details: $details, tenderContractDetails: $tenderContractDetails, principalName: $principalName, principalCode: $principalCode, governmentMaterialCode: $governmentMaterialCode, productType: $productType, promosStatus: $promosStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsOrderItemDto &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.sAPStatus, sAPStatus) ||
                other.sAPStatus == sAPStatus) &&
            (identical(other.plannedDeliveryDate, plannedDeliveryDate) ||
                other.plannedDeliveryDate == plannedDeliveryDate) &&
            (identical(other.pickedQuantity, pickedQuantity) ||
                other.pickedQuantity == pickedQuantity) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.lineReferenceNotes, lineReferenceNotes) ||
                other.lineReferenceNotes == lineReferenceNotes) &&
            (identical(
                    other.isTenderContractMaterial, isTenderContractMaterial) ||
                other.isTenderContractMaterial == isTenderContractMaterial) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.tenderContractDetails, tenderContractDetails) ||
                other.tenderContractDetails == tenderContractDetails) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.promosStatus, promosStatus) ||
                other.promosStatus == promosStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        materialNumber,
        materialDescription,
        qty,
        unitPrice,
        totalPrice,
        tax,
        sAPStatus,
        plannedDeliveryDate,
        pickedQuantity,
        batch,
        expiryDate,
        lineReferenceNotes,
        isTenderContractMaterial,
        parentId,
        const DeepCollectionEquality().hash(_details),
        tenderContractDetails,
        principalName,
        principalCode,
        governmentMaterialCode,
        productType,
        promosStatus
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailsOrderItemDtoCopyWith<
          _$_OrderHistoryDetailsOrderItemDto>
      get copyWith => __$$_OrderHistoryDetailsOrderItemDtoCopyWithImpl<
          _$_OrderHistoryDetailsOrderItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryDetailsOrderItemDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsOrderItemDto
    extends OrderHistoryDetailsOrderItemDto {
  const factory _OrderHistoryDetailsOrderItemDto(
      {@JsonKey(name: 'Type', defaultValue: '') required final String type,
      @JsonKey(name: 'MaterialCode') required final String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      required final String materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) required final int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
      required final double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
      required final double totalPrice,
      @JsonKey(name: 'Tax', defaultValue: 0.0) required final double tax,
      @JsonKey(name: 'SAPStatus', defaultValue: '')
      required final String sAPStatus,
      @JsonKey(name: 'PlannedDeliveryDate', defaultValue: '')
      required final String plannedDeliveryDate,
      @JsonKey(name: 'PickedQuantity', defaultValue: 0)
      required final int pickedQuantity,
      @JsonKey(name: 'Batch', defaultValue: '') required final String batch,
      @JsonKey(name: 'ExpiryDate', defaultValue: '')
      required final String expiryDate,
      @JsonKey(name: 'LineReferenceNotes', defaultValue: '')
      required final String lineReferenceNotes,
      @JsonKey(
          name: 'IsTenderContractMaterial',
          defaultValue: false,
          readValue: boolStringFormatCheck)
      required final bool isTenderContractMaterial,
      @JsonKey(name: 'ParentID', defaultValue: '')
      required final String parentId,
      @JsonKey(
          name: 'Details',
          defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
      required final List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(
          name: 'TenderContractDetails',
          readValue: orderHistoryDetailsOrderItemTenderContractDetailsOverride)
      required final OrderHistoryDetailsOrderItemTenderContractDetailsDto
          tenderContractDetails,
      @JsonKey(name: 'PrincipalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'PrincipalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
      required final String governmentMaterialCode,
      @JsonKey(name: 'ProductType', readValue: _getProductType)
      required final String productType,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required final bool promosStatus}) = _$_OrderHistoryDetailsOrderItemDto;
  const _OrderHistoryDetailsOrderItemDto._() : super._();

  factory _OrderHistoryDetailsOrderItemDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryDetailsOrderItemDto.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'MaterialCode')
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
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice;
  @override
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  double get tax;
  @override
  @JsonKey(name: 'SAPStatus', defaultValue: '')
  String get sAPStatus;
  @override
  @JsonKey(name: 'PlannedDeliveryDate', defaultValue: '')
  String get plannedDeliveryDate;
  @override
  @JsonKey(name: 'PickedQuantity', defaultValue: 0)
  int get pickedQuantity;
  @override
  @JsonKey(name: 'Batch', defaultValue: '')
  String get batch;
  @override
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  String get expiryDate;
  @override
  @JsonKey(name: 'LineReferenceNotes', defaultValue: '')
  String get lineReferenceNotes;
  @override
  @JsonKey(
      name: 'IsTenderContractMaterial',
      defaultValue: false,
      readValue: boolStringFormatCheck)
  bool get isTenderContractMaterial;
  @override
  @JsonKey(name: 'ParentID', defaultValue: '')
  String get parentId;
  @override
  @JsonKey(
      name: 'Details', defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
  List<OrderHistoryDetailsOrderItemDetailsDto> get details;
  @override
  @JsonKey(
      name: 'TenderContractDetails',
      readValue: orderHistoryDetailsOrderItemTenderContractDetailsOverride)
  OrderHistoryDetailsOrderItemTenderContractDetailsDto
      get tenderContractDetails;
  @override
  @JsonKey(name: 'PrincipalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'ProductType', readValue: _getProductType)
  String get productType;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promosStatus;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsOrderItemDtoCopyWith<
          _$_OrderHistoryDetailsOrderItemDto>
      get copyWith => throw _privateConstructorUsedError;
}
