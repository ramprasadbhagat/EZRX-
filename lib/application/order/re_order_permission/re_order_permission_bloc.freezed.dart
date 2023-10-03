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
    required TResult Function() initialized,
    required TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)
        fetch,
    required TResult Function(OrderNumber orderNumberWillUpsert)
        resetOrderNumberWillUpsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)?
        fetch,
    TResult? Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)?
        fetch,
    TResult Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ResetOrderNumberWillUpsert value)
        resetOrderNumberWillUpsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ReOrderPermissionEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'ReOrderPermissionEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)
        fetch,
    required TResult Function(OrderNumber orderNumberWillUpsert)
        resetOrderNumberWillUpsert,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)?
        fetch,
    TResult? Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)?
        fetch,
    TResult Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ResetOrderNumberWillUpsert value)
        resetOrderNumberWillUpsert,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisation salesOrganisation,
      OrderNumber orderNumberWillUpsert});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ReOrderPermissionEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetailsOrderItems = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? salesOrganisation = null,
    Object? orderNumberWillUpsert = null,
  }) {
    return _then(_$_Fetch(
      orderHistoryDetailsOrderItems: null == orderHistoryDetailsOrderItems
          ? _value._orderHistoryDetailsOrderItems
          : orderHistoryDetailsOrderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
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
      orderNumberWillUpsert: null == orderNumberWillUpsert
          ? _value.orderNumberWillUpsert
          : orderNumberWillUpsert // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
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
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required final List<OrderHistoryDetailsOrderItem>
          orderHistoryDetailsOrderItems,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.salesOrganisation,
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
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final OrderNumber orderNumberWillUpsert;

  @override
  String toString() {
    return 'ReOrderPermissionEvent.fetch(orderHistoryDetailsOrderItems: $orderHistoryDetailsOrderItems, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, salesOrganisation: $salesOrganisation, orderNumberWillUpsert: $orderNumberWillUpsert)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsOrderItems,
                _orderHistoryDetailsOrderItems) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.orderNumberWillUpsert, orderNumberWillUpsert) ||
                other.orderNumberWillUpsert == orderNumberWillUpsert));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orderHistoryDetailsOrderItems),
      customerCodeInfo,
      shipToInfo,
      salesOrganisation,
      orderNumberWillUpsert);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)
        fetch,
    required TResult Function(OrderNumber orderNumberWillUpsert)
        resetOrderNumberWillUpsert,
  }) {
    return fetch(orderHistoryDetailsOrderItems, customerCodeInfo, shipToInfo,
        salesOrganisation, orderNumberWillUpsert);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)?
        fetch,
    TResult? Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
  }) {
    return fetch?.call(orderHistoryDetailsOrderItems, customerCodeInfo,
        shipToInfo, salesOrganisation, orderNumberWillUpsert);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)?
        fetch,
    TResult Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(orderHistoryDetailsOrderItems, customerCodeInfo, shipToInfo,
          salesOrganisation, orderNumberWillUpsert);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ResetOrderNumberWillUpsert value)
        resetOrderNumberWillUpsert,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ReOrderPermissionEvent {
  const factory _Fetch(
      {required final List<OrderHistoryDetailsOrderItem>
          orderHistoryDetailsOrderItems,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final SalesOrganisation salesOrganisation,
      required final OrderNumber orderNumberWillUpsert}) = _$_Fetch;

  List<OrderHistoryDetailsOrderItem> get orderHistoryDetailsOrderItems;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  SalesOrganisation get salesOrganisation;
  OrderNumber get orderNumberWillUpsert;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
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
    required TResult Function() initialized,
    required TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)
        fetch,
    required TResult Function(OrderNumber orderNumberWillUpsert)
        resetOrderNumberWillUpsert,
  }) {
    return resetOrderNumberWillUpsert(orderNumberWillUpsert);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)?
        fetch,
    TResult? Function(OrderNumber orderNumberWillUpsert)?
        resetOrderNumberWillUpsert,
  }) {
    return resetOrderNumberWillUpsert?.call(orderNumberWillUpsert);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            OrderNumber orderNumberWillUpsert)?
        fetch,
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ResetOrderNumberWillUpsert value)
        resetOrderNumberWillUpsert,
  }) {
    return resetOrderNumberWillUpsert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ResetOrderNumberWillUpsert value)?
        resetOrderNumberWillUpsert,
  }) {
    return resetOrderNumberWillUpsert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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
  List<OrderHistoryDetailsOrderItem> get validOrderHistoryDetailsOrderItems =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  OrderNumber get orderNumberWillUpsert => throw _privateConstructorUsedError;

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
      {List<OrderHistoryDetailsOrderItem> validOrderHistoryDetailsOrderItems,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      OrderNumber orderNumberWillUpsert});
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
    Object? validOrderHistoryDetailsOrderItems = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? orderNumberWillUpsert = null,
  }) {
    return _then(_value.copyWith(
      validOrderHistoryDetailsOrderItems: null ==
              validOrderHistoryDetailsOrderItems
          ? _value.validOrderHistoryDetailsOrderItems
          : validOrderHistoryDetailsOrderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
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
    ) as $Val);
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
      {List<OrderHistoryDetailsOrderItem> validOrderHistoryDetailsOrderItems,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      OrderNumber orderNumberWillUpsert});
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
    Object? validOrderHistoryDetailsOrderItems = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? orderNumberWillUpsert = null,
  }) {
    return _then(_$_ReOrderPermissionState(
      validOrderHistoryDetailsOrderItems: null ==
              validOrderHistoryDetailsOrderItems
          ? _value._validOrderHistoryDetailsOrderItems
          : validOrderHistoryDetailsOrderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
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
    ));
  }
}

