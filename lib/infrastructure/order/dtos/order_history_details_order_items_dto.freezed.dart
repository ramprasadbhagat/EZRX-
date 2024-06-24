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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'Qty', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'mrp', defaultValue: 0.0)
  double get originPrice => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'LineNumber', defaultValue: '')
  String get lineNumber => throw _privateConstructorUsedError;
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
  OrderHistoryDetailsTenderContractDto get tenderContractDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'PrincipalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductType', readValue: _getProductType)
  String get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promosStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  bool get isCounterOffer => throw _privateConstructorUsedError;
  @JsonKey(name: 'HidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCovid', defaultValue: false)
  bool get isCovid => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalUnitPrice', defaultValue: 0.0)
  double get totalUnitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalTax', defaultValue: 0.0)
  double get totalTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxRate', readValue: handleTax)
  double get taxRate => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0) double originPrice,
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
      @JsonKey(name: 'LineNumber', defaultValue: '') String lineNumber,
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
      OrderHistoryDetailsTenderContractDto tenderContractDetails,
      @JsonKey(name: 'PrincipalName', defaultValue: '') String principalName,
      @JsonKey(name: 'PrincipalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'ProductType', readValue: _getProductType)
      String productType,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promosStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false) bool isCounterOffer,
      @JsonKey(name: 'HidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'isCovid', defaultValue: false) bool isCovid,
      @JsonKey(name: 'TotalUnitPrice', defaultValue: 0.0) double totalUnitPrice,
      @JsonKey(name: 'TotalTax', defaultValue: 0.0) double totalTax,
      @JsonKey(name: 'TaxRate', readValue: handleTax) double taxRate});

  $OrderHistoryDetailsTenderContractDtoCopyWith<$Res> get tenderContractDetails;
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
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? originPrice = null,
    Object? totalPrice = null,
    Object? tax = null,
    Object? sAPStatus = null,
    Object? plannedDeliveryDate = null,
    Object? pickedQuantity = null,
    Object? batch = null,
    Object? expiryDate = null,
    Object? lineReferenceNotes = null,
    Object? lineNumber = null,
    Object? isTenderContractMaterial = null,
    Object? parentId = null,
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? productType = null,
    Object? promosStatus = null,
    Object? isCounterOffer = null,
    Object? hidePrice = null,
    Object? isMarketPlace = null,
    Object? isCovid = null,
    Object? totalUnitPrice = null,
    Object? totalTax = null,
    Object? taxRate = null,
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
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
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
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
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
              as OrderHistoryDetailsTenderContractDto,
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
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      promosStatus: null == promosStatus
          ? _value.promosStatus
          : promosStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      isCovid: null == isCovid
          ? _value.isCovid
          : isCovid // ignore: cast_nullable_to_non_nullable
              as bool,
      totalUnitPrice: null == totalUnitPrice
          ? _value.totalUnitPrice
          : totalUnitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsTenderContractDtoCopyWith<$Res>
      get tenderContractDetails {
    return $OrderHistoryDetailsTenderContractDtoCopyWith<$Res>(
        _value.tenderContractDetails, (value) {
      return _then(_value.copyWith(tenderContractDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsOrderItemDtoImplCopyWith<$Res>
    implements $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  factory _$$OrderHistoryDetailsOrderItemDtoImplCopyWith(
          _$OrderHistoryDetailsOrderItemDtoImpl value,
          $Res Function(_$OrderHistoryDetailsOrderItemDtoImpl) then) =
      __$$OrderHistoryDetailsOrderItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'MaterialCode') String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0) double originPrice,
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
      @JsonKey(name: 'LineNumber', defaultValue: '') String lineNumber,
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
      OrderHistoryDetailsTenderContractDto tenderContractDetails,
      @JsonKey(name: 'PrincipalName', defaultValue: '') String principalName,
      @JsonKey(name: 'PrincipalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'ProductType', readValue: _getProductType)
      String productType,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promosStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false) bool isCounterOffer,
      @JsonKey(name: 'HidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'isCovid', defaultValue: false) bool isCovid,
      @JsonKey(name: 'TotalUnitPrice', defaultValue: 0.0) double totalUnitPrice,
      @JsonKey(name: 'TotalTax', defaultValue: 0.0) double totalTax,
      @JsonKey(name: 'TaxRate', readValue: handleTax) double taxRate});

  @override
  $OrderHistoryDetailsTenderContractDtoCopyWith<$Res> get tenderContractDetails;
}

/// @nodoc
class __$$OrderHistoryDetailsOrderItemDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res,
        _$OrderHistoryDetailsOrderItemDtoImpl>
    implements _$$OrderHistoryDetailsOrderItemDtoImplCopyWith<$Res> {
  __$$OrderHistoryDetailsOrderItemDtoImplCopyWithImpl(
      _$OrderHistoryDetailsOrderItemDtoImpl _value,
      $Res Function(_$OrderHistoryDetailsOrderItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? originPrice = null,
    Object? totalPrice = null,
    Object? tax = null,
    Object? sAPStatus = null,
    Object? plannedDeliveryDate = null,
    Object? pickedQuantity = null,
    Object? batch = null,
    Object? expiryDate = null,
    Object? lineReferenceNotes = null,
    Object? lineNumber = null,
    Object? isTenderContractMaterial = null,
    Object? parentId = null,
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? productType = null,
    Object? promosStatus = null,
    Object? isCounterOffer = null,
    Object? hidePrice = null,
    Object? isMarketPlace = null,
    Object? isCovid = null,
    Object? totalUnitPrice = null,
    Object? totalTax = null,
    Object? taxRate = null,
  }) {
    return _then(_$OrderHistoryDetailsOrderItemDtoImpl(
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
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
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
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
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
              as OrderHistoryDetailsTenderContractDto,
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
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      promosStatus: null == promosStatus
          ? _value.promosStatus
          : promosStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      isCovid: null == isCovid
          ? _value.isCovid
          : isCovid // ignore: cast_nullable_to_non_nullable
              as bool,
      totalUnitPrice: null == totalUnitPrice
          ? _value.totalUnitPrice
          : totalUnitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryDetailsOrderItemDtoImpl
    extends _OrderHistoryDetailsOrderItemDto {
  const _$OrderHistoryDetailsOrderItemDtoImpl(
      {@JsonKey(name: 'Type', defaultValue: '') required this.type,
      @JsonKey(name: 'MaterialCode') required this.materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) required this.qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) required this.unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0) required this.originPrice,
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
      @JsonKey(name: 'LineNumber', defaultValue: '') required this.lineNumber,
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
      @JsonKey(
          name: 'PrincipalName', defaultValue: '')
      required this.principalName,
      @JsonKey(
          name: 'PrincipalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(
          name: 'GovernmentMaterialCode', defaultValue: '')
      required this.governmentMaterialCode,
      @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
      required this.itemRegistrationNumber,
      @JsonKey(name: 'ProductType', readValue: _getProductType)
      required this.productType,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required this.promosStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
      required this.isCounterOffer,
      @JsonKey(name: 'HidePrice', defaultValue: false) required this.hidePrice,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
      required this.isMarketPlace,
      @JsonKey(name: 'isCovid', defaultValue: false) required this.isCovid,
      @JsonKey(name: 'TotalUnitPrice', defaultValue: 0.0)
      required this.totalUnitPrice,
      @JsonKey(name: 'TotalTax', defaultValue: 0.0) required this.totalTax,
      @JsonKey(name: 'TaxRate', readValue: handleTax) required this.taxRate})
      : _details = details,
        super._();

  factory _$OrderHistoryDetailsOrderItemDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OrderHistoryDetailsOrderItemDtoImplFromJson(json);

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
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
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
  @JsonKey(name: 'LineNumber', defaultValue: '')
  final String lineNumber;
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
  final OrderHistoryDetailsTenderContractDto tenderContractDetails;
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
  @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'ProductType', readValue: _getProductType)
  final String productType;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  final bool promosStatus;
  @override
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  final bool isCounterOffer;
  @override
  @JsonKey(name: 'HidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
  final bool isMarketPlace;
  @override
  @JsonKey(name: 'isCovid', defaultValue: false)
  final bool isCovid;
  @override
  @JsonKey(name: 'TotalUnitPrice', defaultValue: 0.0)
  final double totalUnitPrice;
  @override
  @JsonKey(name: 'TotalTax', defaultValue: 0.0)
  final double totalTax;
  @override
  @JsonKey(name: 'TaxRate', readValue: handleTax)
  final double taxRate;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItemDto(type: $type, materialNumber: $materialNumber, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription, qty: $qty, unitPrice: $unitPrice, originPrice: $originPrice, totalPrice: $totalPrice, tax: $tax, sAPStatus: $sAPStatus, plannedDeliveryDate: $plannedDeliveryDate, pickedQuantity: $pickedQuantity, batch: $batch, expiryDate: $expiryDate, lineReferenceNotes: $lineReferenceNotes, lineNumber: $lineNumber, isTenderContractMaterial: $isTenderContractMaterial, parentId: $parentId, details: $details, tenderContractDetails: $tenderContractDetails, principalName: $principalName, principalCode: $principalCode, governmentMaterialCode: $governmentMaterialCode, itemRegistrationNumber: $itemRegistrationNumber, productType: $productType, promosStatus: $promosStatus, isCounterOffer: $isCounterOffer, hidePrice: $hidePrice, isMarketPlace: $isMarketPlace, isCovid: $isCovid, totalUnitPrice: $totalUnitPrice, totalTax: $totalTax, taxRate: $taxRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsOrderItemDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.originPrice, originPrice) ||
                other.originPrice == originPrice) &&
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
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
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
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.promosStatus, promosStatus) ||
                other.promosStatus == promosStatus) &&
            (identical(other.isCounterOffer, isCounterOffer) ||
                other.isCounterOffer == isCounterOffer) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.isCovid, isCovid) || other.isCovid == isCovid) &&
            (identical(other.totalUnitPrice, totalUnitPrice) ||
                other.totalUnitPrice == totalUnitPrice) &&
            (identical(other.totalTax, totalTax) || other.totalTax == totalTax) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        materialNumber,
        materialDescription,
        defaultMaterialDescription,
        qty,
        unitPrice,
        originPrice,
        totalPrice,
        tax,
        sAPStatus,
        plannedDeliveryDate,
        pickedQuantity,
        batch,
        expiryDate,
        lineReferenceNotes,
        lineNumber,
        isTenderContractMaterial,
        parentId,
        const DeepCollectionEquality().hash(_details),
        tenderContractDetails,
        principalName,
        principalCode,
        governmentMaterialCode,
        itemRegistrationNumber,
        productType,
        promosStatus,
        isCounterOffer,
        hidePrice,
        isMarketPlace,
        isCovid,
        totalUnitPrice,
        totalTax,
        taxRate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsOrderItemDtoImplCopyWith<
          _$OrderHistoryDetailsOrderItemDtoImpl>
      get copyWith => __$$OrderHistoryDetailsOrderItemDtoImplCopyWithImpl<
          _$OrderHistoryDetailsOrderItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryDetailsOrderItemDtoImplToJson(
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
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      required final String defaultMaterialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) required final int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
      required final double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0)
      required final double originPrice,
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
      @JsonKey(name: 'LineNumber', defaultValue: '')
      required final String lineNumber,
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
      required final OrderHistoryDetailsTenderContractDto tenderContractDetails,
      @JsonKey(name: 'PrincipalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'PrincipalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
      required final String governmentMaterialCode,
      @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
      required final String itemRegistrationNumber,
      @JsonKey(name: 'ProductType', readValue: _getProductType)
      required final String productType,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required final bool promosStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
      required final bool isCounterOffer,
      @JsonKey(name: 'HidePrice', defaultValue: false)
      required final bool hidePrice,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
      required final bool isMarketPlace,
      @JsonKey(name: 'isCovid', defaultValue: false)
      required final bool isCovid,
      @JsonKey(name: 'TotalUnitPrice', defaultValue: 0.0)
      required final double totalUnitPrice,
      @JsonKey(name: 'TotalTax', defaultValue: 0.0)
      required final double totalTax,
      @JsonKey(name: 'TaxRate', readValue: handleTax)
      required final double taxRate}) = _$OrderHistoryDetailsOrderItemDtoImpl;
  const _OrderHistoryDetailsOrderItemDto._() : super._();

  factory _OrderHistoryDetailsOrderItemDto.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryDetailsOrderItemDtoImpl.fromJson;

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
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
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
  @JsonKey(name: 'LineNumber', defaultValue: '')
  String get lineNumber;
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
  OrderHistoryDetailsTenderContractDto get tenderContractDetails;
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
  @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'ProductType', readValue: _getProductType)
  String get productType;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promosStatus;
  @override
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  bool get isCounterOffer;
  @override
  @JsonKey(name: 'HidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(name: 'isCovid', defaultValue: false)
  bool get isCovid;
  @override
  @JsonKey(name: 'TotalUnitPrice', defaultValue: 0.0)
  double get totalUnitPrice;
  @override
  @JsonKey(name: 'TotalTax', defaultValue: 0.0)
  double get totalTax;
  @override
  @JsonKey(name: 'TaxRate', readValue: handleTax)
  double get taxRate;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsOrderItemDtoImplCopyWith<
          _$OrderHistoryDetailsOrderItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
