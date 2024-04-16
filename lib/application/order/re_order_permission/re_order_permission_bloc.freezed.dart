// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 're_order_permission_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReOrderPermissionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)
        initialized,
    required TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)
        fetchOrder,
    required TResult Function(
            OrderHistory orderHistoryDetail, OrderHistoryItem item)
        fetchItem,
    required TResult Function(OrderNumber orderNumberWillUpsert)
        resetOrderNumberWillUpsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult? Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult? Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult? Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchOrder value) fetchOrder,
    required TResult Function(_FetchItem value) fetchItem,
    required TResult Function(_ResetOrderNumberWillUpsert value)
        resetOrderNumberWillUpsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrder value)? fetchOrder,
    TResult? Function(_FetchItem value)? fetchItem,
    TResult? Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrder value)? fetchOrder,
    TResult Function(_FetchItem value)? fetchItem,
    TResult Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReOrderPermissionEventCopyWith<$Res> {
  factory $ReOrderPermissionEventCopyWith(ReOrderPermissionEvent value,
          $Res Function(ReOrderPermissionEvent) then) =
      _$ReOrderPermissionEventCopyWithImpl<$Res, ReOrderPermissionEvent>;
}

/// @nodoc
class _$ReOrderPermissionEventCopyWithImpl<$Res,
        $Val extends ReOrderPermissionEvent>
    implements $ReOrderPermissionEventCopyWith<$Res> {
  _$ReOrderPermissionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrganisationConfigs,
      User user});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ReOrderPermissionEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? salesOrganisation = null,
    Object? salesOrganisationConfigs = null,
    Object? user = null,
  }) {
    return _then(_$_Initialized(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.customerCodeInfo,
      required this.shipToInfo,
      required this.salesOrganisation,
      required this.salesOrganisationConfigs,
      required this.user});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final User user;

  @override
  String toString() {
    return 'ReOrderPermissionEvent.initialized(customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, salesOrganisation: $salesOrganisation, salesOrganisationConfigs: $salesOrganisationConfigs, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo, shipToInfo,
      salesOrganisation, salesOrganisationConfigs, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)
        initialized,
    required TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)
        fetchOrder,
    required TResult Function(
            OrderHistory orderHistoryDetail, OrderHistoryItem item)
        fetchItem,
    required TResult Function(OrderNumber orderNumberWillUpsert)
        resetOrderNumberWillUpsert,
  }) {
    return initialized(customerCodeInfo, shipToInfo, salesOrganisation,
        salesOrganisationConfigs, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult? Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult? Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult? Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
  }) {
    return initialized?.call(customerCodeInfo, shipToInfo, salesOrganisation,
        salesOrganisationConfigs, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(customerCodeInfo, shipToInfo, salesOrganisation,
          salesOrganisationConfigs, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchOrder value) fetchOrder,
    required TResult Function(_FetchItem value) fetchItem,
    required TResult Function(_ResetOrderNumberWillUpsert value)
        resetOrderNumberWillUpsert,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrder value)? fetchOrder,
    TResult? Function(_FetchItem value)? fetchItem,
    TResult? Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrder value)? fetchOrder,
    TResult Function(_FetchItem value)? fetchItem,
    TResult Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ReOrderPermissionEvent {
  const factory _Initialized(
      {required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final User user}) = _$_Initialized;

  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  User get user;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchOrderCopyWith<$Res> {
  factory _$$_FetchOrderCopyWith(
          _$_FetchOrder value, $Res Function(_$_FetchOrder) then) =
      __$$_FetchOrderCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
      OrderNumber orderNumberWillUpsert});
}

/// @nodoc
class __$$_FetchOrderCopyWithImpl<$Res>
    extends _$ReOrderPermissionEventCopyWithImpl<$Res, _$_FetchOrder>
    implements _$$_FetchOrderCopyWith<$Res> {
  __$$_FetchOrderCopyWithImpl(
      _$_FetchOrder _value, $Res Function(_$_FetchOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetailsOrderItems = null,
    Object? orderNumberWillUpsert = null,
  }) {
    return _then(_$_FetchOrder(
      orderHistoryDetailsOrderItems: null == orderHistoryDetailsOrderItems
          ? _value._orderHistoryDetailsOrderItems
          : orderHistoryDetailsOrderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
      orderNumberWillUpsert: null == orderNumberWillUpsert
          ? _value.orderNumberWillUpsert
          : orderNumberWillUpsert // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
    ));
  }
}

