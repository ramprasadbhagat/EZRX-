// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_eligibility_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderEligibilityEvent {
  List<PriceAggregate> get cartItems => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrg => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get configs => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipInfo => throw _privateConstructorUsedError;
  String get orderType => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<PriceAggregate> cartItems,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo,
            String orderType,
            User user)
        checkMinimumOrderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<PriceAggregate> cartItems,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo,
            String orderType,
            User user)?
        checkMinimumOrderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<PriceAggregate> cartItems,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo,
            String orderType,
            User user)?
        checkMinimumOrderValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MinimumOrderValue value) checkMinimumOrderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MinimumOrderValue value)? checkMinimumOrderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MinimumOrderValue value)? checkMinimumOrderValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderEligibilityEventCopyWith<OrderEligibilityEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEligibilityEventCopyWith<$Res> {
  factory $OrderEligibilityEventCopyWith(OrderEligibilityEvent value,
          $Res Function(OrderEligibilityEvent) then) =
      _$OrderEligibilityEventCopyWithImpl<$Res, OrderEligibilityEvent>;
  @useResult
  $Res call(
      {List<PriceAggregate> cartItems,
      SalesOrganisation salesOrg,
      SalesOrganisationConfigs configs,
      double grandTotal,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipInfo,
      String orderType,
      User user});

  $SalesOrganisationCopyWith<$Res> get salesOrg;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$OrderEligibilityEventCopyWithImpl<$Res,
        $Val extends OrderEligibilityEvent>
    implements $OrderEligibilityEventCopyWith<$Res> {
  _$OrderEligibilityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? salesOrg = null,
    Object? configs = null,
    Object? grandTotal = null,
    Object? customerCodeInfo = null,
    Object? shipInfo = null,
    Object? orderType = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrg {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrg, (value) {
      return _then(_value.copyWith(salesOrg: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value) as $Val);
    });
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
  $ShipToInfoCopyWith<$Res> get shipInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipInfo, (value) {
      return _then(_value.copyWith(shipInfo: value) as $Val);
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
abstract class _$$_MinimumOrderValueCopyWith<$Res>
    implements $OrderEligibilityEventCopyWith<$Res> {
  factory _$$_MinimumOrderValueCopyWith(_$_MinimumOrderValue value,
          $Res Function(_$_MinimumOrderValue) then) =
      __$$_MinimumOrderValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PriceAggregate> cartItems,
      SalesOrganisation salesOrg,
      SalesOrganisationConfigs configs,
      double grandTotal,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipInfo,
      String orderType,
      User user});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrg;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipInfo;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_MinimumOrderValueCopyWithImpl<$Res>
    extends _$OrderEligibilityEventCopyWithImpl<$Res, _$_MinimumOrderValue>
    implements _$$_MinimumOrderValueCopyWith<$Res> {
  __$$_MinimumOrderValueCopyWithImpl(
      _$_MinimumOrderValue _value, $Res Function(_$_MinimumOrderValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? salesOrg = null,
    Object? configs = null,
    Object? grandTotal = null,
    Object? customerCodeInfo = null,
    Object? shipInfo = null,
    Object? orderType = null,
    Object? user = null,
  }) {
    return _then(_$_MinimumOrderValue(
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_MinimumOrderValue implements _MinimumOrderValue {
  const _$_MinimumOrderValue(
      {required final List<PriceAggregate> cartItems,
      required this.salesOrg,
      required this.configs,
      required this.grandTotal,
      required this.customerCodeInfo,
      required this.shipInfo,
      required this.orderType,
      required this.user})
      : _cartItems = cartItems;

  final List<PriceAggregate> _cartItems;
  @override
  List<PriceAggregate> get cartItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final SalesOrganisation salesOrg;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final double grandTotal;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipInfo;
  @override
  final String orderType;
  @override
  final User user;

  @override
  String toString() {
    return 'OrderEligibilityEvent.checkMinimumOrderValue(cartItems: $cartItems, salesOrg: $salesOrg, configs: $configs, grandTotal: $grandTotal, customerCodeInfo: $customerCodeInfo, shipInfo: $shipInfo, orderType: $orderType, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MinimumOrderValue &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipInfo, shipInfo) ||
                other.shipInfo == shipInfo) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItems),
      salesOrg,
      configs,
      grandTotal,
      customerCodeInfo,
      shipInfo,
      orderType,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MinimumOrderValueCopyWith<_$_MinimumOrderValue> get copyWith =>
      __$$_MinimumOrderValueCopyWithImpl<_$_MinimumOrderValue>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<PriceAggregate> cartItems,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo,
            String orderType,
            User user)
        checkMinimumOrderValue,
  }) {
    return checkMinimumOrderValue(cartItems, salesOrg, configs, grandTotal,
        customerCodeInfo, shipInfo, orderType, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<PriceAggregate> cartItems,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo,
            String orderType,
            User user)?
        checkMinimumOrderValue,
  }) {
    return checkMinimumOrderValue?.call(cartItems, salesOrg, configs,
        grandTotal, customerCodeInfo, shipInfo, orderType, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<PriceAggregate> cartItems,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo,
            String orderType,
            User user)?
        checkMinimumOrderValue,
    required TResult orElse(),
  }) {
    if (checkMinimumOrderValue != null) {
      return checkMinimumOrderValue(cartItems, salesOrg, configs, grandTotal,
          customerCodeInfo, shipInfo, orderType, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MinimumOrderValue value) checkMinimumOrderValue,
  }) {
    return checkMinimumOrderValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MinimumOrderValue value)? checkMinimumOrderValue,
  }) {
    return checkMinimumOrderValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MinimumOrderValue value)? checkMinimumOrderValue,
    required TResult orElse(),
  }) {
    if (checkMinimumOrderValue != null) {
      return checkMinimumOrderValue(this);
    }
    return orElse();
  }
}

