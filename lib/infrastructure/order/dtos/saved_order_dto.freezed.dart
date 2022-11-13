// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'saved_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedOrderDto _$SavedOrderDtoFromJson(Map<String, dynamic> json) {
  return _SavedOrderDto.fromJson(json);
}

/// @nodoc
mixin _$SavedOrderDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @_OrderProductItemListConverter()
  @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
  List<MaterialItemDto> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'draftorder', defaultValue: false)
  bool get isDraftOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'BillingDocument', defaultValue: '')
  String get billingDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'eZRxNumber', defaultValue: '')
  String get eZRxNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'SoldToParty', defaultValue: '')
  String get soldToParty => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShipToParty', defaultValue: '')
  String get shipToParty => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyName', defaultValue: '')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
  double get totalOrderValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedOrderDtoCopyWith<SavedOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedOrderDtoCopyWith<$Res> {
  factory $SavedOrderDtoCopyWith(
          SavedOrderDto value, $Res Function(SavedOrderDto) then) =
      _$SavedOrderDtoCopyWithImpl<$Res, SavedOrderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @_OrderProductItemListConverter()
      @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
          List<MaterialItemDto> items,
      @JsonKey(name: 'draftorder', defaultValue: false)
          bool isDraftOrder,
      @JsonKey(name: 'BillingDocument', defaultValue: '')
          String billingDocument,
      @JsonKey(name: 'eZRxNumber', defaultValue: '')
          String eZRxNumber,
      @JsonKey(name: 'SoldToParty', defaultValue: '')
          String soldToParty,
      @JsonKey(name: 'ShipToParty', defaultValue: '')
          String shipToParty,
      @JsonKey(name: 'CompanyName', defaultValue: '')
          String companyName,
      @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
          double totalOrderValue,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
          String requestedDeliveryDate});
}

/// @nodoc
class _$SavedOrderDtoCopyWithImpl<$Res, $Val extends SavedOrderDto>
    implements $SavedOrderDtoCopyWith<$Res> {
  _$SavedOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? isDraftOrder = null,
    Object? billingDocument = null,
    Object? eZRxNumber = null,
    Object? soldToParty = null,
    Object? shipToParty = null,
    Object? companyName = null,
    Object? totalOrderValue = null,
    Object? requestedDeliveryDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemDto>,
      isDraftOrder: null == isDraftOrder
          ? _value.isDraftOrder
          : isDraftOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      billingDocument: null == billingDocument
          ? _value.billingDocument
          : billingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      eZRxNumber: null == eZRxNumber
          ? _value.eZRxNumber
          : eZRxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      soldToParty: null == soldToParty
          ? _value.soldToParty
          : soldToParty // ignore: cast_nullable_to_non_nullable
              as String,
      shipToParty: null == shipToParty
          ? _value.shipToParty
          : shipToParty // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      totalOrderValue: null == totalOrderValue
          ? _value.totalOrderValue
          : totalOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedOrderDtoCopyWith<$Res>
    implements $SavedOrderDtoCopyWith<$Res> {
  factory _$$_SavedOrderDtoCopyWith(
          _$_SavedOrderDto value, $Res Function(_$_SavedOrderDto) then) =
      __$$_SavedOrderDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @_OrderProductItemListConverter()
      @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
          List<MaterialItemDto> items,
      @JsonKey(name: 'draftorder', defaultValue: false)
          bool isDraftOrder,
      @JsonKey(name: 'BillingDocument', defaultValue: '')
          String billingDocument,
      @JsonKey(name: 'eZRxNumber', defaultValue: '')
          String eZRxNumber,
      @JsonKey(name: 'SoldToParty', defaultValue: '')
          String soldToParty,
      @JsonKey(name: 'ShipToParty', defaultValue: '')
          String shipToParty,
      @JsonKey(name: 'CompanyName', defaultValue: '')
          String companyName,
      @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
          double totalOrderValue,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
          String requestedDeliveryDate});
}

