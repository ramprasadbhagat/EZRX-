// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddToCartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(PriceAggregate cartItem) setCartItem,
    required TResult Function(int quantity, int cartZmgQtyExcludeCurrent)
        updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(PriceAggregate cartItem)? setCartItem,
    TResult? Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(PriceAggregate cartItem)? setCartItem,
    TResult Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetCartItem value) setCartItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetCartItem value)? setCartItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartEventCopyWith<$Res> {
  factory $AddToCartEventCopyWith(
          AddToCartEvent value, $Res Function(AddToCartEvent) then) =
      _$AddToCartEventCopyWithImpl<$Res, AddToCartEvent>;
}

/// @nodoc
class _$AddToCartEventCopyWithImpl<$Res, $Val extends AddToCartEvent>
    implements $AddToCartEventCopyWith<$Res> {
  _$AddToCartEventCopyWithImpl(this._value, this._then);

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
    extends _$AddToCartEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'AddToCartEvent.initialized()';
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
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(PriceAggregate cartItem) setCartItem,
    required TResult Function(int quantity, int cartZmgQtyExcludeCurrent)
        updateQuantity,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(PriceAggregate cartItem)? setCartItem,
    TResult? Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(PriceAggregate cartItem)? setCartItem,
    TResult Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
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
    required TResult Function(_SetCartItem value) setCartItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetCartItem value)? setCartItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements AddToCartEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CustomerCodeInfo customerCode,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrganisationConfigs,
      ShipToInfo shipToCode,
      MaterialNumber materialNumber,
      int cartZmgQtyExcludeCurrent,
      bool isSpecialOrderType});

  $CustomerCodeInfoCopyWith<$Res> get customerCode;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $ShipToInfoCopyWith<$Res> get shipToCode;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$AddToCartEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? salesOrganisation = null,
    Object? salesOrganisationConfigs = null,
    Object? shipToCode = null,
    Object? materialNumber = null,
    Object? cartZmgQtyExcludeCurrent = null,
    Object? isSpecialOrderType = null,
  }) {
    return _then(_$_Fetch(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToCode: null == shipToCode
          ? _value.shipToCode
          : shipToCode // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      cartZmgQtyExcludeCurrent: null == cartZmgQtyExcludeCurrent
          ? _value.cartZmgQtyExcludeCurrent
          : cartZmgQtyExcludeCurrent // ignore: cast_nullable_to_non_nullable
              as int,
      isSpecialOrderType: null == isSpecialOrderType
          ? _value.isSpecialOrderType
          : isSpecialOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCode {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCode, (value) {
      return _then(_value.copyWith(customerCode: value));
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
  $ShipToInfoCopyWith<$Res> get shipToCode {
    return $ShipToInfoCopyWith<$Res>(_value.shipToCode, (value) {
      return _then(_value.copyWith(shipToCode: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.customerCode,
      required this.salesOrganisation,
      required this.salesOrganisationConfigs,
      required this.shipToCode,
      required this.materialNumber,
      required this.cartZmgQtyExcludeCurrent,
      required this.isSpecialOrderType});

  @override
  final CustomerCodeInfo customerCode;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final ShipToInfo shipToCode;
  @override
  final MaterialNumber materialNumber;
  @override
  final int cartZmgQtyExcludeCurrent;
  @override
  final bool isSpecialOrderType;

  @override
  String toString() {
    return 'AddToCartEvent.fetch(customerCode: $customerCode, salesOrganisation: $salesOrganisation, salesOrganisationConfigs: $salesOrganisationConfigs, shipToCode: $shipToCode, materialNumber: $materialNumber, cartZmgQtyExcludeCurrent: $cartZmgQtyExcludeCurrent, isSpecialOrderType: $isSpecialOrderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.shipToCode, shipToCode) ||
                other.shipToCode == shipToCode) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(
                    other.cartZmgQtyExcludeCurrent, cartZmgQtyExcludeCurrent) ||
                other.cartZmgQtyExcludeCurrent == cartZmgQtyExcludeCurrent) &&
            (identical(other.isSpecialOrderType, isSpecialOrderType) ||
                other.isSpecialOrderType == isSpecialOrderType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerCode,
      salesOrganisation,
      salesOrganisationConfigs,
      shipToCode,
      materialNumber,
      cartZmgQtyExcludeCurrent,
      isSpecialOrderType);

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
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(PriceAggregate cartItem) setCartItem,
    required TResult Function(int quantity, int cartZmgQtyExcludeCurrent)
        updateQuantity,
  }) {
    return fetch(
        customerCode,
        salesOrganisation,
        salesOrganisationConfigs,
        shipToCode,
        materialNumber,
        cartZmgQtyExcludeCurrent,
        isSpecialOrderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(PriceAggregate cartItem)? setCartItem,
    TResult? Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
  }) {
    return fetch?.call(
        customerCode,
        salesOrganisation,
        salesOrganisationConfigs,
        shipToCode,
        materialNumber,
        cartZmgQtyExcludeCurrent,
        isSpecialOrderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(PriceAggregate cartItem)? setCartItem,
    TResult Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(
          customerCode,
          salesOrganisation,
          salesOrganisationConfigs,
          shipToCode,
          materialNumber,
          cartZmgQtyExcludeCurrent,
          isSpecialOrderType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetCartItem value) setCartItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetCartItem value)? setCartItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements AddToCartEvent {
  const factory _Fetch(
      {required final CustomerCodeInfo customerCode,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final ShipToInfo shipToCode,
      required final MaterialNumber materialNumber,
      required final int cartZmgQtyExcludeCurrent,
      required final bool isSpecialOrderType}) = _$_Fetch;

  CustomerCodeInfo get customerCode;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  ShipToInfo get shipToCode;
  MaterialNumber get materialNumber;
  int get cartZmgQtyExcludeCurrent;
  bool get isSpecialOrderType;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetCartItemCopyWith<$Res> {
  factory _$$_SetCartItemCopyWith(
          _$_SetCartItem value, $Res Function(_$_SetCartItem) then) =
      __$$_SetCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate cartItem});

  $PriceAggregateCopyWith<$Res> get cartItem;
}

/// @nodoc
class __$$_SetCartItemCopyWithImpl<$Res>
    extends _$AddToCartEventCopyWithImpl<$Res, _$_SetCartItem>
    implements _$$_SetCartItemCopyWith<$Res> {
  __$$_SetCartItemCopyWithImpl(
      _$_SetCartItem _value, $Res Function(_$_SetCartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
  }) {
    return _then(_$_SetCartItem(
      null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get cartItem {
    return $PriceAggregateCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value));
    });
  }
}

/// @nodoc

class _$_SetCartItem implements _SetCartItem {
  const _$_SetCartItem(this.cartItem);

  @override
  final PriceAggregate cartItem;

  @override
  String toString() {
    return 'AddToCartEvent.setCartItem(cartItem: $cartItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetCartItem &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetCartItemCopyWith<_$_SetCartItem> get copyWith =>
      __$$_SetCartItemCopyWithImpl<_$_SetCartItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(PriceAggregate cartItem) setCartItem,
    required TResult Function(int quantity, int cartZmgQtyExcludeCurrent)
        updateQuantity,
  }) {
    return setCartItem(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(PriceAggregate cartItem)? setCartItem,
    TResult? Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
  }) {
    return setCartItem?.call(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(PriceAggregate cartItem)? setCartItem,
    TResult Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
    required TResult orElse(),
  }) {
    if (setCartItem != null) {
      return setCartItem(cartItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetCartItem value) setCartItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return setCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetCartItem value)? setCartItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return setCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (setCartItem != null) {
      return setCartItem(this);
    }
    return orElse();
  }
}

abstract class _SetCartItem implements AddToCartEvent {
  const factory _SetCartItem(final PriceAggregate cartItem) = _$_SetCartItem;

  PriceAggregate get cartItem;
  @JsonKey(ignore: true)
  _$$_SetCartItemCopyWith<_$_SetCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateQuantityCopyWith<$Res> {
  factory _$$_UpdateQuantityCopyWith(
          _$_UpdateQuantity value, $Res Function(_$_UpdateQuantity) then) =
      __$$_UpdateQuantityCopyWithImpl<$Res>;
  @useResult
  $Res call({int quantity, int cartZmgQtyExcludeCurrent});
}

/// @nodoc
class __$$_UpdateQuantityCopyWithImpl<$Res>
    extends _$AddToCartEventCopyWithImpl<$Res, _$_UpdateQuantity>
    implements _$$_UpdateQuantityCopyWith<$Res> {
  __$$_UpdateQuantityCopyWithImpl(
      _$_UpdateQuantity _value, $Res Function(_$_UpdateQuantity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? cartZmgQtyExcludeCurrent = null,
  }) {
    return _then(_$_UpdateQuantity(
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      null == cartZmgQtyExcludeCurrent
          ? _value.cartZmgQtyExcludeCurrent
          : cartZmgQtyExcludeCurrent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UpdateQuantity implements _UpdateQuantity {
  const _$_UpdateQuantity(this.quantity, this.cartZmgQtyExcludeCurrent);

  @override
  final int quantity;
  @override
  final int cartZmgQtyExcludeCurrent;

  @override
  String toString() {
    return 'AddToCartEvent.updateQuantity(quantity: $quantity, cartZmgQtyExcludeCurrent: $cartZmgQtyExcludeCurrent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateQuantity &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(
                    other.cartZmgQtyExcludeCurrent, cartZmgQtyExcludeCurrent) ||
                other.cartZmgQtyExcludeCurrent == cartZmgQtyExcludeCurrent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, quantity, cartZmgQtyExcludeCurrent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      __$$_UpdateQuantityCopyWithImpl<_$_UpdateQuantity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(PriceAggregate cartItem) setCartItem,
    required TResult Function(int quantity, int cartZmgQtyExcludeCurrent)
        updateQuantity,
  }) {
    return updateQuantity(quantity, cartZmgQtyExcludeCurrent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(PriceAggregate cartItem)? setCartItem,
    TResult? Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
  }) {
    return updateQuantity?.call(quantity, cartZmgQtyExcludeCurrent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            MaterialNumber materialNumber,
            int cartZmgQtyExcludeCurrent,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(PriceAggregate cartItem)? setCartItem,
    TResult Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(quantity, cartZmgQtyExcludeCurrent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetCartItem value) setCartItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetCartItem value)? setCartItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements AddToCartEvent {
  const factory _UpdateQuantity(
          final int quantity, final int cartZmgQtyExcludeCurrent) =
      _$_UpdateQuantity;

  int get quantity;
  int get cartZmgQtyExcludeCurrent;
  @JsonKey(ignore: true)
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddToCartState {
  PriceAggregate get cartItem => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddToCartStateCopyWith<AddToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartStateCopyWith<$Res> {
  factory $AddToCartStateCopyWith(
          AddToCartState value, $Res Function(AddToCartState) then) =
      _$AddToCartStateCopyWithImpl<$Res, AddToCartState>;
  @useResult
  $Res call(
      {PriceAggregate cartItem,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $PriceAggregateCopyWith<$Res> get cartItem;
}

/// @nodoc
class _$AddToCartStateCopyWithImpl<$Res, $Val extends AddToCartState>
    implements $AddToCartStateCopyWith<$Res> {
  _$AddToCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
    Object? isFetching = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get cartItem {
    return $PriceAggregateCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddToCartStateCopyWith<$Res>
    implements $AddToCartStateCopyWith<$Res> {
  factory _$$_AddToCartStateCopyWith(
          _$_AddToCartState value, $Res Function(_$_AddToCartState) then) =
      __$$_AddToCartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PriceAggregate cartItem,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $PriceAggregateCopyWith<$Res> get cartItem;
}

/// @nodoc
class __$$_AddToCartStateCopyWithImpl<$Res>
    extends _$AddToCartStateCopyWithImpl<$Res, _$_AddToCartState>
    implements _$$_AddToCartStateCopyWith<$Res> {
  __$$_AddToCartStateCopyWithImpl(
      _$_AddToCartState _value, $Res Function(_$_AddToCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
    Object? isFetching = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddToCartState(
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_AddToCartState extends _AddToCartState {
  const _$_AddToCartState(
      {required this.cartItem,
      required this.isFetching,
      required this.apiFailureOrSuccessOption})
      : super._();

  @override
  final PriceAggregate cartItem;
  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddToCartState(cartItem: $cartItem, isFetching: $isFetching, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToCartState &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cartItem, isFetching, apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddToCartStateCopyWith<_$_AddToCartState> get copyWith =>
      __$$_AddToCartStateCopyWithImpl<_$_AddToCartState>(this, _$identity);
}

abstract class _AddToCartState extends AddToCartState {
  const factory _AddToCartState(
      {required final PriceAggregate cartItem,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_AddToCartState;
  const _AddToCartState._() : super._();

  @override
  PriceAggregate get cartItem;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddToCartStateCopyWith<_$_AddToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
