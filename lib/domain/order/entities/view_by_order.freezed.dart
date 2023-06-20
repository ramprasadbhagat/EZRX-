// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByOrderHistory {
  int get orderCount => throw _privateConstructorUsedError;
  List<String> get creatingOrderIds => throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderHeader> get orderHeaders =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrderHistoryCopyWith<ViewByOrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderHistoryCopyWith<$Res> {
  factory $ViewByOrderHistoryCopyWith(
          ViewByOrderHistory value, $Res Function(ViewByOrderHistory) then) =
      _$ViewByOrderHistoryCopyWithImpl<$Res, ViewByOrderHistory>;
  @useResult
  $Res call(
      {int orderCount,
      List<String> creatingOrderIds,
      List<OrderHistoryDetailsOrderHeader> orderHeaders});
}

/// @nodoc
class _$ViewByOrderHistoryCopyWithImpl<$Res, $Val extends ViewByOrderHistory>
    implements $ViewByOrderHistoryCopyWith<$Res> {
  _$ViewByOrderHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCount = null,
    Object? creatingOrderIds = null,
    Object? orderHeaders = null,
  }) {
    return _then(_value.copyWith(
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      creatingOrderIds: null == creatingOrderIds
          ? _value.creatingOrderIds
          : creatingOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orderHeaders: null == orderHeaders
          ? _value.orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderHeader>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByOrderHistoryCopyWith<$Res>
    implements $ViewByOrderHistoryCopyWith<$Res> {
  factory _$$_ViewByOrderHistoryCopyWith(_$_ViewByOrderHistory value,
          $Res Function(_$_ViewByOrderHistory) then) =
      __$$_ViewByOrderHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int orderCount,
      List<String> creatingOrderIds,
      List<OrderHistoryDetailsOrderHeader> orderHeaders});
}

/// @nodoc
class __$$_ViewByOrderHistoryCopyWithImpl<$Res>
    extends _$ViewByOrderHistoryCopyWithImpl<$Res, _$_ViewByOrderHistory>
    implements _$$_ViewByOrderHistoryCopyWith<$Res> {
  __$$_ViewByOrderHistoryCopyWithImpl(
      _$_ViewByOrderHistory _value, $Res Function(_$_ViewByOrderHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCount = null,
    Object? creatingOrderIds = null,
    Object? orderHeaders = null,
  }) {
    return _then(_$_ViewByOrderHistory(
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      creatingOrderIds: null == creatingOrderIds
          ? _value._creatingOrderIds
          : creatingOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orderHeaders: null == orderHeaders
          ? _value._orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderHeader>,
    ));
  }
}

/// @nodoc

class _$_ViewByOrderHistory extends _ViewByOrderHistory {
  _$_ViewByOrderHistory(
      {required this.orderCount,
      required final List<String> creatingOrderIds,
      required final List<OrderHistoryDetailsOrderHeader> orderHeaders})
      : _creatingOrderIds = creatingOrderIds,
        _orderHeaders = orderHeaders,
        super._();

  @override
  final int orderCount;
  final List<String> _creatingOrderIds;
  @override
  List<String> get creatingOrderIds {
    if (_creatingOrderIds is EqualUnmodifiableListView)
      return _creatingOrderIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creatingOrderIds);
  }

  final List<OrderHistoryDetailsOrderHeader> _orderHeaders;
  @override
  List<OrderHistoryDetailsOrderHeader> get orderHeaders {
    if (_orderHeaders is EqualUnmodifiableListView) return _orderHeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHeaders);
  }

  @override
  String toString() {
    return 'ViewByOrderHistory(orderCount: $orderCount, creatingOrderIds: $creatingOrderIds, orderHeaders: $orderHeaders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderHistory &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            const DeepCollectionEquality()
                .equals(other._creatingOrderIds, _creatingOrderIds) &&
            const DeepCollectionEquality()
                .equals(other._orderHeaders, _orderHeaders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderCount,
      const DeepCollectionEquality().hash(_creatingOrderIds),
      const DeepCollectionEquality().hash(_orderHeaders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderHistoryCopyWith<_$_ViewByOrderHistory> get copyWith =>
      __$$_ViewByOrderHistoryCopyWithImpl<_$_ViewByOrderHistory>(
          this, _$identity);
}

abstract class _ViewByOrderHistory extends ViewByOrderHistory {
  factory _ViewByOrderHistory(
          {required final int orderCount,
          required final List<String> creatingOrderIds,
          required final List<OrderHistoryDetailsOrderHeader> orderHeaders}) =
      _$_ViewByOrderHistory;
  _ViewByOrderHistory._() : super._();

  @override
  int get orderCount;
  @override
  List<String> get creatingOrderIds;
  @override
  List<OrderHistoryDetailsOrderHeader> get orderHeaders;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderHistoryCopyWith<_$_ViewByOrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
