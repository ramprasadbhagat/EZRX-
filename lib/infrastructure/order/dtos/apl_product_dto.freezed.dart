// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AplProductDto _$AplProductDtoFromJson(Map<String, dynamic> json) {
  return _AplProductDto.fromJson(json);
}

/// @nodoc
mixin _$AplProductDto {
  @JsonKey(name: 'material', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'netValue', defaultValue: 0)
  double get finalPriceTotal =>
      throw _privateConstructorUsedError; //total individual price (unit price * quantity)
  @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
  double get finalPrice => throw _privateConstructorUsedError; //item unit price
  @JsonKey(name: 'productQty', defaultValue: 0)
  int get productQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxValue', defaultValue: 0)
  double get taxValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AplProductDtoCopyWith<AplProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplProductDtoCopyWith<$Res> {
  factory $AplProductDtoCopyWith(
          AplProductDto value, $Res Function(AplProductDto) then) =
      _$AplProductDtoCopyWithImpl<$Res, AplProductDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material', defaultValue: '') String materialNumber,
      @JsonKey(name: 'netValue', defaultValue: 0) double finalPriceTotal,
      @JsonKey(name: 'productPriceNetValue', defaultValue: 0) double finalPrice,
      @JsonKey(name: 'productQty', defaultValue: 0) int productQty,
      @JsonKey(name: 'taxValue', defaultValue: 0) double taxValue});
}

/// @nodoc
class _$AplProductDtoCopyWithImpl<$Res, $Val extends AplProductDto>
    implements $AplProductDtoCopyWith<$Res> {
  _$AplProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? finalPriceTotal = null,
    Object? finalPrice = null,
    Object? productQty = null,
    Object? taxValue = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      finalPriceTotal: null == finalPriceTotal
          ? _value.finalPriceTotal
          : finalPriceTotal // ignore: cast_nullable_to_non_nullable
              as double,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productQty: null == productQty
          ? _value.productQty
          : productQty // ignore: cast_nullable_to_non_nullable
              as int,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AplProductDtoCopyWith<$Res>
    implements $AplProductDtoCopyWith<$Res> {
  factory _$$_AplProductDtoCopyWith(
          _$_AplProductDto value, $Res Function(_$_AplProductDto) then) =
      __$$_AplProductDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material', defaultValue: '') String materialNumber,
      @JsonKey(name: 'netValue', defaultValue: 0) double finalPriceTotal,
      @JsonKey(name: 'productPriceNetValue', defaultValue: 0) double finalPrice,
      @JsonKey(name: 'productQty', defaultValue: 0) int productQty,
      @JsonKey(name: 'taxValue', defaultValue: 0) double taxValue});
}

/// @nodoc
class __$$_AplProductDtoCopyWithImpl<$Res>
    extends _$AplProductDtoCopyWithImpl<$Res, _$_AplProductDto>
    implements _$$_AplProductDtoCopyWith<$Res> {
  __$$_AplProductDtoCopyWithImpl(
      _$_AplProductDto _value, $Res Function(_$_AplProductDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? finalPriceTotal = null,
    Object? finalPrice = null,
    Object? productQty = null,
    Object? taxValue = null,
  }) {
    return _then(_$_AplProductDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      finalPriceTotal: null == finalPriceTotal
          ? _value.finalPriceTotal
          : finalPriceTotal // ignore: cast_nullable_to_non_nullable
              as double,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productQty: null == productQty
          ? _value.productQty
          : productQty // ignore: cast_nullable_to_non_nullable
              as int,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AplProductDto extends _AplProductDto {
  const _$_AplProductDto(
      {@JsonKey(name: 'material', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'netValue', defaultValue: 0) required this.finalPriceTotal,
      @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
      required this.finalPrice,
      @JsonKey(name: 'productQty', defaultValue: 0) required this.productQty,
      @JsonKey(name: 'taxValue', defaultValue: 0) required this.taxValue})
      : super._();

  factory _$_AplProductDto.fromJson(Map<String, dynamic> json) =>
      _$$_AplProductDtoFromJson(json);

  @override
  @JsonKey(name: 'material', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'netValue', defaultValue: 0)
  final double finalPriceTotal;
//total individual price (unit price * quantity)
  @override
  @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
  final double finalPrice;
//item unit price
  @override
  @JsonKey(name: 'productQty', defaultValue: 0)
  final int productQty;
  @override
  @JsonKey(name: 'taxValue', defaultValue: 0)
  final double taxValue;

  @override
  String toString() {
    return 'AplProductDto(materialNumber: $materialNumber, finalPriceTotal: $finalPriceTotal, finalPrice: $finalPrice, productQty: $productQty, taxValue: $taxValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AplProductDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.finalPriceTotal, finalPriceTotal) ||
                other.finalPriceTotal == finalPriceTotal) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.productQty, productQty) ||
                other.productQty == productQty) &&
            (identical(other.taxValue, taxValue) ||
                other.taxValue == taxValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, finalPriceTotal,
      finalPrice, productQty, taxValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AplProductDtoCopyWith<_$_AplProductDto> get copyWith =>
      __$$_AplProductDtoCopyWithImpl<_$_AplProductDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AplProductDtoToJson(
      this,
    );
  }
}

abstract class _AplProductDto extends AplProductDto {
  const factory _AplProductDto(
      {@JsonKey(name: 'material', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'netValue', defaultValue: 0)
      required final double finalPriceTotal,
      @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
      required final double finalPrice,
      @JsonKey(name: 'productQty', defaultValue: 0)
      required final int productQty,
      @JsonKey(name: 'taxValue', defaultValue: 0)
      required final double taxValue}) = _$_AplProductDto;
  const _AplProductDto._() : super._();

  factory _AplProductDto.fromJson(Map<String, dynamic> json) =
      _$_AplProductDto.fromJson;

  @override
  @JsonKey(name: 'material', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'netValue', defaultValue: 0)
  double get finalPriceTotal;
  @override //total individual price (unit price * quantity)
  @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
  double get finalPrice;
  @override //item unit price
  @JsonKey(name: 'productQty', defaultValue: 0)
  int get productQty;
  @override
  @JsonKey(name: 'taxValue', defaultValue: 0)
  double get taxValue;
  @override
  @JsonKey(ignore: true)
  _$$_AplProductDtoCopyWith<_$_AplProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}
