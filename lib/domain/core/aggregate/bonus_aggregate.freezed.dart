// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bonus_aggregate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryDetailsBonusAggregate {
  OrderHistoryDetailsOrderItem get orderItem =>
      throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderItemDetails> get details =>
      throw _privateConstructorUsedError;
  OrderHistoryDetailsOrderItemTenderContractDetails get tenderContractDetails =>
      throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderItem> get bonusList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsBonusAggregateCopyWith<OrderHistoryDetailsBonusAggregate>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsBonusAggregateCopyWith<$Res> {
  factory $OrderHistoryDetailsBonusAggregateCopyWith(
          OrderHistoryDetailsBonusAggregate value,
          $Res Function(OrderHistoryDetailsBonusAggregate) then) =
      _$OrderHistoryDetailsBonusAggregateCopyWithImpl<$Res,
          OrderHistoryDetailsBonusAggregate>;
  @useResult
  $Res call(
      {OrderHistoryDetailsOrderItem orderItem,
      List<OrderHistoryDetailsOrderItemDetails> details,
      OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails,
      List<OrderHistoryDetailsOrderItem> bonusList});

  $OrderHistoryDetailsOrderItemCopyWith<$Res> get orderItem;
  $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res>
      get tenderContractDetails;
}

/// @nodoc
class _$OrderHistoryDetailsBonusAggregateCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsBonusAggregate>
    implements $OrderHistoryDetailsBonusAggregateCopyWith<$Res> {
  _$OrderHistoryDetailsBonusAggregateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderItem = null,
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? bonusList = null,
  }) {
    return _then(_value.copyWith(
      orderItem: null == orderItem
          ? _value.orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItem,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetails>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItemTenderContractDetails,
      bonusList: null == bonusList
          ? _value.bonusList
          : bonusList // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsOrderItemCopyWith<$Res> get orderItem {
    return $OrderHistoryDetailsOrderItemCopyWith<$Res>(_value.orderItem,
        (value) {
      return _then(_value.copyWith(orderItem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res>
      get tenderContractDetails {
    return $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res>(
        _value.tenderContractDetails, (value) {
      return _then(_value.copyWith(tenderContractDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsOrderItemCopyWith<$Res>
    implements $OrderHistoryDetailsBonusAggregateCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsOrderItemCopyWith(
          _$_OrderHistoryDetailsOrderItem value,
          $Res Function(_$_OrderHistoryDetailsOrderItem) then) =
      __$$_OrderHistoryDetailsOrderItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderHistoryDetailsOrderItem orderItem,
      List<OrderHistoryDetailsOrderItemDetails> details,
      OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails,
      List<OrderHistoryDetailsOrderItem> bonusList});

  @override
  $OrderHistoryDetailsOrderItemCopyWith<$Res> get orderItem;
  @override
  $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res>
      get tenderContractDetails;
}

/// @nodoc
class __$$_OrderHistoryDetailsOrderItemCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsBonusAggregateCopyWithImpl<$Res,
        _$_OrderHistoryDetailsOrderItem>
    implements _$$_OrderHistoryDetailsOrderItemCopyWith<$Res> {
  __$$_OrderHistoryDetailsOrderItemCopyWithImpl(
      _$_OrderHistoryDetailsOrderItem _value,
      $Res Function(_$_OrderHistoryDetailsOrderItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderItem = null,
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? bonusList = null,
  }) {
    return _then(_$_OrderHistoryDetailsOrderItem(
      orderItem: null == orderItem
          ? _value.orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItem,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetails>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItemTenderContractDetails,
      bonusList: null == bonusList
          ? _value._bonusList
          : bonusList // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryDetailsOrderItem extends _OrderHistoryDetailsOrderItem {
  _$_OrderHistoryDetailsOrderItem(
      {required this.orderItem,
      required final List<OrderHistoryDetailsOrderItemDetails> details,
      required this.tenderContractDetails,
      required final List<OrderHistoryDetailsOrderItem> bonusList})
      : _details = details,
        _bonusList = bonusList,
        super._();

  @override
  final OrderHistoryDetailsOrderItem orderItem;
  final List<OrderHistoryDetailsOrderItemDetails> _details;
  @override
  List<OrderHistoryDetailsOrderItemDetails> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails;
  final List<OrderHistoryDetailsOrderItem> _bonusList;
  @override
  List<OrderHistoryDetailsOrderItem> get bonusList {
    if (_bonusList is EqualUnmodifiableListView) return _bonusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusList);
  }

  @override
  String toString() {
    return 'OrderHistoryDetailsBonusAggregate(orderItem: $orderItem, details: $details, tenderContractDetails: $tenderContractDetails, bonusList: $bonusList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsOrderItem &&
            (identical(other.orderItem, orderItem) ||
                other.orderItem == orderItem) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.tenderContractDetails, tenderContractDetails) ||
                other.tenderContractDetails == tenderContractDetails) &&
            const DeepCollectionEquality()
                .equals(other._bonusList, _bonusList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderItem,
      const DeepCollectionEquality().hash(_details),
      tenderContractDetails,
      const DeepCollectionEquality().hash(_bonusList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailsOrderItemCopyWith<_$_OrderHistoryDetailsOrderItem>
      get copyWith => __$$_OrderHistoryDetailsOrderItemCopyWithImpl<
          _$_OrderHistoryDetailsOrderItem>(this, _$identity);
}

abstract class _OrderHistoryDetailsOrderItem
    extends OrderHistoryDetailsBonusAggregate {
  factory _OrderHistoryDetailsOrderItem(
          {required final OrderHistoryDetailsOrderItem orderItem,
          required final List<OrderHistoryDetailsOrderItemDetails> details,
          required final OrderHistoryDetailsOrderItemTenderContractDetails
              tenderContractDetails,
          required final List<OrderHistoryDetailsOrderItem> bonusList}) =
      _$_OrderHistoryDetailsOrderItem;
  _OrderHistoryDetailsOrderItem._() : super._();

  @override
  OrderHistoryDetailsOrderItem get orderItem;
  @override
  List<OrderHistoryDetailsOrderItemDetails> get details;
  @override
  OrderHistoryDetailsOrderItemTenderContractDetails get tenderContractDetails;
  @override
  List<OrderHistoryDetailsOrderItem> get bonusList;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsOrderItemCopyWith<_$_OrderHistoryDetailsOrderItem>
      get copyWith => throw _privateConstructorUsedError;
}
