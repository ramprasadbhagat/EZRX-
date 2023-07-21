// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentOrderDto _$RecentOrderDtoFromJson(Map<String, dynamic> json) {
  return _RecentOrderDto.fromJson(json);
}

/// @nodoc
mixin _$RecentOrderDto {
  @JsonKey(name: 'MaterialCode', defaultValue: '')
  String get materialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'Qty', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManufactureName', defaultValue: '')
  String get manufactureName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Seller', defaultValue: '')
  String get seller => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsMarketplace', defaultValue: false)
  bool get isMarketplace => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'EZRXNumber', defaultValue: '')
  String get eZRXNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'WarehouseStorageCondition', defaultValue: '')
  String get warehouseStorageCondition => throw _privateConstructorUsedError;
  @JsonKey(name: 'Available', defaultValue: false)
  bool get available => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderBy', defaultValue: '')
  String get orderBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderType', defaultValue: '')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'HidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentOrderDtoCopyWith<RecentOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentOrderDtoCopyWith<$Res> {
  factory $RecentOrderDtoCopyWith(
          RecentOrderDto value, $Res Function(RecentOrderDto) then) =
      _$RecentOrderDtoCopyWithImpl<$Res, RecentOrderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialCode', defaultValue: '') String materialCode,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
      String manufactureName,
      @JsonKey(name: 'Seller', defaultValue: '') String seller,
      @JsonKey(name: 'IsMarketplace', defaultValue: false) bool isMarketplace,
      @JsonKey(name: 'OrderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'EZRXNumber', defaultValue: '') String eZRXNumber,
      @JsonKey(name: 'WarehouseStorageCondition', defaultValue: '')
      String warehouseStorageCondition,
      @JsonKey(name: 'Available', defaultValue: false) bool available,
      @JsonKey(name: 'OrderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'OrderType', defaultValue: '') String orderType,
      @JsonKey(name: 'HidePrice', defaultValue: false) bool hidePrice});
}

/// @nodoc
class _$RecentOrderDtoCopyWithImpl<$Res, $Val extends RecentOrderDto>
    implements $RecentOrderDtoCopyWith<$Res> {
  _$RecentOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialCode = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? manufactureName = null,
    Object? seller = null,
    Object? isMarketplace = null,
    Object? orderNumber = null,
    Object? eZRXNumber = null,
    Object? warehouseStorageCondition = null,
    Object? available = null,
    Object? orderBy = null,
    Object? orderType = null,
    Object? hidePrice = null,
  }) {
    return _then(_value.copyWith(
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
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
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as String,
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketplace: null == isMarketplace
          ? _value.isMarketplace
          : isMarketplace // ignore: cast_nullable_to_non_nullable
              as bool,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseStorageCondition: null == warehouseStorageCondition
          ? _value.warehouseStorageCondition
          : warehouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecentOrderDtoCopyWith<$Res>
    implements $RecentOrderDtoCopyWith<$Res> {
  factory _$$_RecentOrderDtoCopyWith(
          _$_RecentOrderDto value, $Res Function(_$_RecentOrderDto) then) =
      __$$_RecentOrderDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialCode', defaultValue: '') String materialCode,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
      String manufactureName,
      @JsonKey(name: 'Seller', defaultValue: '') String seller,
      @JsonKey(name: 'IsMarketplace', defaultValue: false) bool isMarketplace,
      @JsonKey(name: 'OrderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'EZRXNumber', defaultValue: '') String eZRXNumber,
      @JsonKey(name: 'WarehouseStorageCondition', defaultValue: '')
      String warehouseStorageCondition,
      @JsonKey(name: 'Available', defaultValue: false) bool available,
      @JsonKey(name: 'OrderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'OrderType', defaultValue: '') String orderType,
      @JsonKey(name: 'HidePrice', defaultValue: false) bool hidePrice});
}

/// @nodoc
class __$$_RecentOrderDtoCopyWithImpl<$Res>
    extends _$RecentOrderDtoCopyWithImpl<$Res, _$_RecentOrderDto>
    implements _$$_RecentOrderDtoCopyWith<$Res> {
  __$$_RecentOrderDtoCopyWithImpl(
      _$_RecentOrderDto _value, $Res Function(_$_RecentOrderDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialCode = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? manufactureName = null,
    Object? seller = null,
    Object? isMarketplace = null,
    Object? orderNumber = null,
    Object? eZRXNumber = null,
    Object? warehouseStorageCondition = null,
    Object? available = null,
    Object? orderBy = null,
    Object? orderType = null,
    Object? hidePrice = null,
  }) {
    return _then(_$_RecentOrderDto(
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
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
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as String,
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketplace: null == isMarketplace
          ? _value.isMarketplace
          : isMarketplace // ignore: cast_nullable_to_non_nullable
              as bool,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseStorageCondition: null == warehouseStorageCondition
          ? _value.warehouseStorageCondition
          : warehouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
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
class _$_RecentOrderDto extends _RecentOrderDto {
  _$_RecentOrderDto(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
      required this.materialCode,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) required this.qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) required this.unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) required this.totalPrice,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
      required this.manufactureName,
      @JsonKey(name: 'Seller', defaultValue: '') required this.seller,
      @JsonKey(name: 'IsMarketplace', defaultValue: false)
      required this.isMarketplace,
      @JsonKey(name: 'OrderNumber', defaultValue: '') required this.orderNumber,
      @JsonKey(name: 'EZRXNumber', defaultValue: '') required this.eZRXNumber,
      @JsonKey(name: 'WarehouseStorageCondition', defaultValue: '')
      required this.warehouseStorageCondition,
      @JsonKey(name: 'Available', defaultValue: false) required this.available,
      @JsonKey(name: 'OrderBy', defaultValue: '') required this.orderBy,
      @JsonKey(name: 'OrderType', defaultValue: '') required this.orderType,
      @JsonKey(name: 'HidePrice', defaultValue: false) required this.hidePrice})
      : super._();

  factory _$_RecentOrderDto.fromJson(Map<String, dynamic> json) =>
      _$$_RecentOrderDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialCode', defaultValue: '')
  final String materialCode;
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
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  final double totalPrice;
  @override
  @JsonKey(name: 'ManufactureName', defaultValue: '')
  final String manufactureName;
  @override
  @JsonKey(name: 'Seller', defaultValue: '')
  final String seller;
  @override
  @JsonKey(name: 'IsMarketplace', defaultValue: false)
  final bool isMarketplace;
  @override
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  final String orderNumber;
  @override
  @JsonKey(name: 'EZRXNumber', defaultValue: '')
  final String eZRXNumber;
  @override
  @JsonKey(name: 'WarehouseStorageCondition', defaultValue: '')
  final String warehouseStorageCondition;
  @override
  @JsonKey(name: 'Available', defaultValue: false)
  final bool available;
  @override
  @JsonKey(name: 'OrderBy', defaultValue: '')
  final String orderBy;
  @override
  @JsonKey(name: 'OrderType', defaultValue: '')
  final String orderType;
  @override
  @JsonKey(name: 'HidePrice', defaultValue: false)
  final bool hidePrice;

  @override
  String toString() {
    return 'RecentOrderDto(materialCode: $materialCode, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription, qty: $qty, unitPrice: $unitPrice, totalPrice: $totalPrice, manufactureName: $manufactureName, seller: $seller, isMarketplace: $isMarketplace, orderNumber: $orderNumber, eZRXNumber: $eZRXNumber, warehouseStorageCondition: $warehouseStorageCondition, available: $available, orderBy: $orderBy, orderType: $orderType, hidePrice: $hidePrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentOrderDto &&
            (identical(other.materialCode, materialCode) ||
                other.materialCode == materialCode) &&
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
            (identical(other.manufactureName, manufactureName) ||
                other.manufactureName == manufactureName) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.isMarketplace, isMarketplace) ||
                other.isMarketplace == isMarketplace) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.eZRXNumber, eZRXNumber) ||
                other.eZRXNumber == eZRXNumber) &&
            (identical(other.warehouseStorageCondition,
                    warehouseStorageCondition) ||
                other.warehouseStorageCondition == warehouseStorageCondition) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialCode,
      materialDescription,
      defaultMaterialDescription,
      qty,
      unitPrice,
      totalPrice,
      manufactureName,
      seller,
      isMarketplace,
      orderNumber,
      eZRXNumber,
      warehouseStorageCondition,
      available,
      orderBy,
      orderType,
      hidePrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentOrderDtoCopyWith<_$_RecentOrderDto> get copyWith =>
      __$$_RecentOrderDtoCopyWithImpl<_$_RecentOrderDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecentOrderDtoToJson(
      this,
    );
  }
}

