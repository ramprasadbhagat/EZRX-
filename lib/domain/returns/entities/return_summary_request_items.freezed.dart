// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnSummaryRequestItems {
  ReturnSummaryStatus get status => throw _privateConstructorUsedError;
  String get materialNumber => throw _privateConstructorUsedError;
  String get materialName => throw _privateConstructorUsedError;
  String get returnQty => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnSummaryRequestItemsCopyWith<ReturnSummaryRequestItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryRequestItemsCopyWith<$Res> {
  factory $ReturnSummaryRequestItemsCopyWith(ReturnSummaryRequestItems value,
          $Res Function(ReturnSummaryRequestItems) then) =
      _$ReturnSummaryRequestItemsCopyWithImpl<$Res, ReturnSummaryRequestItems>;
  @useResult
  $Res call(
      {ReturnSummaryStatus status,
      String materialNumber,
      String materialName,
      String returnQty,
      double unitPrice,
      double total});
}

/// @nodoc
class _$ReturnSummaryRequestItemsCopyWithImpl<$Res,
        $Val extends ReturnSummaryRequestItems>
    implements $ReturnSummaryRequestItemsCopyWith<$Res> {
  _$ReturnSummaryRequestItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? materialNumber = null,
    Object? materialName = null,
    Object? returnQty = null,
    Object? unitPrice = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReturnSummaryStatus,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      returnQty: null == returnQty
          ? _value.returnQty
          : returnQty // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryRequestItemsCopyWith<$Res>
    implements $ReturnSummaryRequestItemsCopyWith<$Res> {
  factory _$$_ReturnSummaryRequestItemsCopyWith(
          _$_ReturnSummaryRequestItems value,
          $Res Function(_$_ReturnSummaryRequestItems) then) =
      __$$_ReturnSummaryRequestItemsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReturnSummaryStatus status,
      String materialNumber,
      String materialName,
      String returnQty,
      double unitPrice,
      double total});
}

/// @nodoc
class __$$_ReturnSummaryRequestItemsCopyWithImpl<$Res>
    extends _$ReturnSummaryRequestItemsCopyWithImpl<$Res,
        _$_ReturnSummaryRequestItems>
    implements _$$_ReturnSummaryRequestItemsCopyWith<$Res> {
  __$$_ReturnSummaryRequestItemsCopyWithImpl(
      _$_ReturnSummaryRequestItems _value,
      $Res Function(_$_ReturnSummaryRequestItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? materialNumber = null,
    Object? materialName = null,
    Object? returnQty = null,
    Object? unitPrice = null,
    Object? total = null,
  }) {
    return _then(_$_ReturnSummaryRequestItems(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReturnSummaryStatus,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      returnQty: null == returnQty
          ? _value.returnQty
          : returnQty // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ReturnSummaryRequestItems extends _ReturnSummaryRequestItems {
  _$_ReturnSummaryRequestItems(
      {required this.status,
      required this.materialNumber,
      required this.materialName,
      required this.returnQty,
      required this.unitPrice,
      required this.total})
      : super._();

  @override
  final ReturnSummaryStatus status;
  @override
  final String materialNumber;
  @override
  final String materialName;
  @override
  final String returnQty;
  @override
  final double unitPrice;
  @override
  final double total;

  @override
  String toString() {
    return 'ReturnSummaryRequestItems(status: $status, materialNumber: $materialNumber, materialName: $materialName, returnQty: $returnQty, unitPrice: $unitPrice, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryRequestItems &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.returnQty, returnQty) ||
                other.returnQty == returnQty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, materialNumber,
      materialName, returnQty, unitPrice, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryRequestItemsCopyWith<_$_ReturnSummaryRequestItems>
      get copyWith => __$$_ReturnSummaryRequestItemsCopyWithImpl<
          _$_ReturnSummaryRequestItems>(this, _$identity);
}

abstract class _ReturnSummaryRequestItems extends ReturnSummaryRequestItems {
  factory _ReturnSummaryRequestItems(
      {required final ReturnSummaryStatus status,
      required final String materialNumber,
      required final String materialName,
      required final String returnQty,
      required final double unitPrice,
      required final double total}) = _$_ReturnSummaryRequestItems;
  _ReturnSummaryRequestItems._() : super._();

  @override
  ReturnSummaryStatus get status;
  @override
  String get materialNumber;
  @override
  String get materialName;
  @override
  String get returnQty;
  @override
  double get unitPrice;
  @override
  double get total;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryRequestItemsCopyWith<_$_ReturnSummaryRequestItems>
      get copyWith => throw _privateConstructorUsedError;
}
