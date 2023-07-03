// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentOrderItem {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  ZpPrice get unitPrice => throw _privateConstructorUsedError;
  TotalPrice get totalPrice => throw _privateConstructorUsedError;
  DocumentType get orderType => throw _privateConstructorUsedError;
  OrderNumber get orderNumber => throw _privateConstructorUsedError;
  StringValue get ezrxNumber => throw _privateConstructorUsedError;
  String get orderBy => throw _privateConstructorUsedError;
  String get warehouseStorageCondition => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;
  bool get isMarketplace => throw _privateConstructorUsedError;
  String get seller => throw _privateConstructorUsedError;
  String get manufactureName => throw _privateConstructorUsedError;
  ProductImages get productImages => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentOrderItemCopyWith<RecentOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentOrderItemCopyWith<$Res> {
  factory $RecentOrderItemCopyWith(
          RecentOrderItem value, $Res Function(RecentOrderItem) then) =
      _$RecentOrderItemCopyWithImpl<$Res, RecentOrderItem>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      String materialDescription,
      String defaultMaterialDescription,
      int qty,
      ZpPrice unitPrice,
      TotalPrice totalPrice,
      DocumentType orderType,
      OrderNumber orderNumber,
      StringValue ezrxNumber,
      String orderBy,
      String warehouseStorageCondition,
      bool available,
      bool isMarketplace,
      String seller,
      String manufactureName,
      ProductImages productImages,
      bool isFavourite});

  $ProductImagesCopyWith<$Res> get productImages;
}

