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
    required TResult Function(CartItem cartItem) setCartItem,
    required TResult Function(int quantity) updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
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
      _$AddToCartEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddToCartEventCopyWithImpl<$Res>
    implements $AddToCartEventCopyWith<$Res> {
  _$AddToCartEventCopyWithImpl(this._value, this._then);

  final AddToCartEvent _value;
  // ignore: unused_field
  final $Res Function(AddToCartEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$AddToCartEventCopyWithImpl<$Res>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, (v) => _then(v as _$_Initialized));

  @override
  _$_Initialized get _value => super._value as _$_Initialized;
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
    required TResult Function(CartItem cartItem) setCartItem,
    required TResult Function(int quantity) updateQuantity,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
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
class __$$_FetchCopyWithImpl<$Res> extends _$AddToCartEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;
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
    required TResult Function(CartItem cartItem) setCartItem,
    required TResult Function(int quantity) updateQuantity,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
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
  $Res call({CartItem cartItem});

  $CartItemCopyWith<$Res> get cartItem;
}

/// @nodoc
class __$$_SetCartItemCopyWithImpl<$Res>
    extends _$AddToCartEventCopyWithImpl<$Res>
    implements _$$_SetCartItemCopyWith<$Res> {
  __$$_SetCartItemCopyWithImpl(
      _$_SetCartItem _value, $Res Function(_$_SetCartItem) _then)
      : super(_value, (v) => _then(v as _$_SetCartItem));

  @override
  _$_SetCartItem get _value => super._value as _$_SetCartItem;

  @override
  $Res call({
    Object? cartItem = freezed,
  }) {
    return _then(_$_SetCartItem(
      cartItem == freezed
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as CartItem,
    ));
  }

  @override
  $CartItemCopyWith<$Res> get cartItem {
    return $CartItemCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value));
    });
  }
}

/// @nodoc

class _$_SetCartItem implements _SetCartItem {
  const _$_SetCartItem(this.cartItem);

  @override
  final CartItem cartItem;

  @override
  String toString() {
    return 'AddToCartEvent.setCartItem(cartItem: $cartItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetCartItem &&
            const DeepCollectionEquality().equals(other.cartItem, cartItem));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(cartItem));

  @JsonKey(ignore: true)
  @override
  _$$_SetCartItemCopyWith<_$_SetCartItem> get copyWith =>
      __$$_SetCartItemCopyWithImpl<_$_SetCartItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(CartItem cartItem) setCartItem,
    required TResult Function(int quantity) updateQuantity,
  }) {
    return setCartItem(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
  }) {
    return setCartItem?.call(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
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
  const factory _SetCartItem(final CartItem cartItem) = _$_SetCartItem;

  CartItem get cartItem;
  @JsonKey(ignore: true)
  _$$_SetCartItemCopyWith<_$_SetCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateQuantityCopyWith<$Res> {
  factory _$$_UpdateQuantityCopyWith(
          _$_UpdateQuantity value, $Res Function(_$_UpdateQuantity) then) =
      __$$_UpdateQuantityCopyWithImpl<$Res>;
  $Res call({int quantity});
}

/// @nodoc
class __$$_UpdateQuantityCopyWithImpl<$Res>
    extends _$AddToCartEventCopyWithImpl<$Res>
    implements _$$_UpdateQuantityCopyWith<$Res> {
  __$$_UpdateQuantityCopyWithImpl(
      _$_UpdateQuantity _value, $Res Function(_$_UpdateQuantity) _then)
      : super(_value, (v) => _then(v as _$_UpdateQuantity));

  @override
  _$_UpdateQuantity get _value => super._value as _$_UpdateQuantity;

  @override
  $Res call({
    Object? quantity = freezed,
  }) {
    return _then(_$_UpdateQuantity(
      quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UpdateQuantity implements _UpdateQuantity {
  const _$_UpdateQuantity(this.quantity);

  @override
  final int quantity;

  @override
  String toString() {
    return 'AddToCartEvent.updateQuantity(quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateQuantity &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      __$$_UpdateQuantityCopyWithImpl<_$_UpdateQuantity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(CartItem cartItem) setCartItem,
    required TResult Function(int quantity) updateQuantity,
  }) {
    return updateQuantity(quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
  }) {
    return updateQuantity?.call(quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem cartItem)? setCartItem,
    TResult Function(int quantity)? updateQuantity,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(quantity);
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetCartItem value)? setCartItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
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
  const factory _UpdateQuantity(final int quantity) = _$_UpdateQuantity;

  int get quantity;
  @JsonKey(ignore: true)
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddToCartState {
  CartItem get cartItem => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddToCartStateCopyWith<AddToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartStateCopyWith<$Res> {
  factory $AddToCartStateCopyWith(
          AddToCartState value, $Res Function(AddToCartState) then) =
      _$AddToCartStateCopyWithImpl<$Res>;
  $Res call({CartItem cartItem, int quantity});

  $CartItemCopyWith<$Res> get cartItem;
}

/// @nodoc
class _$AddToCartStateCopyWithImpl<$Res>
    implements $AddToCartStateCopyWith<$Res> {
  _$AddToCartStateCopyWithImpl(this._value, this._then);

  final AddToCartState _value;
  // ignore: unused_field
  final $Res Function(AddToCartState) _then;

  @override
  $Res call({
    Object? cartItem = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      cartItem: cartItem == freezed
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as CartItem,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $CartItemCopyWith<$Res> get cartItem {
    return $CartItemCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value));
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
  $Res call({CartItem cartItem, int quantity});

  @override
  $CartItemCopyWith<$Res> get cartItem;
}

/// @nodoc
class __$$_AddToCartStateCopyWithImpl<$Res>
    extends _$AddToCartStateCopyWithImpl<$Res>
    implements _$$_AddToCartStateCopyWith<$Res> {
  __$$_AddToCartStateCopyWithImpl(
      _$_AddToCartState _value, $Res Function(_$_AddToCartState) _then)
      : super(_value, (v) => _then(v as _$_AddToCartState));

  @override
  _$_AddToCartState get _value => super._value as _$_AddToCartState;

  @override
  $Res call({
    Object? cartItem = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_AddToCartState(
      cartItem: cartItem == freezed
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as CartItem,
      quantity: quantity == freezed
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
  final CartItem cartItem;
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
            const DeepCollectionEquality().equals(other.cartItem, cartItem) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cartItem),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_AddToCartStateCopyWith<_$_AddToCartState> get copyWith =>
      __$$_AddToCartStateCopyWithImpl<_$_AddToCartState>(this, _$identity);
}

abstract class _AddToCartState extends AddToCartState {
  const factory _AddToCartState(
      {required final CartItem cartItem,
      required final int quantity}) = _$_AddToCartState;
  const _AddToCartState._() : super._();

  @override
  CartItem get cartItem;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_AddToCartStateCopyWith<_$_AddToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
