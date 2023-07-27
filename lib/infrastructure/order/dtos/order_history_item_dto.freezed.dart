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
  @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeliveryDate', defaultValue: '')
  String get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate', defaultValue: '')
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderBy', defaultValue: '')
  String get orderBy => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'ExpiryDate', defaultValue: '')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  String get specialInstruction => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tax', defaultValue: 0.0)
  double get tax => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'MaterialCode', defaultValue: '') String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'Status', defaultValue: '') String status,
      @JsonKey(name: 'DeliveryDate', defaultValue: '') String deliveryDate,
      @JsonKey(name: 'OrderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'CreatedDate', defaultValue: '') String createdDate,
      @JsonKey(name: 'OrderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'Batch', defaultValue: '') String batch,
      @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
      bool isBonusMaterial,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
      String telephoneNumber,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'POReference', defaultValue: '') String pOReference,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
      String manufactureName,
      @JsonKey(name: 'ExpiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
      String specialInstruction,
      @JsonKey(name: 'Tax', defaultValue: 0.0) double tax});
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
    Object? orderNumber = null,
    Object? createdDate = null,
    Object? orderBy = null,
    Object? batch = null,
    Object? isBonusMaterial = null,
    Object? telephoneNumber = null,
    Object? invoiceNumber = null,
    Object? pOReference = null,
    Object? manufactureName = null,
    Object? expiryDate = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstruction = null,
    Object? tax = null,
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
      {@JsonKey(name: 'MaterialCode', defaultValue: '') String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'Qty', defaultValue: 0) int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'Status', defaultValue: '') String status,
      @JsonKey(name: 'DeliveryDate', defaultValue: '') String deliveryDate,
      @JsonKey(name: 'OrderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'CreatedDate', defaultValue: '') String createdDate,
      @JsonKey(name: 'OrderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'Batch', defaultValue: '') String batch,
      @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
      bool isBonusMaterial,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
      String telephoneNumber,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'POReference', defaultValue: '') String pOReference,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
      String manufactureName,
      @JsonKey(name: 'ExpiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
      String specialInstruction,
      @JsonKey(name: 'Tax', defaultValue: 0.0) double tax});
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
    Object? orderNumber = null,
    Object? createdDate = null,
    Object? orderBy = null,
    Object? batch = null,
    Object? isBonusMaterial = null,
    Object? telephoneNumber = null,
    Object? invoiceNumber = null,
    Object? pOReference = null,
    Object? manufactureName = null,
    Object? expiryDate = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstruction = null,
    Object? tax = null,
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
      @JsonKey(name: 'Qty', defaultValue: 0) required this.qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0) required this.unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0) required this.totalPrice,
      @JsonKey(name: 'Status', defaultValue: '') required this.status,
      @JsonKey(name: 'DeliveryDate', defaultValue: '')
      required this.deliveryDate,
      @JsonKey(name: 'OrderNumber', defaultValue: '') required this.orderNumber,
      @JsonKey(name: 'CreatedDate', defaultValue: '') required this.createdDate,
      @JsonKey(name: 'OrderBy', defaultValue: '') required this.orderBy,
      @JsonKey(name: 'Batch', defaultValue: '') required this.batch,
      @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
      required this.isBonusMaterial,
      @JsonKey(name: 'TelephoneNumber', defaultValue: '')
      required this.telephoneNumber,
      @JsonKey(name: 'InvoiceNumber', defaultValue: '')
      required this.invoiceNumber,
      @JsonKey(name: 'POReference', defaultValue: '') required this.pOReference,
      @JsonKey(name: 'ManufactureName', defaultValue: '')
      required this.manufactureName,
      @JsonKey(name: 'ExpiryDate', defaultValue: '') required this.expiryDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      required this.requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
      required this.specialInstruction,
      @JsonKey(name: 'Tax', defaultValue: 0.0) required this.tax})
      : super._();

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
  @JsonKey(name: 'CreatedDate', defaultValue: '')
  final String createdDate;
  @override
  @JsonKey(name: 'OrderBy', defaultValue: '')
  final String orderBy;
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
  String toString() {
    return 'OrderHistoryItemDto(materialNumber: $materialNumber, materialDescription: $materialDescription, qty: $qty, unitPrice: $unitPrice, totalPrice: $totalPrice, status: $status, deliveryDate: $deliveryDate, orderNumber: $orderNumber, createdDate: $createdDate, orderBy: $orderBy, batch: $batch, isBonusMaterial: $isBonusMaterial, telephoneNumber: $telephoneNumber, invoiceNumber: $invoiceNumber, pOReference: $pOReference, manufactureName: $manufactureName, expiryDate: $expiryDate, requestedDeliveryDate: $requestedDeliveryDate, specialInstruction: $specialInstruction, tax: $tax)';
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
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
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
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.requestedDeliveryDate, requestedDeliveryDate) ||
                other.requestedDeliveryDate == requestedDeliveryDate) &&
            (identical(other.specialInstruction, specialInstruction) ||
                other.specialInstruction == specialInstruction) &&
            (identical(other.tax, tax) || other.tax == tax));
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
        orderNumber,
        createdDate,
        orderBy,
        batch,
        isBonusMaterial,
        telephoneNumber,
        invoiceNumber,
        pOReference,
        manufactureName,
        expiryDate,
        requestedDeliveryDate,
        specialInstruction,
        tax
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
      @JsonKey(name: 'Qty', defaultValue: 0) required final int qty,
      @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
      required final double unitPrice,
      @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
      required final double totalPrice,
      @JsonKey(name: 'Status', defaultValue: '') required final String status,
      @JsonKey(name: 'DeliveryDate', defaultValue: '')
      required final String deliveryDate,
      @JsonKey(name: 'OrderNumber', defaultValue: '')
      required final String orderNumber,
      @JsonKey(name: 'CreatedDate', defaultValue: '')
      required final String createdDate,
      @JsonKey(name: 'OrderBy', defaultValue: '') required final String orderBy,
      @JsonKey(name: 'Batch', defaultValue: '') required final String batch,
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
      @JsonKey(name: 'ExpiryDate', defaultValue: '')
      required final String expiryDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      required final String requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
      required final String specialInstruction,
      @JsonKey(name: 'Tax', defaultValue: 0.0)
      required final double tax}) = _$_OrderHistoryItemDto;
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
  @JsonKey(name: 'CreatedDate', defaultValue: '')
  String get createdDate;
  @override
  @JsonKey(name: 'OrderBy', defaultValue: '')
  String get orderBy;
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
  @JsonKey(ignore: true)
  _$$_OrderHistoryItemDtoCopyWith<_$_OrderHistoryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
