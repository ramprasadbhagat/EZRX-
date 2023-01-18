// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    required TResult Function() fetch,
    required TResult Function(PriceAggregate cartItem) setCartItem,
    required TResult Function(int quantity, int cartZmgQtyExcludeCurrent)
        updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function(PriceAggregate cartItem)? setCartItem,
    TResult? Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
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
    required TResult Function() fetch,
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
    TResult? Function()? fetch,
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
    TResult Function()? fetch,
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
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$AddToCartEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'AddToCartEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(PriceAggregate cartItem) setCartItem,
    required TResult Function(int quantity, int cartZmgQtyExcludeCurrent)
        updateQuantity,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function(PriceAggregate cartItem)? setCartItem,
    TResult? Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(PriceAggregate cartItem)? setCartItem,
    TResult Function(int quantity, int cartZmgQtyExcludeCurrent)?
        updateQuantity,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
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
  const factory _Fetch() = _$_Fetch;
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
    required TResult Function() fetch,
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
    TResult? Function()? fetch,
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
    TResult Function()? fetch,
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
    required TResult Function() fetch,
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
    TResult? Function()? fetch,
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
    TResult Function()? fetch,
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
  int get quantity => throw _privateConstructorUsedError;

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
  $Res call({PriceAggregate cartItem, int quantity});

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
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({PriceAggregate cartItem, int quantity});

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
    Object? quantity = null,
  }) {
    return _then(_$_AddToCartState(
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AddToCartState extends _AddToCartState {
  const _$_AddToCartState({required this.cartItem, required this.quantity})
      : super._();

  @override
  final PriceAggregate cartItem;
  @override
  final int quantity;

  @override
  String toString() {
    return 'AddToCartState(cartItem: $cartItem, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToCartState &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItem, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddToCartStateCopyWith<_$_AddToCartState> get copyWith =>
      __$$_AddToCartStateCopyWithImpl<_$_AddToCartState>(this, _$identity);
}

abstract class _AddToCartState extends AddToCartState {
  const factory _AddToCartState(
      {required final PriceAggregate cartItem,
      required final int quantity}) = _$_AddToCartState;
  const _AddToCartState._() : super._();

  @override
  PriceAggregate get cartItem;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_AddToCartStateCopyWith<_$_AddToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
