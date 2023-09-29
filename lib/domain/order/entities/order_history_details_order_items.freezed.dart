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
  ZpPrice get unitPrice => throw _privateConstructorUsedError;
  TotalPrice get totalPrice => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  SAPStatus get sAPStatus => throw _privateConstructorUsedError;
  DateTimeStringValue get plannedDeliveryDate =>
      throw _privateConstructorUsedError;
  int get pickedQuantity => throw _privateConstructorUsedError;
  String get batch => throw _privateConstructorUsedError;
  DateTimeStringValue get expiryDate => throw _privateConstructorUsedError;
  Remarks get lineReferenceNotes => throw _privateConstructorUsedError;
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
      ZpPrice unitPrice,
      TotalPrice totalPrice,
      double tax,
      SAPStatus sAPStatus,
      DateTimeStringValue plannedDeliveryDate,
      int pickedQuantity,
      String batch,
      DateTimeStringValue expiryDate,
      Remarks lineReferenceNotes,
      bool isTenderContractMaterial,
      List<OrderHistoryDetailsOrderItemDetails> details,
      OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails,
      PrincipalData principalData,
      ProductImages productImages,
      String governmentMaterialCode,
      MaterialStockInfo materialStockInfo,
      PriceAggregate priceAggregate,
      MaterialInfoType productType,
      String parentId});

  $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res>
      get tenderContractDetails;
  $PrincipalDataCopyWith<$Res> get principalData;
  $ProductImagesCopyWith<$Res> get productImages;
  $MaterialStockInfoCopyWith<$Res> get materialStockInfo;
  $PriceAggregateCopyWith<$Res> get priceAggregate;
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
    Object? totalPrice = null,
    Object? tax = null,
    Object? sAPStatus = null,
    Object? plannedDeliveryDate = null,
    Object? pickedQuantity = null,
    Object? batch = null,
    Object? expiryDate = null,
    Object? lineReferenceNotes = null,
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
              as ZpPrice,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as TotalPrice,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      sAPStatus: null == sAPStatus
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as SAPStatus,
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
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as Remarks,
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
      ZpPrice unitPrice,
      TotalPrice totalPrice,
      double tax,
      SAPStatus sAPStatus,
      DateTimeStringValue plannedDeliveryDate,
      int pickedQuantity,
      String batch,
      DateTimeStringValue expiryDate,
      Remarks lineReferenceNotes,
      bool isTenderContractMaterial,
      List<OrderHistoryDetailsOrderItemDetails> details,
      OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails,
      PrincipalData principalData,
      ProductImages productImages,
      String governmentMaterialCode,
      MaterialStockInfo materialStockInfo,
      PriceAggregate priceAggregate,
      MaterialInfoType productType,
      String parentId});

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
    Object? totalPrice = null,
    Object? tax = null,
    Object? sAPStatus = null,
    Object? plannedDeliveryDate = null,
    Object? pickedQuantity = null,
    Object? batch = null,
    Object? expiryDate = null,
    Object? lineReferenceNotes = null,
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
              as ZpPrice,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as TotalPrice,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      sAPStatus: null == sAPStatus
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as SAPStatus,
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
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as Remarks,
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
      required this.totalPrice,
      required this.tax,
      required this.sAPStatus,
      required this.plannedDeliveryDate,
      required this.pickedQuantity,
      required this.batch,
      required this.expiryDate,
      required this.lineReferenceNotes,
      required this.isTenderContractMaterial,
      required final List<OrderHistoryDetailsOrderItemDetails> details,
      required this.tenderContractDetails,
      required this.principalData,
      required this.productImages,
      required this.governmentMaterialCode,
      required this.materialStockInfo,
      required this.priceAggregate,
      required this.productType,
      required this.parentId})
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
  final ZpPrice unitPrice;
  @override
  final TotalPrice totalPrice;
  @override
  final double tax;
  @override
  final SAPStatus sAPStatus;
  @override
  final DateTimeStringValue plannedDeliveryDate;
  @override
  final int pickedQuantity;
  @override
  final String batch;
  @override
  final DateTimeStringValue expiryDate;
  @override
  final Remarks lineReferenceNotes;
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
  String toString() {
    return 'OrderHistoryDetailsOrderItem(type: $type, materialNumber: $materialNumber, materialDescription: $materialDescription, qty: $qty, unitPrice: $unitPrice, totalPrice: $totalPrice, tax: $tax, sAPStatus: $sAPStatus, plannedDeliveryDate: $plannedDeliveryDate, pickedQuantity: $pickedQuantity, batch: $batch, expiryDate: $expiryDate, lineReferenceNotes: $lineReferenceNotes, isTenderContractMaterial: $isTenderContractMaterial, details: $details, tenderContractDetails: $tenderContractDetails, principalData: $principalData, productImages: $productImages, governmentMaterialCode: $governmentMaterialCode, materialStockInfo: $materialStockInfo, priceAggregate: $priceAggregate, productType: $productType, parentId: $parentId)';
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
                other.parentId == parentId));
  }

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
        const DeepCollectionEquality().hash(_details),
        tenderContractDetails,
        principalData,
        productImages,
        governmentMaterialCode,
        materialStockInfo,
        priceAggregate,
        productType,
        parentId
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
      required final ZpPrice unitPrice,
      required final TotalPrice totalPrice,
      required final double tax,
      required final SAPStatus sAPStatus,
      required final DateTimeStringValue plannedDeliveryDate,
      required final int pickedQuantity,
      required final String batch,
      required final DateTimeStringValue expiryDate,
      required final Remarks lineReferenceNotes,
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
      required final String parentId}) = _$_OrderHistoryDetailsOrderItem;
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
  ZpPrice get unitPrice;
  @override
  TotalPrice get totalPrice;
  @override
  double get tax;
  @override
  SAPStatus get sAPStatus;
  @override
  DateTimeStringValue get plannedDeliveryDate;
  @override
  int get pickedQuantity;
  @override
  String get batch;
  @override
  DateTimeStringValue get expiryDate;
  @override
  Remarks get lineReferenceNotes;
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
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsOrderItemCopyWith<_$_OrderHistoryDetailsOrderItem>
      get copyWith => throw _privateConstructorUsedError;
}
