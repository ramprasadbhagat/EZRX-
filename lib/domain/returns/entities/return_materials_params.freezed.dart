// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_materials_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnMaterialsParams {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  String get shipToInfo => throw _privateConstructorUsedError;
  String get soldToInfo => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  ReturnItemsFilter get filter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnMaterialsParamsCopyWith<ReturnMaterialsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnMaterialsParamsCopyWith<$Res> {
  factory $ReturnMaterialsParamsCopyWith(ReturnMaterialsParams value,
          $Res Function(ReturnMaterialsParams) then) =
      _$ReturnMaterialsParamsCopyWithImpl<$Res, ReturnMaterialsParams>;
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      String shipToInfo,
      String soldToInfo,
      int pageSize,
      int offset,
      ReturnItemsFilter filter});

  $ReturnItemsFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$ReturnMaterialsParamsCopyWithImpl<$Res,
        $Val extends ReturnMaterialsParams>
    implements $ReturnMaterialsParamsCopyWith<$Res> {
  _$ReturnMaterialsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? shipToInfo = null,
    Object? soldToInfo = null,
    Object? pageSize = null,
    Object? offset = null,
    Object? filter = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as String,
      soldToInfo: null == soldToInfo
          ? _value.soldToInfo
          : soldToInfo // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ReturnItemsFilter,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnItemsFilterCopyWith<$Res> get filter {
    return $ReturnItemsFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnMaterialsParamsCopyWith<$Res>
    implements $ReturnMaterialsParamsCopyWith<$Res> {
  factory _$$_ReturnMaterialsParamsCopyWith(_$_ReturnMaterialsParams value,
          $Res Function(_$_ReturnMaterialsParams) then) =
      __$$_ReturnMaterialsParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      String shipToInfo,
      String soldToInfo,
      int pageSize,
      int offset,
      ReturnItemsFilter filter});

  @override
  $ReturnItemsFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$_ReturnMaterialsParamsCopyWithImpl<$Res>
    extends _$ReturnMaterialsParamsCopyWithImpl<$Res, _$_ReturnMaterialsParams>
    implements _$$_ReturnMaterialsParamsCopyWith<$Res> {
  __$$_ReturnMaterialsParamsCopyWithImpl(_$_ReturnMaterialsParams _value,
      $Res Function(_$_ReturnMaterialsParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? shipToInfo = null,
    Object? soldToInfo = null,
    Object? pageSize = null,
    Object? offset = null,
    Object? filter = null,
  }) {
    return _then(_$_ReturnMaterialsParams(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as String,
      soldToInfo: null == soldToInfo
          ? _value.soldToInfo
          : soldToInfo // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ReturnItemsFilter,
    ));
  }
}

/// @nodoc

class _$_ReturnMaterialsParams extends _ReturnMaterialsParams {
  const _$_ReturnMaterialsParams(
      {required this.salesOrg,
      required this.shipToInfo,
      required this.soldToInfo,
      required this.pageSize,
      required this.offset,
      required this.filter})
      : super._();

  @override
  final SalesOrg salesOrg;
  @override
  final String shipToInfo;
  @override
  final String soldToInfo;
  @override
  final int pageSize;
  @override
  final int offset;
  @override
  final ReturnItemsFilter filter;

  @override
  String toString() {
    return 'ReturnMaterialsParams(salesOrg: $salesOrg, shipToInfo: $shipToInfo, soldToInfo: $soldToInfo, pageSize: $pageSize, offset: $offset, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnMaterialsParams &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.soldToInfo, soldToInfo) ||
                other.soldToInfo == soldToInfo) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrg, shipToInfo, soldToInfo, pageSize, offset, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnMaterialsParamsCopyWith<_$_ReturnMaterialsParams> get copyWith =>
      __$$_ReturnMaterialsParamsCopyWithImpl<_$_ReturnMaterialsParams>(
          this, _$identity);
}

abstract class _ReturnMaterialsParams extends ReturnMaterialsParams {
  const factory _ReturnMaterialsParams(
      {required final SalesOrg salesOrg,
      required final String shipToInfo,
      required final String soldToInfo,
      required final int pageSize,
      required final int offset,
      required final ReturnItemsFilter filter}) = _$_ReturnMaterialsParams;
  const _ReturnMaterialsParams._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  String get shipToInfo;
  @override
  String get soldToInfo;
  @override
  int get pageSize;
  @override
  int get offset;
  @override
  ReturnItemsFilter get filter;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnMaterialsParamsCopyWith<_$_ReturnMaterialsParams> get copyWith =>
      throw _privateConstructorUsedError;
}