/// @nodoc
class _$RecentOrderItemCopyWithImpl<$Res, $Val extends RecentOrderItem>
    implements $RecentOrderItemCopyWith<$Res> {
  _$RecentOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? orderType = null,
    Object? orderNumber = null,
    Object? ezrxNumber = null,
    Object? orderBy = null,
    Object? warehouseStorageCondition = null,
    Object? available = null,
    Object? isMarketplace = null,
    Object? seller = null,
    Object? manufactureName = null,
    Object? productImages = null,
    Object? isFavourite = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
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
              as ZpPrice,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as TotalPrice,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      ezrxNumber: null == ezrxNumber
          ? _value.ezrxNumber
          : ezrxNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseStorageCondition: null == warehouseStorageCondition
          ? _value.warehouseStorageCondition
          : warehouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketplace: null == isMarketplace
          ? _value.isMarketplace
          : isMarketplace // ignore: cast_nullable_to_non_nullable
              as bool,
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as String,
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as ProductImages,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductImagesCopyWith<$Res> get productImages {
    return $ProductImagesCopyWith<$Res>(_value.productImages, (value) {
      return _then(_value.copyWith(productImages: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryItemCopyWith<$Res>
    implements $RecentOrderItemCopyWith<$Res> {
  factory _$$_OrderHistoryItemCopyWith(
          _$_OrderHistoryItem value, $Res Function(_$_OrderHistoryItem) then) =
      __$$_OrderHistoryItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      String materialDescription,
      String defaultMaterialDescription,
      int qty,
      ZpPrice unitPrice,
      TotalPrice totalPrice,
      DocumentType orderType,
      OrderNumber orderNumber,
      StringValue ezrxNumber,
      String orderBy,
      String warehouseStorageCondition,
      bool available,
      bool isMarketplace,
      String seller,
      String manufactureName,
      ProductImages productImages,
      bool isFavourite});

  @override
  $ProductImagesCopyWith<$Res> get productImages;
}

/// @nodoc
class __$$_OrderHistoryItemCopyWithImpl<$Res>
    extends _$RecentOrderItemCopyWithImpl<$Res, _$_OrderHistoryItem>
    implements _$$_OrderHistoryItemCopyWith<$Res> {
  __$$_OrderHistoryItemCopyWithImpl(
      _$_OrderHistoryItem _value, $Res Function(_$_OrderHistoryItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? orderType = null,
    Object? orderNumber = null,
    Object? ezrxNumber = null,
    Object? orderBy = null,
    Object? warehouseStorageCondition = null,
    Object? available = null,
    Object? isMarketplace = null,
    Object? seller = null,
    Object? manufactureName = null,
    Object? productImages = null,
    Object? isFavourite = null,
  }) {
    return _then(_$_OrderHistoryItem(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
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
              as ZpPrice,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as TotalPrice,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      ezrxNumber: null == ezrxNumber
          ? _value.ezrxNumber
          : ezrxNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseStorageCondition: null == warehouseStorageCondition
          ? _value.warehouseStorageCondition
          : warehouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketplace: null == isMarketplace
          ? _value.isMarketplace
          : isMarketplace // ignore: cast_nullable_to_non_nullable
              as bool,
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as String,
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as ProductImages,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryItem extends _OrderHistoryItem {
  _$_OrderHistoryItem(
      {required this.materialNumber,
      required this.materialDescription,
      required this.defaultMaterialDescription,
      required this.qty,
      required this.unitPrice,
      required this.totalPrice,
      required this.orderType,
      required this.orderNumber,
      required this.ezrxNumber,
      required this.orderBy,
      required this.warehouseStorageCondition,
      required this.available,
      required this.isMarketplace,
      required this.seller,
      required this.manufactureName,
      required this.productImages,
      this.isFavourite = false})
      : super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final String materialDescription;
  @override
  final String defaultMaterialDescription;
  @override
  final int qty;
  @override
  final ZpPrice unitPrice;
  @override
  final TotalPrice totalPrice;
  @override
  final DocumentType orderType;
  @override
  final OrderNumber orderNumber;
  @override
  final StringValue ezrxNumber;
  @override
  final String orderBy;
  @override
  final String warehouseStorageCondition;
  @override
  final bool available;
  @override
  final bool isMarketplace;
  @override
  final String seller;
  @override
  final String manufactureName;
  @override
  final ProductImages productImages;
  @override
  @JsonKey()
  final bool isFavourite;

  @override
  String toString() {
    return 'RecentOrderItem(materialNumber: $materialNumber, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription, qty: $qty, unitPrice: $unitPrice, totalPrice: $totalPrice, orderType: $orderType, orderNumber: $orderNumber, ezrxNumber: $ezrxNumber, orderBy: $orderBy, warehouseStorageCondition: $warehouseStorageCondition, available: $available, isMarketplace: $isMarketplace, seller: $seller, manufactureName: $manufactureName, productImages: $productImages, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryItem &&
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
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.ezrxNumber, ezrxNumber) ||
                other.ezrxNumber == ezrxNumber) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.warehouseStorageCondition,
                    warehouseStorageCondition) ||
                other.warehouseStorageCondition == warehouseStorageCondition) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.isMarketplace, isMarketplace) ||
                other.isMarketplace == isMarketplace) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.manufactureName, manufactureName) ||
                other.manufactureName == manufactureName) &&
            (identical(other.productImages, productImages) ||
                other.productImages == productImages) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialNumber,
      materialDescription,
      defaultMaterialDescription,
      qty,
      unitPrice,
      totalPrice,
      orderType,
      orderNumber,
      ezrxNumber,
      orderBy,
      warehouseStorageCondition,
      available,
      isMarketplace,
      seller,
      manufactureName,
      productImages,
      isFavourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryItemCopyWith<_$_OrderHistoryItem> get copyWith =>
      __$$_OrderHistoryItemCopyWithImpl<_$_OrderHistoryItem>(this, _$identity);
}

abstract class _OrderHistoryItem extends RecentOrderItem {
  factory _OrderHistoryItem(
      {required final MaterialNumber materialNumber,
      required final String materialDescription,
      required final String defaultMaterialDescription,
      required final int qty,
      required final ZpPrice unitPrice,
      required final TotalPrice totalPrice,
      required final DocumentType orderType,
      required final OrderNumber orderNumber,
      required final StringValue ezrxNumber,
      required final String orderBy,
      required final String warehouseStorageCondition,
      required final bool available,
      required final bool isMarketplace,
      required final String seller,
      required final String manufactureName,
      required final ProductImages productImages,
      final bool isFavourite}) = _$_OrderHistoryItem;
  _OrderHistoryItem._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  String get materialDescription;
  @override
  String get defaultMaterialDescription;
  @override
  int get qty;
  @override
  ZpPrice get unitPrice;
  @override
  TotalPrice get totalPrice;
  @override
  DocumentType get orderType;
  @override
  OrderNumber get orderNumber;
  @override
  StringValue get ezrxNumber;
  @override
  String get orderBy;
  @override
  String get warehouseStorageCondition;
  @override
  bool get available;
  @override
  bool get isMarketplace;
  @override
  String get seller;
  @override
  String get manufactureName;
  @override
  ProductImages get productImages;
  @override
  bool get isFavourite;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryItemCopyWith<_$_OrderHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}
