// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryDetailsOrderItem {
  OrderItemType get type => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get originPrice => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  OrderStepValue get sAPStatus => throw _privateConstructorUsedError;
  DateTimeStringValue get plannedDeliveryDate =>
      throw _privateConstructorUsedError;
  int get pickedQuantity => throw _privateConstructorUsedError;
  StringValue get batch => throw _privateConstructorUsedError;
  DateTimeStringValue get expiryDate => throw _privateConstructorUsedError;
  Remarks get lineReferenceNotes => throw _privateConstructorUsedError;
  LineNumber get lineNumber => throw _privateConstructorUsedError;
  bool get isTenderContractMaterial => throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderItemDetails> get details =>
      throw _privateConstructorUsedError;
  OrderHistoryDetailsOrderItemTenderContractDetails get tenderContractDetails =>
      throw _privateConstructorUsedError;
  PrincipalData get principalData => throw _privateConstructorUsedError;
  ProductImages get productImages => throw _privateConstructorUsedError;
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  MaterialStockInfo get materialStockInfo => throw _privateConstructorUsedError;
  PriceAggregate get priceAggregate => throw _privateConstructorUsedError;
  MaterialInfoType get productType => throw _privateConstructorUsedError;
  String get parentId => throw _privateConstructorUsedError;
  MaterialInfo get material => throw _privateConstructorUsedError;
  bool get promoStatus => throw _privateConstructorUsedError;
  bool get isCounterOffer => throw _privateConstructorUsedError;
  bool get hidePrice => throw _privateConstructorUsedError;
  bool get isMarketPlace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsOrderItemCopyWith<OrderHistoryDetailsOrderItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemCopyWith<$Res> {
  factory $OrderHistoryDetailsOrderItemCopyWith(
          OrderHistoryDetailsOrderItem value,
          $Res Function(OrderHistoryDetailsOrderItem) then) =
      _$OrderHistoryDetailsOrderItemCopyWithImpl<$Res,
          OrderHistoryDetailsOrderItem>;
  @useResult
  $Res call(
      {OrderItemType type,
      MaterialNumber materialNumber,
      String materialDescription,
      int qty,
      double unitPrice,
      double originPrice,
      double totalPrice,
      double tax,
      OrderStepValue sAPStatus,
      DateTimeStringValue plannedDeliveryDate,
      int pickedQuantity,
      StringValue batch,
      DateTimeStringValue expiryDate,
      Remarks lineReferenceNotes,
      LineNumber lineNumber,
      bool isTenderContractMaterial,
      List<OrderHistoryDetailsOrderItemDetails> details,
      OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails,
      PrincipalData principalData,
      ProductImages productImages,
      String governmentMaterialCode,
      MaterialStockInfo materialStockInfo,
      PriceAggregate priceAggregate,
      MaterialInfoType productType,
      String parentId,
      MaterialInfo material,
      bool promoStatus,
      bool isCounterOffer,
      bool hidePrice,
      bool isMarketPlace});

  $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res>
      get tenderContractDetails;
  $PrincipalDataCopyWith<$Res> get principalData;
  $ProductImagesCopyWith<$Res> get productImages;
  $MaterialStockInfoCopyWith<$Res> get materialStockInfo;
  $PriceAggregateCopyWith<$Res> get priceAggregate;
  $MaterialInfoCopyWith<$Res> get material;
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsOrderItem>
    implements $OrderHistoryDetailsOrderItemCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemCopyWithImpl(this._value, this._then);

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
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalData = null,
    Object? productImages = null,
    Object? governmentMaterialCode = null,
    Object? materialStockInfo = null,
    Object? priceAggregate = null,
    Object? productType = null,
    Object? parentId = null,
    Object? material = null,
    Object? promoStatus = null,
    Object? isCounterOffer = null,
    Object? hidePrice = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OrderItemType,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
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
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      sAPStatus: null == sAPStatus
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as OrderStepValue,
      plannedDeliveryDate: null == plannedDeliveryDate
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      pickedQuantity: null == pickedQuantity
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as StringValue,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as Remarks,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as LineNumber,
      isTenderContractMaterial: null == isTenderContractMaterial
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetails>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItemTenderContractDetails,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as ProductImages,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      materialStockInfo: null == materialStockInfo
          ? _value.materialStockInfo
          : materialStockInfo // ignore: cast_nullable_to_non_nullable
              as MaterialStockInfo,
      priceAggregate: null == priceAggregate
          ? _value.priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as MaterialInfoType,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res>
      get tenderContractDetails {
    return $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res>(
        _value.tenderContractDetails, (value) {
      return _then(_value.copyWith(tenderContractDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrincipalDataCopyWith<$Res> get principalData {
    return $PrincipalDataCopyWith<$Res>(_value.principalData, (value) {
      return _then(_value.copyWith(principalData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductImagesCopyWith<$Res> get productImages {
    return $ProductImagesCopyWith<$Res>(_value.productImages, (value) {
      return _then(_value.copyWith(productImages: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialStockInfoCopyWith<$Res> get materialStockInfo {
    return $MaterialStockInfoCopyWith<$Res>(_value.materialStockInfo, (value) {
      return _then(_value.copyWith(materialStockInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get priceAggregate {
    return $PriceAggregateCopyWith<$Res>(_value.priceAggregate, (value) {
      return _then(_value.copyWith(priceAggregate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get material {
    return $MaterialInfoCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsOrderItemCopyWith<$Res>
    implements $OrderHistoryDetailsOrderItemCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsOrderItemCopyWith(
          _$_OrderHistoryDetailsOrderItem value,
          $Res Function(_$_OrderHistoryDetailsOrderItem) then) =
      __$$_OrderHistoryDetailsOrderItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderItemType type,
      MaterialNumber materialNumber,
      String materialDescription,
      int qty,
      double unitPrice,
      double originPrice,
      double totalPrice,
      double tax,
      OrderStepValue sAPStatus,
      DateTimeStringValue plannedDeliveryDate,
      int pickedQuantity,
      StringValue batch,
      DateTimeStringValue expiryDate,
      Remarks lineReferenceNotes,
      LineNumber lineNumber,
      bool isTenderContractMaterial,
      List<OrderHistoryDetailsOrderItemDetails> details,
      OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails,
      PrincipalData principalData,
      ProductImages productImages,
      String governmentMaterialCode,
      MaterialStockInfo materialStockInfo,
      PriceAggregate priceAggregate,
      MaterialInfoType productType,
      String parentId,
      MaterialInfo material,
      bool promoStatus,
      bool isCounterOffer,
      bool hidePrice,
      bool isMarketPlace});

  @override
  $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res>
      get tenderContractDetails;
  @override
  $PrincipalDataCopyWith<$Res> get principalData;
  @override
  $ProductImagesCopyWith<$Res> get productImages;
  @override
  $MaterialStockInfoCopyWith<$Res> get materialStockInfo;
  @override
  $PriceAggregateCopyWith<$Res> get priceAggregate;
  @override
  $MaterialInfoCopyWith<$Res> get material;
}

/// @nodoc
class __$$_OrderHistoryDetailsOrderItemCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemCopyWithImpl<$Res,
        _$_OrderHistoryDetailsOrderItem>
    implements _$$_OrderHistoryDetailsOrderItemCopyWith<$Res> {
  __$$_OrderHistoryDetailsOrderItemCopyWithImpl(
      _$_OrderHistoryDetailsOrderItem _value,
      $Res Function(_$_OrderHistoryDetailsOrderItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
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
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalData = null,
    Object? productImages = null,
    Object? governmentMaterialCode = null,
    Object? materialStockInfo = null,
    Object? priceAggregate = null,
    Object? productType = null,
    Object? parentId = null,
    Object? material = null,
    Object? promoStatus = null,
    Object? isCounterOffer = null,
    Object? hidePrice = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$_OrderHistoryDetailsOrderItem(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OrderItemType,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
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
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      sAPStatus: null == sAPStatus
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as OrderStepValue,
      plannedDeliveryDate: null == plannedDeliveryDate
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      pickedQuantity: null == pickedQuantity
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as StringValue,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as Remarks,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as LineNumber,
      isTenderContractMaterial: null == isTenderContractMaterial
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetails>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItemTenderContractDetails,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as ProductImages,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      materialStockInfo: null == materialStockInfo
          ? _value.materialStockInfo
          : materialStockInfo // ignore: cast_nullable_to_non_nullable
              as MaterialStockInfo,
      priceAggregate: null == priceAggregate
          ? _value.priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as MaterialInfoType,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$_OrderHistoryDetailsOrderItem extends _OrderHistoryDetailsOrderItem {
  _$_OrderHistoryDetailsOrderItem(
      {required this.type,
      required this.materialNumber,
      required this.materialDescription,
      required this.qty,
      required this.unitPrice,
      required this.originPrice,
      required this.totalPrice,
      required this.tax,
      required this.sAPStatus,
      required this.plannedDeliveryDate,
      required this.pickedQuantity,
      required this.batch,
      required this.expiryDate,
      required this.lineReferenceNotes,
      required this.lineNumber,
      required this.isTenderContractMaterial,
      required final List<OrderHistoryDetailsOrderItemDetails> details,
      required this.tenderContractDetails,
      required this.principalData,
      required this.productImages,
      required this.governmentMaterialCode,
      required this.materialStockInfo,
      required this.priceAggregate,
      required this.productType,
      required this.parentId,
      required this.material,
      required this.promoStatus,
      required this.isCounterOffer,
      required this.hidePrice,
      required this.isMarketPlace})
      : _details = details,
        super._();

  @override
  final OrderItemType type;
  @override
  final MaterialNumber materialNumber;
  @override
  final String materialDescription;
  @override
  final int qty;
  @override
  final double unitPrice;
  @override
  final double originPrice;
  @override
  final double totalPrice;
  @override
  final double tax;
  @override
  final OrderStepValue sAPStatus;
  @override
  final DateTimeStringValue plannedDeliveryDate;
  @override
  final int pickedQuantity;
  @override
  final StringValue batch;
  @override
  final DateTimeStringValue expiryDate;
  @override
  final Remarks lineReferenceNotes;
  @override
  final LineNumber lineNumber;
  @override
  final bool isTenderContractMaterial;
  final List<OrderHistoryDetailsOrderItemDetails> _details;
  @override
  List<OrderHistoryDetailsOrderItemDetails> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails;
  @override
  final PrincipalData principalData;
  @override
  final ProductImages productImages;
  @override
  final String governmentMaterialCode;
  @override
  final MaterialStockInfo materialStockInfo;
  @override
  final PriceAggregate priceAggregate;
  @override
  final MaterialInfoType productType;
  @override
  final String parentId;
  @override
  final MaterialInfo material;
  @override
  final bool promoStatus;
  @override
  final bool isCounterOffer;
  @override
  final bool hidePrice;
  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItem(type: $type, materialNumber: $materialNumber, materialDescription: $materialDescription, qty: $qty, unitPrice: $unitPrice, originPrice: $originPrice, totalPrice: $totalPrice, tax: $tax, sAPStatus: $sAPStatus, plannedDeliveryDate: $plannedDeliveryDate, pickedQuantity: $pickedQuantity, batch: $batch, expiryDate: $expiryDate, lineReferenceNotes: $lineReferenceNotes, lineNumber: $lineNumber, isTenderContractMaterial: $isTenderContractMaterial, details: $details, tenderContractDetails: $tenderContractDetails, principalData: $principalData, productImages: $productImages, governmentMaterialCode: $governmentMaterialCode, materialStockInfo: $materialStockInfo, priceAggregate: $priceAggregate, productType: $productType, parentId: $parentId, material: $material, promoStatus: $promoStatus, isCounterOffer: $isCounterOffer, hidePrice: $hidePrice, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsOrderItem &&
            (identical(other.type, type) || other.type == type) &&
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
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.tenderContractDetails, tenderContractDetails) ||
                other.tenderContractDetails == tenderContractDetails) &&
            (identical(other.principalData, principalData) ||
                other.principalData == principalData) &&
            (identical(other.productImages, productImages) ||
                other.productImages == productImages) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.materialStockInfo, materialStockInfo) ||
                other.materialStockInfo == materialStockInfo) &&
            (identical(other.priceAggregate, priceAggregate) ||
                other.priceAggregate == priceAggregate) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.promoStatus, promoStatus) ||
                other.promoStatus == promoStatus) &&
            (identical(other.isCounterOffer, isCounterOffer) ||
                other.isCounterOffer == isCounterOffer) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        materialNumber,
        materialDescription,
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
        const DeepCollectionEquality().hash(_details),
        tenderContractDetails,
        principalData,
        productImages,
        governmentMaterialCode,
        materialStockInfo,
        priceAggregate,
        productType,
        parentId,
        material,
        promoStatus,
        isCounterOffer,
        hidePrice,
        isMarketPlace
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailsOrderItemCopyWith<_$_OrderHistoryDetailsOrderItem>
      get copyWith => __$$_OrderHistoryDetailsOrderItemCopyWithImpl<
          _$_OrderHistoryDetailsOrderItem>(this, _$identity);
}

abstract class _OrderHistoryDetailsOrderItem
    extends OrderHistoryDetailsOrderItem {
  factory _OrderHistoryDetailsOrderItem(
      {required final OrderItemType type,
      required final MaterialNumber materialNumber,
      required final String materialDescription,
      required final int qty,
      required final double unitPrice,
      required final double originPrice,
      required final double totalPrice,
      required final double tax,
      required final OrderStepValue sAPStatus,
      required final DateTimeStringValue plannedDeliveryDate,
      required final int pickedQuantity,
      required final StringValue batch,
      required final DateTimeStringValue expiryDate,
      required final Remarks lineReferenceNotes,
      required final LineNumber lineNumber,
      required final bool isTenderContractMaterial,
      required final List<OrderHistoryDetailsOrderItemDetails> details,
      required final OrderHistoryDetailsOrderItemTenderContractDetails
          tenderContractDetails,
      required final PrincipalData principalData,
      required final ProductImages productImages,
      required final String governmentMaterialCode,
      required final MaterialStockInfo materialStockInfo,
      required final PriceAggregate priceAggregate,
      required final MaterialInfoType productType,
      required final String parentId,
      required final MaterialInfo material,
      required final bool promoStatus,
      required final bool isCounterOffer,
      required final bool hidePrice,
      required final bool isMarketPlace}) = _$_OrderHistoryDetailsOrderItem;
  _OrderHistoryDetailsOrderItem._() : super._();

  @override
  OrderItemType get type;
  @override
  MaterialNumber get materialNumber;
  @override
  String get materialDescription;
  @override
  int get qty;
  @override
  double get unitPrice;
  @override
  double get originPrice;
  @override
  double get totalPrice;
  @override
  double get tax;
  @override
  OrderStepValue get sAPStatus;
  @override
  DateTimeStringValue get plannedDeliveryDate;
  @override
  int get pickedQuantity;
  @override
  StringValue get batch;
  @override
  DateTimeStringValue get expiryDate;
  @override
  Remarks get lineReferenceNotes;
  @override
  LineNumber get lineNumber;
  @override
  bool get isTenderContractMaterial;
  @override
  List<OrderHistoryDetailsOrderItemDetails> get details;
  @override
  OrderHistoryDetailsOrderItemTenderContractDetails get tenderContractDetails;
  @override
  PrincipalData get principalData;
  @override
  ProductImages get productImages;
  @override
  String get governmentMaterialCode;
  @override
  MaterialStockInfo get materialStockInfo;
  @override
  PriceAggregate get priceAggregate;
  @override
  MaterialInfoType get productType;
  @override
  String get parentId;
  @override
  MaterialInfo get material;
  @override
  bool get promoStatus;
  @override
  bool get isCounterOffer;
  @override
  bool get hidePrice;
  @override
  bool get isMarketPlace;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsOrderItemCopyWith<_$_OrderHistoryDetailsOrderItem>
      get copyWith => throw _privateConstructorUsedError;
}
