// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
    required TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult? Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryEventCopyWith<$Res> {
  factory $OrderSummaryEventCopyWith(
          OrderSummaryEvent value, $Res Function(OrderSummaryEvent) then) =
      _$OrderSummaryEventCopyWithImpl<$Res, OrderSummaryEvent>;
}

/// @nodoc
class _$OrderSummaryEventCopyWithImpl<$Res, $Val extends OrderSummaryEvent>
    implements $OrderSummaryEventCopyWith<$Res> {
  _$OrderSummaryEventCopyWithImpl(this._value, this._then);

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
  $Res call({SalesOrganisationConfigs config});

  $SalesOrganisationConfigsCopyWith<$Res> get config;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$_Initialized(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get config {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized({required this.config});

  @override
  final SalesOrganisationConfigs config;

  @override
  String toString() {
    return 'OrderSummaryEvent.initialized(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
    required TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
  }) {
    return initialized(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult? Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
  }) {
    return initialized?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OrderSummaryEvent {
  const factory _Initialized({required final SalesOrganisationConfigs config}) =
      _$_Initialized;

  SalesOrganisationConfigs get config;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmitOrderCopyWith<$Res> {
  factory _$$_SubmitOrderCopyWith(
          _$_SubmitOrder value, $Res Function(_$_SubmitOrder) then) =
      __$$_SubmitOrderCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ShipToInfo shipToInfo,
      User user,
      List<PriceAggregate> cartProducts,
      double grandTotal,
      double orderValue,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      DeliveryInfoData data,
      OrderDocumentType orderDocumentType,
      SalesOrganisationConfigs config});

  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $DeliveryInfoDataCopyWith<$Res> get data;
  $OrderDocumentTypeCopyWith<$Res> get orderDocumentType;
  $SalesOrganisationConfigsCopyWith<$Res> get config;
}

/// @nodoc
class __$$_SubmitOrderCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_SubmitOrder>
    implements _$$_SubmitOrderCopyWith<$Res> {
  __$$_SubmitOrderCopyWithImpl(
      _$_SubmitOrder _value, $Res Function(_$_SubmitOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToInfo = null,
    Object? user = null,
    Object? cartProducts = null,
    Object? grandTotal = null,
    Object? orderValue = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? data = null,
    Object? orderDocumentType = null,
    Object? config = null,
  }) {
    return _then(_$_SubmitOrder(
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      cartProducts: null == cartProducts
          ? _value._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DeliveryInfoData,
      orderDocumentType: null == orderDocumentType
          ? _value.orderDocumentType
          : orderDocumentType // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
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
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryInfoDataCopyWith<$Res> get data {
    return $DeliveryInfoDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDocumentTypeCopyWith<$Res> get orderDocumentType {
    return $OrderDocumentTypeCopyWith<$Res>(_value.orderDocumentType, (value) {
      return _then(_value.copyWith(orderDocumentType: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get config {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$_SubmitOrder implements _SubmitOrder {
  const _$_SubmitOrder(
      {required this.shipToInfo,
      required this.user,
      required final List<PriceAggregate> cartProducts,
      required this.grandTotal,
      required this.orderValue,
      required this.customerCodeInfo,
      required this.salesOrganisation,
      required this.data,
      required this.orderDocumentType,
      required this.config})
      : _cartProducts = cartProducts;

  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  final List<PriceAggregate> _cartProducts;
  @override
  List<PriceAggregate> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  @override
  final double grandTotal;
  @override
  final double orderValue;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final DeliveryInfoData data;
  @override
  final OrderDocumentType orderDocumentType;
  @override
  final SalesOrganisationConfigs config;

  @override
  String toString() {
    return 'OrderSummaryEvent.submitOrder(shipToInfo: $shipToInfo, user: $user, cartProducts: $cartProducts, grandTotal: $grandTotal, orderValue: $orderValue, customerCodeInfo: $customerCodeInfo, salesOrganisation: $salesOrganisation, data: $data, orderDocumentType: $orderDocumentType, config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitOrder &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.orderDocumentType, orderDocumentType) ||
                other.orderDocumentType == orderDocumentType) &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      shipToInfo,
      user,
      const DeepCollectionEquality().hash(_cartProducts),
      grandTotal,
      orderValue,
      customerCodeInfo,
      salesOrganisation,
      data,
      orderDocumentType,
      config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitOrderCopyWith<_$_SubmitOrder> get copyWith =>
      __$$_SubmitOrderCopyWithImpl<_$_SubmitOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
    required TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
  }) {
    return submitOrder(shipToInfo, user, cartProducts, grandTotal, orderValue,
        customerCodeInfo, salesOrganisation, data, orderDocumentType, config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult? Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
  }) {
    return submitOrder?.call(
        shipToInfo,
        user,
        cartProducts,
        grandTotal,
        orderValue,
        customerCodeInfo,
        salesOrganisation,
        data,
        orderDocumentType,
        config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    required TResult orElse(),
  }) {
    if (submitOrder != null) {
      return submitOrder(shipToInfo, user, cartProducts, grandTotal, orderValue,
          customerCodeInfo, salesOrganisation, data, orderDocumentType, config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
  }) {
    return submitOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
  }) {
    return submitOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    required TResult orElse(),
  }) {
    if (submitOrder != null) {
      return submitOrder(this);
    }
    return orElse();
  }
}

abstract class _SubmitOrder implements OrderSummaryEvent {
  const factory _SubmitOrder(
      {required final ShipToInfo shipToInfo,
      required final User user,
      required final List<PriceAggregate> cartProducts,
      required final double grandTotal,
      required final double orderValue,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganisation,
      required final DeliveryInfoData data,
      required final OrderDocumentType orderDocumentType,
      required final SalesOrganisationConfigs config}) = _$_SubmitOrder;

  ShipToInfo get shipToInfo;
  User get user;
  List<PriceAggregate> get cartProducts;
  double get grandTotal;
  double get orderValue;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisation get salesOrganisation;
  DeliveryInfoData get data;
  OrderDocumentType get orderDocumentType;
  SalesOrganisationConfigs get config;
  @JsonKey(ignore: true)
  _$$_SubmitOrderCopyWith<_$_SubmitOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OrderConfirmationDetailCopyWith<$Res> {
  factory _$$_OrderConfirmationDetailCopyWith(_$_OrderConfirmationDetail value,
          $Res Function(_$_OrderConfirmationDetail) then) =
      __$$_OrderConfirmationDetailCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      SalesOrg salesOrg,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrgConfig,
      List<PriceAggregate> priceAggregate});

  $UserCopyWith<$Res> get user;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
}

/// @nodoc
class __$$_OrderConfirmationDetailCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_OrderConfirmationDetail>
    implements _$$_OrderConfirmationDetailCopyWith<$Res> {
  __$$_OrderConfirmationDetailCopyWithImpl(_$_OrderConfirmationDetail _value,
      $Res Function(_$_OrderConfirmationDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? customerCodeInfo = null,
    Object? salesOrgConfig = null,
    Object? priceAggregate = null,
  }) {
    return _then(_$_OrderConfirmationDetail(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      priceAggregate: null == priceAggregate
          ? _value._priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfig,
        (value) {
      return _then(_value.copyWith(salesOrgConfig: value));
    });
  }
}

/// @nodoc

class _$_OrderConfirmationDetail implements _OrderConfirmationDetail {
  const _$_OrderConfirmationDetail(
      {required this.user,
      required this.salesOrg,
      required this.customerCodeInfo,
      required this.salesOrgConfig,
      required final List<PriceAggregate> priceAggregate})
      : _priceAggregate = priceAggregate;

  @override
  final User user;
  @override
  final SalesOrg salesOrg;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrgConfig;
  final List<PriceAggregate> _priceAggregate;
  @override
  List<PriceAggregate> get priceAggregate {
    if (_priceAggregate is EqualUnmodifiableListView) return _priceAggregate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceAggregate);
  }

  @override
  String toString() {
    return 'OrderSummaryEvent.orderConfirmationDetail(user: $user, salesOrg: $salesOrg, customerCodeInfo: $customerCodeInfo, salesOrgConfig: $salesOrgConfig, priceAggregate: $priceAggregate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderConfirmationDetail &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrgConfig, salesOrgConfig) ||
                other.salesOrgConfig == salesOrgConfig) &&
            const DeepCollectionEquality()
                .equals(other._priceAggregate, _priceAggregate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, salesOrg, customerCodeInfo,
      salesOrgConfig, const DeepCollectionEquality().hash(_priceAggregate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderConfirmationDetailCopyWith<_$_OrderConfirmationDetail>
      get copyWith =>
          __$$_OrderConfirmationDetailCopyWithImpl<_$_OrderConfirmationDetail>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
    required TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
  }) {
    return orderConfirmationDetail(
        user, salesOrg, customerCodeInfo, salesOrgConfig, priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult? Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
  }) {
    return orderConfirmationDetail?.call(
        user, salesOrg, customerCodeInfo, salesOrgConfig, priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    required TResult orElse(),
  }) {
    if (orderConfirmationDetail != null) {
      return orderConfirmationDetail(
          user, salesOrg, customerCodeInfo, salesOrgConfig, priceAggregate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
  }) {
    return orderConfirmationDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
  }) {
    return orderConfirmationDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    required TResult orElse(),
  }) {
    if (orderConfirmationDetail != null) {
      return orderConfirmationDetail(this);
    }
    return orElse();
  }
}

abstract class _OrderConfirmationDetail implements OrderSummaryEvent {
  const factory _OrderConfirmationDetail(
          {required final User user,
          required final SalesOrg salesOrg,
          required final CustomerCodeInfo customerCodeInfo,
          required final SalesOrganisationConfigs salesOrgConfig,
          required final List<PriceAggregate> priceAggregate}) =
      _$_OrderConfirmationDetail;

  User get user;
  SalesOrg get salesOrg;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisationConfigs get salesOrgConfig;
  List<PriceAggregate> get priceAggregate;
  @JsonKey(ignore: true)
  _$$_OrderConfirmationDetailCopyWith<_$_OrderConfirmationDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConfirmedOrderStockInfoCopyWith<$Res> {
  factory _$$_ConfirmedOrderStockInfoCopyWith(_$_ConfirmedOrderStockInfo value,
          $Res Function(_$_ConfirmedOrderStockInfo) then) =
      __$$_ConfirmedOrderStockInfoCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {OrderHistoryDetails orderHistoryDetails,
      SalesOrg salesOrg,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrgConfig,
      List<PriceAggregate> priceAggregate});

  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
}

/// @nodoc
class __$$_ConfirmedOrderStockInfoCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_ConfirmedOrderStockInfo>
    implements _$$_ConfirmedOrderStockInfoCopyWith<$Res> {
  __$$_ConfirmedOrderStockInfoCopyWithImpl(_$_ConfirmedOrderStockInfo _value,
      $Res Function(_$_ConfirmedOrderStockInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetails = null,
    Object? salesOrg = null,
    Object? customerCodeInfo = null,
    Object? salesOrgConfig = null,
    Object? priceAggregate = null,
  }) {
    return _then(_$_ConfirmedOrderStockInfo(
      orderHistoryDetails: null == orderHistoryDetails
          ? _value.orderHistoryDetails
          : orderHistoryDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetails,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      priceAggregate: null == priceAggregate
          ? _value._priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails {
    return $OrderHistoryDetailsCopyWith<$Res>(_value.orderHistoryDetails,
        (value) {
      return _then(_value.copyWith(orderHistoryDetails: value));
    });
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfig,
        (value) {
      return _then(_value.copyWith(salesOrgConfig: value));
    });
  }
}

/// @nodoc

class _$_ConfirmedOrderStockInfo implements _ConfirmedOrderStockInfo {
  const _$_ConfirmedOrderStockInfo(
      {required this.orderHistoryDetails,
      required this.salesOrg,
      required this.customerCodeInfo,
      required this.salesOrgConfig,
      required final List<PriceAggregate> priceAggregate})
      : _priceAggregate = priceAggregate;

  @override
  final OrderHistoryDetails orderHistoryDetails;
  @override
  final SalesOrg salesOrg;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrgConfig;
  final List<PriceAggregate> _priceAggregate;
  @override
  List<PriceAggregate> get priceAggregate {
    if (_priceAggregate is EqualUnmodifiableListView) return _priceAggregate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceAggregate);
  }

  @override
  String toString() {
    return 'OrderSummaryEvent.confirmedOrderStockInfo(orderHistoryDetails: $orderHistoryDetails, salesOrg: $salesOrg, customerCodeInfo: $customerCodeInfo, salesOrgConfig: $salesOrgConfig, priceAggregate: $priceAggregate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfirmedOrderStockInfo &&
            (identical(other.orderHistoryDetails, orderHistoryDetails) ||
                other.orderHistoryDetails == orderHistoryDetails) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrgConfig, salesOrgConfig) ||
                other.salesOrgConfig == salesOrgConfig) &&
            const DeepCollectionEquality()
                .equals(other._priceAggregate, _priceAggregate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderHistoryDetails,
      salesOrg,
      customerCodeInfo,
      salesOrgConfig,
      const DeepCollectionEquality().hash(_priceAggregate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfirmedOrderStockInfoCopyWith<_$_ConfirmedOrderStockInfo>
      get copyWith =>
          __$$_ConfirmedOrderStockInfoCopyWithImpl<_$_ConfirmedOrderStockInfo>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs config) initialized,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
    required TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
  }) {
    return confirmedOrderStockInfo(orderHistoryDetails, salesOrg,
        customerCodeInfo, salesOrgConfig, priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs config)? initialized,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult? Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
  }) {
    return confirmedOrderStockInfo?.call(orderHistoryDetails, salesOrg,
        customerCodeInfo, salesOrgConfig, priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs config)? initialized,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    TResult Function(
            User user,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(
            OrderHistoryDetails orderHistoryDetails,
            SalesOrg salesOrg,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    required TResult orElse(),
  }) {
    if (confirmedOrderStockInfo != null) {
      return confirmedOrderStockInfo(orderHistoryDetails, salesOrg,
          customerCodeInfo, salesOrgConfig, priceAggregate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
  }) {
    return confirmedOrderStockInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
  }) {
    return confirmedOrderStockInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    required TResult orElse(),
  }) {
    if (confirmedOrderStockInfo != null) {
      return confirmedOrderStockInfo(this);
    }
    return orElse();
  }
}

abstract class _ConfirmedOrderStockInfo implements OrderSummaryEvent {
  const factory _ConfirmedOrderStockInfo(
          {required final OrderHistoryDetails orderHistoryDetails,
          required final SalesOrg salesOrg,
          required final CustomerCodeInfo customerCodeInfo,
          required final SalesOrganisationConfigs salesOrgConfig,
          required final List<PriceAggregate> priceAggregate}) =
      _$_ConfirmedOrderStockInfo;

  OrderHistoryDetails get orderHistoryDetails;
  SalesOrg get salesOrg;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisationConfigs get salesOrgConfig;
  List<PriceAggregate> get priceAggregate;
  @JsonKey(ignore: true)
  _$$_ConfirmedOrderStockInfoCopyWith<_$_ConfirmedOrderStockInfo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderSummaryState {
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isConfirming => throw _privateConstructorUsedError;
  SubmitOrderResponse get submitOrderResponse =>
      throw _privateConstructorUsedError;
  OrderHistoryDetails get orderHistoryDetails =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderSummaryStateCopyWith<OrderSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryStateCopyWith<$Res> {
  factory $OrderSummaryStateCopyWith(
          OrderSummaryState value, $Res Function(OrderSummaryState) then) =
      _$OrderSummaryStateCopyWithImpl<$Res, OrderSummaryState>;
  @useResult
  $Res call(
      {Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isSubmitting,
      bool isConfirming,
      SubmitOrderResponse submitOrderResponse,
      OrderHistoryDetails orderHistoryDetails});

  $SubmitOrderResponseCopyWith<$Res> get submitOrderResponse;
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
}

/// @nodoc
class _$OrderSummaryStateCopyWithImpl<$Res, $Val extends OrderSummaryState>
    implements $OrderSummaryStateCopyWith<$Res> {
  _$OrderSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiFailureOrSuccessOption = null,
    Object? isSubmitting = null,
    Object? isConfirming = null,
    Object? submitOrderResponse = null,
    Object? orderHistoryDetails = null,
  }) {
    return _then(_value.copyWith(
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirming: null == isConfirming
          ? _value.isConfirming
          : isConfirming // ignore: cast_nullable_to_non_nullable
              as bool,
      submitOrderResponse: null == submitOrderResponse
          ? _value.submitOrderResponse
          : submitOrderResponse // ignore: cast_nullable_to_non_nullable
              as SubmitOrderResponse,
      orderHistoryDetails: null == orderHistoryDetails
          ? _value.orderHistoryDetails
          : orderHistoryDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubmitOrderResponseCopyWith<$Res> get submitOrderResponse {
    return $SubmitOrderResponseCopyWith<$Res>(_value.submitOrderResponse,
        (value) {
      return _then(_value.copyWith(submitOrderResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails {
    return $OrderHistoryDetailsCopyWith<$Res>(_value.orderHistoryDetails,
        (value) {
      return _then(_value.copyWith(orderHistoryDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderSummaryStateCopyWith<$Res>
    implements $OrderSummaryStateCopyWith<$Res> {
  factory _$$_OrderSummaryStateCopyWith(_$_OrderSummaryState value,
          $Res Function(_$_OrderSummaryState) then) =
      __$$_OrderSummaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isSubmitting,
      bool isConfirming,
      SubmitOrderResponse submitOrderResponse,
      OrderHistoryDetails orderHistoryDetails});

  @override
  $SubmitOrderResponseCopyWith<$Res> get submitOrderResponse;
  @override
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
}

/// @nodoc
class __$$_OrderSummaryStateCopyWithImpl<$Res>
    extends _$OrderSummaryStateCopyWithImpl<$Res, _$_OrderSummaryState>
    implements _$$_OrderSummaryStateCopyWith<$Res> {
  __$$_OrderSummaryStateCopyWithImpl(
      _$_OrderSummaryState _value, $Res Function(_$_OrderSummaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiFailureOrSuccessOption = null,
    Object? isSubmitting = null,
    Object? isConfirming = null,
    Object? submitOrderResponse = null,
    Object? orderHistoryDetails = null,
  }) {
    return _then(_$_OrderSummaryState(
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirming: null == isConfirming
          ? _value.isConfirming
          : isConfirming // ignore: cast_nullable_to_non_nullable
              as bool,
      submitOrderResponse: null == submitOrderResponse
          ? _value.submitOrderResponse
          : submitOrderResponse // ignore: cast_nullable_to_non_nullable
              as SubmitOrderResponse,
      orderHistoryDetails: null == orderHistoryDetails
          ? _value.orderHistoryDetails
          : orderHistoryDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetails,
    ));
  }
}

/// @nodoc

class _$_OrderSummaryState extends _OrderSummaryState {
  const _$_OrderSummaryState(
      {required this.apiFailureOrSuccessOption,
      required this.isSubmitting,
      required this.isConfirming,
      required this.submitOrderResponse,
      required this.orderHistoryDetails})
      : super._();

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isSubmitting;
  @override
  final bool isConfirming;
  @override
  final SubmitOrderResponse submitOrderResponse;
  @override
  final OrderHistoryDetails orderHistoryDetails;

  @override
  String toString() {
    return 'OrderSummaryState(apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isSubmitting: $isSubmitting, isConfirming: $isConfirming, submitOrderResponse: $submitOrderResponse, orderHistoryDetails: $orderHistoryDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderSummaryState &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isConfirming, isConfirming) ||
                other.isConfirming == isConfirming) &&
            (identical(other.submitOrderResponse, submitOrderResponse) ||
                other.submitOrderResponse == submitOrderResponse) &&
            (identical(other.orderHistoryDetails, orderHistoryDetails) ||
                other.orderHistoryDetails == orderHistoryDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiFailureOrSuccessOption,
      isSubmitting, isConfirming, submitOrderResponse, orderHistoryDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderSummaryStateCopyWith<_$_OrderSummaryState> get copyWith =>
      __$$_OrderSummaryStateCopyWithImpl<_$_OrderSummaryState>(
          this, _$identity);
}

abstract class _OrderSummaryState extends OrderSummaryState {
  const factory _OrderSummaryState(
          {required final Option<Either<ApiFailure, dynamic>>
              apiFailureOrSuccessOption,
          required final bool isSubmitting,
          required final bool isConfirming,
          required final SubmitOrderResponse submitOrderResponse,
          required final OrderHistoryDetails orderHistoryDetails}) =
      _$_OrderSummaryState;
  const _OrderSummaryState._() : super._();

  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  bool get isConfirming;
  @override
  SubmitOrderResponse get submitOrderResponse;
  @override
  OrderHistoryDetails get orderHistoryDetails;
  @override
  @JsonKey(ignore: true)
  _$$_OrderSummaryStateCopyWith<_$_OrderSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