/// @nodoc
class __$$_SavedOrderDtoCopyWithImpl<$Res>
    extends _$SavedOrderDtoCopyWithImpl<$Res, _$_SavedOrderDto>
    implements _$$_SavedOrderDtoCopyWith<$Res> {
  __$$_SavedOrderDtoCopyWithImpl(
      _$_SavedOrderDto _value, $Res Function(_$_SavedOrderDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? isDraftOrder = null,
    Object? billingDocument = null,
    Object? eZRxNumber = null,
    Object? soldToParty = null,
    Object? shipToParty = null,
    Object? companyName = null,
    Object? totalOrderValue = null,
    Object? requestedDeliveryDate = null,
  }) {
    return _then(_$_SavedOrderDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemDto>,
      isDraftOrder: null == isDraftOrder
          ? _value.isDraftOrder
          : isDraftOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      billingDocument: null == billingDocument
          ? _value.billingDocument
          : billingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      eZRxNumber: null == eZRxNumber
          ? _value.eZRxNumber
          : eZRxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      soldToParty: null == soldToParty
          ? _value.soldToParty
          : soldToParty // ignore: cast_nullable_to_non_nullable
              as String,
      shipToParty: null == shipToParty
          ? _value.shipToParty
          : shipToParty // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      totalOrderValue: null == totalOrderValue
          ? _value.totalOrderValue
          : totalOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedOrderDto extends _SavedOrderDto {
  const _$_SavedOrderDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required this.id,
      @_OrderProductItemListConverter()
      @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
          required final List<MaterialItemDto> items,
      @JsonKey(name: 'draftorder', defaultValue: false)
          required this.isDraftOrder,
      @JsonKey(name: 'BillingDocument', defaultValue: '')
          required this.billingDocument,
      @JsonKey(name: 'eZRxNumber', defaultValue: '')
          required this.eZRxNumber,
      @JsonKey(name: 'SoldToParty', defaultValue: '')
          required this.soldToParty,
      @JsonKey(name: 'ShipToParty', defaultValue: '')
          required this.shipToParty,
      @JsonKey(name: 'CompanyName', defaultValue: '')
          required this.companyName,
      @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
          required this.totalOrderValue,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
          required this.requestedDeliveryDate})
      : _items = items,
        super._();

  factory _$_SavedOrderDto.fromJson(Map<String, dynamic> json) =>
      _$$_SavedOrderDtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  final List<MaterialItemDto> _items;
  @override
  @_OrderProductItemListConverter()
  @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
  List<MaterialItemDto> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'draftorder', defaultValue: false)
  final bool isDraftOrder;
  @override
  @JsonKey(name: 'BillingDocument', defaultValue: '')
  final String billingDocument;
  @override
  @JsonKey(name: 'eZRxNumber', defaultValue: '')
  final String eZRxNumber;
  @override
  @JsonKey(name: 'SoldToParty', defaultValue: '')
  final String soldToParty;
  @override
  @JsonKey(name: 'ShipToParty', defaultValue: '')
  final String shipToParty;
  @override
  @JsonKey(name: 'CompanyName', defaultValue: '')
  final String companyName;
  @override
  @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
  final double totalOrderValue;
  @override
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  final String requestedDeliveryDate;

  @override
  String toString() {
    return 'SavedOrderDto(id: $id, items: $items, isDraftOrder: $isDraftOrder, billingDocument: $billingDocument, eZRxNumber: $eZRxNumber, soldToParty: $soldToParty, shipToParty: $shipToParty, companyName: $companyName, totalOrderValue: $totalOrderValue, requestedDeliveryDate: $requestedDeliveryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedOrderDto &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isDraftOrder, isDraftOrder) ||
                other.isDraftOrder == isDraftOrder) &&
            (identical(other.billingDocument, billingDocument) ||
                other.billingDocument == billingDocument) &&
            (identical(other.eZRxNumber, eZRxNumber) ||
                other.eZRxNumber == eZRxNumber) &&
            (identical(other.soldToParty, soldToParty) ||
                other.soldToParty == soldToParty) &&
            (identical(other.shipToParty, shipToParty) ||
                other.shipToParty == shipToParty) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.totalOrderValue, totalOrderValue) ||
                other.totalOrderValue == totalOrderValue) &&
            (identical(other.requestedDeliveryDate, requestedDeliveryDate) ||
                other.requestedDeliveryDate == requestedDeliveryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_items),
      isDraftOrder,
      billingDocument,
      eZRxNumber,
      soldToParty,
      shipToParty,
      companyName,
      totalOrderValue,
      requestedDeliveryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedOrderDtoCopyWith<_$_SavedOrderDto> get copyWith =>
      __$$_SavedOrderDtoCopyWithImpl<_$_SavedOrderDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedOrderDtoToJson(
      this,
    );
  }
}

abstract class _SavedOrderDto extends SavedOrderDto {
  const factory _SavedOrderDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required final String id,
      @_OrderProductItemListConverter()
      @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
          required final List<MaterialItemDto> items,
      @JsonKey(name: 'draftorder', defaultValue: false)
          required final bool isDraftOrder,
      @JsonKey(name: 'BillingDocument', defaultValue: '')
          required final String billingDocument,
      @JsonKey(name: 'eZRxNumber', defaultValue: '')
          required final String eZRxNumber,
      @JsonKey(name: 'SoldToParty', defaultValue: '')
          required final String soldToParty,
      @JsonKey(name: 'ShipToParty', defaultValue: '')
          required final String shipToParty,
      @JsonKey(name: 'CompanyName', defaultValue: '')
          required final String companyName,
      @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
          required final double totalOrderValue,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
          required final String requestedDeliveryDate}) = _$_SavedOrderDto;
  const _SavedOrderDto._() : super._();

  factory _SavedOrderDto.fromJson(Map<String, dynamic> json) =
      _$_SavedOrderDto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @_OrderProductItemListConverter()
  @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
  List<MaterialItemDto> get items;
  @override
  @JsonKey(name: 'draftorder', defaultValue: false)
  bool get isDraftOrder;
  @override
  @JsonKey(name: 'BillingDocument', defaultValue: '')
  String get billingDocument;
  @override
  @JsonKey(name: 'eZRxNumber', defaultValue: '')
  String get eZRxNumber;
  @override
  @JsonKey(name: 'SoldToParty', defaultValue: '')
  String get soldToParty;
  @override
  @JsonKey(name: 'ShipToParty', defaultValue: '')
  String get shipToParty;
  @override
  @JsonKey(name: 'CompanyName', defaultValue: '')
  String get companyName;
  @override
  @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
  double get totalOrderValue;
  @override
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate;
  @override
  @JsonKey(ignore: true)
  _$$_SavedOrderDtoCopyWith<_$_SavedOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}
