// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryFilter {
  SearchKey get orderId => throw _privateConstructorUsedError;
  SearchKey get poNumber => throw _privateConstructorUsedError;
  SearchKey get materialSearch => throw _privateConstructorUsedError;
  SearchKey get principalSearch => throw _privateConstructorUsedError;
  DateTime get toDate => throw _privateConstructorUsedError;
  DateTime get fromDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryFilterCopyWith<OrderHistoryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryFilterCopyWith<$Res> {
  factory $OrderHistoryFilterCopyWith(
          OrderHistoryFilter value, $Res Function(OrderHistoryFilter) then) =
      _$OrderHistoryFilterCopyWithImpl<$Res>;
  $Res call(
      {SearchKey orderId,
      SearchKey poNumber,
      SearchKey materialSearch,
      SearchKey principalSearch,
      DateTime toDate,
      DateTime fromDate});
}

/// @nodoc
class _$OrderHistoryFilterCopyWithImpl<$Res>
    implements $OrderHistoryFilterCopyWith<$Res> {
  _$OrderHistoryFilterCopyWithImpl(this._value, this._then);

  final OrderHistoryFilter _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryFilter) _then;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? poNumber = freezed,
    Object? materialSearch = freezed,
    Object? principalSearch = freezed,
    Object? toDate = freezed,
    Object? fromDate = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      poNumber: poNumber == freezed
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      materialSearch: materialSearch == freezed
          ? _value.materialSearch
          : materialSearch // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      principalSearch: principalSearch == freezed
          ? _value.principalSearch
          : principalSearch // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      toDate: toDate == freezed
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fromDate: fromDate == freezed
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderHistoryFilterCopyWith<$Res>
    implements $OrderHistoryFilterCopyWith<$Res> {
  factory _$$_OrderHistoryFilterCopyWith(_$_OrderHistoryFilter value,
          $Res Function(_$_OrderHistoryFilter) then) =
      __$$_OrderHistoryFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {SearchKey orderId,
      SearchKey poNumber,
      SearchKey materialSearch,
      SearchKey principalSearch,
      DateTime toDate,
      DateTime fromDate});
}

/// @nodoc
class __$$_OrderHistoryFilterCopyWithImpl<$Res>
    extends _$OrderHistoryFilterCopyWithImpl<$Res>
    implements _$$_OrderHistoryFilterCopyWith<$Res> {
  __$$_OrderHistoryFilterCopyWithImpl(
      _$_OrderHistoryFilter _value, $Res Function(_$_OrderHistoryFilter) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryFilter));

  @override
  _$_OrderHistoryFilter get _value => super._value as _$_OrderHistoryFilter;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? poNumber = freezed,
    Object? materialSearch = freezed,
    Object? principalSearch = freezed,
    Object? toDate = freezed,
    Object? fromDate = freezed,
  }) {
    return _then(_$_OrderHistoryFilter(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      poNumber: poNumber == freezed
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      materialSearch: materialSearch == freezed
          ? _value.materialSearch
          : materialSearch // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      principalSearch: principalSearch == freezed
          ? _value.principalSearch
          : principalSearch // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      toDate: toDate == freezed
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fromDate: fromDate == freezed
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryFilter extends _OrderHistoryFilter {
  _$_OrderHistoryFilter(
      {required this.orderId,
      required this.poNumber,
      required this.materialSearch,
      required this.principalSearch,
      required this.toDate,
      required this.fromDate})
      : super._();

  @override
  final SearchKey orderId;
  @override
  final SearchKey poNumber;
  @override
  final SearchKey materialSearch;
  @override
  final SearchKey principalSearch;
  @override
  final DateTime toDate;
  @override
  final DateTime fromDate;

  @override
  String toString() {
    return 'OrderHistoryFilter(orderId: $orderId, poNumber: $poNumber, materialSearch: $materialSearch, principalSearch: $principalSearch, toDate: $toDate, fromDate: $fromDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryFilter &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality().equals(other.poNumber, poNumber) &&
            const DeepCollectionEquality()
                .equals(other.materialSearch, materialSearch) &&
            const DeepCollectionEquality()
                .equals(other.principalSearch, principalSearch) &&
            const DeepCollectionEquality().equals(other.toDate, toDate) &&
            const DeepCollectionEquality().equals(other.fromDate, fromDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(poNumber),
      const DeepCollectionEquality().hash(materialSearch),
      const DeepCollectionEquality().hash(principalSearch),
      const DeepCollectionEquality().hash(toDate),
      const DeepCollectionEquality().hash(fromDate));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryFilterCopyWith<_$_OrderHistoryFilter> get copyWith =>
      __$$_OrderHistoryFilterCopyWithImpl<_$_OrderHistoryFilter>(
          this, _$identity);
}

abstract class _OrderHistoryFilter extends OrderHistoryFilter {
  factory _OrderHistoryFilter(
      {required final SearchKey orderId,
      required final SearchKey poNumber,
      required final SearchKey materialSearch,
      required final SearchKey principalSearch,
      required final DateTime toDate,
      required final DateTime fromDate}) = _$_OrderHistoryFilter;
  _OrderHistoryFilter._() : super._();

  @override
  SearchKey get orderId;
  @override
  SearchKey get poNumber;
  @override
  SearchKey get materialSearch;
  @override
  SearchKey get principalSearch;
  @override
  DateTime get toDate;
  @override
  DateTime get fromDate;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryFilterCopyWith<_$_OrderHistoryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
