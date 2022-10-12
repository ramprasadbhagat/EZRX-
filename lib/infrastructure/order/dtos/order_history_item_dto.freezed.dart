// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  @JsonKey(name: 'Status', defaultValue: 'NA')
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
  @JsonKey(name: 'OrderNumber', defaultValue: 'NA')
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryItemDtoCopyWith<OrderHistoryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryItemDtoCopyWith<$Res> {
  factory $OrderHistoryItemDtoCopyWith(
          OrderHistoryItemDto value, $Res Function(OrderHistoryItemDto) then) =
      _$OrderHistoryItemDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'MaterialCode') String materialNumber,
      @JsonKey(name: 'MaterialDescription') String materialDescription,
      @JsonKey(name: 'Qty') int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'Status', defaultValue: 'NA') String status,
      @JsonKey(name: 'DeliveryDate') String deliveryDate,
      @JsonKey(name: 'DeliveryTime') String deliveryTime,
      @JsonKey(name: 'LineNumber') String lineNumber,
      @JsonKey(name: 'Tax', defaultValue: 0.0) double tax,
      @JsonKey(name: 'OrderType') String orderType,
      @JsonKey(name: 'OrderNumber', defaultValue: 'NA') String orderNumber,
      @JsonKey(name: 'EZRXNumber') String ezrxNumber,
      @JsonKey(name: 'CreatedDate') String createdDate,
      @JsonKey(name: 'CreatedTime') String createdTime,
      @JsonKey(name: 'OrderBy') String orderBy,
      @JsonKey(name: 'PurchaseOrderType') String purchaseOrderType});
}

/// @nodoc
class _$OrderHistoryItemDtoCopyWithImpl<$Res>
    implements $OrderHistoryItemDtoCopyWith<$Res> {
  _$OrderHistoryItemDtoCopyWithImpl(this._value, this._then);

  final OrderHistoryItemDto _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryItemDto) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? qty = freezed,
    Object? unitPrice = freezed,
    Object? totalPrice = freezed,
    Object? status = freezed,
    Object? deliveryDate = freezed,
    Object? deliveryTime = freezed,
    Object? lineNumber = freezed,
    Object? tax = freezed,
    Object? orderType = freezed,
    Object? orderNumber = freezed,
    Object? ezrxNumber = freezed,
    Object? createdDate = freezed,
    Object? createdTime = freezed,
    Object? orderBy = freezed,
    Object? purchaseOrderType = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: unitPrice == freezed
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: deliveryDate == freezed
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: deliveryTime == freezed
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: lineNumber == freezed
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: orderNumber == freezed
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ezrxNumber: ezrxNumber == freezed
          ? _value.ezrxNumber
          : ezrxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: orderBy == freezed
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderType: purchaseOrderType == freezed
          ? _value.purchaseOrderType
          : purchaseOrderType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderHistoryItemDtoCopyWith<$Res>
    implements $OrderHistoryItemDtoCopyWith<$Res> {
  factory _$$_OrderHistoryItemDtoCopyWith(_$_OrderHistoryItemDto value,
          $Res Function(_$_OrderHistoryItemDto) then) =
      __$$_OrderHistoryItemDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'MaterialCode') String materialNumber,
      @JsonKey(name: 'MaterialDescription') String materialDescription,
      @JsonKey(name: 'Qty') int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'Status', defaultValue: 'NA') String status,
      @JsonKey(name: 'DeliveryDate') String deliveryDate,
      @JsonKey(name: 'DeliveryTime') String deliveryTime,
      @JsonKey(name: 'LineNumber') String lineNumber,
      @JsonKey(name: 'Tax', defaultValue: 0.0) double tax,
      @JsonKey(name: 'OrderType') String orderType,
      @JsonKey(name: 'OrderNumber', defaultValue: 'NA') String orderNumber,
      @JsonKey(name: 'EZRXNumber') String ezrxNumber,
      @JsonKey(name: 'CreatedDate') String createdDate,
      @JsonKey(name: 'CreatedTime') String createdTime,
      @JsonKey(name: 'OrderBy') String orderBy,
      @JsonKey(name: 'PurchaseOrderType') String purchaseOrderType});
}

