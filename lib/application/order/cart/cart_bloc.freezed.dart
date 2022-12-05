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
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

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
    extends _$CartEventCopyWithImpl<$Res, _$_Initialized>
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
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
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
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
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
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo,
      bool doNotAllowOutOfStockMaterials});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
    Object? doNotAllowOutOfStockMaterials = null,
  }) {
    return _then(_$_Fetch(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      doNotAllowOutOfStockMaterials: null == doNotAllowOutOfStockMaterials
          ? _value.doNotAllowOutOfStockMaterials
          : doNotAllowOutOfStockMaterials // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.customerCodeInfo,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.shipToInfo,
      required this.doNotAllowOutOfStockMaterials});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;
  @override
  final bool doNotAllowOutOfStockMaterials;

  @override
  String toString() {
    return 'CartEvent.fetch(customerCodeInfo: $customerCodeInfo, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo, doNotAllowOutOfStockMaterials: $doNotAllowOutOfStockMaterials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.doNotAllowOutOfStockMaterials,
                    doNotAllowOutOfStockMaterials) ||
                other.doNotAllowOutOfStockMaterials ==
                    doNotAllowOutOfStockMaterials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerCodeInfo,
      salesOrganisationConfigs,
      salesOrganisation,
      shipToInfo,
      doNotAllowOutOfStockMaterials);

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
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return fetch(customerCodeInfo, salesOrganisationConfigs, salesOrganisation,
        shipToInfo, doNotAllowOutOfStockMaterials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return fetch?.call(customerCodeInfo, salesOrganisationConfigs,
        salesOrganisation, shipToInfo, doNotAllowOutOfStockMaterials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(customerCodeInfo, salesOrganisationConfigs,
          salesOrganisation, shipToInfo, doNotAllowOutOfStockMaterials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements CartEvent {
  const factory _Fetch(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final ShipToInfo shipToInfo,
      required final bool doNotAllowOutOfStockMaterials}) = _$_Fetch;

  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  ShipToInfo get shipToInfo;
  bool get doNotAllowOutOfStockMaterials;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddToCartCopyWith<$Res> {
  factory _$$_AddToCartCopyWith(
          _$_AddToCart value, $Res Function(_$_AddToCart) then) =
      __$$_AddToCartCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PriceAggregate item,
      bool doNotallowOutOfStockMaterial,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo});

  $PriceAggregateCopyWith<$Res> get item;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_AddToCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddToCart>
    implements _$$_AddToCartCopyWith<$Res> {
  __$$_AddToCartCopyWithImpl(
      _$_AddToCart _value, $Res Function(_$_AddToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? doNotallowOutOfStockMaterial = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_AddToCart(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      doNotallowOutOfStockMaterial: null == doNotallowOutOfStockMaterial
          ? _value.doNotallowOutOfStockMaterial
          : doNotallowOutOfStockMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$_AddToCart implements _AddToCart {
  const _$_AddToCart(
      {required this.item,
      required this.doNotallowOutOfStockMaterial,
      required this.customerCodeInfo,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.shipToInfo});

  @override
  final PriceAggregate item;
  @override
  final bool doNotallowOutOfStockMaterial;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'CartEvent.addToCart(item: $item, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial, customerCodeInfo: $customerCodeInfo, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToCart &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.doNotallowOutOfStockMaterial,
                    doNotallowOutOfStockMaterial) ||
                other.doNotallowOutOfStockMaterial ==
                    doNotallowOutOfStockMaterial) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      item,
      doNotallowOutOfStockMaterial,
      customerCodeInfo,
      salesOrganisationConfigs,
      salesOrganisation,
      shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddToCartCopyWith<_$_AddToCart> get copyWith =>
      __$$_AddToCartCopyWithImpl<_$_AddToCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return addToCart(item, doNotallowOutOfStockMaterial, customerCodeInfo,
        salesOrganisationConfigs, salesOrganisation, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return addToCart?.call(item, doNotallowOutOfStockMaterial, customerCodeInfo,
        salesOrganisationConfigs, salesOrganisation, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(item, doNotallowOutOfStockMaterial, customerCodeInfo,
          salesOrganisationConfigs, salesOrganisation, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class _AddToCart implements CartEvent {
  const factory _AddToCart(
      {required final PriceAggregate item,
      required final bool doNotallowOutOfStockMaterial,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final ShipToInfo shipToInfo}) = _$_AddToCart;

  PriceAggregate get item;
  bool get doNotallowOutOfStockMaterial;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_AddToCartCopyWith<_$_AddToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddToCartFromListCopyWith<$Res> {
  factory _$$_AddToCartFromListCopyWith(_$_AddToCartFromList value,
          $Res Function(_$_AddToCartFromList) then) =
      __$$_AddToCartFromListCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PriceAggregate> items,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo,
      bool doNotAllowOutOfStockMaterials});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_AddToCartFromListCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddToCartFromList>
    implements _$$_AddToCartFromListCopyWith<$Res> {
  __$$_AddToCartFromListCopyWithImpl(
      _$_AddToCartFromList _value, $Res Function(_$_AddToCartFromList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
    Object? doNotAllowOutOfStockMaterials = null,
  }) {
    return _then(_$_AddToCartFromList(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      doNotAllowOutOfStockMaterials: null == doNotAllowOutOfStockMaterials
          ? _value.doNotAllowOutOfStockMaterials
          : doNotAllowOutOfStockMaterials // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$_AddToCartFromList implements _AddToCartFromList {
  const _$_AddToCartFromList(
      {required final List<PriceAggregate> items,
      required this.customerCodeInfo,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.shipToInfo,
      required this.doNotAllowOutOfStockMaterials})
      : _items = items;

  final List<PriceAggregate> _items;
  @override
  List<PriceAggregate> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;
  @override
  final bool doNotAllowOutOfStockMaterials;

  @override
  String toString() {
    return 'CartEvent.addToCartFromList(items: $items, customerCodeInfo: $customerCodeInfo, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo, doNotAllowOutOfStockMaterials: $doNotAllowOutOfStockMaterials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToCartFromList &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.doNotAllowOutOfStockMaterials,
                    doNotAllowOutOfStockMaterials) ||
                other.doNotAllowOutOfStockMaterials ==
                    doNotAllowOutOfStockMaterials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      customerCodeInfo,
      salesOrganisationConfigs,
      salesOrganisation,
      shipToInfo,
      doNotAllowOutOfStockMaterials);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddToCartFromListCopyWith<_$_AddToCartFromList> get copyWith =>
      __$$_AddToCartFromListCopyWithImpl<_$_AddToCartFromList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return addToCartFromList(items, customerCodeInfo, salesOrganisationConfigs,
        salesOrganisation, shipToInfo, doNotAllowOutOfStockMaterials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return addToCartFromList?.call(
        items,
        customerCodeInfo,
        salesOrganisationConfigs,
        salesOrganisation,
        shipToInfo,
        doNotAllowOutOfStockMaterials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (addToCartFromList != null) {
      return addToCartFromList(
          items,
          customerCodeInfo,
          salesOrganisationConfigs,
          salesOrganisation,
          shipToInfo,
          doNotAllowOutOfStockMaterials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return addToCartFromList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return addToCartFromList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (addToCartFromList != null) {
      return addToCartFromList(this);
    }
    return orElse();
  }
}

abstract class _AddToCartFromList implements CartEvent {
  const factory _AddToCartFromList(
          {required final List<PriceAggregate> items,
          required final CustomerCodeInfo customerCodeInfo,
          required final SalesOrganisationConfigs salesOrganisationConfigs,
          required final SalesOrganisation salesOrganisation,
          required final ShipToInfo shipToInfo,
          required final bool doNotAllowOutOfStockMaterials}) =
      _$_AddToCartFromList;

  List<PriceAggregate> get items;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  ShipToInfo get shipToInfo;
  bool get doNotAllowOutOfStockMaterials;
  @JsonKey(ignore: true)
  _$$_AddToCartFromListCopyWith<_$_AddToCartFromList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateCartItemCopyWith<$Res> {
  factory _$$_UpdateCartItemCopyWith(
          _$_UpdateCartItem value, $Res Function(_$_UpdateCartItem) then) =
      __$$_UpdateCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PriceAggregate item,
      bool doNotallowOutOfStockMaterial,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo});

  $PriceAggregateCopyWith<$Res> get item;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_UpdateCartItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateCartItem>
    implements _$$_UpdateCartItemCopyWith<$Res> {
  __$$_UpdateCartItemCopyWithImpl(
      _$_UpdateCartItem _value, $Res Function(_$_UpdateCartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? doNotallowOutOfStockMaterial = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_UpdateCartItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      doNotallowOutOfStockMaterial: null == doNotallowOutOfStockMaterial
          ? _value.doNotallowOutOfStockMaterial
          : doNotallowOutOfStockMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$_UpdateCartItem implements _UpdateCartItem {
  const _$_UpdateCartItem(
      {required this.item,
      required this.doNotallowOutOfStockMaterial,
      required this.customerCodeInfo,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.shipToInfo});

  @override
  final PriceAggregate item;
  @override
  final bool doNotallowOutOfStockMaterial;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'CartEvent.updateCartItem(item: $item, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial, customerCodeInfo: $customerCodeInfo, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateCartItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.doNotallowOutOfStockMaterial,
                    doNotallowOutOfStockMaterial) ||
                other.doNotallowOutOfStockMaterial ==
                    doNotallowOutOfStockMaterial) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      item,
      doNotallowOutOfStockMaterial,
      customerCodeInfo,
      salesOrganisationConfigs,
      salesOrganisation,
      shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCartItemCopyWith<_$_UpdateCartItem> get copyWith =>
      __$$_UpdateCartItemCopyWithImpl<_$_UpdateCartItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return updateCartItem(item, doNotallowOutOfStockMaterial, customerCodeInfo,
        salesOrganisationConfigs, salesOrganisation, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return updateCartItem?.call(
        item,
        doNotallowOutOfStockMaterial,
        customerCodeInfo,
        salesOrganisationConfigs,
        salesOrganisation,
        shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateCartItem != null) {
      return updateCartItem(
          item,
          doNotallowOutOfStockMaterial,
          customerCodeInfo,
          salesOrganisationConfigs,
          salesOrganisation,
          shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return updateCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return updateCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateCartItem != null) {
      return updateCartItem(this);
    }
    return orElse();
  }
}

abstract class _UpdateCartItem implements CartEvent {
  const factory _UpdateCartItem(
      {required final PriceAggregate item,
      required final bool doNotallowOutOfStockMaterial,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final ShipToInfo shipToInfo}) = _$_UpdateCartItem;

  PriceAggregate get item;
  bool get doNotallowOutOfStockMaterial;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_UpdateCartItemCopyWith<_$_UpdateCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateCartCopyWith<$Res> {
  factory _$$_UpdateCartCopyWith(
          _$_UpdateCart value, $Res Function(_$_UpdateCart) then) =
      __$$_UpdateCartCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Price> item, String materialNumber});
}

/// @nodoc
class __$$_UpdateCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateCart>
    implements _$$_UpdateCartCopyWith<$Res> {
  __$$_UpdateCartCopyWithImpl(
      _$_UpdateCart _value, $Res Function(_$_UpdateCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? materialNumber = null,
  }) {
    return _then(_$_UpdateCart(
      item: null == item
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<Price>,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateCart implements _UpdateCart {
  const _$_UpdateCart(
      {required final List<Price> item, required this.materialNumber})
      : _item = item;

  final List<Price> _item;
  @override
  List<Price> get item {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item);
  }

  @override
  final String materialNumber;

  @override
  String toString() {
    return 'CartEvent.updateCart(item: $item, materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateCart &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_item), materialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCartCopyWith<_$_UpdateCart> get copyWith =>
      __$$_UpdateCartCopyWithImpl<_$_UpdateCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return updateCart(item, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return updateCart?.call(item, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateCart != null) {
      return updateCart(item, materialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return updateCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return updateCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateCart != null) {
      return updateCart(this);
    }
    return orElse();
  }
}

abstract class _UpdateCart implements CartEvent {
  const factory _UpdateCart(
      {required final List<Price> item,
      required final String materialNumber}) = _$_UpdateCart;

  List<Price> get item;
  String get materialNumber;
  @JsonKey(ignore: true)
  _$$_UpdateCartCopyWith<_$_UpdateCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateStockInfoCopyWith<$Res> {
  factory _$$_UpdateStockInfoCopyWith(
          _$_UpdateStockInfo value, $Res Function(_$_UpdateStockInfo) then) =
      __$$_UpdateStockInfoCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo});

  $UserCopyWith<$Res> get user;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_UpdateStockInfoCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateStockInfo>
    implements _$$_UpdateStockInfoCopyWith<$Res> {
  __$$_UpdateStockInfoCopyWithImpl(
      _$_UpdateStockInfo _value, $Res Function(_$_UpdateStockInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_UpdateStockInfo(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$_UpdateStockInfo implements _UpdateStockInfo {
  const _$_UpdateStockInfo(
      {required this.user,
      required this.customerCodeInfo,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.shipToInfo});

  @override
  final User user;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'CartEvent.updateStockInfo(user: $user, customerCodeInfo: $customerCodeInfo, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateStockInfo &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, customerCodeInfo,
      salesOrganisationConfigs, salesOrganisation, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateStockInfoCopyWith<_$_UpdateStockInfo> get copyWith =>
      __$$_UpdateStockInfoCopyWithImpl<_$_UpdateStockInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return updateStockInfo(user, customerCodeInfo, salesOrganisationConfigs,
        salesOrganisation, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return updateStockInfo?.call(user, customerCodeInfo,
        salesOrganisationConfigs, salesOrganisation, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateStockInfo != null) {
      return updateStockInfo(user, customerCodeInfo, salesOrganisationConfigs,
          salesOrganisation, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return updateStockInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return updateStockInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateStockInfo != null) {
      return updateStockInfo(this);
    }
    return orElse();
  }
}

abstract class _UpdateStockInfo implements CartEvent {
  const factory _UpdateStockInfo(
      {required final User user,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final ShipToInfo shipToInfo}) = _$_UpdateStockInfo;

  User get user;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_UpdateStockInfoCopyWith<_$_UpdateStockInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveFromCartCopyWith<$Res> {
  factory _$$_RemoveFromCartCopyWith(
          _$_RemoveFromCart value, $Res Function(_$_RemoveFromCart) then) =
      __$$_RemoveFromCartCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate item});

  $PriceAggregateCopyWith<$Res> get item;
}

/// @nodoc
class __$$_RemoveFromCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_RemoveFromCart>
    implements _$$_RemoveFromCartCopyWith<$Res> {
  __$$_RemoveFromCartCopyWithImpl(
      _$_RemoveFromCart _value, $Res Function(_$_RemoveFromCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_RemoveFromCart(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_RemoveFromCart implements _RemoveFromCart {
  const _$_RemoveFromCart({required this.item});

  @override
  final PriceAggregate item;

  @override
  String toString() {
    return 'CartEvent.removeFromCart(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveFromCart &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveFromCartCopyWith<_$_RemoveFromCart> get copyWith =>
      __$$_RemoveFromCartCopyWithImpl<_$_RemoveFromCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return removeFromCart(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return removeFromCart?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
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
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return removeFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return removeFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(this);
    }
    return orElse();
  }
}

abstract class _RemoveFromCart implements CartEvent {
  const factory _RemoveFromCart({required final PriceAggregate item}) =
      _$_RemoveFromCart;

  PriceAggregate get item;
  @JsonKey(ignore: true)
  _$$_RemoveFromCartCopyWith<_$_RemoveFromCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearCartCopyWith<$Res> {
  factory _$$_ClearCartCopyWith(
          _$_ClearCart value, $Res Function(_$_ClearCart) then) =
      __$$_ClearCartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_ClearCart>
    implements _$$_ClearCartCopyWith<$Res> {
  __$$_ClearCartCopyWithImpl(
      _$_ClearCart _value, $Res Function(_$_ClearCart) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearCart implements _ClearCart {
  const _$_ClearCart();

  @override
  String toString() {
    return 'CartEvent.clearCart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearCart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class _ClearCart implements CartEvent {
  const factory _ClearCart() = _$_ClearCart;
}

/// @nodoc
abstract class _$$_updateSelectedItemCopyWith<$Res> {
  factory _$$_updateSelectedItemCopyWith(_$_updateSelectedItem value,
          $Res Function(_$_updateSelectedItem) then) =
      __$$_updateSelectedItemCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate item});

  $PriceAggregateCopyWith<$Res> get item;
}

/// @nodoc
class __$$_updateSelectedItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_updateSelectedItem>
    implements _$$_updateSelectedItemCopyWith<$Res> {
  __$$_updateSelectedItemCopyWithImpl(
      _$_updateSelectedItem _value, $Res Function(_$_updateSelectedItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_updateSelectedItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_updateSelectedItem implements _updateSelectedItem {
  const _$_updateSelectedItem({required this.item});

  @override
  final PriceAggregate item;

  @override
  String toString() {
    return 'CartEvent.updateSelectedItem(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateSelectedItem &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_updateSelectedItemCopyWith<_$_updateSelectedItem> get copyWith =>
      __$$_updateSelectedItemCopyWithImpl<_$_updateSelectedItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return updateSelectedItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return updateSelectedItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateSelectedItem != null) {
      return updateSelectedItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return updateSelectedItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return updateSelectedItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateSelectedItem != null) {
      return updateSelectedItem(this);
    }
    return orElse();
  }
}

abstract class _updateSelectedItem implements CartEvent {
  const factory _updateSelectedItem({required final PriceAggregate item}) =
      _$_updateSelectedItem;

  PriceAggregate get item;
  @JsonKey(ignore: true)
  _$$_updateSelectedItemCopyWith<_$_updateSelectedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_updateSelectAllItemsCopyWith<$Res> {
  factory _$$_updateSelectAllItemsCopyWith(_$_updateSelectAllItems value,
          $Res Function(_$_updateSelectAllItems) then) =
      __$$_updateSelectAllItemsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_updateSelectAllItemsCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_updateSelectAllItems>
    implements _$$_updateSelectAllItemsCopyWith<$Res> {
  __$$_updateSelectAllItemsCopyWithImpl(_$_updateSelectAllItems _value,
      $Res Function(_$_updateSelectAllItems) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_updateSelectAllItems implements _updateSelectAllItems {
  const _$_updateSelectAllItems();

  @override
  String toString() {
    return 'CartEvent.updateSelectAllItems()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_updateSelectAllItems);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return updateSelectAllItems();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return updateSelectAllItems?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateSelectAllItems != null) {
      return updateSelectAllItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return updateSelectAllItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return updateSelectAllItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateSelectAllItems != null) {
      return updateSelectAllItems(this);
    }
    return orElse();
  }
}

abstract class _updateSelectAllItems implements CartEvent {
  const factory _updateSelectAllItems() = _$_updateSelectAllItems;
}

/// @nodoc
abstract class _$$_updateBonusItemCopyWith<$Res> {
  factory _$$_updateBonusItemCopyWith(
          _$_updateBonusItem value, $Res Function(_$_updateBonusItem) then) =
      __$$_updateBonusItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int bonusItemCount,
      PriceAggregate cartItem,
      MaterialItemBonus bonusItem,
      bool isUpdateFromCart});

  $PriceAggregateCopyWith<$Res> get cartItem;
  $MaterialItemBonusCopyWith<$Res> get bonusItem;
}

/// @nodoc
class __$$_updateBonusItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_updateBonusItem>
    implements _$$_updateBonusItemCopyWith<$Res> {
  __$$_updateBonusItemCopyWithImpl(
      _$_updateBonusItem _value, $Res Function(_$_updateBonusItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bonusItemCount = null,
    Object? cartItem = null,
    Object? bonusItem = null,
    Object? isUpdateFromCart = null,
  }) {
    return _then(_$_updateBonusItem(
      bonusItemCount: null == bonusItemCount
          ? _value.bonusItemCount
          : bonusItemCount // ignore: cast_nullable_to_non_nullable
              as int,
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      bonusItem: null == bonusItem
          ? _value.bonusItem
          : bonusItem // ignore: cast_nullable_to_non_nullable
              as MaterialItemBonus,
      isUpdateFromCart: null == isUpdateFromCart
          ? _value.isUpdateFromCart
          : isUpdateFromCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get cartItem {
    return $PriceAggregateCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialItemBonusCopyWith<$Res> get bonusItem {
    return $MaterialItemBonusCopyWith<$Res>(_value.bonusItem, (value) {
      return _then(_value.copyWith(bonusItem: value));
    });
  }
}

/// @nodoc

class _$_updateBonusItem implements _updateBonusItem {
  const _$_updateBonusItem(
      {required this.bonusItemCount,
      required this.cartItem,
      required this.bonusItem,
      required this.isUpdateFromCart});

  @override
  final int bonusItemCount;
  @override
  final PriceAggregate cartItem;
  @override
  final MaterialItemBonus bonusItem;
  @override
  final bool isUpdateFromCart;

  @override
  String toString() {
    return 'CartEvent.updateBonusItem(bonusItemCount: $bonusItemCount, cartItem: $cartItem, bonusItem: $bonusItem, isUpdateFromCart: $isUpdateFromCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateBonusItem &&
            (identical(other.bonusItemCount, bonusItemCount) ||
                other.bonusItemCount == bonusItemCount) &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem) &&
            (identical(other.bonusItem, bonusItem) ||
                other.bonusItem == bonusItem) &&
            (identical(other.isUpdateFromCart, isUpdateFromCart) ||
                other.isUpdateFromCart == isUpdateFromCart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bonusItemCount, cartItem, bonusItem, isUpdateFromCart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_updateBonusItemCopyWith<_$_updateBonusItem> get copyWith =>
      __$$_updateBonusItemCopyWithImpl<_$_updateBonusItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return updateBonusItem(
        bonusItemCount, cartItem, bonusItem, isUpdateFromCart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return updateBonusItem?.call(
        bonusItemCount, cartItem, bonusItem, isUpdateFromCart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateBonusItem != null) {
      return updateBonusItem(
          bonusItemCount, cartItem, bonusItem, isUpdateFromCart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return updateBonusItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return updateBonusItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (updateBonusItem != null) {
      return updateBonusItem(this);
    }
    return orElse();
  }
}

abstract class _updateBonusItem implements CartEvent {
  const factory _updateBonusItem(
      {required final int bonusItemCount,
      required final PriceAggregate cartItem,
      required final MaterialItemBonus bonusItem,
      required final bool isUpdateFromCart}) = _$_updateBonusItem;

  int get bonusItemCount;
  PriceAggregate get cartItem;
  MaterialItemBonus get bonusItem;
  bool get isUpdateFromCart;
  @JsonKey(ignore: true)
  _$$_updateBonusItemCopyWith<_$_updateBonusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_deleteBonusItemCopyWith<$Res> {
  factory _$$_deleteBonusItemCopyWith(
          _$_deleteBonusItem value, $Res Function(_$_deleteBonusItem) then) =
      __$$_deleteBonusItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PriceAggregate cartItem,
      MaterialItemBonus bonusItem,
      bool isUpdateFromCart});

  $PriceAggregateCopyWith<$Res> get cartItem;
  $MaterialItemBonusCopyWith<$Res> get bonusItem;
}

/// @nodoc
class __$$_deleteBonusItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_deleteBonusItem>
    implements _$$_deleteBonusItemCopyWith<$Res> {
  __$$_deleteBonusItemCopyWithImpl(
      _$_deleteBonusItem _value, $Res Function(_$_deleteBonusItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
    Object? bonusItem = null,
    Object? isUpdateFromCart = null,
  }) {
    return _then(_$_deleteBonusItem(
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      bonusItem: null == bonusItem
          ? _value.bonusItem
          : bonusItem // ignore: cast_nullable_to_non_nullable
              as MaterialItemBonus,
      isUpdateFromCart: null == isUpdateFromCart
          ? _value.isUpdateFromCart
          : isUpdateFromCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get cartItem {
    return $PriceAggregateCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialItemBonusCopyWith<$Res> get bonusItem {
    return $MaterialItemBonusCopyWith<$Res>(_value.bonusItem, (value) {
      return _then(_value.copyWith(bonusItem: value));
    });
  }
}

/// @nodoc

class _$_deleteBonusItem implements _deleteBonusItem {
  const _$_deleteBonusItem(
      {required this.cartItem,
      required this.bonusItem,
      required this.isUpdateFromCart});

  @override
  final PriceAggregate cartItem;
  @override
  final MaterialItemBonus bonusItem;
  @override
  final bool isUpdateFromCart;

  @override
  String toString() {
    return 'CartEvent.deleteBonusItem(cartItem: $cartItem, bonusItem: $bonusItem, isUpdateFromCart: $isUpdateFromCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_deleteBonusItem &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem) &&
            (identical(other.bonusItem, bonusItem) ||
                other.bonusItem == bonusItem) &&
            (identical(other.isUpdateFromCart, isUpdateFromCart) ||
                other.isUpdateFromCart == isUpdateFromCart));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cartItem, bonusItem, isUpdateFromCart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_deleteBonusItemCopyWith<_$_deleteBonusItem> get copyWith =>
      __$$_deleteBonusItemCopyWithImpl<_$_deleteBonusItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return deleteBonusItem(cartItem, bonusItem, isUpdateFromCart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return deleteBonusItem?.call(cartItem, bonusItem, isUpdateFromCart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (deleteBonusItem != null) {
      return deleteBonusItem(cartItem, bonusItem, isUpdateFromCart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return deleteBonusItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return deleteBonusItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (deleteBonusItem != null) {
      return deleteBonusItem(this);
    }
    return orElse();
  }
}

abstract class _deleteBonusItem implements CartEvent {
  const factory _deleteBonusItem(
      {required final PriceAggregate cartItem,
      required final MaterialItemBonus bonusItem,
      required final bool isUpdateFromCart}) = _$_deleteBonusItem;

  PriceAggregate get cartItem;
  MaterialItemBonus get bonusItem;
  bool get isUpdateFromCart;
  @JsonKey(ignore: true)
  _$$_deleteBonusItemCopyWith<_$_deleteBonusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemarksChangedCopyWith<$Res> {
  factory _$$_RemarksChangedCopyWith(
          _$_RemarksChanged value, $Res Function(_$_RemarksChanged) then) =
      __$$_RemarksChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String remarks});
}

/// @nodoc
class __$$_RemarksChangedCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_RemarksChanged>
    implements _$$_RemarksChangedCopyWith<$Res> {
  __$$_RemarksChangedCopyWithImpl(
      _$_RemarksChanged _value, $Res Function(_$_RemarksChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remarks = null,
  }) {
    return _then(_$_RemarksChanged(
      null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RemarksChanged implements _RemarksChanged {
  const _$_RemarksChanged(this.remarks);

  @override
  final String remarks;

  @override
  String toString() {
    return 'CartEvent.remarksChanged(remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemarksChanged &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemarksChangedCopyWith<_$_RemarksChanged> get copyWith =>
      __$$_RemarksChangedCopyWithImpl<_$_RemarksChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return remarksChanged(remarks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return remarksChanged?.call(remarks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (remarksChanged != null) {
      return remarksChanged(remarks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return remarksChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return remarksChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (remarksChanged != null) {
      return remarksChanged(this);
    }
    return orElse();
  }
}

abstract class _RemarksChanged implements CartEvent {
  const factory _RemarksChanged(final String remarks) = _$_RemarksChanged;

  String get remarks;
  @JsonKey(ignore: true)
  _$$_RemarksChangedCopyWith<_$_RemarksChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddRemarksToCartItemCopyWith<$Res> {
  factory _$$_AddRemarksToCartItemCopyWith(_$_AddRemarksToCartItem value,
          $Res Function(_$_AddRemarksToCartItem) then) =
      __$$_AddRemarksToCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate item, bool isDelete});

  $PriceAggregateCopyWith<$Res> get item;
}

/// @nodoc
class __$$_AddRemarksToCartItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddRemarksToCartItem>
    implements _$$_AddRemarksToCartItemCopyWith<$Res> {
  __$$_AddRemarksToCartItemCopyWithImpl(_$_AddRemarksToCartItem _value,
      $Res Function(_$_AddRemarksToCartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? isDelete = null,
  }) {
    return _then(_$_AddRemarksToCartItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_AddRemarksToCartItem implements _AddRemarksToCartItem {
  const _$_AddRemarksToCartItem({required this.item, required this.isDelete});

  @override
  final PriceAggregate item;
  @override
  final bool isDelete;

  @override
  String toString() {
    return 'CartEvent.addRemarksToCartItem(item: $item, isDelete: $isDelete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddRemarksToCartItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, isDelete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddRemarksToCartItemCopyWith<_$_AddRemarksToCartItem> get copyWith =>
      __$$_AddRemarksToCartItemCopyWithImpl<_$_AddRemarksToCartItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return addRemarksToCartItem(item, isDelete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return addRemarksToCartItem?.call(item, isDelete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (addRemarksToCartItem != null) {
      return addRemarksToCartItem(item, isDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return addRemarksToCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return addRemarksToCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (addRemarksToCartItem != null) {
      return addRemarksToCartItem(this);
    }
    return orElse();
  }
}

abstract class _AddRemarksToCartItem implements CartEvent {
  const factory _AddRemarksToCartItem(
      {required final PriceAggregate item,
      required final bool isDelete}) = _$_AddRemarksToCartItem;

  PriceAggregate get item;
  bool get isDelete;
  @JsonKey(ignore: true)
  _$$_AddRemarksToCartItemCopyWith<_$_AddRemarksToCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddRemarksToBonusItemCopyWith<$Res> {
  factory _$$_AddRemarksToBonusItemCopyWith(_$_AddRemarksToBonusItem value,
          $Res Function(_$_AddRemarksToBonusItem) then) =
      __$$_AddRemarksToBonusItemCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate item, MaterialInfo bonusItem, bool isDelete});

  $PriceAggregateCopyWith<$Res> get item;
  $MaterialInfoCopyWith<$Res> get bonusItem;
}

/// @nodoc
class __$$_AddRemarksToBonusItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddRemarksToBonusItem>
    implements _$$_AddRemarksToBonusItemCopyWith<$Res> {
  __$$_AddRemarksToBonusItemCopyWithImpl(_$_AddRemarksToBonusItem _value,
      $Res Function(_$_AddRemarksToBonusItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? bonusItem = null,
    Object? isDelete = null,
  }) {
    return _then(_$_AddRemarksToBonusItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      bonusItem: null == bonusItem
          ? _value.bonusItem
          : bonusItem // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get bonusItem {
    return $MaterialInfoCopyWith<$Res>(_value.bonusItem, (value) {
      return _then(_value.copyWith(bonusItem: value));
    });
  }
}

/// @nodoc

class _$_AddRemarksToBonusItem implements _AddRemarksToBonusItem {
  const _$_AddRemarksToBonusItem(
      {required this.item, required this.bonusItem, required this.isDelete});

  @override
  final PriceAggregate item;
  @override
  final MaterialInfo bonusItem;
  @override
  final bool isDelete;

  @override
  String toString() {
    return 'CartEvent.addRemarksToBonusItem(item: $item, bonusItem: $bonusItem, isDelete: $isDelete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddRemarksToBonusItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.bonusItem, bonusItem) ||
                other.bonusItem == bonusItem) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, bonusItem, isDelete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddRemarksToBonusItemCopyWith<_$_AddRemarksToBonusItem> get copyWith =>
      __$$_AddRemarksToBonusItemCopyWithImpl<_$_AddRemarksToBonusItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        addToCart,
    required TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)
        addToCartFromList,
    required TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateCartItem,
    required TResult Function(List<Price> item, String materialNumber)
        updateCart,
    required TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        updateStockInfo,
    required TResult Function(PriceAggregate item) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(PriceAggregate item) updateSelectedItem,
    required TResult Function() updateSelectAllItems,
    required TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        updateBonusItem,
    required TResult Function(PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)
        deleteBonusItem,
    required TResult Function(String remarks) remarksChanged,
    required TResult Function(PriceAggregate item, bool isDelete)
        addRemarksToCartItem,
    required TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)
        addRemarksToBonusItem,
  }) {
    return addRemarksToBonusItem(item, bonusItem, isDelete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult? Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult? Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult? Function(List<Price> item, String materialNumber)? updateCart,
    TResult? Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult? Function(PriceAggregate item)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(PriceAggregate item)? updateSelectedItem,
    TResult? Function()? updateSelectAllItems,
    TResult? Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult? Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult? Function(String remarks)? remarksChanged,
    TResult? Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult? Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
  }) {
    return addRemarksToBonusItem?.call(item, bonusItem, isDelete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        addToCart,
    TResult Function(
            List<PriceAggregate> items,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials)?
        addToCartFromList,
    TResult Function(
            PriceAggregate item,
            bool doNotallowOutOfStockMaterial,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateCartItem,
    TResult Function(List<Price> item, String materialNumber)? updateCart,
    TResult Function(
            User user,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        updateStockInfo,
    TResult Function(PriceAggregate item)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(PriceAggregate item)? updateSelectedItem,
    TResult Function()? updateSelectAllItems,
    TResult Function(int bonusItemCount, PriceAggregate cartItem,
            MaterialItemBonus bonusItem, bool isUpdateFromCart)?
        updateBonusItem,
    TResult Function(PriceAggregate cartItem, MaterialItemBonus bonusItem,
            bool isUpdateFromCart)?
        deleteBonusItem,
    TResult Function(String remarks)? remarksChanged,
    TResult Function(PriceAggregate item, bool isDelete)? addRemarksToCartItem,
    TResult Function(
            PriceAggregate item, MaterialInfo bonusItem, bool isDelete)?
        addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (addRemarksToBonusItem != null) {
      return addRemarksToBonusItem(item, bonusItem, isDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddToCartFromList value) addToCartFromList,
    required TResult Function(_UpdateCartItem value) updateCartItem,
    required TResult Function(_UpdateCart value) updateCart,
    required TResult Function(_UpdateStockInfo value) updateStockInfo,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_updateSelectedItem value) updateSelectedItem,
    required TResult Function(_updateSelectAllItems value) updateSelectAllItems,
    required TResult Function(_updateBonusItem value) updateBonusItem,
    required TResult Function(_deleteBonusItem value) deleteBonusItem,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_AddRemarksToCartItem value) addRemarksToCartItem,
    required TResult Function(_AddRemarksToBonusItem value)
        addRemarksToBonusItem,
  }) {
    return addRemarksToBonusItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddToCartFromList value)? addToCartFromList,
    TResult? Function(_UpdateCartItem value)? updateCartItem,
    TResult? Function(_UpdateCart value)? updateCart,
    TResult? Function(_UpdateStockInfo value)? updateStockInfo,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_updateSelectedItem value)? updateSelectedItem,
    TResult? Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult? Function(_updateBonusItem value)? updateBonusItem,
    TResult? Function(_deleteBonusItem value)? deleteBonusItem,
    TResult? Function(_RemarksChanged value)? remarksChanged,
    TResult? Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult? Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
  }) {
    return addRemarksToBonusItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddToCartFromList value)? addToCartFromList,
    TResult Function(_UpdateCartItem value)? updateCartItem,
    TResult Function(_UpdateCart value)? updateCart,
    TResult Function(_UpdateStockInfo value)? updateStockInfo,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_updateSelectedItem value)? updateSelectedItem,
    TResult Function(_updateSelectAllItems value)? updateSelectAllItems,
    TResult Function(_updateBonusItem value)? updateBonusItem,
    TResult Function(_deleteBonusItem value)? deleteBonusItem,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_AddRemarksToCartItem value)? addRemarksToCartItem,
    TResult Function(_AddRemarksToBonusItem value)? addRemarksToBonusItem,
    required TResult orElse(),
  }) {
    if (addRemarksToBonusItem != null) {
      return addRemarksToBonusItem(this);
    }
    return orElse();
  }
}

abstract class _AddRemarksToBonusItem implements CartEvent {
  const factory _AddRemarksToBonusItem(
      {required final PriceAggregate item,
      required final MaterialInfo bonusItem,
      required final bool isDelete}) = _$_AddRemarksToBonusItem;

  PriceAggregate get item;
  MaterialInfo get bonusItem;
  bool get isDelete;
  @JsonKey(ignore: true)
  _$$_AddRemarksToBonusItemCopyWith<_$_AddRemarksToBonusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  List<PriceAggregate> get cartItemList => throw _privateConstructorUsedError;
  List<MaterialNumber> get selectedItemsMaterialNumber =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Remarks get remarks => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isRemarksAdding => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {List<PriceAggregate> cartItemList,
      List<MaterialNumber> selectedItemsMaterialNumber,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      Remarks remarks,
      bool showErrorMessages,
      bool isRemarksAdding});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemList = null,
    Object? selectedItemsMaterialNumber = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? remarks = null,
    Object? showErrorMessages = null,
    Object? isRemarksAdding = null,
  }) {
    return _then(_value.copyWith(
      cartItemList: null == cartItemList
          ? _value.cartItemList
          : cartItemList // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      selectedItemsMaterialNumber: null == selectedItemsMaterialNumber
          ? _value.selectedItemsMaterialNumber
          : selectedItemsMaterialNumber // ignore: cast_nullable_to_non_nullable
              as List<MaterialNumber>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as Remarks,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isRemarksAdding: null == isRemarksAdding
          ? _value.isRemarksAdding
          : isRemarksAdding // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_CartStateCopyWith(
          _$_CartState value, $Res Function(_$_CartState) then) =
      __$$_CartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PriceAggregate> cartItemList,
      List<MaterialNumber> selectedItemsMaterialNumber,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      Remarks remarks,
      bool showErrorMessages,
      bool isRemarksAdding});
}

/// @nodoc
class __$$_CartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_CartState>
    implements _$$_CartStateCopyWith<$Res> {
  __$$_CartStateCopyWithImpl(
      _$_CartState _value, $Res Function(_$_CartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemList = null,
    Object? selectedItemsMaterialNumber = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? remarks = null,
    Object? showErrorMessages = null,
    Object? isRemarksAdding = null,
  }) {
    return _then(_$_CartState(
      cartItemList: null == cartItemList
          ? _value._cartItemList
          : cartItemList // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      selectedItemsMaterialNumber: null == selectedItemsMaterialNumber
          ? _value._selectedItemsMaterialNumber
          : selectedItemsMaterialNumber // ignore: cast_nullable_to_non_nullable
              as List<MaterialNumber>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as Remarks,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isRemarksAdding: null == isRemarksAdding
          ? _value.isRemarksAdding
          : isRemarksAdding // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CartState extends _CartState {
  const _$_CartState(
      {required final List<PriceAggregate> cartItemList,
      required final List<MaterialNumber> selectedItemsMaterialNumber,
      required this.apiFailureOrSuccessOption,
      required this.isFetching,
      required this.remarks,
      required this.showErrorMessages,
      required this.isRemarksAdding})
      : _cartItemList = cartItemList,
        _selectedItemsMaterialNumber = selectedItemsMaterialNumber,
        super._();

  final List<PriceAggregate> _cartItemList;
  @override
  List<PriceAggregate> get cartItemList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItemList);
  }

  final List<MaterialNumber> _selectedItemsMaterialNumber;
  @override
  List<MaterialNumber> get selectedItemsMaterialNumber {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItemsMaterialNumber);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isFetching;
  @override
  final Remarks remarks;
  @override
  final bool showErrorMessages;
  @override
  final bool isRemarksAdding;

  @override
  String toString() {
    return 'CartState(cartItemList: $cartItemList, selectedItemsMaterialNumber: $selectedItemsMaterialNumber, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isFetching: $isFetching, remarks: $remarks, showErrorMessages: $showErrorMessages, isRemarksAdding: $isRemarksAdding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            const DeepCollectionEquality()
                .equals(other._cartItemList, _cartItemList) &&
            const DeepCollectionEquality().equals(
                other._selectedItemsMaterialNumber,
                _selectedItemsMaterialNumber) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isRemarksAdding, isRemarksAdding) ||
                other.isRemarksAdding == isRemarksAdding));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItemList),
      const DeepCollectionEquality().hash(_selectedItemsMaterialNumber),
      apiFailureOrSuccessOption,
      isFetching,
      remarks,
      showErrorMessages,
      isRemarksAdding);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
      {required final List<PriceAggregate> cartItemList,
      required final List<MaterialNumber> selectedItemsMaterialNumber,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isFetching,
      required final Remarks remarks,
      required final bool showErrorMessages,
      required final bool isRemarksAdding}) = _$_CartState;
  const _CartState._() : super._();

  @override
  List<PriceAggregate> get cartItemList;
  @override
  List<MaterialNumber> get selectedItemsMaterialNumber;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  Remarks get remarks;
  @override
  bool get showErrorMessages;
  @override
  bool get isRemarksAdding;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