abstract class _MinimumOrderValue implements OrderEligibilityEvent {
  const factory _MinimumOrderValue(
      {required final List<PriceAggregate> cartItems,
      required final SalesOrganisation salesOrg,
      required final SalesOrganisationConfigs configs,
      required final double grandTotal,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipInfo,
      required final String orderType,
      required final User user}) = _$_MinimumOrderValue;

  @override
  List<PriceAggregate> get cartItems;
  @override
  SalesOrganisation get salesOrg;
  @override
  SalesOrganisationConfigs get configs;
  @override
  double get grandTotal;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipInfo;
  @override
  String get orderType;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_MinimumOrderValueCopyWith<_$_MinimumOrderValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderEligibilityState {
  bool get eligibleForOrderSubmit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderEligibilityStateCopyWith<OrderEligibilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEligibilityStateCopyWith<$Res> {
  factory $OrderEligibilityStateCopyWith(OrderEligibilityState value,
          $Res Function(OrderEligibilityState) then) =
      _$OrderEligibilityStateCopyWithImpl<$Res, OrderEligibilityState>;
  @useResult
  $Res call({bool eligibleForOrderSubmit});
}

/// @nodoc
class _$OrderEligibilityStateCopyWithImpl<$Res,
        $Val extends OrderEligibilityState>
    implements $OrderEligibilityStateCopyWith<$Res> {
  _$OrderEligibilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eligibleForOrderSubmit = null,
  }) {
    return _then(_value.copyWith(
      eligibleForOrderSubmit: null == eligibleForOrderSubmit
          ? _value.eligibleForOrderSubmit
          : eligibleForOrderSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderEligibilityStateCopyWith<$Res>
    implements $OrderEligibilityStateCopyWith<$Res> {
  factory _$$_OrderEligibilityStateCopyWith(_$_OrderEligibilityState value,
          $Res Function(_$_OrderEligibilityState) then) =
      __$$_OrderEligibilityStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool eligibleForOrderSubmit});
}

/// @nodoc
class __$$_OrderEligibilityStateCopyWithImpl<$Res>
    extends _$OrderEligibilityStateCopyWithImpl<$Res, _$_OrderEligibilityState>
    implements _$$_OrderEligibilityStateCopyWith<$Res> {
  __$$_OrderEligibilityStateCopyWithImpl(_$_OrderEligibilityState _value,
      $Res Function(_$_OrderEligibilityState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eligibleForOrderSubmit = null,
  }) {
    return _then(_$_OrderEligibilityState(
      eligibleForOrderSubmit: null == eligibleForOrderSubmit
          ? _value.eligibleForOrderSubmit
          : eligibleForOrderSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderEligibilityState extends _OrderEligibilityState {
  const _$_OrderEligibilityState({required this.eligibleForOrderSubmit})
      : super._();

  @override
  final bool eligibleForOrderSubmit;

  @override
  String toString() {
    return 'OrderEligibilityState(eligibleForOrderSubmit: $eligibleForOrderSubmit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderEligibilityState &&
            (identical(other.eligibleForOrderSubmit, eligibleForOrderSubmit) ||
                other.eligibleForOrderSubmit == eligibleForOrderSubmit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eligibleForOrderSubmit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderEligibilityStateCopyWith<_$_OrderEligibilityState> get copyWith =>
      __$$_OrderEligibilityStateCopyWithImpl<_$_OrderEligibilityState>(
          this, _$identity);
}

abstract class _OrderEligibilityState extends OrderEligibilityState {
  const factory _OrderEligibilityState(
      {required final bool eligibleForOrderSubmit}) = _$_OrderEligibilityState;
  const _OrderEligibilityState._() : super._();

  @override
  bool get eligibleForOrderSubmit;
  @override
  @JsonKey(ignore: true)
  _$$_OrderEligibilityStateCopyWith<_$_OrderEligibilityState> get copyWith =>
      throw _privateConstructorUsedError;
}