/// @nodoc
class __$$_OrderHistoryItemDtoCopyWithImpl<$Res>
    extends _$OrderHistoryItemDtoCopyWithImpl<$Res>
    implements _$$_OrderHistoryItemDtoCopyWith<$Res> {
  __$$_OrderHistoryItemDtoCopyWithImpl(_$_OrderHistoryItemDto _value,
      $Res Function(_$_OrderHistoryItemDto) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryItemDto));

  @override
  _$_OrderHistoryItemDto get _value => super._value as _$_OrderHistoryItemDto;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? qty = freezed,
    Object? unitPrice = freezed,
    Object? totalPrice = freezed,
    Object? status = freezed,
    Object? deliveryDate = freezed,
    Object? deliveryTime = freezed,
    Object? lineNumber = freezed,
    Object? tax = freezed,
    Object? orderType = freezed,
    Object? orderNumber = freezed,
    Object? ezrxNumber = freezed,
    Object? createdDate = freezed,
    Object? createdTime = freezed,
    Object? orderBy = freezed,
    Object? purchaseOrderType = freezed,
  }) {
    return _then(_$_OrderHistoryItemDto(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: unitPrice == freezed
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: deliveryDate == freezed
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: deliveryTime == freezed
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: lineNumber == freezed
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: orderNumber == freezed
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ezrxNumber: ezrxNumber == freezed
          ? _value.ezrxNumber
          : ezrxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: orderBy == freezed
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderType: purchaseOrderType == freezed
          ? _value.purchaseOrderType
          : purchaseOrderType // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'Status', defaultValue: 'NA')
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
      @JsonKey(name: 'OrderNumber', defaultValue: 'NA')
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
          required this.purchaseOrderType})
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
  @JsonKey(name: 'Status', defaultValue: 'NA')
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
  @JsonKey(name: 'OrderNumber', defaultValue: 'NA')
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
  String toString() {
    return 'OrderHistoryItemDto(materialNumber: $materialNumber, materialDescription: $materialDescription, qty: $qty, unitPrice: $unitPrice, totalPrice: $totalPrice, status: $status, deliveryDate: $deliveryDate, deliveryTime: $deliveryTime, lineNumber: $lineNumber, tax: $tax, orderType: $orderType, orderNumber: $orderNumber, ezrxNumber: $ezrxNumber, createdDate: $createdDate, createdTime: $createdTime, orderBy: $orderBy, purchaseOrderType: $purchaseOrderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryItemDto &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.unitPrice, unitPrice) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.deliveryDate, deliveryDate) &&
            const DeepCollectionEquality()
                .equals(other.deliveryTime, deliveryTime) &&
            const DeepCollectionEquality()
                .equals(other.lineNumber, lineNumber) &&
            const DeepCollectionEquality().equals(other.tax, tax) &&
            const DeepCollectionEquality().equals(other.orderType, orderType) &&
            const DeepCollectionEquality()
                .equals(other.orderNumber, orderNumber) &&
            const DeepCollectionEquality()
                .equals(other.ezrxNumber, ezrxNumber) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.createdTime, createdTime) &&
            const DeepCollectionEquality().equals(other.orderBy, orderBy) &&
            const DeepCollectionEquality()
                .equals(other.purchaseOrderType, purchaseOrderType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(materialDescription),
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(unitPrice),
      const DeepCollectionEquality().hash(totalPrice),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(deliveryDate),
      const DeepCollectionEquality().hash(deliveryTime),
      const DeepCollectionEquality().hash(lineNumber),
      const DeepCollectionEquality().hash(tax),
      const DeepCollectionEquality().hash(orderType),
      const DeepCollectionEquality().hash(orderNumber),
      const DeepCollectionEquality().hash(ezrxNumber),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(createdTime),
      const DeepCollectionEquality().hash(orderBy),
      const DeepCollectionEquality().hash(purchaseOrderType));

  @JsonKey(ignore: true)
  @override
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
      @JsonKey(name: 'Status', defaultValue: 'NA')
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
      @JsonKey(name: 'OrderNumber', defaultValue: 'NA')
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
          required final String purchaseOrderType}) = _$_OrderHistoryItemDto;
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
  @JsonKey(name: 'Status', defaultValue: 'NA')
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
  @JsonKey(name: 'OrderNumber', defaultValue: 'NA')
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
  @JsonKey(ignore: true)
  _$$_OrderHistoryItemDtoCopyWith<_$_OrderHistoryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