/// @nodoc

class _$_ReOrderPermissionState implements _ReOrderPermissionState {
  const _$_ReOrderPermissionState(
      {required final List<OrderHistoryDetailsOrderItem>
          validOrderHistoryDetailsOrderItems,
      required this.isFetching,
      required this.failureOrSuccessOption,
      required this.orderNumberWillUpsert})
      : _validOrderHistoryDetailsOrderItems =
            validOrderHistoryDetailsOrderItems;

  final List<OrderHistoryDetailsOrderItem> _validOrderHistoryDetailsOrderItems;
  @override
  List<OrderHistoryDetailsOrderItem> get validOrderHistoryDetailsOrderItems {
    if (_validOrderHistoryDetailsOrderItems is EqualUnmodifiableListView)
      return _validOrderHistoryDetailsOrderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validOrderHistoryDetailsOrderItems);
  }

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final OrderNumber orderNumberWillUpsert;

  @override
  String toString() {
    return 'ReOrderPermissionState(validOrderHistoryDetailsOrderItems: $validOrderHistoryDetailsOrderItems, isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption, orderNumberWillUpsert: $orderNumberWillUpsert)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReOrderPermissionState &&
            const DeepCollectionEquality().equals(
                other._validOrderHistoryDetailsOrderItems,
                _validOrderHistoryDetailsOrderItems) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.orderNumberWillUpsert, orderNumberWillUpsert) ||
                other.orderNumberWillUpsert == orderNumberWillUpsert));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_validOrderHistoryDetailsOrderItems),
      isFetching,
      failureOrSuccessOption,
      orderNumberWillUpsert);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReOrderPermissionStateCopyWith<_$_ReOrderPermissionState> get copyWith =>
      __$$_ReOrderPermissionStateCopyWithImpl<_$_ReOrderPermissionState>(
          this, _$identity);
}

abstract class _ReOrderPermissionState implements ReOrderPermissionState {
  const factory _ReOrderPermissionState(
      {required final List<OrderHistoryDetailsOrderItem>
          validOrderHistoryDetailsOrderItems,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final OrderNumber
          orderNumberWillUpsert}) = _$_ReOrderPermissionState;

  @override
  List<OrderHistoryDetailsOrderItem> get validOrderHistoryDetailsOrderItems;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  OrderNumber get orderNumberWillUpsert;
  @override
  @JsonKey(ignore: true)
  _$$_ReOrderPermissionStateCopyWith<_$_ReOrderPermissionState> get copyWith =>
      throw _privateConstructorUsedError;
}