/// @nodoc

class _$_FetchOrder implements _FetchOrder {
  const _$_FetchOrder(
      {required final List<OrderHistoryDetailsOrderItem>
          orderHistoryDetailsOrderItems,
      required this.orderNumberWillUpsert})
      : _orderHistoryDetailsOrderItems = orderHistoryDetailsOrderItems;

  final List<OrderHistoryDetailsOrderItem> _orderHistoryDetailsOrderItems;
  @override
  List<OrderHistoryDetailsOrderItem> get orderHistoryDetailsOrderItems {
    if (_orderHistoryDetailsOrderItems is EqualUnmodifiableListView)
      return _orderHistoryDetailsOrderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsOrderItems);
  }

  @override
  final OrderNumber orderNumberWillUpsert;

  @override
  String toString() {
    return 'ReOrderPermissionEvent.fetchOrder(orderHistoryDetailsOrderItems: $orderHistoryDetailsOrderItems, orderNumberWillUpsert: $orderNumberWillUpsert)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchOrder &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsOrderItems,
                _orderHistoryDetailsOrderItems) &&
            (identical(other.orderNumberWillUpsert, orderNumberWillUpsert) ||
                other.orderNumberWillUpsert == orderNumberWillUpsert));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orderHistoryDetailsOrderItems),
      orderNumberWillUpsert);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchOrderCopyWith<_$_FetchOrder> get copyWith =>
      __$$_FetchOrderCopyWithImpl<_$_FetchOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)
        initialized,
    required TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)
        fetchOrder,
    required TResult Function(
            OrderHistory orderHistoryDetail, OrderHistoryItem item)
        fetchItem,
    required TResult Function(OrderNumber orderNumberWillUpsert)
        resetOrderNumberWillUpsert,
  }) {
    return fetchOrder(orderHistoryDetailsOrderItems, orderNumberWillUpsert);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult? Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult? Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult? Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
  }) {
    return fetchOrder?.call(
        orderHistoryDetailsOrderItems, orderNumberWillUpsert);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (fetchOrder != null) {
      return fetchOrder(orderHistoryDetailsOrderItems, orderNumberWillUpsert);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchOrder value) fetchOrder,
    required TResult Function(_FetchItem value) fetchItem,
    required TResult Function(_ResetOrderNumberWillUpsert value)
        resetOrderNumberWillUpsert,
  }) {
    return fetchOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrder value)? fetchOrder,
    TResult? Function(_FetchItem value)? fetchItem,
    TResult? Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
  }) {
    return fetchOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrder value)? fetchOrder,
    TResult Function(_FetchItem value)? fetchItem,
    TResult Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (fetchOrder != null) {
      return fetchOrder(this);
    }
    return orElse();
  }
}

abstract class _FetchOrder implements ReOrderPermissionEvent {
  const factory _FetchOrder(
      {required final List<OrderHistoryDetailsOrderItem>
          orderHistoryDetailsOrderItems,
      required final OrderNumber orderNumberWillUpsert}) = _$_FetchOrder;

