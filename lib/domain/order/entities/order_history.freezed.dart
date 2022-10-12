// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistory {
  OrderHistoryBasicInfo get orderBasicInformation =>
      throw _privateConstructorUsedError;
  List<OrderHistoryItem> get orderHistoryItems =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryCopyWith<OrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryCopyWith<$Res> {
  factory $OrderHistoryCopyWith(
          OrderHistory value, $Res Function(OrderHistory) then) =
      _$OrderHistoryCopyWithImpl<$Res>;
  $Res call(
      {OrderHistoryBasicInfo orderBasicInformation,
      List<OrderHistoryItem> orderHistoryItems});

  $OrderHistoryBasicInfoCopyWith<$Res> get orderBasicInformation;
}

/// @nodoc
class _$OrderHistoryCopyWithImpl<$Res> implements $OrderHistoryCopyWith<$Res> {
  _$OrderHistoryCopyWithImpl(this._value, this._then);

  final OrderHistory _value;
  // ignore: unused_field
  final $Res Function(OrderHistory) _then;

  @override
  $Res call({
    Object? orderBasicInformation = freezed,
    Object? orderHistoryItems = freezed,
  }) {
    return _then(_value.copyWith(
      orderBasicInformation: orderBasicInformation == freezed
          ? _value.orderBasicInformation
          : orderBasicInformation // ignore: cast_nullable_to_non_nullable
              as OrderHistoryBasicInfo,
      orderHistoryItems: orderHistoryItems == freezed
          ? _value.orderHistoryItems
          : orderHistoryItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
    ));
  }

  @override
  $OrderHistoryBasicInfoCopyWith<$Res> get orderBasicInformation {
    return $OrderHistoryBasicInfoCopyWith<$Res>(_value.orderBasicInformation,
        (value) {
      return _then(_value.copyWith(orderBasicInformation: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryCopyWith<$Res>
    implements $OrderHistoryCopyWith<$Res> {
  factory _$$_OrderHistoryCopyWith(
          _$_OrderHistory value, $Res Function(_$_OrderHistory) then) =
      __$$_OrderHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {OrderHistoryBasicInfo orderBasicInformation,
      List<OrderHistoryItem> orderHistoryItems});

  @override
  $OrderHistoryBasicInfoCopyWith<$Res> get orderBasicInformation;
}

/// @nodoc
class __$$_OrderHistoryCopyWithImpl<$Res>
    extends _$OrderHistoryCopyWithImpl<$Res>
    implements _$$_OrderHistoryCopyWith<$Res> {
  __$$_OrderHistoryCopyWithImpl(
      _$_OrderHistory _value, $Res Function(_$_OrderHistory) _then)
      : super(_value, (v) => _then(v as _$_OrderHistory));

  @override
  _$_OrderHistory get _value => super._value as _$_OrderHistory;

  @override
  $Res call({
    Object? orderBasicInformation = freezed,
    Object? orderHistoryItems = freezed,
  }) {
    return _then(_$_OrderHistory(
      orderBasicInformation: orderBasicInformation == freezed
          ? _value.orderBasicInformation
          : orderBasicInformation // ignore: cast_nullable_to_non_nullable
              as OrderHistoryBasicInfo,
      orderHistoryItems: orderHistoryItems == freezed
          ? _value._orderHistoryItems
          : orderHistoryItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
    ));
  }
}

/// @nodoc

class _$_OrderHistory extends _OrderHistory {
  _$_OrderHistory(
      {required this.orderBasicInformation,
      required final List<OrderHistoryItem> orderHistoryItems})
      : _orderHistoryItems = orderHistoryItems,
        super._();

  @override
  final OrderHistoryBasicInfo orderBasicInformation;
  final List<OrderHistoryItem> _orderHistoryItems;
  @override
  List<OrderHistoryItem> get orderHistoryItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryItems);
  }

  @override
  String toString() {
    return 'OrderHistory(orderBasicInformation: $orderBasicInformation, orderHistoryItems: $orderHistoryItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistory &&
            const DeepCollectionEquality()
                .equals(other.orderBasicInformation, orderBasicInformation) &&
            const DeepCollectionEquality()
                .equals(other._orderHistoryItems, _orderHistoryItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderBasicInformation),
      const DeepCollectionEquality().hash(_orderHistoryItems));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryCopyWith<_$_OrderHistory> get copyWith =>
      __$$_OrderHistoryCopyWithImpl<_$_OrderHistory>(this, _$identity);
}

abstract class _OrderHistory extends OrderHistory {
  factory _OrderHistory(
          {required final OrderHistoryBasicInfo orderBasicInformation,
          required final List<OrderHistoryItem> orderHistoryItems}) =
      _$_OrderHistory;
  _OrderHistory._() : super._();

  @override
  OrderHistoryBasicInfo get orderBasicInformation;
  @override
  List<OrderHistoryItem> get orderHistoryItems;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryCopyWith<_$_OrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
