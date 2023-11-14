// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AplProduct {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  MaterialPrice get finalPriceTotal => throw _privateConstructorUsedError;
  MaterialPrice get finalPrice => throw _privateConstructorUsedError;
  MaterialQty get productQty => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AplProductCopyWith<AplProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplProductCopyWith<$Res> {
  factory $AplProductCopyWith(
          AplProduct value, $Res Function(AplProduct) then) =
      _$AplProductCopyWithImpl<$Res, AplProduct>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      MaterialPrice finalPriceTotal,
      MaterialPrice finalPrice,
      MaterialQty productQty,
      double tax});
}

/// @nodoc
class _$AplProductCopyWithImpl<$Res, $Val extends AplProduct>
    implements $AplProductCopyWith<$Res> {
  _$AplProductCopyWithImpl(this._value, this._then);

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
    Object? tax = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      finalPriceTotal: null == finalPriceTotal
          ? _value.finalPriceTotal
          : finalPriceTotal // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      productQty: null == productQty
          ? _value.productQty
          : productQty // ignore: cast_nullable_to_non_nullable
              as MaterialQty,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AplProductCopyWith<$Res>
    implements $AplProductCopyWith<$Res> {
  factory _$$_AplProductCopyWith(
          _$_AplProduct value, $Res Function(_$_AplProduct) then) =
      __$$_AplProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      MaterialPrice finalPriceTotal,
      MaterialPrice finalPrice,
      MaterialQty productQty,
      double tax});
}

/// @nodoc
class __$$_AplProductCopyWithImpl<$Res>
    extends _$AplProductCopyWithImpl<$Res, _$_AplProduct>
    implements _$$_AplProductCopyWith<$Res> {
  __$$_AplProductCopyWithImpl(
      _$_AplProduct _value, $Res Function(_$_AplProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? finalPriceTotal = null,
    Object? finalPrice = null,
    Object? productQty = null,
    Object? tax = null,
  }) {
    return _then(_$_AplProduct(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      finalPriceTotal: null == finalPriceTotal
          ? _value.finalPriceTotal
          : finalPriceTotal // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      productQty: null == productQty
          ? _value.productQty
          : productQty // ignore: cast_nullable_to_non_nullable
              as MaterialQty,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_AplProduct extends _AplProduct {
  const _$_AplProduct(
      {required this.materialNumber,
      required this.finalPriceTotal,
      required this.finalPrice,
      required this.productQty,
      required this.tax})
      : super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final MaterialPrice finalPriceTotal;
  @override
  final MaterialPrice finalPrice;
  @override
  final MaterialQty productQty;
  @override
  final double tax;

  @override
  String toString() {
    return 'AplProduct(materialNumber: $materialNumber, finalPriceTotal: $finalPriceTotal, finalPrice: $finalPrice, productQty: $productQty, tax: $tax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AplProduct &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.finalPriceTotal, finalPriceTotal) ||
                other.finalPriceTotal == finalPriceTotal) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.productQty, productQty) ||
                other.productQty == productQty) &&
            (identical(other.tax, tax) || other.tax == tax));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, finalPriceTotal,
      finalPrice, productQty, tax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AplProductCopyWith<_$_AplProduct> get copyWith =>
      __$$_AplProductCopyWithImpl<_$_AplProduct>(this, _$identity);
}

abstract class _AplProduct extends AplProduct {
  const factory _AplProduct(
      {required final MaterialNumber materialNumber,
      required final MaterialPrice finalPriceTotal,
      required final MaterialPrice finalPrice,
      required final MaterialQty productQty,
      required final double tax}) = _$_AplProduct;
  const _AplProduct._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  MaterialPrice get finalPriceTotal;
  @override
  MaterialPrice get finalPrice;
  @override
  MaterialQty get productQty;
  @override
  double get tax;
  @override
  @JsonKey(ignore: true)
  _$$_AplProductCopyWith<_$_AplProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
