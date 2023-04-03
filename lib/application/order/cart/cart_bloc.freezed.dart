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
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
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
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
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
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
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
      {SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      bool doNotAllowOutOfStockMaterials,
      bool comboDealEligible,
      bool isSpecialOrderType});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
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
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? doNotAllowOutOfStockMaterials = null,
    Object? comboDealEligible = null,
    Object? isSpecialOrderType = null,
  }) {
    return _then(_$_Fetch(
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      doNotAllowOutOfStockMaterials: null == doNotAllowOutOfStockMaterials
          ? _value.doNotAllowOutOfStockMaterials
          : doNotAllowOutOfStockMaterials // ignore: cast_nullable_to_non_nullable
              as bool,
      comboDealEligible: null == comboDealEligible
          ? _value.comboDealEligible
          : comboDealEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpecialOrderType: null == isSpecialOrderType
          ? _value.isSpecialOrderType
          : isSpecialOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
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
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.doNotAllowOutOfStockMaterials,
      required this.comboDealEligible,
      this.isSpecialOrderType = false});

  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final bool doNotAllowOutOfStockMaterials;
  @override
  final bool comboDealEligible;
  @override
  @JsonKey()
  final bool isSpecialOrderType;

  @override
  String toString() {
    return 'CartEvent.fetch(salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, doNotAllowOutOfStockMaterials: $doNotAllowOutOfStockMaterials, comboDealEligible: $comboDealEligible, isSpecialOrderType: $isSpecialOrderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.doNotAllowOutOfStockMaterials,
                    doNotAllowOutOfStockMaterials) ||
                other.doNotAllowOutOfStockMaterials ==
                    doNotAllowOutOfStockMaterials) &&
            (identical(other.comboDealEligible, comboDealEligible) ||
                other.comboDealEligible == comboDealEligible) &&
            (identical(other.isSpecialOrderType, isSpecialOrderType) ||
                other.isSpecialOrderType == isSpecialOrderType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisationConfigs,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      doNotAllowOutOfStockMaterials,
      comboDealEligible,
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
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return fetch(
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotAllowOutOfStockMaterials,
        comboDealEligible,
        isSpecialOrderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return fetch?.call(
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotAllowOutOfStockMaterials,
        comboDealEligible,
        isSpecialOrderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(
          salesOrganisationConfigs,
          salesOrganisation,
          customerCodeInfo,
          shipToInfo,
          doNotAllowOutOfStockMaterials,
          comboDealEligible,
          isSpecialOrderType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
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
      {required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final bool doNotAllowOutOfStockMaterials,
      required final bool comboDealEligible,
      final bool isSpecialOrderType}) = _$_Fetch;

  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  bool get doNotAllowOutOfStockMaterials;
  bool get comboDealEligible;
  bool get isSpecialOrderType;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddMaterialToCartCopyWith<$Res> {
  factory _$$_AddMaterialToCartCopyWith(_$_AddMaterialToCart value,
          $Res Function(_$_AddMaterialToCart) then) =
      __$$_AddMaterialToCartCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PriceAggregate item,
      bool overrideQty,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      bool doNotallowOutOfStockMaterial,
      bool isSpecialOrderType});

  $PriceAggregateCopyWith<$Res> get item;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_AddMaterialToCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddMaterialToCart>
    implements _$$_AddMaterialToCartCopyWith<$Res> {
  __$$_AddMaterialToCartCopyWithImpl(
      _$_AddMaterialToCart _value, $Res Function(_$_AddMaterialToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? overrideQty = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? doNotallowOutOfStockMaterial = null,
    Object? isSpecialOrderType = null,
  }) {
    return _then(_$_AddMaterialToCart(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      overrideQty: null == overrideQty
          ? _value.overrideQty
          : overrideQty // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      doNotallowOutOfStockMaterial: null == doNotallowOutOfStockMaterial
          ? _value.doNotallowOutOfStockMaterial
          : doNotallowOutOfStockMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpecialOrderType: null == isSpecialOrderType
          ? _value.isSpecialOrderType
          : isSpecialOrderType // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc

class _$_AddMaterialToCart implements _AddMaterialToCart {
  const _$_AddMaterialToCart(
      {required this.item,
      this.overrideQty = false,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.doNotallowOutOfStockMaterial,
      this.isSpecialOrderType = false});

  @override
  final PriceAggregate item;
  @override
  @JsonKey()
  final bool overrideQty;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final bool doNotallowOutOfStockMaterial;
  @override
  @JsonKey()
  final bool isSpecialOrderType;

  @override
  String toString() {
    return 'CartEvent.addMaterialToCart(item: $item, overrideQty: $overrideQty, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial, isSpecialOrderType: $isSpecialOrderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddMaterialToCart &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.overrideQty, overrideQty) ||
                other.overrideQty == overrideQty) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.doNotallowOutOfStockMaterial,
                    doNotallowOutOfStockMaterial) ||
                other.doNotallowOutOfStockMaterial ==
                    doNotallowOutOfStockMaterial) &&
            (identical(other.isSpecialOrderType, isSpecialOrderType) ||
                other.isSpecialOrderType == isSpecialOrderType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      item,
      overrideQty,
      salesOrganisationConfigs,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      doNotallowOutOfStockMaterial,
      isSpecialOrderType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddMaterialToCartCopyWith<_$_AddMaterialToCart> get copyWith =>
      __$$_AddMaterialToCartCopyWithImpl<_$_AddMaterialToCart>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return addMaterialToCart(
        item,
        overrideQty,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial,
        isSpecialOrderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return addMaterialToCart?.call(
        item,
        overrideQty,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial,
        isSpecialOrderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addMaterialToCart != null) {
      return addMaterialToCart(
          item,
          overrideQty,
          salesOrganisationConfigs,
          salesOrganisation,
          customerCodeInfo,
          shipToInfo,
          doNotallowOutOfStockMaterial,
          isSpecialOrderType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return addMaterialToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return addMaterialToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addMaterialToCart != null) {
      return addMaterialToCart(this);
    }
    return orElse();
  }
}

abstract class _AddMaterialToCart implements CartEvent {
  const factory _AddMaterialToCart(
      {required final PriceAggregate item,
      final bool overrideQty,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final bool doNotallowOutOfStockMaterial,
      final bool isSpecialOrderType}) = _$_AddMaterialToCart;

  PriceAggregate get item;
  bool get overrideQty;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  bool get doNotallowOutOfStockMaterial;
  bool get isSpecialOrderType;
  @JsonKey(ignore: true)
  _$$_AddMaterialToCartCopyWith<_$_AddMaterialToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DiscountOverrideCopyWith<$Res> {
  factory _$$_DiscountOverrideCopyWith(
          _$_DiscountOverride value, $Res Function(_$_DiscountOverride) then) =
      __$$_DiscountOverrideCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate item});

  $PriceAggregateCopyWith<$Res> get item;
}

/// @nodoc
class __$$_DiscountOverrideCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_DiscountOverride>
    implements _$$_DiscountOverrideCopyWith<$Res> {
  __$$_DiscountOverrideCopyWithImpl(
      _$_DiscountOverride _value, $Res Function(_$_DiscountOverride) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_DiscountOverride(
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

class _$_DiscountOverride implements _DiscountOverride {
  const _$_DiscountOverride({required this.item});

  @override
  final PriceAggregate item;

  @override
  String toString() {
    return 'CartEvent.discountOverride(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountOverride &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountOverrideCopyWith<_$_DiscountOverride> get copyWith =>
      __$$_DiscountOverrideCopyWithImpl<_$_DiscountOverride>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return discountOverride(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return discountOverride?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (discountOverride != null) {
      return discountOverride(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return discountOverride(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return discountOverride?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (discountOverride != null) {
      return discountOverride(this);
    }
    return orElse();
  }
}

abstract class _DiscountOverride implements CartEvent {
  const factory _DiscountOverride({required final PriceAggregate item}) =
      _$_DiscountOverride;

  PriceAggregate get item;
  @JsonKey(ignore: true)
  _$$_DiscountOverrideCopyWith<_$_DiscountOverride> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddBundleToCartCopyWith<$Res> {
  factory _$$_AddBundleToCartCopyWith(
          _$_AddBundleToCart value, $Res Function(_$_AddBundleToCart) then) =
      __$$_AddBundleToCartCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PriceAggregate> bundleItems,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      bool doNotallowOutOfStockMaterial});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_AddBundleToCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddBundleToCart>
    implements _$$_AddBundleToCartCopyWith<$Res> {
  __$$_AddBundleToCartCopyWithImpl(
      _$_AddBundleToCart _value, $Res Function(_$_AddBundleToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleItems = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? doNotallowOutOfStockMaterial = null,
  }) {
    return _then(_$_AddBundleToCart(
      bundleItems: null == bundleItems
          ? _value._bundleItems
          : bundleItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      doNotallowOutOfStockMaterial: null == doNotallowOutOfStockMaterial
          ? _value.doNotallowOutOfStockMaterial
          : doNotallowOutOfStockMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
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
}

/// @nodoc

class _$_AddBundleToCart implements _AddBundleToCart {
  const _$_AddBundleToCart(
      {required final List<PriceAggregate> bundleItems,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.doNotallowOutOfStockMaterial})
      : _bundleItems = bundleItems;

  final List<PriceAggregate> _bundleItems;
  @override
  List<PriceAggregate> get bundleItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleItems);
  }

  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final bool doNotallowOutOfStockMaterial;

  @override
  String toString() {
    return 'CartEvent.addBundleToCart(bundleItems: $bundleItems, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddBundleToCart &&
            const DeepCollectionEquality()
                .equals(other._bundleItems, _bundleItems) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.doNotallowOutOfStockMaterial,
                    doNotallowOutOfStockMaterial) ||
                other.doNotallowOutOfStockMaterial ==
                    doNotallowOutOfStockMaterial));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bundleItems),
      salesOrganisationConfigs,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      doNotallowOutOfStockMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddBundleToCartCopyWith<_$_AddBundleToCart> get copyWith =>
      __$$_AddBundleToCartCopyWithImpl<_$_AddBundleToCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return addBundleToCart(
        bundleItems,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return addBundleToCart?.call(
        bundleItems,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addBundleToCart != null) {
      return addBundleToCart(
          bundleItems,
          salesOrganisationConfigs,
          salesOrganisation,
          customerCodeInfo,
          shipToInfo,
          doNotallowOutOfStockMaterial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return addBundleToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return addBundleToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addBundleToCart != null) {
      return addBundleToCart(this);
    }
    return orElse();
  }
}

abstract class _AddBundleToCart implements CartEvent {
  const factory _AddBundleToCart(
      {required final List<PriceAggregate> bundleItems,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final bool doNotallowOutOfStockMaterial}) = _$_AddBundleToCart;

  List<PriceAggregate> get bundleItems;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  bool get doNotallowOutOfStockMaterial;
  @JsonKey(ignore: true)
  _$$_AddBundleToCartCopyWith<_$_AddBundleToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddComboDealToCartCopyWith<$Res> {
  factory _$$_AddComboDealToCartCopyWith(_$_AddComboDealToCart value,
          $Res Function(_$_AddComboDealToCart) then) =
      __$$_AddComboDealToCartCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PriceAggregate> comboDealItems,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      bool doNotallowOutOfStockMaterial,
      bool overrideQty});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_AddComboDealToCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddComboDealToCart>
    implements _$$_AddComboDealToCartCopyWith<$Res> {
  __$$_AddComboDealToCartCopyWithImpl(
      _$_AddComboDealToCart _value, $Res Function(_$_AddComboDealToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comboDealItems = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? doNotallowOutOfStockMaterial = null,
    Object? overrideQty = null,
  }) {
    return _then(_$_AddComboDealToCart(
      comboDealItems: null == comboDealItems
          ? _value._comboDealItems
          : comboDealItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      doNotallowOutOfStockMaterial: null == doNotallowOutOfStockMaterial
          ? _value.doNotallowOutOfStockMaterial
          : doNotallowOutOfStockMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      overrideQty: null == overrideQty
          ? _value.overrideQty
          : overrideQty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
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
}

/// @nodoc

class _$_AddComboDealToCart implements _AddComboDealToCart {
  const _$_AddComboDealToCart(
      {required final List<PriceAggregate> comboDealItems,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.doNotallowOutOfStockMaterial,
      this.overrideQty = false})
      : _comboDealItems = comboDealItems;

  final List<PriceAggregate> _comboDealItems;
  @override
  List<PriceAggregate> get comboDealItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comboDealItems);
  }

  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final bool doNotallowOutOfStockMaterial;
  @override
  @JsonKey()
  final bool overrideQty;

  @override
  String toString() {
    return 'CartEvent.addComboDealToCart(comboDealItems: $comboDealItems, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial, overrideQty: $overrideQty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddComboDealToCart &&
            const DeepCollectionEquality()
                .equals(other._comboDealItems, _comboDealItems) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.doNotallowOutOfStockMaterial,
                    doNotallowOutOfStockMaterial) ||
                other.doNotallowOutOfStockMaterial ==
                    doNotallowOutOfStockMaterial) &&
            (identical(other.overrideQty, overrideQty) ||
                other.overrideQty == overrideQty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_comboDealItems),
      salesOrganisationConfigs,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      doNotallowOutOfStockMaterial,
      overrideQty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddComboDealToCartCopyWith<_$_AddComboDealToCart> get copyWith =>
      __$$_AddComboDealToCartCopyWithImpl<_$_AddComboDealToCart>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return addComboDealToCart(
        comboDealItems,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial,
        overrideQty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return addComboDealToCart?.call(
        comboDealItems,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial,
        overrideQty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addComboDealToCart != null) {
      return addComboDealToCart(
          comboDealItems,
          salesOrganisationConfigs,
          salesOrganisation,
          customerCodeInfo,
          shipToInfo,
          doNotallowOutOfStockMaterial,
          overrideQty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return addComboDealToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return addComboDealToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addComboDealToCart != null) {
      return addComboDealToCart(this);
    }
    return orElse();
  }
}

abstract class _AddComboDealToCart implements CartEvent {
  const factory _AddComboDealToCart(
      {required final List<PriceAggregate> comboDealItems,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final bool doNotallowOutOfStockMaterial,
      final bool overrideQty}) = _$_AddComboDealToCart;

  List<PriceAggregate> get comboDealItems;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  bool get doNotallowOutOfStockMaterial;
  bool get overrideQty;
  @JsonKey(ignore: true)
  _$$_AddComboDealToCartCopyWith<_$_AddComboDealToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateMaterialQtyInCartItemCopyWith<$Res> {
  factory _$$_UpdateMaterialQtyInCartItemCopyWith(
          _$_UpdateMaterialQtyInCartItem value,
          $Res Function(_$_UpdateMaterialQtyInCartItem) then) =
      __$$_UpdateMaterialQtyInCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CartItem currentItem,
      PriceAggregate updatedQtyItem,
      bool overrideQty,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      bool doNotallowOutOfStockMaterial});

  $CartItemCopyWith<$Res> get currentItem;
  $PriceAggregateCopyWith<$Res> get updatedQtyItem;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_UpdateMaterialQtyInCartItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateMaterialQtyInCartItem>
    implements _$$_UpdateMaterialQtyInCartItemCopyWith<$Res> {
  __$$_UpdateMaterialQtyInCartItemCopyWithImpl(
      _$_UpdateMaterialQtyInCartItem _value,
      $Res Function(_$_UpdateMaterialQtyInCartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentItem = null,
    Object? updatedQtyItem = null,
    Object? overrideQty = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? doNotallowOutOfStockMaterial = null,
  }) {
    return _then(_$_UpdateMaterialQtyInCartItem(
      currentItem: null == currentItem
          ? _value.currentItem
          : currentItem // ignore: cast_nullable_to_non_nullable
              as CartItem,
      updatedQtyItem: null == updatedQtyItem
          ? _value.updatedQtyItem
          : updatedQtyItem // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      overrideQty: null == overrideQty
          ? _value.overrideQty
          : overrideQty // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      doNotallowOutOfStockMaterial: null == doNotallowOutOfStockMaterial
          ? _value.doNotallowOutOfStockMaterial
          : doNotallowOutOfStockMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get currentItem {
    return $CartItemCopyWith<$Res>(_value.currentItem, (value) {
      return _then(_value.copyWith(currentItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get updatedQtyItem {
    return $PriceAggregateCopyWith<$Res>(_value.updatedQtyItem, (value) {
      return _then(_value.copyWith(updatedQtyItem: value));
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
}

/// @nodoc

class _$_UpdateMaterialQtyInCartItem implements _UpdateMaterialQtyInCartItem {
  const _$_UpdateMaterialQtyInCartItem(
      {required this.currentItem,
      required this.updatedQtyItem,
      this.overrideQty = true,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.doNotallowOutOfStockMaterial});

  @override
  final CartItem currentItem;
  @override
  final PriceAggregate updatedQtyItem;
  @override
  @JsonKey()
  final bool overrideQty;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final bool doNotallowOutOfStockMaterial;

  @override
  String toString() {
    return 'CartEvent.updateMaterialQtyInCartItem(currentItem: $currentItem, updatedQtyItem: $updatedQtyItem, overrideQty: $overrideQty, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateMaterialQtyInCartItem &&
            (identical(other.currentItem, currentItem) ||
                other.currentItem == currentItem) &&
            (identical(other.updatedQtyItem, updatedQtyItem) ||
                other.updatedQtyItem == updatedQtyItem) &&
            (identical(other.overrideQty, overrideQty) ||
                other.overrideQty == overrideQty) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.doNotallowOutOfStockMaterial,
                    doNotallowOutOfStockMaterial) ||
                other.doNotallowOutOfStockMaterial ==
                    doNotallowOutOfStockMaterial));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentItem,
      updatedQtyItem,
      overrideQty,
      salesOrganisationConfigs,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      doNotallowOutOfStockMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateMaterialQtyInCartItemCopyWith<_$_UpdateMaterialQtyInCartItem>
      get copyWith => __$$_UpdateMaterialQtyInCartItemCopyWithImpl<
          _$_UpdateMaterialQtyInCartItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return updateMaterialQtyInCartItem(
        currentItem,
        updatedQtyItem,
        overrideQty,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return updateMaterialQtyInCartItem?.call(
        currentItem,
        updatedQtyItem,
        overrideQty,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (updateMaterialQtyInCartItem != null) {
      return updateMaterialQtyInCartItem(
          currentItem,
          updatedQtyItem,
          overrideQty,
          salesOrganisationConfigs,
          salesOrganisation,
          customerCodeInfo,
          shipToInfo,
          doNotallowOutOfStockMaterial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return updateMaterialQtyInCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return updateMaterialQtyInCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (updateMaterialQtyInCartItem != null) {
      return updateMaterialQtyInCartItem(this);
    }
    return orElse();
  }
}

abstract class _UpdateMaterialQtyInCartItem implements CartEvent {
  const factory _UpdateMaterialQtyInCartItem(
          {required final CartItem currentItem,
          required final PriceAggregate updatedQtyItem,
          final bool overrideQty,
          required final SalesOrganisationConfigs salesOrganisationConfigs,
          required final SalesOrganisation salesOrganisation,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipToInfo,
          required final bool doNotallowOutOfStockMaterial}) =
      _$_UpdateMaterialQtyInCartItem;

  CartItem get currentItem;
  PriceAggregate get updatedQtyItem;
  bool get overrideQty;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  bool get doNotallowOutOfStockMaterial;
  @JsonKey(ignore: true)
  _$$_UpdateMaterialQtyInCartItemCopyWith<_$_UpdateMaterialQtyInCartItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyMaterialDealBonusCopyWith<$Res> {
  factory _$$_VerifyMaterialDealBonusCopyWith(_$_VerifyMaterialDealBonus value,
          $Res Function(_$_VerifyMaterialDealBonus) then) =
      __$$_VerifyMaterialDealBonusCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PriceAggregate item,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo});

  $PriceAggregateCopyWith<$Res> get item;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_VerifyMaterialDealBonusCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_VerifyMaterialDealBonus>
    implements _$$_VerifyMaterialDealBonusCopyWith<$Res> {
  __$$_VerifyMaterialDealBonusCopyWithImpl(_$_VerifyMaterialDealBonus _value,
      $Res Function(_$_VerifyMaterialDealBonus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_VerifyMaterialDealBonus(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
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
}

/// @nodoc

class _$_VerifyMaterialDealBonus implements _VerifyMaterialDealBonus {
  const _$_VerifyMaterialDealBonus(
      {required this.item,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo});

  @override
  final PriceAggregate item;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'CartEvent.verifyMaterialDealBonus(item: $item, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyMaterialDealBonus &&
            (identical(other.item, item) || other.item == item) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, salesOrganisationConfigs,
      salesOrganisation, customerCodeInfo, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyMaterialDealBonusCopyWith<_$_VerifyMaterialDealBonus>
      get copyWith =>
          __$$_VerifyMaterialDealBonusCopyWithImpl<_$_VerifyMaterialDealBonus>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return verifyMaterialDealBonus(item, salesOrganisationConfigs,
        salesOrganisation, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return verifyMaterialDealBonus?.call(item, salesOrganisationConfigs,
        salesOrganisation, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (verifyMaterialDealBonus != null) {
      return verifyMaterialDealBonus(item, salesOrganisationConfigs,
          salesOrganisation, customerCodeInfo, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return verifyMaterialDealBonus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return verifyMaterialDealBonus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (verifyMaterialDealBonus != null) {
      return verifyMaterialDealBonus(this);
    }
    return orElse();
  }
}

abstract class _VerifyMaterialDealBonus implements CartEvent {
  const factory _VerifyMaterialDealBonus(
      {required final PriceAggregate item,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo}) = _$_VerifyMaterialDealBonus;

  PriceAggregate get item;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_VerifyMaterialDealBonusCopyWith<_$_VerifyMaterialDealBonus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveFromCartCopyWith<$Res> {
  factory _$$_RemoveFromCartCopyWith(
          _$_RemoveFromCart value, $Res Function(_$_RemoveFromCart) then) =
      __$$_RemoveFromCartCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItem item});

  $CartItemCopyWith<$Res> get item;
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
              as CartItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
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
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return removeFromCart(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return removeFromCart?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
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
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return removeFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return removeFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
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
abstract class _$$_AddRemarkToCartItemCopyWith<$Res> {
  factory _$$_AddRemarkToCartItemCopyWith(_$_AddRemarkToCartItem value,
          $Res Function(_$_AddRemarkToCartItem) then) =
      __$$_AddRemarkToCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItem item, String message});

  $CartItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_AddRemarkToCartItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddRemarkToCartItem>
    implements _$$_AddRemarkToCartItemCopyWith<$Res> {
  __$$_AddRemarkToCartItemCopyWithImpl(_$_AddRemarkToCartItem _value,
      $Res Function(_$_AddRemarkToCartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? message = null,
  }) {
    return _then(_$_AddRemarkToCartItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItem,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get item {
    return $CartItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_AddRemarkToCartItem implements _AddRemarkToCartItem {
  const _$_AddRemarkToCartItem({required this.item, required this.message});

  @override
  final CartItem item;
  @override
  final String message;

  @override
  String toString() {
    return 'CartEvent.addRemarkToCartItem(item: $item, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddRemarkToCartItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddRemarkToCartItemCopyWith<_$_AddRemarkToCartItem> get copyWith =>
      __$$_AddRemarkToCartItemCopyWithImpl<_$_AddRemarkToCartItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return addRemarkToCartItem(item, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return addRemarkToCartItem?.call(item, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addRemarkToCartItem != null) {
      return addRemarkToCartItem(item, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return addRemarkToCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return addRemarkToCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addRemarkToCartItem != null) {
      return addRemarkToCartItem(this);
    }
    return orElse();
  }
}

abstract class _AddRemarkToCartItem implements CartEvent {
  const factory _AddRemarkToCartItem(
      {required final CartItem item,
      required final String message}) = _$_AddRemarkToCartItem;

  CartItem get item;
  String get message;
  @JsonKey(ignore: true)
  _$$_AddRemarkToCartItemCopyWith<_$_AddRemarkToCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddBonusToCartItemCopyWith<$Res> {
  factory _$$_AddBonusToCartItemCopyWith(_$_AddBonusToCartItem value,
          $Res Function(_$_AddBonusToCartItem) then) =
      __$$_AddBonusToCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CartItem item,
      MaterialItemBonus bonusItem,
      bool overrideQty,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      bool doNotallowOutOfStockMaterial});

  $CartItemCopyWith<$Res> get item;
  $MaterialItemBonusCopyWith<$Res> get bonusItem;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_AddBonusToCartItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddBonusToCartItem>
    implements _$$_AddBonusToCartItemCopyWith<$Res> {
  __$$_AddBonusToCartItemCopyWithImpl(
      _$_AddBonusToCartItem _value, $Res Function(_$_AddBonusToCartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? bonusItem = null,
    Object? overrideQty = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? doNotallowOutOfStockMaterial = null,
  }) {
    return _then(_$_AddBonusToCartItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItem,
      bonusItem: null == bonusItem
          ? _value.bonusItem
          : bonusItem // ignore: cast_nullable_to_non_nullable
              as MaterialItemBonus,
      overrideQty: null == overrideQty
          ? _value.overrideQty
          : overrideQty // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      doNotallowOutOfStockMaterial: null == doNotallowOutOfStockMaterial
          ? _value.doNotallowOutOfStockMaterial
          : doNotallowOutOfStockMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get item {
    return $CartItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialItemBonusCopyWith<$Res> get bonusItem {
    return $MaterialItemBonusCopyWith<$Res>(_value.bonusItem, (value) {
      return _then(_value.copyWith(bonusItem: value));
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
}

/// @nodoc

class _$_AddBonusToCartItem implements _AddBonusToCartItem {
  const _$_AddBonusToCartItem(
      {required this.item,
      required this.bonusItem,
      this.overrideQty = false,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.doNotallowOutOfStockMaterial});

  @override
  final CartItem item;
  @override
  final MaterialItemBonus bonusItem;
  @override
  @JsonKey()
  final bool overrideQty;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final bool doNotallowOutOfStockMaterial;

  @override
  String toString() {
    return 'CartEvent.addBonusToCartItem(item: $item, bonusItem: $bonusItem, overrideQty: $overrideQty, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddBonusToCartItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.bonusItem, bonusItem) ||
                other.bonusItem == bonusItem) &&
            (identical(other.overrideQty, overrideQty) ||
                other.overrideQty == overrideQty) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.doNotallowOutOfStockMaterial,
                    doNotallowOutOfStockMaterial) ||
                other.doNotallowOutOfStockMaterial ==
                    doNotallowOutOfStockMaterial));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      item,
      bonusItem,
      overrideQty,
      salesOrganisationConfigs,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      doNotallowOutOfStockMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddBonusToCartItemCopyWith<_$_AddBonusToCartItem> get copyWith =>
      __$$_AddBonusToCartItemCopyWithImpl<_$_AddBonusToCartItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return addBonusToCartItem(
        item,
        bonusItem,
        overrideQty,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return addBonusToCartItem?.call(
        item,
        bonusItem,
        overrideQty,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addBonusToCartItem != null) {
      return addBonusToCartItem(
          item,
          bonusItem,
          overrideQty,
          salesOrganisationConfigs,
          salesOrganisation,
          customerCodeInfo,
          shipToInfo,
          doNotallowOutOfStockMaterial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return addBonusToCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return addBonusToCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addBonusToCartItem != null) {
      return addBonusToCartItem(this);
    }
    return orElse();
  }
}

abstract class _AddBonusToCartItem implements CartEvent {
  const factory _AddBonusToCartItem(
          {required final CartItem item,
          required final MaterialItemBonus bonusItem,
          final bool overrideQty,
          required final SalesOrganisationConfigs salesOrganisationConfigs,
          required final SalesOrganisation salesOrganisation,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipToInfo,
          required final bool doNotallowOutOfStockMaterial}) =
      _$_AddBonusToCartItem;

  CartItem get item;
  MaterialItemBonus get bonusItem;
  bool get overrideQty;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  bool get doNotallowOutOfStockMaterial;
  @JsonKey(ignore: true)
  _$$_AddBonusToCartItemCopyWith<_$_AddBonusToCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveBonusFromCartItemCopyWith<$Res> {
  factory _$$_RemoveBonusFromCartItemCopyWith(_$_RemoveBonusFromCartItem value,
          $Res Function(_$_RemoveBonusFromCartItem) then) =
      __$$_RemoveBonusFromCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItem item, MaterialItemBonus bonusItem});

  $CartItemCopyWith<$Res> get item;
  $MaterialItemBonusCopyWith<$Res> get bonusItem;
}

/// @nodoc
class __$$_RemoveBonusFromCartItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_RemoveBonusFromCartItem>
    implements _$$_RemoveBonusFromCartItemCopyWith<$Res> {
  __$$_RemoveBonusFromCartItemCopyWithImpl(_$_RemoveBonusFromCartItem _value,
      $Res Function(_$_RemoveBonusFromCartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? bonusItem = null,
  }) {
    return _then(_$_RemoveBonusFromCartItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItem,
      bonusItem: null == bonusItem
          ? _value.bonusItem
          : bonusItem // ignore: cast_nullable_to_non_nullable
              as MaterialItemBonus,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get item {
    return $CartItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
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

class _$_RemoveBonusFromCartItem implements _RemoveBonusFromCartItem {
  const _$_RemoveBonusFromCartItem(
      {required this.item, required this.bonusItem});

  @override
  final CartItem item;
  @override
  final MaterialItemBonus bonusItem;

  @override
  String toString() {
    return 'CartEvent.removeBonusFromCartItem(item: $item, bonusItem: $bonusItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveBonusFromCartItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.bonusItem, bonusItem) ||
                other.bonusItem == bonusItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, bonusItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveBonusFromCartItemCopyWith<_$_RemoveBonusFromCartItem>
      get copyWith =>
          __$$_RemoveBonusFromCartItemCopyWithImpl<_$_RemoveBonusFromCartItem>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return removeBonusFromCartItem(item, bonusItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return removeBonusFromCartItem?.call(item, bonusItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (removeBonusFromCartItem != null) {
      return removeBonusFromCartItem(item, bonusItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return removeBonusFromCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return removeBonusFromCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (removeBonusFromCartItem != null) {
      return removeBonusFromCartItem(this);
    }
    return orElse();
  }
}

abstract class _RemoveBonusFromCartItem implements CartEvent {
  const factory _RemoveBonusFromCartItem(
      {required final CartItem item,
      required final MaterialItemBonus bonusItem}) = _$_RemoveBonusFromCartItem;

  CartItem get item;
  MaterialItemBonus get bonusItem;
  @JsonKey(ignore: true)
  _$$_RemoveBonusFromCartItemCopyWith<_$_RemoveBonusFromCartItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddRemarkToBonusItemCopyWith<$Res> {
  factory _$$_AddRemarkToBonusItemCopyWith(_$_AddRemarkToBonusItem value,
          $Res Function(_$_AddRemarkToBonusItem) then) =
      __$$_AddRemarkToBonusItemCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItem item, MaterialItemBonus bonusItem, String message});

  $CartItemCopyWith<$Res> get item;
  $MaterialItemBonusCopyWith<$Res> get bonusItem;
}

/// @nodoc
class __$$_AddRemarkToBonusItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddRemarkToBonusItem>
    implements _$$_AddRemarkToBonusItemCopyWith<$Res> {
  __$$_AddRemarkToBonusItemCopyWithImpl(_$_AddRemarkToBonusItem _value,
      $Res Function(_$_AddRemarkToBonusItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? bonusItem = null,
    Object? message = null,
  }) {
    return _then(_$_AddRemarkToBonusItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItem,
      bonusItem: null == bonusItem
          ? _value.bonusItem
          : bonusItem // ignore: cast_nullable_to_non_nullable
              as MaterialItemBonus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get item {
    return $CartItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
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

class _$_AddRemarkToBonusItem implements _AddRemarkToBonusItem {
  const _$_AddRemarkToBonusItem(
      {required this.item, required this.bonusItem, required this.message});

  @override
  final CartItem item;
  @override
  final MaterialItemBonus bonusItem;
  @override
  final String message;

  @override
  String toString() {
    return 'CartEvent.addRemarkToBonusItem(item: $item, bonusItem: $bonusItem, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddRemarkToBonusItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.bonusItem, bonusItem) ||
                other.bonusItem == bonusItem) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, bonusItem, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddRemarkToBonusItemCopyWith<_$_AddRemarkToBonusItem> get copyWith =>
      __$$_AddRemarkToBonusItemCopyWithImpl<_$_AddRemarkToBonusItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return addRemarkToBonusItem(item, bonusItem, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return addRemarkToBonusItem?.call(item, bonusItem, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addRemarkToBonusItem != null) {
      return addRemarkToBonusItem(item, bonusItem, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return addRemarkToBonusItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return addRemarkToBonusItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (addRemarkToBonusItem != null) {
      return addRemarkToBonusItem(this);
    }
    return orElse();
  }
}

abstract class _AddRemarkToBonusItem implements CartEvent {
  const factory _AddRemarkToBonusItem(
      {required final CartItem item,
      required final MaterialItemBonus bonusItem,
      required final String message}) = _$_AddRemarkToBonusItem;

  CartItem get item;
  MaterialItemBonus get bonusItem;
  String get message;
  @JsonKey(ignore: true)
  _$$_AddRemarkToBonusItemCopyWith<_$_AddRemarkToBonusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OverrideCartItemPriceCopyWith<$Res> {
  factory _$$_OverrideCartItemPriceCopyWith(_$_OverrideCartItemPrice value,
          $Res Function(_$_OverrideCartItemPrice) then) =
      __$$_OverrideCartItemPriceCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Price> overridenPrice, CartItem cartItem});

  $CartItemCopyWith<$Res> get cartItem;
}

/// @nodoc
class __$$_OverrideCartItemPriceCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_OverrideCartItemPrice>
    implements _$$_OverrideCartItemPriceCopyWith<$Res> {
  __$$_OverrideCartItemPriceCopyWithImpl(_$_OverrideCartItemPrice _value,
      $Res Function(_$_OverrideCartItemPrice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overridenPrice = null,
    Object? cartItem = null,
  }) {
    return _then(_$_OverrideCartItemPrice(
      overridenPrice: null == overridenPrice
          ? _value._overridenPrice
          : overridenPrice // ignore: cast_nullable_to_non_nullable
              as List<Price>,
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as CartItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get cartItem {
    return $CartItemCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value));
    });
  }
}

/// @nodoc

class _$_OverrideCartItemPrice implements _OverrideCartItemPrice {
  const _$_OverrideCartItemPrice(
      {required final List<Price> overridenPrice, required this.cartItem})
      : _overridenPrice = overridenPrice;

  final List<Price> _overridenPrice;
  @override
  List<Price> get overridenPrice {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overridenPrice);
  }

  @override
  final CartItem cartItem;

  @override
  String toString() {
    return 'CartEvent.overrideCartItemPrice(overridenPrice: $overridenPrice, cartItem: $cartItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OverrideCartItemPrice &&
            const DeepCollectionEquality()
                .equals(other._overridenPrice, _overridenPrice) &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_overridenPrice), cartItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OverrideCartItemPriceCopyWith<_$_OverrideCartItemPrice> get copyWith =>
      __$$_OverrideCartItemPriceCopyWithImpl<_$_OverrideCartItemPrice>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return overrideCartItemPrice(overridenPrice, cartItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return overrideCartItemPrice?.call(overridenPrice, cartItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (overrideCartItemPrice != null) {
      return overrideCartItemPrice(overridenPrice, cartItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return overrideCartItemPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return overrideCartItemPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (overrideCartItemPrice != null) {
      return overrideCartItemPrice(this);
    }
    return orElse();
  }
}

abstract class _OverrideCartItemPrice implements CartEvent {
  const factory _OverrideCartItemPrice(
      {required final List<Price> overridenPrice,
      required final CartItem cartItem}) = _$_OverrideCartItemPrice;

  List<Price> get overridenPrice;
  CartItem get cartItem;
  @JsonKey(ignore: true)
  _$$_OverrideCartItemPriceCopyWith<_$_OverrideCartItemPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectButtonTappedCopyWith<$Res> {
  factory _$$_SelectButtonTappedCopyWith(_$_SelectButtonTapped value,
          $Res Function(_$_SelectButtonTapped) then) =
      __$$_SelectButtonTappedCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItem cartItem});

  $CartItemCopyWith<$Res> get cartItem;
}

/// @nodoc
class __$$_SelectButtonTappedCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_SelectButtonTapped>
    implements _$$_SelectButtonTappedCopyWith<$Res> {
  __$$_SelectButtonTappedCopyWithImpl(
      _$_SelectButtonTapped _value, $Res Function(_$_SelectButtonTapped) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
  }) {
    return _then(_$_SelectButtonTapped(
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as CartItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get cartItem {
    return $CartItemCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value));
    });
  }
}

/// @nodoc

class _$_SelectButtonTapped implements _SelectButtonTapped {
  const _$_SelectButtonTapped({required this.cartItem});

  @override
  final CartItem cartItem;

  @override
  String toString() {
    return 'CartEvent.selectButtonTapped(cartItem: $cartItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectButtonTapped &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectButtonTappedCopyWith<_$_SelectButtonTapped> get copyWith =>
      __$$_SelectButtonTappedCopyWithImpl<_$_SelectButtonTapped>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return selectButtonTapped(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return selectButtonTapped?.call(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (selectButtonTapped != null) {
      return selectButtonTapped(cartItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return selectButtonTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return selectButtonTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (selectButtonTapped != null) {
      return selectButtonTapped(this);
    }
    return orElse();
  }
}

abstract class _SelectButtonTapped implements CartEvent {
  const factory _SelectButtonTapped({required final CartItem cartItem}) =
      _$_SelectButtonTapped;

  CartItem get cartItem;
  @JsonKey(ignore: true)
  _$$_SelectButtonTappedCopyWith<_$_SelectButtonTapped> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectAllButtonTappedCopyWith<$Res> {
  factory _$$_SelectAllButtonTappedCopyWith(_$_SelectAllButtonTapped value,
          $Res Function(_$_SelectAllButtonTapped) then) =
      __$$_SelectAllButtonTappedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SelectAllButtonTappedCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_SelectAllButtonTapped>
    implements _$$_SelectAllButtonTappedCopyWith<$Res> {
  __$$_SelectAllButtonTappedCopyWithImpl(_$_SelectAllButtonTapped _value,
      $Res Function(_$_SelectAllButtonTapped) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SelectAllButtonTapped implements _SelectAllButtonTapped {
  const _$_SelectAllButtonTapped();

  @override
  String toString() {
    return 'CartEvent.selectAllButtonTapped()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SelectAllButtonTapped);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return selectAllButtonTapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return selectAllButtonTapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (selectAllButtonTapped != null) {
      return selectAllButtonTapped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return selectAllButtonTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return selectAllButtonTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (selectAllButtonTapped != null) {
      return selectAllButtonTapped(this);
    }
    return orElse();
  }
}

abstract class _SelectAllButtonTapped implements CartEvent {
  const factory _SelectAllButtonTapped() = _$_SelectAllButtonTapped;
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
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
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
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
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
abstract class _$$_ClearSelectedItemsFromCartCopyWith<$Res> {
  factory _$$_ClearSelectedItemsFromCartCopyWith(
          _$_ClearSelectedItemsFromCart value,
          $Res Function(_$_ClearSelectedItemsFromCart) then) =
      __$$_ClearSelectedItemsFromCartCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> selectedItemIds});
}

/// @nodoc
class __$$_ClearSelectedItemsFromCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_ClearSelectedItemsFromCart>
    implements _$$_ClearSelectedItemsFromCartCopyWith<$Res> {
  __$$_ClearSelectedItemsFromCartCopyWithImpl(
      _$_ClearSelectedItemsFromCart _value,
      $Res Function(_$_ClearSelectedItemsFromCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItemIds = null,
  }) {
    return _then(_$_ClearSelectedItemsFromCart(
      selectedItemIds: null == selectedItemIds
          ? _value._selectedItemIds
          : selectedItemIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_ClearSelectedItemsFromCart implements _ClearSelectedItemsFromCart {
  const _$_ClearSelectedItemsFromCart(
      {required final List<String> selectedItemIds})
      : _selectedItemIds = selectedItemIds;

  final List<String> _selectedItemIds;
  @override
  List<String> get selectedItemIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItemIds);
  }

  @override
  String toString() {
    return 'CartEvent.clearSelectedItemsFromCart(selectedItemIds: $selectedItemIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClearSelectedItemsFromCart &&
            const DeepCollectionEquality()
                .equals(other._selectedItemIds, _selectedItemIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedItemIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClearSelectedItemsFromCartCopyWith<_$_ClearSelectedItemsFromCart>
      get copyWith => __$$_ClearSelectedItemsFromCartCopyWithImpl<
          _$_ClearSelectedItemsFromCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return clearSelectedItemsFromCart(selectedItemIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return clearSelectedItemsFromCart?.call(selectedItemIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (clearSelectedItemsFromCart != null) {
      return clearSelectedItemsFromCart(selectedItemIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return clearSelectedItemsFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return clearSelectedItemsFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (clearSelectedItemsFromCart != null) {
      return clearSelectedItemsFromCart(this);
    }
    return orElse();
  }
}

abstract class _ClearSelectedItemsFromCart implements CartEvent {
  const factory _ClearSelectedItemsFromCart(
          {required final List<String> selectedItemIds}) =
      _$_ClearSelectedItemsFromCart;

  List<String> get selectedItemIds;
  @JsonKey(ignore: true)
  _$$_ClearSelectedItemsFromCartCopyWith<_$_ClearSelectedItemsFromCart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReplaceWithOrderItemsCopyWith<$Res> {
  factory _$$_ReplaceWithOrderItemsCopyWith(_$_ReplaceWithOrderItems value,
          $Res Function(_$_ReplaceWithOrderItems) then) =
      __$$_ReplaceWithOrderItemsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<CartItem> items,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      bool doNotallowOutOfStockMaterial});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_ReplaceWithOrderItemsCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_ReplaceWithOrderItems>
    implements _$$_ReplaceWithOrderItemsCopyWith<$Res> {
  __$$_ReplaceWithOrderItemsCopyWithImpl(_$_ReplaceWithOrderItems _value,
      $Res Function(_$_ReplaceWithOrderItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? doNotallowOutOfStockMaterial = null,
  }) {
    return _then(_$_ReplaceWithOrderItems(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      doNotallowOutOfStockMaterial: null == doNotallowOutOfStockMaterial
          ? _value.doNotallowOutOfStockMaterial
          : doNotallowOutOfStockMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
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
}

/// @nodoc

class _$_ReplaceWithOrderItems implements _ReplaceWithOrderItems {
  const _$_ReplaceWithOrderItems(
      {required final List<CartItem> items,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.doNotallowOutOfStockMaterial})
      : _items = items;

  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final bool doNotallowOutOfStockMaterial;

  @override
  String toString() {
    return 'CartEvent.replaceWithOrderItems(items: $items, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplaceWithOrderItems &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.doNotallowOutOfStockMaterial,
                    doNotallowOutOfStockMaterial) ||
                other.doNotallowOutOfStockMaterial ==
                    doNotallowOutOfStockMaterial));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      salesOrganisationConfigs,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      doNotallowOutOfStockMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReplaceWithOrderItemsCopyWith<_$_ReplaceWithOrderItems> get copyWith =>
      __$$_ReplaceWithOrderItemsCopyWithImpl<_$_ReplaceWithOrderItems>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return replaceWithOrderItems(
        items,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return replaceWithOrderItems?.call(
        items,
        salesOrganisationConfigs,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (replaceWithOrderItems != null) {
      return replaceWithOrderItems(
          items,
          salesOrganisationConfigs,
          salesOrganisation,
          customerCodeInfo,
          shipToInfo,
          doNotallowOutOfStockMaterial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return replaceWithOrderItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return replaceWithOrderItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (replaceWithOrderItems != null) {
      return replaceWithOrderItems(this);
    }
    return orElse();
  }
}

abstract class _ReplaceWithOrderItems implements CartEvent {
  const factory _ReplaceWithOrderItems(
          {required final List<CartItem> items,
          required final SalesOrganisationConfigs salesOrganisationConfigs,
          required final SalesOrganisation salesOrganisation,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipToInfo,
          required final bool doNotallowOutOfStockMaterial}) =
      _$_ReplaceWithOrderItems;

  List<CartItem> get items;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  bool get doNotallowOutOfStockMaterial;
  @JsonKey(ignore: true)
  _$$_ReplaceWithOrderItemsCopyWith<_$_ReplaceWithOrderItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateBatchInCartItemCopyWith<$Res> {
  factory _$$_UpdateBatchInCartItemCopyWith(_$_UpdateBatchInCartItem value,
          $Res Function(_$_UpdateBatchInCartItem) then) =
      __$$_UpdateBatchInCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItem item, StockInfo stockInfo});

  $CartItemCopyWith<$Res> get item;
  $StockInfoCopyWith<$Res> get stockInfo;
}

/// @nodoc
class __$$_UpdateBatchInCartItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateBatchInCartItem>
    implements _$$_UpdateBatchInCartItemCopyWith<$Res> {
  __$$_UpdateBatchInCartItemCopyWithImpl(_$_UpdateBatchInCartItem _value,
      $Res Function(_$_UpdateBatchInCartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? stockInfo = null,
  }) {
    return _then(_$_UpdateBatchInCartItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItem,
      stockInfo: null == stockInfo
          ? _value.stockInfo
          : stockInfo // ignore: cast_nullable_to_non_nullable
              as StockInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get item {
    return $CartItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StockInfoCopyWith<$Res> get stockInfo {
    return $StockInfoCopyWith<$Res>(_value.stockInfo, (value) {
      return _then(_value.copyWith(stockInfo: value));
    });
  }
}

/// @nodoc

class _$_UpdateBatchInCartItem implements _UpdateBatchInCartItem {
  const _$_UpdateBatchInCartItem({required this.item, required this.stockInfo});

  @override
  final CartItem item;
  @override
  final StockInfo stockInfo;

  @override
  String toString() {
    return 'CartEvent.updateBatchInCartItem(item: $item, stockInfo: $stockInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateBatchInCartItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.stockInfo, stockInfo) ||
                other.stockInfo == stockInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, stockInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateBatchInCartItemCopyWith<_$_UpdateBatchInCartItem> get copyWith =>
      __$$_UpdateBatchInCartItemCopyWithImpl<_$_UpdateBatchInCartItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)
        fetch,
    required TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)
        addMaterialToCart,
    required TResult Function(PriceAggregate item) discountOverride,
    required TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBundleToCart,
    required TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)
        addComboDealToCart,
    required TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        updateMaterialQtyInCartItem,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item) removeFromCart,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function(CartItem cartItem) selectButtonTapped,
    required TResult Function() selectAllButtonTapped,
    required TResult Function() clearCart,
    required TResult Function(List<String> selectedItemIds)
        clearSelectedItemsFromCart,
    required TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
  }) {
    return updateBatchInCartItem(item, stockInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult? Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult? Function(PriceAggregate item)? discountOverride,
    TResult? Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult? Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult? Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult? Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item)? removeFromCart,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function(CartItem cartItem)? selectButtonTapped,
    TResult? Function()? selectAllButtonTapped,
    TResult? Function()? clearCart,
    TResult? Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult? Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
  }) {
    return updateBatchInCartItem?.call(item, stockInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotAllowOutOfStockMaterials,
            bool comboDealEligible,
            bool isSpecialOrderType)?
        fetch,
    TResult Function(
            PriceAggregate item,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool isSpecialOrderType)?
        addMaterialToCart,
    TResult Function(PriceAggregate item)? discountOverride,
    TResult Function(
            List<PriceAggregate> bundleItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBundleToCart,
    TResult Function(
            List<PriceAggregate> comboDealItems,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial,
            bool overrideQty)?
        addComboDealToCart,
    TResult Function(
            CartItem currentItem,
            PriceAggregate updatedQtyItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        updateMaterialQtyInCartItem,
    TResult Function(
            PriceAggregate item,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item)? removeFromCart,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(
            CartItem item,
            MaterialItemBonus bonusItem,
            bool overrideQty,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function(CartItem cartItem)? selectButtonTapped,
    TResult Function()? selectAllButtonTapped,
    TResult Function()? clearCart,
    TResult Function(List<String> selectedItemIds)? clearSelectedItemsFromCart,
    TResult Function(
            List<CartItem> items,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (updateBatchInCartItem != null) {
      return updateBatchInCartItem(item, stockInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddMaterialToCart value) addMaterialToCart,
    required TResult Function(_DiscountOverride value) discountOverride,
    required TResult Function(_AddBundleToCart value) addBundleToCart,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_UpdateMaterialQtyInCartItem value)
        updateMaterialQtyInCartItem,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_SelectButtonTapped value) selectButtonTapped,
    required TResult Function(_SelectAllButtonTapped value)
        selectAllButtonTapped,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ClearSelectedItemsFromCart value)
        clearSelectedItemsFromCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
  }) {
    return updateBatchInCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult? Function(_DiscountOverride value)? discountOverride,
    TResult? Function(_AddBundleToCart value)? addBundleToCart,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult? Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
  }) {
    return updateBatchInCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddMaterialToCart value)? addMaterialToCart,
    TResult Function(_DiscountOverride value)? discountOverride,
    TResult Function(_AddBundleToCart value)? addBundleToCart,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_UpdateMaterialQtyInCartItem value)?
        updateMaterialQtyInCartItem,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_SelectButtonTapped value)? selectButtonTapped,
    TResult Function(_SelectAllButtonTapped value)? selectAllButtonTapped,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ClearSelectedItemsFromCart value)?
        clearSelectedItemsFromCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    required TResult orElse(),
  }) {
    if (updateBatchInCartItem != null) {
      return updateBatchInCartItem(this);
    }
    return orElse();
  }
}

abstract class _UpdateBatchInCartItem implements CartEvent {
  const factory _UpdateBatchInCartItem(
      {required final CartItem item,
      required final StockInfo stockInfo}) = _$_UpdateBatchInCartItem;

  CartItem get item;
  StockInfo get stockInfo;
  @JsonKey(ignore: true)
  _$$_UpdateBatchInCartItemCopyWith<_$_UpdateBatchInCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get isClearing => throw _privateConstructorUsedError;
  bool get isFetchingBonus => throw _privateConstructorUsedError;

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
      {List<CartItem> cartItems,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      bool isClearing,
      bool isFetchingBonus});
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
    Object? cartItems = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? isClearing = null,
    Object? isFetchingBonus = null,
  }) {
    return _then(_value.copyWith(
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isClearing: null == isClearing
          ? _value.isClearing
          : isClearing // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingBonus: null == isFetchingBonus
          ? _value.isFetchingBonus
          : isFetchingBonus // ignore: cast_nullable_to_non_nullable
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
      {List<CartItem> cartItems,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      bool isClearing,
      bool isFetchingBonus});
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
    Object? cartItems = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? isClearing = null,
    Object? isFetchingBonus = null,
  }) {
    return _then(_$_CartState(
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isClearing: null == isClearing
          ? _value.isClearing
          : isClearing // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingBonus: null == isFetchingBonus
          ? _value.isFetchingBonus
          : isFetchingBonus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CartState extends _CartState {
  const _$_CartState(
      {required final List<CartItem> cartItems,
      required this.apiFailureOrSuccessOption,
      required this.isFetching,
      required this.isClearing,
      required this.isFetchingBonus})
      : _cartItems = cartItems,
        super._();

  final List<CartItem> _cartItems;
  @override
  List<CartItem> get cartItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isFetching;
  @override
  final bool isClearing;
  @override
  final bool isFetchingBonus;

  @override
  String toString() {
    return 'CartState(cartItems: $cartItems, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isFetching: $isFetching, isClearing: $isClearing, isFetchingBonus: $isFetchingBonus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.isClearing, isClearing) ||
                other.isClearing == isClearing) &&
            (identical(other.isFetchingBonus, isFetchingBonus) ||
                other.isFetchingBonus == isFetchingBonus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItems),
      apiFailureOrSuccessOption,
      isFetching,
      isClearing,
      isFetchingBonus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
      {required final List<CartItem> cartItems,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isFetching,
      required final bool isClearing,
      required final bool isFetchingBonus}) = _$_CartState;
  const _CartState._() : super._();

  @override
  List<CartItem> get cartItems;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  bool get isClearing;
  @override
  bool get isFetchingBonus;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
