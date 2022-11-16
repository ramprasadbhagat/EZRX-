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
  String get inStock => throw _privateConstructorUsedError;
  String get salesDistrict => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockInfoCopyWith<StockInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockInfoCopyWith<$Res> {
  factory $StockInfoCopyWith(StockInfo value, $Res Function(StockInfo) then) =
      _$StockInfoCopyWithImpl<$Res>;
  $Res call(
      {MaterialNumber materialNumber,
      String expiryDate,
      String batch,
      String inStock,
      String salesDistrict});
}

/// @nodoc
class _$StockInfoCopyWithImpl<$Res> implements $StockInfoCopyWith<$Res> {
  _$StockInfoCopyWithImpl(this._value, this._then);

  final StockInfo _value;
  // ignore: unused_field
  final $Res Function(StockInfo) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? expiryDate = freezed,
    Object? batch = freezed,
    Object? inStock = freezed,
    Object? salesDistrict = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: inStock == freezed
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: salesDistrict == freezed
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_StockInfoCopyWith<$Res> implements $StockInfoCopyWith<$Res> {
  factory _$$_StockInfoCopyWith(
          _$_StockInfo value, $Res Function(_$_StockInfo) then) =
      __$$_StockInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {MaterialNumber materialNumber,
      String expiryDate,
      String batch,
      String inStock,
      String salesDistrict});
}

/// @nodoc
class __$$_StockInfoCopyWithImpl<$Res> extends _$StockInfoCopyWithImpl<$Res>
    implements _$$_StockInfoCopyWith<$Res> {
  __$$_StockInfoCopyWithImpl(
      _$_StockInfo _value, $Res Function(_$_StockInfo) _then)
      : super(_value, (v) => _then(v as _$_StockInfo));

  @override
  _$_StockInfo get _value => super._value as _$_StockInfo;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? expiryDate = freezed,
    Object? batch = freezed,
    Object? inStock = freezed,
    Object? salesDistrict = freezed,
  }) {
    return _then(_$_StockInfo(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: inStock == freezed
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: salesDistrict == freezed
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
  final String inStock;
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
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality()
                .equals(other.expiryDate, expiryDate) &&
            const DeepCollectionEquality().equals(other.batch, batch) &&
            const DeepCollectionEquality().equals(other.inStock, inStock) &&
            const DeepCollectionEquality()
                .equals(other.salesDistrict, salesDistrict));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(expiryDate),
      const DeepCollectionEquality().hash(batch),
      const DeepCollectionEquality().hash(inStock),
      const DeepCollectionEquality().hash(salesDistrict));

  @JsonKey(ignore: true)
  @override
  _$$_StockInfoCopyWith<_$_StockInfo> get copyWith =>
      __$$_StockInfoCopyWithImpl<_$_StockInfo>(this, _$identity);
}

abstract class _StockInfo extends StockInfo {
  const factory _StockInfo(
      {required final MaterialNumber materialNumber,
      required final String expiryDate,
      required final String batch,
      required final String inStock,
      required final String salesDistrict}) = _$_StockInfo;
  const _StockInfo._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  String get expiryDate;
  @override
  String get batch;
  @override
  String get inStock;
  @override
  String get salesDistrict;
  @override
  @JsonKey(ignore: true)
  _$$_StockInfoCopyWith<_$_StockInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
