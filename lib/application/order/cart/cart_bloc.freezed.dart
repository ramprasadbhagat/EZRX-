// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(CartItem item) addToCart,
    required TResult Function(CartItem item) removeFromCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res> implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  final CartEvent _value;
  // ignore: unused_field
  final $Res Function(CartEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
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
    return 'CartEvent.initialized()';
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
    required TResult Function(CartItem item) addToCart,
    required TResult Function(CartItem item) removeFromCart,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
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
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CartEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
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
    return 'CartEvent.fetch()';
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
    required TResult Function(CartItem item) addToCart,
    required TResult Function(CartItem item) removeFromCart,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
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
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements CartEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
abstract class _$$_AddToCartCopyWith<$Res> {
  factory _$$_AddToCartCopyWith(
          _$_AddToCart value, $Res Function(_$_AddToCart) then) =
      __$$_AddToCartCopyWithImpl<$Res>;
  $Res call({CartItem item});

  $CartItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_AddToCartCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$$_AddToCartCopyWith<$Res> {
  __$$_AddToCartCopyWithImpl(
      _$_AddToCart _value, $Res Function(_$_AddToCart) _then)
      : super(_value, (v) => _then(v as _$_AddToCart));

  @override
  _$_AddToCart get _value => super._value as _$_AddToCart;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_AddToCart(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItem,
    ));
  }

  @override
  $CartItemCopyWith<$Res> get item {
    return $CartItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_AddToCart implements _AddToCart {
  const _$_AddToCart({required this.item});

  @override
  final CartItem item;

  @override
  String toString() {
    return 'CartEvent.addToCart(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToCart &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_AddToCartCopyWith<_$_AddToCart> get copyWith =>
      __$$_AddToCartCopyWithImpl<_$_AddToCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(CartItem item) addToCart,
    required TResult Function(CartItem item) removeFromCart,
  }) {
    return addToCart(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
  }) {
    return addToCart?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class _AddToCart implements CartEvent {
  const factory _AddToCart({required final CartItem item}) = _$_AddToCart;

  CartItem get item;
  @JsonKey(ignore: true)
  _$$_AddToCartCopyWith<_$_AddToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveFromCartCopyWith<$Res> {
  factory _$$_RemoveFromCartCopyWith(
          _$_RemoveFromCart value, $Res Function(_$_RemoveFromCart) then) =
      __$$_RemoveFromCartCopyWithImpl<$Res>;
  $Res call({CartItem item});

  $CartItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_RemoveFromCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res>
    implements _$$_RemoveFromCartCopyWith<$Res> {
  __$$_RemoveFromCartCopyWithImpl(
      _$_RemoveFromCart _value, $Res Function(_$_RemoveFromCart) _then)
      : super(_value, (v) => _then(v as _$_RemoveFromCart));

  @override
  _$_RemoveFromCart get _value => super._value as _$_RemoveFromCart;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_RemoveFromCart(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItem,
    ));
  }

  @override
  $CartItemCopyWith<$Res> get item {
    return $CartItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_RemoveFromCart implements _RemoveFromCart {
  const _$_RemoveFromCart({required this.item});

  @override
  final CartItem item;

  @override
  String toString() {
    return 'CartEvent.removeFromCart(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveFromCart &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_RemoveFromCartCopyWith<_$_RemoveFromCart> get copyWith =>
      __$$_RemoveFromCartCopyWithImpl<_$_RemoveFromCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(CartItem item) addToCart,
    required TResult Function(CartItem item) removeFromCart,
  }) {
    return removeFromCart(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
  }) {
    return removeFromCart?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(CartItem item)? addToCart,
    TResult Function(CartItem item)? removeFromCart,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
  }) {
    return removeFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
  }) {
    return removeFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(this);
    }
    return orElse();
  }
}

abstract class _RemoveFromCart implements CartEvent {
  const factory _RemoveFromCart({required final CartItem item}) =
      _$_RemoveFromCart;

  CartItem get item;
  @JsonKey(ignore: true)
  _$$_RemoveFromCartCopyWith<_$_RemoveFromCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  List<CartItem> get cartItemList => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
  $Res call(
      {List<CartItem> cartItemList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  final CartState _value;
  // ignore: unused_field
  final $Res Function(CartState) _then;

  @override
  $Res call({
    Object? cartItemList = freezed,
    Object? apiFailureOrSuccessOption = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_value.copyWith(
      cartItemList: cartItemList == freezed
          ? _value.cartItemList
          : cartItemList // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_CartStateCopyWith(
          _$_CartState value, $Res Function(_$_CartState) then) =
      __$$_CartStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CartItem> cartItemList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching});
}

/// @nodoc
class __$$_CartStateCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$$_CartStateCopyWith<$Res> {
  __$$_CartStateCopyWithImpl(
      _$_CartState _value, $Res Function(_$_CartState) _then)
      : super(_value, (v) => _then(v as _$_CartState));

  @override
  _$_CartState get _value => super._value as _$_CartState;

  @override
  $Res call({
    Object? cartItemList = freezed,
    Object? apiFailureOrSuccessOption = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_$_CartState(
      cartItemList: cartItemList == freezed
          ? _value._cartItemList
          : cartItemList // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CartState extends _CartState {
  const _$_CartState(
      {required final List<CartItem> cartItemList,
      required this.apiFailureOrSuccessOption,
      required this.isFetching})
      : _cartItemList = cartItemList,
        super._();

  final List<CartItem> _cartItemList;
  @override
  List<CartItem> get cartItemList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItemList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isFetching;

  @override
  String toString() {
    return 'CartState(cartItemList: $cartItemList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            const DeepCollectionEquality()
                .equals(other._cartItemList, _cartItemList) &&
            const DeepCollectionEquality().equals(
                other.apiFailureOrSuccessOption, apiFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItemList),
      const DeepCollectionEquality().hash(apiFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isFetching));

  @JsonKey(ignore: true)
  @override
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
      {required final List<CartItem> cartItemList,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isFetching}) = _$_CartState;
  const _CartState._() : super._();

  @override
  List<CartItem> get cartItemList;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
