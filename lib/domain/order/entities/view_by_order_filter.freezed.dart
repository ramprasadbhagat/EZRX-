// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByOrdersFilter {
  DateTimeStringValue get orderDateFrom => throw _privateConstructorUsedError;
  DateTimeStringValue get orderDateTo => throw _privateConstructorUsedError;
  List<StatusType> get orderStatusList => throw _privateConstructorUsedError;
  OrderHistoryType get orderHistoryType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrdersFilterCopyWith<ViewByOrdersFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrdersFilterCopyWith<$Res> {
  factory $ViewByOrdersFilterCopyWith(
          ViewByOrdersFilter value, $Res Function(ViewByOrdersFilter) then) =
      _$ViewByOrdersFilterCopyWithImpl<$Res, ViewByOrdersFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue orderDateFrom,
      DateTimeStringValue orderDateTo,
      List<StatusType> orderStatusList,
      OrderHistoryType orderHistoryType});
}

/// @nodoc
class _$ViewByOrdersFilterCopyWithImpl<$Res, $Val extends ViewByOrdersFilter>
    implements $ViewByOrdersFilterCopyWith<$Res> {
  _$ViewByOrdersFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDateFrom = null,
    Object? orderDateTo = null,
    Object? orderStatusList = null,
    Object? orderHistoryType = null,
  }) {
    return _then(_value.copyWith(
      orderDateFrom: null == orderDateFrom
          ? _value.orderDateFrom
          : orderDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderDateTo: null == orderDateTo
          ? _value.orderDateTo
          : orderDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderStatusList: null == orderStatusList
          ? _value.orderStatusList
          : orderStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      orderHistoryType: null == orderHistoryType
          ? _value.orderHistoryType
          : orderHistoryType // ignore: cast_nullable_to_non_nullable
              as OrderHistoryType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByOrderHistoryFilterCopyWith<$Res>
    implements $ViewByOrdersFilterCopyWith<$Res> {
  factory _$$_ViewByOrderHistoryFilterCopyWith(
          _$_ViewByOrderHistoryFilter value,
          $Res Function(_$_ViewByOrderHistoryFilter) then) =
      __$$_ViewByOrderHistoryFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue orderDateFrom,
      DateTimeStringValue orderDateTo,
      List<StatusType> orderStatusList,
      OrderHistoryType orderHistoryType});
}

/// @nodoc
class __$$_ViewByOrderHistoryFilterCopyWithImpl<$Res>
    extends _$ViewByOrdersFilterCopyWithImpl<$Res, _$_ViewByOrderHistoryFilter>
    implements _$$_ViewByOrderHistoryFilterCopyWith<$Res> {
  __$$_ViewByOrderHistoryFilterCopyWithImpl(_$_ViewByOrderHistoryFilter _value,
      $Res Function(_$_ViewByOrderHistoryFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDateFrom = null,
    Object? orderDateTo = null,
    Object? orderStatusList = null,
    Object? orderHistoryType = null,
  }) {
    return _then(_$_ViewByOrderHistoryFilter(
      orderDateFrom: null == orderDateFrom
          ? _value.orderDateFrom
          : orderDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderDateTo: null == orderDateTo
          ? _value.orderDateTo
          : orderDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderStatusList: null == orderStatusList
          ? _value._orderStatusList
          : orderStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      orderHistoryType: null == orderHistoryType
          ? _value.orderHistoryType
          : orderHistoryType // ignore: cast_nullable_to_non_nullable
              as OrderHistoryType,
    ));
  }
}

/// @nodoc

class _$_ViewByOrderHistoryFilter extends _ViewByOrderHistoryFilter {
  _$_ViewByOrderHistoryFilter(
      {required this.orderDateFrom,
      required this.orderDateTo,
      required final List<StatusType> orderStatusList,
      required this.orderHistoryType})
      : _orderStatusList = orderStatusList,
        super._();

  @override
  final DateTimeStringValue orderDateFrom;
  @override
  final DateTimeStringValue orderDateTo;
  final List<StatusType> _orderStatusList;
  @override
  List<StatusType> get orderStatusList {
    if (_orderStatusList is EqualUnmodifiableListView) return _orderStatusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderStatusList);
  }

  @override
  final OrderHistoryType orderHistoryType;

  @override
  String toString() {
    return 'ViewByOrdersFilter(orderDateFrom: $orderDateFrom, orderDateTo: $orderDateTo, orderStatusList: $orderStatusList, orderHistoryType: $orderHistoryType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderHistoryFilter &&
            (identical(other.orderDateFrom, orderDateFrom) ||
                other.orderDateFrom == orderDateFrom) &&
            (identical(other.orderDateTo, orderDateTo) ||
                other.orderDateTo == orderDateTo) &&
            const DeepCollectionEquality()
                .equals(other._orderStatusList, _orderStatusList) &&
            (identical(other.orderHistoryType, orderHistoryType) ||
                other.orderHistoryType == orderHistoryType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderDateFrom, orderDateTo,
      const DeepCollectionEquality().hash(_orderStatusList), orderHistoryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderHistoryFilterCopyWith<_$_ViewByOrderHistoryFilter>
      get copyWith => __$$_ViewByOrderHistoryFilterCopyWithImpl<
          _$_ViewByOrderHistoryFilter>(this, _$identity);
}

abstract class _ViewByOrderHistoryFilter extends ViewByOrdersFilter {
  factory _ViewByOrderHistoryFilter(
          {required final DateTimeStringValue orderDateFrom,
          required final DateTimeStringValue orderDateTo,
          required final List<StatusType> orderStatusList,
          required final OrderHistoryType orderHistoryType}) =
      _$_ViewByOrderHistoryFilter;
  _ViewByOrderHistoryFilter._() : super._();

  @override
  DateTimeStringValue get orderDateFrom;
  @override
  DateTimeStringValue get orderDateTo;
  @override
  List<StatusType> get orderStatusList;
  @override
  OrderHistoryType get orderHistoryType;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderHistoryFilterCopyWith<_$_ViewByOrderHistoryFilter>
      get copyWith => throw _privateConstructorUsedError;
}