  List<OrderHistoryDetailsOrderItem> get orderHistoryDetailsOrderItems;
  OrderNumber get orderNumberWillUpsert;
  @JsonKey(ignore: true)
  _$$_FetchOrderCopyWith<_$_FetchOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchItemCopyWith<$Res> {
  factory _$$_FetchItemCopyWith(
          _$_FetchItem value, $Res Function(_$_FetchItem) then) =
      __$$_FetchItemCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderHistory orderHistoryDetail, OrderHistoryItem item});

  $OrderHistoryCopyWith<$Res> get orderHistoryDetail;
  $OrderHistoryItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_FetchItemCopyWithImpl<$Res>
    extends _$ReOrderPermissionEventCopyWithImpl<$Res, _$_FetchItem>
    implements _$$_FetchItemCopyWith<$Res> {
  __$$_FetchItemCopyWithImpl(
      _$_FetchItem _value, $Res Function(_$_FetchItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetail = null,
    Object? item = null,
  }) {
    return _then(_$_FetchItem(
      orderHistoryDetail: null == orderHistoryDetail
          ? _value.orderHistoryDetail
          : orderHistoryDetail // ignore: cast_nullable_to_non_nullable
              as OrderHistory,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as OrderHistoryItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryCopyWith<$Res> get orderHistoryDetail {
    return $OrderHistoryCopyWith<$Res>(_value.orderHistoryDetail, (value) {
      return _then(_value.copyWith(orderHistoryDetail: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryItemCopyWith<$Res> get item {
    return $OrderHistoryItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_FetchItem implements _FetchItem {
  const _$_FetchItem({required this.orderHistoryDetail, required this.item});

  @override
  final OrderHistory orderHistoryDetail;
  @override
  final OrderHistoryItem item;

  @override
  String toString() {
    return 'ReOrderPermissionEvent.fetchItem(orderHistoryDetail: $orderHistoryDetail, item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchItem &&
            (identical(other.orderHistoryDetail, orderHistoryDetail) ||
                other.orderHistoryDetail == orderHistoryDetail) &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderHistoryDetail, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchItemCopyWith<_$_FetchItem> get copyWith =>
      __$$_FetchItemCopyWithImpl<_$_FetchItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)
        initialized,
    required TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)
        fetchOrder,
    required TResult Function(
            OrderHistory orderHistoryDetail, OrderHistoryItem item)
        fetchItem,
    required TResult Function(OrderNumber orderNumberWillUpsert)
        resetOrderNumberWillUpsert,
  }) {
    return fetchItem(orderHistoryDetail, item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult? Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult? Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult? Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
  }) {
    return fetchItem?.call(orderHistoryDetail, item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (fetchItem != null) {
      return fetchItem(orderHistoryDetail, item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchOrder value) fetchOrder,
    required TResult Function(_FetchItem value) fetchItem,
    required TResult Function(_ResetOrderNumberWillUpsert value)
        resetOrderNumberWillUpsert,
  }) {
    return fetchItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrder value)? fetchOrder,
    TResult? Function(_FetchItem value)? fetchItem,
    TResult? Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
  }) {
    return fetchItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrder value)? fetchOrder,
    TResult Function(_FetchItem value)? fetchItem,
    TResult Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (fetchItem != null) {
      return fetchItem(this);
    }
    return orElse();
  }
}

abstract class _FetchItem implements ReOrderPermissionEvent {
  const factory _FetchItem(
      {required final OrderHistory orderHistoryDetail,
      required final OrderHistoryItem item}) = _$_FetchItem;

  OrderHistory get orderHistoryDetail;
  OrderHistoryItem get item;
  @JsonKey(ignore: true)
  _$$_FetchItemCopyWith<_$_FetchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetOrderNumberWillUpsertCopyWith<$Res> {
  factory _$$_ResetOrderNumberWillUpsertCopyWith(
          _$_ResetOrderNumberWillUpsert value,
          $Res Function(_$_ResetOrderNumberWillUpsert) then) =
      __$$_ResetOrderNumberWillUpsertCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderNumber orderNumberWillUpsert});
}

/// @nodoc
class __$$_ResetOrderNumberWillUpsertCopyWithImpl<$Res>
    extends _$ReOrderPermissionEventCopyWithImpl<$Res,
        _$_ResetOrderNumberWillUpsert>
    implements _$$_ResetOrderNumberWillUpsertCopyWith<$Res> {
  __$$_ResetOrderNumberWillUpsertCopyWithImpl(
      _$_ResetOrderNumberWillUpsert _value,
      $Res Function(_$_ResetOrderNumberWillUpsert) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumberWillUpsert = null,
  }) {
    return _then(_$_ResetOrderNumberWillUpsert(
      orderNumberWillUpsert: null == orderNumberWillUpsert
          ? _value.orderNumberWillUpsert
          : orderNumberWillUpsert // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
    ));
  }
}

/// @nodoc

class _$_ResetOrderNumberWillUpsert implements _ResetOrderNumberWillUpsert {
  const _$_ResetOrderNumberWillUpsert({required this.orderNumberWillUpsert});

  @override
  final OrderNumber orderNumberWillUpsert;

  @override
  String toString() {
    return 'ReOrderPermissionEvent.resetOrderNumberWillUpsert(orderNumberWillUpsert: $orderNumberWillUpsert)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetOrderNumberWillUpsert &&
            (identical(other.orderNumberWillUpsert, orderNumberWillUpsert) ||
                other.orderNumberWillUpsert == orderNumberWillUpsert));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderNumberWillUpsert);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetOrderNumberWillUpsertCopyWith<_$_ResetOrderNumberWillUpsert>
      get copyWith => __$$_ResetOrderNumberWillUpsertCopyWithImpl<
          _$_ResetOrderNumberWillUpsert>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)
        initialized,
    required TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)
        fetchOrder,
    required TResult Function(
            OrderHistory orderHistoryDetail, OrderHistoryItem item)
        fetchItem,
    required TResult Function(OrderNumber orderNumberWillUpsert)
        resetOrderNumberWillUpsert,
  }) {
    return resetOrderNumberWillUpsert(orderNumberWillUpsert);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult? Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult? Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult? Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
  }) {
    return resetOrderNumberWillUpsert?.call(orderNumberWillUpsert);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            User user)?
        initialized,
    TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            OrderNumber orderNumberWillUpsert)?
        fetchOrder,
    TResult Function(OrderHistory orderHistoryDetail, OrderHistoryItem item)?
        fetchItem,
    TResult Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (resetOrderNumberWillUpsert != null) {
      return resetOrderNumberWillUpsert(orderNumberWillUpsert);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchOrder value) fetchOrder,
    required TResult Function(_FetchItem value) fetchItem,
    required TResult Function(_ResetOrderNumberWillUpsert value)
        resetOrderNumberWillUpsert,
  }) {
    return resetOrderNumberWillUpsert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrder value)? fetchOrder,
    TResult? Function(_FetchItem value)? fetchItem,
    TResult? Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
  }) {
    return resetOrderNumberWillUpsert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrder value)? fetchOrder,
    TResult Function(_FetchItem value)? fetchItem,
    TResult Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (resetOrderNumberWillUpsert != null) {
      return resetOrderNumberWillUpsert(this);
    }
    return orElse();
  }
}