abstract class _RecentOrderDto extends RecentOrderDto {
  factory _RecentOrderDto(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
      required final String materialCode,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      required final String materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      required final String defaultMaterialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) required final int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
      required final double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
      required final double totalPrice,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
      required final String manufactureName,
      @JsonKey(name: 'Seller', defaultValue: '') required final String seller,
      @JsonKey(name: 'IsMarketplace', defaultValue: false)
      required final bool isMarketplace,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
      required final String orderNumber,
      @JsonKey(name: 'EZRXNumber', defaultValue: '')
      required final String eZRXNumber,
      @JsonKey(name: 'WarehouseStorageCondition', defaultValue: '')
      required final String warehouseStorageCondition,
      @JsonKey(name: 'Available', defaultValue: false)
      required final bool available,
      @JsonKey(name: 'OrderBy', defaultValue: '') required final String orderBy,
      @JsonKey(name: 'OrderType', defaultValue: '')
      required final String orderType,
      @JsonKey(name: 'HidePrice', defaultValue: false)
      required final bool hidePrice}) = _$_RecentOrderDto;
  _RecentOrderDto._() : super._();

  factory _RecentOrderDto.fromJson(Map<String, dynamic> json) =
      _$_RecentOrderDto.fromJson;

  @override
  @JsonKey(name: 'MaterialCode', defaultValue: '')
  String get materialCode;
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
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice;
  @override
  @JsonKey(name: 'ManufactureName', defaultValue: '')
  String get manufactureName;
  @override
  @JsonKey(name: 'Seller', defaultValue: '')
  String get seller;
  @override
  @JsonKey(name: 'IsMarketplace', defaultValue: false)
  bool get isMarketplace;
  @override
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(name: 'EZRXNumber', defaultValue: '')
  String get eZRXNumber;
  @override
  @JsonKey(name: 'WarehouseStorageCondition', defaultValue: '')
  String get warehouseStorageCondition;
  @override
  @JsonKey(name: 'Available', defaultValue: false)
  bool get available;
  @override
  @JsonKey(name: 'OrderBy', defaultValue: '')
  String get orderBy;
  @override
  @JsonKey(name: 'OrderType', defaultValue: '')
  String get orderType;
  @override
  @JsonKey(name: 'HidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(ignore: true)
  _$$_RecentOrderDtoCopyWith<_$_RecentOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}
