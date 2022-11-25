// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StockInfo {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get expiryDate => throw _privateConstructorUsedError;
  String get batch => throw _privateConstructorUsedError;
  MaterialInStock get inStock => throw _privateConstructorUsedError;
  String get salesDistrict => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockInfoCopyWith<StockInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockInfoCopyWith<$Res> {
  factory $StockInfoCopyWith(StockInfo value, $Res Function(StockInfo) then) =
      _$StockInfoCopyWithImpl<$Res, StockInfo>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      String expiryDate,
      String batch,
      MaterialInStock inStock,
      String salesDistrict});
}

/// @nodoc
class _$StockInfoCopyWithImpl<$Res, $Val extends StockInfo>
    implements $StockInfoCopyWith<$Res> {
  _$StockInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? expiryDate = null,
    Object? batch = null,
    Object? inStock = null,
    Object? salesDistrict = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as MaterialInStock,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StockInfoCopyWith<$Res> implements $StockInfoCopyWith<$Res> {
  factory _$$_StockInfoCopyWith(
          _$_StockInfo value, $Res Function(_$_StockInfo) then) =
      __$$_StockInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      String expiryDate,
      String batch,
      MaterialInStock inStock,
      String salesDistrict});
}

/// @nodoc
class __$$_StockInfoCopyWithImpl<$Res>
    extends _$StockInfoCopyWithImpl<$Res, _$_StockInfo>
    implements _$$_StockInfoCopyWith<$Res> {
  __$$_StockInfoCopyWithImpl(
      _$_StockInfo _value, $Res Function(_$_StockInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? expiryDate = null,
    Object? batch = null,
    Object? inStock = null,
    Object? salesDistrict = null,
  }) {
    return _then(_$_StockInfo(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as MaterialInStock,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StockInfo extends _StockInfo {
  const _$_StockInfo(
      {required this.materialNumber,
      required this.expiryDate,
      required this.batch,
      required this.inStock,
      required this.salesDistrict})
      : super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final String expiryDate;
  @override
  final String batch;
  @override
  final MaterialInStock inStock;
  @override
  final String salesDistrict;

  @override
  String toString() {
    return 'StockInfo(materialNumber: $materialNumber, expiryDate: $expiryDate, batch: $batch, inStock: $inStock, salesDistrict: $salesDistrict)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockInfo &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, materialNumber, expiryDate, batch, inStock, salesDistrict);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StockInfoCopyWith<_$_StockInfo> get copyWith =>
      __$$_StockInfoCopyWithImpl<_$_StockInfo>(this, _$identity);
}

abstract class _StockInfo extends StockInfo {
  const factory _StockInfo(
      {required final MaterialNumber materialNumber,
      required final String expiryDate,
      required final String batch,
      required final MaterialInStock inStock,
      required final String salesDistrict}) = _$_StockInfo;
  const _StockInfo._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  String get expiryDate;
  @override
  String get batch;
  @override
  MaterialInStock get inStock;
  @override
  String get salesDistrict;
  @override
  @JsonKey(ignore: true)
  _$$_StockInfoCopyWith<_$_StockInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
