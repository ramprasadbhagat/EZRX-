// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartProductRequestDto _$CartProductRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _CartProductRequestDto.fromJson(json);
}

/// @nodoc
mixin _$CartProductRequestDto {
  @JsonKey(name: 'SalesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCode', defaultValue: '')
  String get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShipToID', defaultValue: '')
  String get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductID', defaultValue: '')
  String get productNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity', defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
  String get itemSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'Language', defaultValue: 'EN')
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID', defaultValue: '')
  String get parentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'CounterOfferPrice', defaultValue: 0.0)
  double get counterOfferPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'Comment', defaultValue: '')
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
  String get counterOfferCurrency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartProductRequestDtoCopyWith<CartProductRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductRequestDtoCopyWith<$Res> {
  factory $CartProductRequestDtoCopyWith(CartProductRequestDto value,
          $Res Function(CartProductRequestDto) then) =
      _$CartProductRequestDtoCopyWithImpl<$Res, CartProductRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SalesOrg', defaultValue: '')
          String salesOrg,
      @JsonKey(name: 'CustomerCode', defaultValue: '')
          String customerCode,
      @JsonKey(name: 'ShipToID', defaultValue: '')
          String shipTo,
      @JsonKey(name: 'ProductID', defaultValue: '')
          String productNumber,
      @JsonKey(name: 'Quantity', defaultValue: 0)
          int quantity,
      @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
          String itemSource,
      @JsonKey(name: 'Language', defaultValue: 'EN')
          String language,
      @JsonKey(name: 'ParentID', defaultValue: '')
          String parentID,
      @JsonKey(name: 'CounterOfferPrice', defaultValue: 0.0)
          double counterOfferPrice,
      @JsonKey(name: 'Comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
          String counterOfferCurrency});
}

/// @nodoc
class _$CartProductRequestDtoCopyWithImpl<$Res,
        $Val extends CartProductRequestDto>
    implements $CartProductRequestDtoCopyWith<$Res> {
  _$CartProductRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? customerCode = null,
    Object? shipTo = null,
    Object? productNumber = null,
    Object? quantity = null,
    Object? itemSource = null,
    Object? language = null,
    Object? parentID = null,
    Object? counterOfferPrice = null,
    Object? comment = null,
    Object? counterOfferCurrency = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      productNumber: null == productNumber
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      itemSource: null == itemSource
          ? _value.itemSource
          : itemSource // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: null == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartProductRequestDtoCopyWith<$Res>
    implements $CartProductRequestDtoCopyWith<$Res> {
  factory _$$_CartProductRequestDtoCopyWith(_$_CartProductRequestDto value,
          $Res Function(_$_CartProductRequestDto) then) =
      __$$_CartProductRequestDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SalesOrg', defaultValue: '')
          String salesOrg,
      @JsonKey(name: 'CustomerCode', defaultValue: '')
          String customerCode,
      @JsonKey(name: 'ShipToID', defaultValue: '')
          String shipTo,
      @JsonKey(name: 'ProductID', defaultValue: '')
          String productNumber,
      @JsonKey(name: 'Quantity', defaultValue: 0)
          int quantity,
      @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
          String itemSource,
      @JsonKey(name: 'Language', defaultValue: 'EN')
          String language,
      @JsonKey(name: 'ParentID', defaultValue: '')
          String parentID,
      @JsonKey(name: 'CounterOfferPrice', defaultValue: 0.0)
          double counterOfferPrice,
      @JsonKey(name: 'Comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
          String counterOfferCurrency});
}

