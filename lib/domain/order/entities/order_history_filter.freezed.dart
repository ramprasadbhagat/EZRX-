// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  DateTimeStringValue get toDate => throw _privateConstructorUsedError;
  DateTimeStringValue get fromDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryFilterCopyWith<OrderHistoryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryFilterCopyWith<$Res> {
  factory $OrderHistoryFilterCopyWith(
          OrderHistoryFilter value, $Res Function(OrderHistoryFilter) then) =
      _$OrderHistoryFilterCopyWithImpl<$Res, OrderHistoryFilter>;
  @useResult
  $Res call(
      {SearchKey orderId,
      SearchKey poNumber,
      SearchKey materialSearch,
      SearchKey principalSearch,
      DateTimeStringValue toDate,
      DateTimeStringValue fromDate});
}

/// @nodoc
class _$OrderHistoryFilterCopyWithImpl<$Res, $Val extends OrderHistoryFilter>
    implements $OrderHistoryFilterCopyWith<$Res> {
  _$OrderHistoryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? poNumber = null,
    Object? materialSearch = null,
    Object? principalSearch = null,
    Object? toDate = null,
    Object? fromDate = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      poNumber: null == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      materialSearch: null == materialSearch
          ? _value.materialSearch
          : materialSearch // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      principalSearch: null == principalSearch
          ? _value.principalSearch
          : principalSearch // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderHistoryFilterCopyWith<$Res>
    implements $OrderHistoryFilterCopyWith<$Res> {
  factory _$$_OrderHistoryFilterCopyWith(_$_OrderHistoryFilter value,
          $Res Function(_$_OrderHistoryFilter) then) =
      __$$_OrderHistoryFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchKey orderId,
      SearchKey poNumber,
      SearchKey materialSearch,
      SearchKey principalSearch,
      DateTimeStringValue toDate,
      DateTimeStringValue fromDate});
}

/// @nodoc
class __$$_OrderHistoryFilterCopyWithImpl<$Res>
    extends _$OrderHistoryFilterCopyWithImpl<$Res, _$_OrderHistoryFilter>
    implements _$$_OrderHistoryFilterCopyWith<$Res> {
  __$$_OrderHistoryFilterCopyWithImpl(
      _$_OrderHistoryFilter _value, $Res Function(_$_OrderHistoryFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? poNumber = null,
    Object? materialSearch = null,
    Object? principalSearch = null,
    Object? toDate = null,
    Object? fromDate = null,
  }) {
    return _then(_$_OrderHistoryFilter(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      poNumber: null == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      materialSearch: null == materialSearch
          ? _value.materialSearch
          : materialSearch // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      principalSearch: null == principalSearch
          ? _value.principalSearch
          : principalSearch // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
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
  final DateTimeStringValue toDate;
  @override
  final DateTimeStringValue fromDate;

  @override
  String toString() {
    return 'OrderHistoryFilter(orderId: $orderId, poNumber: $poNumber, materialSearch: $materialSearch, principalSearch: $principalSearch, toDate: $toDate, fromDate: $fromDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryFilter &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.materialSearch, materialSearch) ||
                other.materialSearch == materialSearch) &&
            (identical(other.principalSearch, principalSearch) ||
                other.principalSearch == principalSearch) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, poNumber,
      materialSearch, principalSearch, toDate, fromDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      required final DateTimeStringValue toDate,
      required final DateTimeStringValue fromDate}) = _$_OrderHistoryFilter;
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
  DateTimeStringValue get toDate;
  @override
  DateTimeStringValue get fromDate;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryFilterCopyWith<_$_OrderHistoryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
