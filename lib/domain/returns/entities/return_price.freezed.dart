// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnPrice {
  MaterialPrice get unitPrice => throw _privateConstructorUsedError;
  MaterialPrice get totalPrice => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get itemNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnPriceCopyWith<ReturnPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnPriceCopyWith<$Res> {
  factory $ReturnPriceCopyWith(
          ReturnPrice value, $Res Function(ReturnPrice) then) =
      _$ReturnPriceCopyWithImpl<$Res, ReturnPrice>;
  @useResult
  $Res call(
      {MaterialPrice unitPrice,
      MaterialPrice totalPrice,
      MaterialNumber materialNumber,
      String itemNumber});
}

/// @nodoc
class _$ReturnPriceCopyWithImpl<$Res, $Val extends ReturnPrice>
    implements $ReturnPriceCopyWith<$Res> {
  _$ReturnPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? materialNumber = null,
    Object? itemNumber = null,
  }) {
    return _then(_value.copyWith(
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnItemCopyWith<$Res>
    implements $ReturnPriceCopyWith<$Res> {
  factory _$$_ReturnItemCopyWith(
          _$_ReturnItem value, $Res Function(_$_ReturnItem) then) =
      __$$_ReturnItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialPrice unitPrice,
      MaterialPrice totalPrice,
      MaterialNumber materialNumber,
      String itemNumber});
}

/// @nodoc
class __$$_ReturnItemCopyWithImpl<$Res>
    extends _$ReturnPriceCopyWithImpl<$Res, _$_ReturnItem>
    implements _$$_ReturnItemCopyWith<$Res> {
  __$$_ReturnItemCopyWithImpl(
      _$_ReturnItem _value, $Res Function(_$_ReturnItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? materialNumber = null,
    Object? itemNumber = null,
  }) {
    return _then(_$_ReturnItem(
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReturnItem extends _ReturnItem {
  const _$_ReturnItem(
      {required this.unitPrice,
      required this.totalPrice,
      required this.materialNumber,
      required this.itemNumber})
      : super._();

  @override
  final MaterialPrice unitPrice;
  @override
  final MaterialPrice totalPrice;
  @override
  final MaterialNumber materialNumber;
  @override
  final String itemNumber;

  @override
  String toString() {
    return 'ReturnPrice(unitPrice: $unitPrice, totalPrice: $totalPrice, materialNumber: $materialNumber, itemNumber: $itemNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnItem &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.itemNumber, itemNumber) ||
                other.itemNumber == itemNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, unitPrice, totalPrice, materialNumber, itemNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnItemCopyWith<_$_ReturnItem> get copyWith =>
      __$$_ReturnItemCopyWithImpl<_$_ReturnItem>(this, _$identity);
}

abstract class _ReturnItem extends ReturnPrice {
  const factory _ReturnItem(
      {required final MaterialPrice unitPrice,
      required final MaterialPrice totalPrice,
      required final MaterialNumber materialNumber,
      required final String itemNumber}) = _$_ReturnItem;
  const _ReturnItem._() : super._();

  @override
  MaterialPrice get unitPrice;
  @override
  MaterialPrice get totalPrice;
  @override
  MaterialNumber get materialNumber;
  @override
  String get itemNumber;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnItemCopyWith<_$_ReturnItem> get copyWith =>
      throw _privateConstructorUsedError;
}