/// @nodoc
class __$$_CartProductRequestDtoCopyWithImpl<$Res>
    extends _$CartProductRequestDtoCopyWithImpl<$Res, _$_CartProductRequestDto>
    implements _$$_CartProductRequestDtoCopyWith<$Res> {
  __$$_CartProductRequestDtoCopyWithImpl(_$_CartProductRequestDto _value,
      $Res Function(_$_CartProductRequestDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? customerCode = null,
    Object? shipTo = null,
    Object? productNumber = null,
    Object? quantity = null,
    Object? itemSource = null,
    Object? language = null,
    Object? parentID = null,
    Object? counterOfferPrice = null,
    Object? comment = null,
    Object? counterOfferCurrency = null,
  }) {
    return _then(_$_CartProductRequestDto(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      productNumber: null == productNumber
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      itemSource: null == itemSource
          ? _value.itemSource
          : itemSource // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: null == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartProductRequestDto extends _CartProductRequestDto {
  const _$_CartProductRequestDto(
      {@JsonKey(name: 'SalesOrg', defaultValue: '')
          required this.salesOrg,
      @JsonKey(name: 'CustomerCode', defaultValue: '')
          required this.customerCode,
      @JsonKey(name: 'ShipToID', defaultValue: '')
          required this.shipTo,
      @JsonKey(name: 'ProductID', defaultValue: '')
          required this.productNumber,
      @JsonKey(name: 'Quantity', defaultValue: 0)
          required this.quantity,
      @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
          required this.itemSource,
      @JsonKey(name: 'Language', defaultValue: 'EN')
          required this.language,
      @JsonKey(name: 'ParentID', defaultValue: '')
          required this.parentID,
      @JsonKey(name: 'CounterOfferPrice', defaultValue: 0.0)
          required this.counterOfferPrice,
      @JsonKey(name: 'Comment', defaultValue: '')
          required this.comment,
      @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
          required this.counterOfferCurrency})
      : super._();

  factory _$_CartProductRequestDto.fromJson(Map<String, dynamic> json) =>
      _$$_CartProductRequestDtoFromJson(json);

  @override
  @JsonKey(name: 'SalesOrg', defaultValue: '')
  final String salesOrg;
  @override
  @JsonKey(name: 'CustomerCode', defaultValue: '')
  final String customerCode;
  @override
  @JsonKey(name: 'ShipToID', defaultValue: '')
  final String shipTo;
  @override
  @JsonKey(name: 'ProductID', defaultValue: '')
  final String productNumber;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  final int quantity;
  @override
  @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
  final String itemSource;
  @override
  @JsonKey(name: 'Language', defaultValue: 'EN')
  final String language;
  @override
  @JsonKey(name: 'ParentID', defaultValue: '')
  final String parentID;
  @override
  @JsonKey(name: 'CounterOfferPrice', defaultValue: 0.0)
  final double counterOfferPrice;
  @override
  @JsonKey(name: 'Comment', defaultValue: '')
  final String comment;
  @override
  @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
  final String counterOfferCurrency;

  @override
  String toString() {
    return 'CartProductRequestDto(salesOrg: $salesOrg, customerCode: $customerCode, shipTo: $shipTo, productNumber: $productNumber, quantity: $quantity, itemSource: $itemSource, language: $language, parentID: $parentID, counterOfferPrice: $counterOfferPrice, comment: $comment, counterOfferCurrency: $counterOfferCurrency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartProductRequestDto &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.productNumber, productNumber) ||
                other.productNumber == productNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.itemSource, itemSource) ||
                other.itemSource == itemSource) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID) &&
            (identical(other.counterOfferPrice, counterOfferPrice) ||
                other.counterOfferPrice == counterOfferPrice) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.counterOfferCurrency, counterOfferCurrency) ||
                other.counterOfferCurrency == counterOfferCurrency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrg,
      customerCode,
      shipTo,
      productNumber,
      quantity,
      itemSource,
      language,
      parentID,
      counterOfferPrice,
      comment,
      counterOfferCurrency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartProductRequestDtoCopyWith<_$_CartProductRequestDto> get copyWith =>
      __$$_CartProductRequestDtoCopyWithImpl<_$_CartProductRequestDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartProductRequestDtoToJson(
      this,
    );
  }
}

abstract class _CartProductRequestDto extends CartProductRequestDto {
  const factory _CartProductRequestDto(
          {@JsonKey(name: 'SalesOrg', defaultValue: '')
              required final String salesOrg,
          @JsonKey(name: 'CustomerCode', defaultValue: '')
              required final String customerCode,
          @JsonKey(name: 'ShipToID', defaultValue: '')
              required final String shipTo,
          @JsonKey(name: 'ProductID', defaultValue: '')
              required final String productNumber,
          @JsonKey(name: 'Quantity', defaultValue: 0)
              required final int quantity,
          @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
              required final String itemSource,
          @JsonKey(name: 'Language', defaultValue: 'EN')
              required final String language,
          @JsonKey(name: 'ParentID', defaultValue: '')
              required final String parentID,
          @JsonKey(name: 'CounterOfferPrice', defaultValue: 0.0)
              required final double counterOfferPrice,
          @JsonKey(name: 'Comment', defaultValue: '')
              required final String comment,
          @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
              required final String counterOfferCurrency}) =
      _$_CartProductRequestDto;
  const _CartProductRequestDto._() : super._();

  factory _CartProductRequestDto.fromJson(Map<String, dynamic> json) =
      _$_CartProductRequestDto.fromJson;

  @override
  @JsonKey(name: 'SalesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'CustomerCode', defaultValue: '')
  String get customerCode;
  @override
  @JsonKey(name: 'ShipToID', defaultValue: '')
  String get shipTo;
  @override
  @JsonKey(name: 'ProductID', defaultValue: '')
  String get productNumber;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  int get quantity;
  @override
  @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
  String get itemSource;
  @override
  @JsonKey(name: 'Language', defaultValue: 'EN')
  String get language;
  @override
  @JsonKey(name: 'ParentID', defaultValue: '')
  String get parentID;
  @override
  @JsonKey(name: 'CounterOfferPrice', defaultValue: 0.0)
  double get counterOfferPrice;
  @override
  @JsonKey(name: 'Comment', defaultValue: '')
  String get comment;
  @override
  @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
  String get counterOfferCurrency;
  @override
  @JsonKey(ignore: true)
  _$$_CartProductRequestDtoCopyWith<_$_CartProductRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}