abstract class _ResetOrderNumberWillUpsert implements ReOrderPermissionEvent {
  const factory _ResetOrderNumberWillUpsert(
          {required final OrderNumber orderNumberWillUpsert}) =
      _$_ResetOrderNumberWillUpsert;

  OrderNumber get orderNumberWillUpsert;
  @JsonKey(ignore: true)
  _$$_ResetOrderNumberWillUpsertCopyWith<_$_ResetOrderNumberWillUpsert>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReOrderPermissionState {
  List<MaterialInfo> get validOrderItems => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  OrderNumber get orderNumberWillUpsert => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesOrganisationConfigs =>
      throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReOrderPermissionStateCopyWith<ReOrderPermissionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReOrderPermissionStateCopyWith<$Res> {
  factory $ReOrderPermissionStateCopyWith(ReOrderPermissionState value,
          $Res Function(ReOrderPermissionState) then) =
      _$ReOrderPermissionStateCopyWithImpl<$Res, ReOrderPermissionState>;
  @useResult
  $Res call(
      {List<MaterialInfo> validOrderItems,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      OrderNumber orderNumberWillUpsert,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrganisationConfigs,
      User user});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ReOrderPermissionStateCopyWithImpl<$Res,
        $Val extends ReOrderPermissionState>
    implements $ReOrderPermissionStateCopyWith<$Res> {
  _$ReOrderPermissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validOrderItems = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? orderNumberWillUpsert = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? salesOrganisation = null,
    Object? salesOrganisationConfigs = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      validOrderItems: null == validOrderItems
          ? _value.validOrderItems
          : validOrderItems // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      orderNumberWillUpsert: null == orderNumberWillUpsert
          ? _value.orderNumberWillUpsert
          : orderNumberWillUpsert // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReOrderPermissionStateCopyWith<$Res>
    implements $ReOrderPermissionStateCopyWith<$Res> {
  factory _$$_ReOrderPermissionStateCopyWith(_$_ReOrderPermissionState value,
          $Res Function(_$_ReOrderPermissionState) then) =
      __$$_ReOrderPermissionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MaterialInfo> validOrderItems,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      OrderNumber orderNumberWillUpsert,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrganisationConfigs,
      User user});

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_ReOrderPermissionStateCopyWithImpl<$Res>
    extends _$ReOrderPermissionStateCopyWithImpl<$Res,
        _$_ReOrderPermissionState>
    implements _$$_ReOrderPermissionStateCopyWith<$Res> {
  __$$_ReOrderPermissionStateCopyWithImpl(_$_ReOrderPermissionState _value,
      $Res Function(_$_ReOrderPermissionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validOrderItems = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? orderNumberWillUpsert = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? salesOrganisation = null,
    Object? salesOrganisationConfigs = null,
    Object? user = null,
  }) {
    return _then(_$_ReOrderPermissionState(
      validOrderItems: null == validOrderItems
          ? _value._validOrderItems
          : validOrderItems // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      orderNumberWillUpsert: null == orderNumberWillUpsert
          ? _value.orderNumberWillUpsert
          : orderNumberWillUpsert // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_ReOrderPermissionState extends _ReOrderPermissionState {
  const _$_ReOrderPermissionState(
      {required final List<MaterialInfo> validOrderItems,
      required this.isFetching,
      required this.failureOrSuccessOption,
      required this.orderNumberWillUpsert,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.salesOrganisation,
      required this.salesOrganisationConfigs,
      required this.user})
      : _validOrderItems = validOrderItems,
        super._();

  final List<MaterialInfo> _validOrderItems;
  @override
  List<MaterialInfo> get validOrderItems {
    if (_validOrderItems is EqualUnmodifiableListView) return _validOrderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validOrderItems);
  }

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final OrderNumber orderNumberWillUpsert;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final User user;

  @override
  String toString() {
    return 'ReOrderPermissionState(validOrderItems: $validOrderItems, isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption, orderNumberWillUpsert: $orderNumberWillUpsert, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, salesOrganisation: $salesOrganisation, salesOrganisationConfigs: $salesOrganisationConfigs, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReOrderPermissionState &&
            const DeepCollectionEquality()
                .equals(other._validOrderItems, _validOrderItems) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.orderNumberWillUpsert, orderNumberWillUpsert) ||
                other.orderNumberWillUpsert == orderNumberWillUpsert) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_validOrderItems),
      isFetching,
      failureOrSuccessOption,
      orderNumberWillUpsert,
      customerCodeInfo,
      shipToInfo,
      salesOrganisation,
      salesOrganisationConfigs,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReOrderPermissionStateCopyWith<_$_ReOrderPermissionState> get copyWith =>
      __$$_ReOrderPermissionStateCopyWithImpl<_$_ReOrderPermissionState>(
          this, _$identity);
}

abstract class _ReOrderPermissionState extends ReOrderPermissionState {
  const factory _ReOrderPermissionState(
      {required final List<MaterialInfo> validOrderItems,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final OrderNumber orderNumberWillUpsert,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final User user}) = _$_ReOrderPermissionState;
  const _ReOrderPermissionState._() : super._();

  @override
  List<MaterialInfo> get validOrderItems;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  OrderNumber get orderNumberWillUpsert;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get salesOrganisationConfigs;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_ReOrderPermissionStateCopyWith<_$_ReOrderPermissionState> get copyWith =>
      throw _privateConstructorUsedError;
}
