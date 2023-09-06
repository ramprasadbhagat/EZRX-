// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
  @useResult
  $Res call(
      {SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_Initialized(
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

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo});

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
    return 'CartEvent.initialized(salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
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
  int get hashCode => Object.hash(runtimeType, salesOrganisationConfigs,
      salesOrganisation, customerCodeInfo, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return initialized(salesOrganisationConfigs, salesOrganisation,
        customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return initialized?.call(salesOrganisationConfigs, salesOrganisation,
        customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisationConfigs, salesOrganisation,
          customerCodeInfo, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CartEvent {
  const factory _Initialized(
      {required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo}) = _$_Initialized;

  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
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
      bool doNotallowOutOfStockMaterial,
      bool overrideQty});
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
    Object? doNotallowOutOfStockMaterial = null,
    Object? overrideQty = null,
  }) {
    return _then(_$_AddComboDealToCart(
      comboDealItems: null == comboDealItems
          ? _value._comboDealItems
          : comboDealItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
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
}

/// @nodoc

class _$_AddComboDealToCart implements _AddComboDealToCart {
  const _$_AddComboDealToCart(
      {required final List<PriceAggregate> comboDealItems,
      required this.doNotallowOutOfStockMaterial,
      this.overrideQty = false})
      : _comboDealItems = comboDealItems;

  final List<PriceAggregate> _comboDealItems;
  @override
  List<PriceAggregate> get comboDealItems {
    if (_comboDealItems is EqualUnmodifiableListView) return _comboDealItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comboDealItems);
  }

  @override
  final bool doNotallowOutOfStockMaterial;
  @override
  @JsonKey()
  final bool overrideQty;

  @override
  String toString() {
    return 'CartEvent.addComboDealToCart(comboDealItems: $comboDealItems, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial, overrideQty: $overrideQty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddComboDealToCart &&
            const DeepCollectionEquality()
                .equals(other._comboDealItems, _comboDealItems) &&
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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return addComboDealToCart(
        comboDealItems, doNotallowOutOfStockMaterial, overrideQty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return addComboDealToCart?.call(
        comboDealItems, doNotallowOutOfStockMaterial, overrideQty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (addComboDealToCart != null) {
      return addComboDealToCart(
          comboDealItems, doNotallowOutOfStockMaterial, overrideQty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return addComboDealToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return addComboDealToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
      required final bool doNotallowOutOfStockMaterial,
      final bool overrideQty}) = _$_AddComboDealToCart;

  List<PriceAggregate> get comboDealItems;
  bool get doNotallowOutOfStockMaterial;
  bool get overrideQty;
  @JsonKey(ignore: true)
  _$$_AddComboDealToCartCopyWith<_$_AddComboDealToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyMaterialDealBonusCopyWith<$Res> {
  factory _$$_VerifyMaterialDealBonusCopyWith(_$_VerifyMaterialDealBonus value,
          $Res Function(_$_VerifyMaterialDealBonus) then) =
      __$$_VerifyMaterialDealBonusCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate item, List<PriceAggregate> items});

  $PriceAggregateCopyWith<$Res> get item;
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
    Object? items = null,
  }) {
    return _then(_$_VerifyMaterialDealBonus(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
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

class _$_VerifyMaterialDealBonus implements _VerifyMaterialDealBonus {
  const _$_VerifyMaterialDealBonus(
      {required this.item, required final List<PriceAggregate> items})
      : _items = items;

  ///Todo: consider to remove it
  @override
  final PriceAggregate item;
  final List<PriceAggregate> _items;
  @override
  List<PriceAggregate> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartEvent.verifyMaterialDealBonus(item: $item, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyMaterialDealBonus &&
            (identical(other.item, item) || other.item == item) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, item, const DeepCollectionEquality().hash(_items));

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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return verifyMaterialDealBonus(item, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return verifyMaterialDealBonus?.call(item, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (verifyMaterialDealBonus != null) {
      return verifyMaterialDealBonus(item, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return verifyMaterialDealBonus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return verifyMaterialDealBonus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
      required final List<PriceAggregate> items}) = _$_VerifyMaterialDealBonus;

  ///Todo: consider to remove it
  PriceAggregate get item;
  List<PriceAggregate> get items;
  @JsonKey(ignore: true)
  _$$_VerifyMaterialDealBonusCopyWith<_$_VerifyMaterialDealBonus>
      get copyWith => throw _privateConstructorUsedError;
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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return addRemarkToCartItem(item, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return addRemarkToCartItem?.call(item, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
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
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return addRemarkToCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return addRemarkToCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
      {MaterialInfo bonusMaterial,
      StringValue bonusItemId,
      RequestCounterOfferDetails counterOfferDetails,
      User user});

  $MaterialInfoCopyWith<$Res> get bonusMaterial;
  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails;
  $UserCopyWith<$Res> get user;
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
    Object? bonusMaterial = null,
    Object? bonusItemId = null,
    Object? counterOfferDetails = null,
    Object? user = null,
  }) {
    return _then(_$_AddBonusToCartItem(
      bonusMaterial: null == bonusMaterial
          ? _value.bonusMaterial
          : bonusMaterial // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      bonusItemId: null == bonusItemId
          ? _value.bonusItemId
          : bonusItemId // ignore: cast_nullable_to_non_nullable
              as StringValue,
      counterOfferDetails: null == counterOfferDetails
          ? _value.counterOfferDetails
          : counterOfferDetails // ignore: cast_nullable_to_non_nullable
              as RequestCounterOfferDetails,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get bonusMaterial {
    return $MaterialInfoCopyWith<$Res>(_value.bonusMaterial, (value) {
      return _then(_value.copyWith(bonusMaterial: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails {
    return $RequestCounterOfferDetailsCopyWith<$Res>(_value.counterOfferDetails,
        (value) {
      return _then(_value.copyWith(counterOfferDetails: value));
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

class _$_AddBonusToCartItem implements _AddBonusToCartItem {
  const _$_AddBonusToCartItem(
      {required this.bonusMaterial,
      required this.bonusItemId,
      required this.counterOfferDetails,
      required this.user});

  @override
  final MaterialInfo bonusMaterial;
  @override
  final StringValue bonusItemId;
  @override
  final RequestCounterOfferDetails counterOfferDetails;
  @override
  final User user;

  @override
  String toString() {
    return 'CartEvent.addBonusToCartItem(bonusMaterial: $bonusMaterial, bonusItemId: $bonusItemId, counterOfferDetails: $counterOfferDetails, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddBonusToCartItem &&
            (identical(other.bonusMaterial, bonusMaterial) ||
                other.bonusMaterial == bonusMaterial) &&
            (identical(other.bonusItemId, bonusItemId) ||
                other.bonusItemId == bonusItemId) &&
            (identical(other.counterOfferDetails, counterOfferDetails) ||
                other.counterOfferDetails == counterOfferDetails) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bonusMaterial, bonusItemId, counterOfferDetails, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddBonusToCartItemCopyWith<_$_AddBonusToCartItem> get copyWith =>
      __$$_AddBonusToCartItemCopyWithImpl<_$_AddBonusToCartItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return addBonusToCartItem(
        bonusMaterial, bonusItemId, counterOfferDetails, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return addBonusToCartItem?.call(
        bonusMaterial, bonusItemId, counterOfferDetails, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (addBonusToCartItem != null) {
      return addBonusToCartItem(
          bonusMaterial, bonusItemId, counterOfferDetails, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return addBonusToCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return addBonusToCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
      {required final MaterialInfo bonusMaterial,
      required final StringValue bonusItemId,
      required final RequestCounterOfferDetails counterOfferDetails,
      required final User user}) = _$_AddBonusToCartItem;

  MaterialInfo get bonusMaterial;
  StringValue get bonusItemId;
  RequestCounterOfferDetails get counterOfferDetails;
  User get user;
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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return removeBonusFromCartItem(item, bonusItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return removeBonusFromCartItem?.call(item, bonusItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
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
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return removeBonusFromCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return removeBonusFromCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return addRemarkToBonusItem(item, bonusItem, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return addRemarkToBonusItem?.call(item, bonusItem, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
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
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return addRemarkToBonusItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return addRemarkToBonusItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
    if (_overridenPrice is EqualUnmodifiableListView) return _overridenPrice;
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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return overrideCartItemPrice(overridenPrice, cartItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return overrideCartItemPrice?.call(overridenPrice, cartItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
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
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return overrideCartItemPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return overrideCartItemPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
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
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
abstract class _$$_ReplaceWithOrderItemsCopyWith<$Res> {
  factory _$$_ReplaceWithOrderItemsCopyWith(_$_ReplaceWithOrderItems value,
          $Res Function(_$_ReplaceWithOrderItems) then) =
      __$$_ReplaceWithOrderItemsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CartItem> items, bool doNotallowOutOfStockMaterial});
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
    Object? doNotallowOutOfStockMaterial = null,
  }) {
    return _then(_$_ReplaceWithOrderItems(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      doNotallowOutOfStockMaterial: null == doNotallowOutOfStockMaterial
          ? _value.doNotallowOutOfStockMaterial
          : doNotallowOutOfStockMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReplaceWithOrderItems implements _ReplaceWithOrderItems {
  const _$_ReplaceWithOrderItems(
      {required final List<CartItem> items,
      required this.doNotallowOutOfStockMaterial})
      : _items = items;

  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool doNotallowOutOfStockMaterial;

  @override
  String toString() {
    return 'CartEvent.replaceWithOrderItems(items: $items, doNotallowOutOfStockMaterial: $doNotallowOutOfStockMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplaceWithOrderItems &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.doNotallowOutOfStockMaterial,
                    doNotallowOutOfStockMaterial) ||
                other.doNotallowOutOfStockMaterial ==
                    doNotallowOutOfStockMaterial));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return replaceWithOrderItems(items, doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return replaceWithOrderItems?.call(items, doNotallowOutOfStockMaterial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (replaceWithOrderItems != null) {
      return replaceWithOrderItems(items, doNotallowOutOfStockMaterial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return replaceWithOrderItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return replaceWithOrderItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
          required final bool doNotallowOutOfStockMaterial}) =
      _$_ReplaceWithOrderItems;

  List<CartItem> get items;
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
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return updateBatchInCartItem(item, stockInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return updateBatchInCartItem?.call(item, stockInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
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
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return updateBatchInCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return updateBatchInCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
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
abstract class _$$_FetchProductsAddedToCartCopyWith<$Res> {
  factory _$$_FetchProductsAddedToCartCopyWith(
          _$_FetchProductsAddedToCart value,
          $Res Function(_$_FetchProductsAddedToCart) then) =
      __$$_FetchProductsAddedToCartCopyWithImpl<$Res>;
  @useResult
  $Res call({bool comboDealEligible});
}

/// @nodoc
class __$$_FetchProductsAddedToCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_FetchProductsAddedToCart>
    implements _$$_FetchProductsAddedToCartCopyWith<$Res> {
  __$$_FetchProductsAddedToCartCopyWithImpl(_$_FetchProductsAddedToCart _value,
      $Res Function(_$_FetchProductsAddedToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comboDealEligible = null,
  }) {
    return _then(_$_FetchProductsAddedToCart(
      comboDealEligible: null == comboDealEligible
          ? _value.comboDealEligible
          : comboDealEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FetchProductsAddedToCart implements _FetchProductsAddedToCart {
  const _$_FetchProductsAddedToCart({required this.comboDealEligible});

  @override
  final bool comboDealEligible;

  @override
  String toString() {
    return 'CartEvent.fetchProductsAddedToCart(comboDealEligible: $comboDealEligible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchProductsAddedToCart &&
            (identical(other.comboDealEligible, comboDealEligible) ||
                other.comboDealEligible == comboDealEligible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comboDealEligible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchProductsAddedToCartCopyWith<_$_FetchProductsAddedToCart>
      get copyWith => __$$_FetchProductsAddedToCartCopyWithImpl<
          _$_FetchProductsAddedToCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return fetchProductsAddedToCart(comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return fetchProductsAddedToCart?.call(comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (fetchProductsAddedToCart != null) {
      return fetchProductsAddedToCart(comboDealEligible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return fetchProductsAddedToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return fetchProductsAddedToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    required TResult orElse(),
  }) {
    if (fetchProductsAddedToCart != null) {
      return fetchProductsAddedToCart(this);
    }
    return orElse();
  }
}

abstract class _FetchProductsAddedToCart implements CartEvent {
  const factory _FetchProductsAddedToCart(
      {required final bool comboDealEligible}) = _$_FetchProductsAddedToCart;

  bool get comboDealEligible;
  @JsonKey(ignore: true)
  _$$_FetchProductsAddedToCartCopyWith<_$_FetchProductsAddedToCart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpsertCartCopyWith<$Res> {
  factory _$$_UpsertCartCopyWith(
          _$_UpsertCart value, $Res Function(_$_UpsertCart) then) =
      __$$_UpsertCartCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate priceAggregate, int quantity});

  $PriceAggregateCopyWith<$Res> get priceAggregate;
}

/// @nodoc
class __$$_UpsertCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpsertCart>
    implements _$$_UpsertCartCopyWith<$Res> {
  __$$_UpsertCartCopyWithImpl(
      _$_UpsertCart _value, $Res Function(_$_UpsertCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceAggregate = null,
    Object? quantity = null,
  }) {
    return _then(_$_UpsertCart(
      priceAggregate: null == priceAggregate
          ? _value.priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get priceAggregate {
    return $PriceAggregateCopyWith<$Res>(_value.priceAggregate, (value) {
      return _then(_value.copyWith(priceAggregate: value));
    });
  }
}

/// @nodoc

class _$_UpsertCart implements _UpsertCart {
  const _$_UpsertCart({required this.priceAggregate, required this.quantity});

  @override
  final PriceAggregate priceAggregate;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartEvent.upsertCart(priceAggregate: $priceAggregate, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpsertCart &&
            (identical(other.priceAggregate, priceAggregate) ||
                other.priceAggregate == priceAggregate) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, priceAggregate, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpsertCartCopyWith<_$_UpsertCart> get copyWith =>
      __$$_UpsertCartCopyWithImpl<_$_UpsertCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return upsertCart(priceAggregate, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return upsertCart?.call(priceAggregate, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (upsertCart != null) {
      return upsertCart(priceAggregate, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return upsertCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return upsertCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    required TResult orElse(),
  }) {
    if (upsertCart != null) {
      return upsertCart(this);
    }
    return orElse();
  }
}

abstract class _UpsertCart implements CartEvent {
  const factory _UpsertCart(
      {required final PriceAggregate priceAggregate,
      required final int quantity}) = _$_UpsertCart;

  PriceAggregate get priceAggregate;
  int get quantity;
  @JsonKey(ignore: true)
  _$$_UpsertCartCopyWith<_$_UpsertCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_addHistoryItemsToCartCopyWith<$Res> {
  factory _$$_addHistoryItemsToCartCopyWith(_$_addHistoryItemsToCart value,
          $Res Function(_$_addHistoryItemsToCart) then) =
      __$$_addHistoryItemsToCartCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PriceAggregate> priceAggregate,
      List<int> quantity,
      RequestCounterOfferDetails counterOfferDetails,
      User user});

  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_addHistoryItemsToCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_addHistoryItemsToCart>
    implements _$$_addHistoryItemsToCartCopyWith<$Res> {
  __$$_addHistoryItemsToCartCopyWithImpl(_$_addHistoryItemsToCart _value,
      $Res Function(_$_addHistoryItemsToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceAggregate = null,
    Object? quantity = null,
    Object? counterOfferDetails = null,
    Object? user = null,
  }) {
    return _then(_$_addHistoryItemsToCart(
      priceAggregate: null == priceAggregate
          ? _value._priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      quantity: null == quantity
          ? _value._quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as List<int>,
      counterOfferDetails: null == counterOfferDetails
          ? _value.counterOfferDetails
          : counterOfferDetails // ignore: cast_nullable_to_non_nullable
              as RequestCounterOfferDetails,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails {
    return $RequestCounterOfferDetailsCopyWith<$Res>(_value.counterOfferDetails,
        (value) {
      return _then(_value.copyWith(counterOfferDetails: value));
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

class _$_addHistoryItemsToCart implements _addHistoryItemsToCart {
  const _$_addHistoryItemsToCart(
      {required final List<PriceAggregate> priceAggregate,
      required final List<int> quantity,
      required this.counterOfferDetails,
      required this.user})
      : _priceAggregate = priceAggregate,
        _quantity = quantity;

  final List<PriceAggregate> _priceAggregate;
  @override
  List<PriceAggregate> get priceAggregate {
    if (_priceAggregate is EqualUnmodifiableListView) return _priceAggregate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceAggregate);
  }

  final List<int> _quantity;
  @override
  List<int> get quantity {
    if (_quantity is EqualUnmodifiableListView) return _quantity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quantity);
  }

  @override
  final RequestCounterOfferDetails counterOfferDetails;
  @override
  final User user;

  @override
  String toString() {
    return 'CartEvent.addHistoryItemsToCart(priceAggregate: $priceAggregate, quantity: $quantity, counterOfferDetails: $counterOfferDetails, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addHistoryItemsToCart &&
            const DeepCollectionEquality()
                .equals(other._priceAggregate, _priceAggregate) &&
            const DeepCollectionEquality().equals(other._quantity, _quantity) &&
            (identical(other.counterOfferDetails, counterOfferDetails) ||
                other.counterOfferDetails == counterOfferDetails) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_priceAggregate),
      const DeepCollectionEquality().hash(_quantity),
      counterOfferDetails,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_addHistoryItemsToCartCopyWith<_$_addHistoryItemsToCart> get copyWith =>
      __$$_addHistoryItemsToCartCopyWithImpl<_$_addHistoryItemsToCart>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return addHistoryItemsToCart(
        priceAggregate, quantity, counterOfferDetails, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return addHistoryItemsToCart?.call(
        priceAggregate, quantity, counterOfferDetails, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (addHistoryItemsToCart != null) {
      return addHistoryItemsToCart(
          priceAggregate, quantity, counterOfferDetails, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return addHistoryItemsToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return addHistoryItemsToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    required TResult orElse(),
  }) {
    if (addHistoryItemsToCart != null) {
      return addHistoryItemsToCart(this);
    }
    return orElse();
  }
}

abstract class _addHistoryItemsToCart implements CartEvent {
  const factory _addHistoryItemsToCart(
      {required final List<PriceAggregate> priceAggregate,
      required final List<int> quantity,
      required final RequestCounterOfferDetails counterOfferDetails,
      required final User user}) = _$_addHistoryItemsToCart;

  List<PriceAggregate> get priceAggregate;
  List<int> get quantity;
  RequestCounterOfferDetails get counterOfferDetails;
  User get user;
  @JsonKey(ignore: true)
  _$$_addHistoryItemsToCartCopyWith<_$_addHistoryItemsToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpsertCartItemsCopyWith<$Res> {
  factory _$$_UpsertCartItemsCopyWith(
          _$_UpsertCartItems value, $Res Function(_$_UpsertCartItems) then) =
      __$$_UpsertCartItemsCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate priceAggregate});

  $PriceAggregateCopyWith<$Res> get priceAggregate;
}

/// @nodoc
class __$$_UpsertCartItemsCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpsertCartItems>
    implements _$$_UpsertCartItemsCopyWith<$Res> {
  __$$_UpsertCartItemsCopyWithImpl(
      _$_UpsertCartItems _value, $Res Function(_$_UpsertCartItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceAggregate = null,
  }) {
    return _then(_$_UpsertCartItems(
      priceAggregate: null == priceAggregate
          ? _value.priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get priceAggregate {
    return $PriceAggregateCopyWith<$Res>(_value.priceAggregate, (value) {
      return _then(_value.copyWith(priceAggregate: value));
    });
  }
}

/// @nodoc

class _$_UpsertCartItems implements _UpsertCartItems {
  const _$_UpsertCartItems({required this.priceAggregate});

  @override
  final PriceAggregate priceAggregate;

  @override
  String toString() {
    return 'CartEvent.upsertCartItems(priceAggregate: $priceAggregate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpsertCartItems &&
            (identical(other.priceAggregate, priceAggregate) ||
                other.priceAggregate == priceAggregate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, priceAggregate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpsertCartItemsCopyWith<_$_UpsertCartItems> get copyWith =>
      __$$_UpsertCartItemsCopyWithImpl<_$_UpsertCartItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return upsertCartItems(priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return upsertCartItems?.call(priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (upsertCartItems != null) {
      return upsertCartItems(priceAggregate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return upsertCartItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return upsertCartItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    required TResult orElse(),
  }) {
    if (upsertCartItems != null) {
      return upsertCartItems(this);
    }
    return orElse();
  }
}

abstract class _UpsertCartItems implements CartEvent {
  const factory _UpsertCartItems(
      {required final PriceAggregate priceAggregate}) = _$_UpsertCartItems;

  PriceAggregate get priceAggregate;
  @JsonKey(ignore: true)
  _$$_UpsertCartItemsCopyWith<_$_UpsertCartItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetDetailsProductsAddedToCartCopyWith<$Res> {
  factory _$$_GetDetailsProductsAddedToCartCopyWith(
          _$_GetDetailsProductsAddedToCart value,
          $Res Function(_$_GetDetailsProductsAddedToCart) then) =
      __$$_GetDetailsProductsAddedToCartCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PriceAggregate> cartProducts});
}

/// @nodoc
class __$$_GetDetailsProductsAddedToCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_GetDetailsProductsAddedToCart>
    implements _$$_GetDetailsProductsAddedToCartCopyWith<$Res> {
  __$$_GetDetailsProductsAddedToCartCopyWithImpl(
      _$_GetDetailsProductsAddedToCart _value,
      $Res Function(_$_GetDetailsProductsAddedToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProducts = null,
  }) {
    return _then(_$_GetDetailsProductsAddedToCart(
      cartProducts: null == cartProducts
          ? _value._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
    ));
  }
}

/// @nodoc

class _$_GetDetailsProductsAddedToCart
    implements _GetDetailsProductsAddedToCart {
  const _$_GetDetailsProductsAddedToCart(
      {required final List<PriceAggregate> cartProducts})
      : _cartProducts = cartProducts;

  final List<PriceAggregate> _cartProducts;
  @override
  List<PriceAggregate> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  @override
  String toString() {
    return 'CartEvent.getDetailsProductsAddedToCart(cartProducts: $cartProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDetailsProductsAddedToCart &&
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_cartProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDetailsProductsAddedToCartCopyWith<_$_GetDetailsProductsAddedToCart>
      get copyWith => __$$_GetDetailsProductsAddedToCartCopyWithImpl<
          _$_GetDetailsProductsAddedToCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return getDetailsProductsAddedToCart(cartProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return getDetailsProductsAddedToCart?.call(cartProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (getDetailsProductsAddedToCart != null) {
      return getDetailsProductsAddedToCart(cartProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return getDetailsProductsAddedToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return getDetailsProductsAddedToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    required TResult orElse(),
  }) {
    if (getDetailsProductsAddedToCart != null) {
      return getDetailsProductsAddedToCart(this);
    }
    return orElse();
  }
}

abstract class _GetDetailsProductsAddedToCart implements CartEvent {
  const factory _GetDetailsProductsAddedToCart(
          {required final List<PriceAggregate> cartProducts}) =
      _$_GetDetailsProductsAddedToCart;

  List<PriceAggregate> get cartProducts;
  @JsonKey(ignore: true)
  _$$_GetDetailsProductsAddedToCartCopyWith<_$_GetDetailsProductsAddedToCart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatePriceProductCopyWith<$Res> {
  factory _$$_UpdatePriceProductCopyWith(_$_UpdatePriceProduct value,
          $Res Function(_$_UpdatePriceProduct) then) =
      __$$_UpdatePriceProductCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Map<MaterialNumber, Price> priceProducts, Price overriddenProductPrice});

  $PriceCopyWith<$Res> get overriddenProductPrice;
}

/// @nodoc
class __$$_UpdatePriceProductCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdatePriceProduct>
    implements _$$_UpdatePriceProductCopyWith<$Res> {
  __$$_UpdatePriceProductCopyWithImpl(
      _$_UpdatePriceProduct _value, $Res Function(_$_UpdatePriceProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceProducts = null,
    Object? overriddenProductPrice = null,
  }) {
    return _then(_$_UpdatePriceProduct(
      priceProducts: null == priceProducts
          ? _value._priceProducts
          : priceProducts // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, Price>,
      overriddenProductPrice: null == overriddenProductPrice
          ? _value.overriddenProductPrice
          : overriddenProductPrice // ignore: cast_nullable_to_non_nullable
              as Price,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res> get overriddenProductPrice {
    return $PriceCopyWith<$Res>(_value.overriddenProductPrice, (value) {
      return _then(_value.copyWith(overriddenProductPrice: value));
    });
  }
}

/// @nodoc

class _$_UpdatePriceProduct implements _UpdatePriceProduct {
  const _$_UpdatePriceProduct(
      {required final Map<MaterialNumber, Price> priceProducts,
      required this.overriddenProductPrice})
      : _priceProducts = priceProducts;

  final Map<MaterialNumber, Price> _priceProducts;
  @override
  Map<MaterialNumber, Price> get priceProducts {
    if (_priceProducts is EqualUnmodifiableMapView) return _priceProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_priceProducts);
  }

  @override
  final Price overriddenProductPrice;

  @override
  String toString() {
    return 'CartEvent.updatePriceProduct(priceProducts: $priceProducts, overriddenProductPrice: $overriddenProductPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePriceProduct &&
            const DeepCollectionEquality()
                .equals(other._priceProducts, _priceProducts) &&
            (identical(other.overriddenProductPrice, overriddenProductPrice) ||
                other.overriddenProductPrice == overriddenProductPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_priceProducts),
      overriddenProductPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePriceProductCopyWith<_$_UpdatePriceProduct> get copyWith =>
      __$$_UpdatePriceProductCopyWithImpl<_$_UpdatePriceProduct>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return updatePriceProduct(priceProducts, overriddenProductPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return updatePriceProduct?.call(priceProducts, overriddenProductPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (updatePriceProduct != null) {
      return updatePriceProduct(priceProducts, overriddenProductPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return updatePriceProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return updatePriceProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    required TResult orElse(),
  }) {
    if (updatePriceProduct != null) {
      return updatePriceProduct(this);
    }
    return orElse();
  }
}

abstract class _UpdatePriceProduct implements CartEvent {
  const factory _UpdatePriceProduct(
      {required final Map<MaterialNumber, Price> priceProducts,
      required final Price overriddenProductPrice}) = _$_UpdatePriceProduct;

  Map<MaterialNumber, Price> get priceProducts;
  Price get overriddenProductPrice;
  @JsonKey(ignore: true)
  _$$_UpdatePriceProductCopyWith<_$_UpdatePriceProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateProductStockCopyWith<$Res> {
  factory _$$_UpdateProductStockCopyWith(_$_UpdateProductStock value,
          $Res Function(_$_UpdateProductStock) then) =
      __$$_UpdateProductStockCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PriceAggregate> products});
}

/// @nodoc
class __$$_UpdateProductStockCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateProductStock>
    implements _$$_UpdateProductStockCopyWith<$Res> {
  __$$_UpdateProductStockCopyWithImpl(
      _$_UpdateProductStock _value, $Res Function(_$_UpdateProductStock) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$_UpdateProductStock(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
    ));
  }
}

/// @nodoc

class _$_UpdateProductStock implements _UpdateProductStock {
  const _$_UpdateProductStock({required final List<PriceAggregate> products})
      : _products = products;

  final List<PriceAggregate> _products;
  @override
  List<PriceAggregate> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CartEvent.updateProductStock(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateProductStock &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateProductStockCopyWith<_$_UpdateProductStock> get copyWith =>
      __$$_UpdateProductStockCopyWithImpl<_$_UpdateProductStock>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)
        addComboDealToCart,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(CartItem item, String message)
        addRemarkToCartItem,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addBonusToCartItem,
    required TResult Function(CartItem item, MaterialItemBonus bonusItem)
        removeBonusFromCartItem,
    required TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)
        addRemarkToBonusItem,
    required TResult Function(List<Price> overridenPrice, CartItem cartItem)
        overrideCartItemPrice,
    required TResult Function() clearCart,
    required TResult Function(
            List<CartItem> items, bool doNotallowOutOfStockMaterial)
        replaceWithOrderItems,
    required TResult Function(CartItem item, StockInfo stockInfo)
        updateBatchInCartItem,
    required TResult Function(bool comboDealEligible) fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> priceAggregate,
            List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails,
            User user)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)
        updatePriceProduct,
    required TResult Function(List<PriceAggregate> products) updateProductStock,
  }) {
    return updateProductStock(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(CartItem item, String message)? addRemarkToCartItem,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult? Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult? Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult? Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult? Function()? clearCart,
    TResult? Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult? Function(CartItem item, StockInfo stockInfo)?
        updateBatchInCartItem,
    TResult? Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult? Function(List<PriceAggregate> products)? updateProductStock,
  }) {
    return updateProductStock?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<PriceAggregate> comboDealItems,
            bool doNotallowOutOfStockMaterial, bool overrideQty)?
        addComboDealToCart,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(CartItem item, String message)? addRemarkToCartItem,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addBonusToCartItem,
    TResult Function(CartItem item, MaterialItemBonus bonusItem)?
        removeBonusFromCartItem,
    TResult Function(
            CartItem item, MaterialItemBonus bonusItem, String message)?
        addRemarkToBonusItem,
    TResult Function(List<Price> overridenPrice, CartItem cartItem)?
        overrideCartItemPrice,
    TResult Function()? clearCart,
    TResult Function(List<CartItem> items, bool doNotallowOutOfStockMaterial)?
        replaceWithOrderItems,
    TResult Function(CartItem item, StockInfo stockInfo)? updateBatchInCartItem,
    TResult Function(bool comboDealEligible)? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<PriceAggregate> priceAggregate, List<int> quantity,
            RequestCounterOfferDetails counterOfferDetails, User user)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts,
            Price overriddenProductPrice)?
        updatePriceProduct,
    TResult Function(List<PriceAggregate> products)? updateProductStock,
    required TResult orElse(),
  }) {
    if (updateProductStock != null) {
      return updateProductStock(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AddComboDealToCart value) addComboDealToCart,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddRemarkToCartItem value) addRemarkToCartItem,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveBonusFromCartItem value)
        removeBonusFromCartItem,
    required TResult Function(_AddRemarkToBonusItem value) addRemarkToBonusItem,
    required TResult Function(_OverrideCartItemPrice value)
        overrideCartItemPrice,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_ReplaceWithOrderItems value)
        replaceWithOrderItems,
    required TResult Function(_UpdateBatchInCartItem value)
        updateBatchInCartItem,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
  }) {
    return updateProductStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult? Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult? Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult? Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
  }) {
    return updateProductStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AddComboDealToCart value)? addComboDealToCart,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddRemarkToCartItem value)? addRemarkToCartItem,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveBonusFromCartItem value)? removeBonusFromCartItem,
    TResult Function(_AddRemarkToBonusItem value)? addRemarkToBonusItem,
    TResult Function(_OverrideCartItemPrice value)? overrideCartItemPrice,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_ReplaceWithOrderItems value)? replaceWithOrderItems,
    TResult Function(_UpdateBatchInCartItem value)? updateBatchInCartItem,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    required TResult orElse(),
  }) {
    if (updateProductStock != null) {
      return updateProductStock(this);
    }
    return orElse();
  }
}

abstract class _UpdateProductStock implements CartEvent {
  const factory _UpdateProductStock(
      {required final List<PriceAggregate> products}) = _$_UpdateProductStock;

  List<PriceAggregate> get products;
  @JsonKey(ignore: true)
  _$$_UpdateProductStockCopyWith<_$_UpdateProductStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  List<PriceAggregate> get cartProducts => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get isClearing => throw _privateConstructorUsedError;
  bool get isFetchingBonus => throw _privateConstructorUsedError;
  bool get isFetchingCartProductDetail => throw _privateConstructorUsedError;
  bool get isUpserting => throw _privateConstructorUsedError;
  bool get isMappingPrice => throw _privateConstructorUsedError;
  bool get isUpdatingStock => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get config => throw _privateConstructorUsedError;
  Map<MaterialNumber, ProductMetaData> get additionInfo =>
      throw _privateConstructorUsedError;
  List<int> get upsertBonusItemInProgressHashCode =>
      throw _privateConstructorUsedError;

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
      {List<PriceAggregate> cartProducts,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      bool isClearing,
      bool isFetchingBonus,
      bool isFetchingCartProductDetail,
      bool isUpserting,
      bool isMappingPrice,
      bool isUpdatingStock,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisationConfigs config,
      Map<MaterialNumber, ProductMetaData> additionInfo,
      List<int> upsertBonusItemInProgressHashCode});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get config;
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
    Object? cartProducts = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? isClearing = null,
    Object? isFetchingBonus = null,
    Object? isFetchingCartProductDetail = null,
    Object? isUpserting = null,
    Object? isMappingPrice = null,
    Object? isUpdatingStock = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? config = null,
    Object? additionInfo = null,
    Object? upsertBonusItemInProgressHashCode = null,
  }) {
    return _then(_value.copyWith(
      cartProducts: null == cartProducts
          ? _value.cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
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
      isFetchingCartProductDetail: null == isFetchingCartProductDetail
          ? _value.isFetchingCartProductDetail
          : isFetchingCartProductDetail // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpserting: null == isUpserting
          ? _value.isUpserting
          : isUpserting // ignore: cast_nullable_to_non_nullable
              as bool,
      isMappingPrice: null == isMappingPrice
          ? _value.isMappingPrice
          : isMappingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStock: null == isUpdatingStock
          ? _value.isUpdatingStock
          : isUpdatingStock // ignore: cast_nullable_to_non_nullable
              as bool,
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
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      additionInfo: null == additionInfo
          ? _value.additionInfo
          : additionInfo // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, ProductMetaData>,
      upsertBonusItemInProgressHashCode: null ==
              upsertBonusItemInProgressHashCode
          ? _value.upsertBonusItemInProgressHashCode
          : upsertBonusItemInProgressHashCode // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
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
  $SalesOrganisationConfigsCopyWith<$Res> get config {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
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
      {List<PriceAggregate> cartProducts,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      bool isClearing,
      bool isFetchingBonus,
      bool isFetchingCartProductDetail,
      bool isUpserting,
      bool isMappingPrice,
      bool isUpdatingStock,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisationConfigs config,
      Map<MaterialNumber, ProductMetaData> additionInfo,
      List<int> upsertBonusItemInProgressHashCode});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get config;
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
    Object? cartProducts = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? isClearing = null,
    Object? isFetchingBonus = null,
    Object? isFetchingCartProductDetail = null,
    Object? isUpserting = null,
    Object? isMappingPrice = null,
    Object? isUpdatingStock = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? config = null,
    Object? additionInfo = null,
    Object? upsertBonusItemInProgressHashCode = null,
  }) {
    return _then(_$_CartState(
      cartProducts: null == cartProducts
          ? _value._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
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
      isFetchingCartProductDetail: null == isFetchingCartProductDetail
          ? _value.isFetchingCartProductDetail
          : isFetchingCartProductDetail // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpserting: null == isUpserting
          ? _value.isUpserting
          : isUpserting // ignore: cast_nullable_to_non_nullable
              as bool,
      isMappingPrice: null == isMappingPrice
          ? _value.isMappingPrice
          : isMappingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStock: null == isUpdatingStock
          ? _value.isUpdatingStock
          : isUpdatingStock // ignore: cast_nullable_to_non_nullable
              as bool,
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
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      additionInfo: null == additionInfo
          ? _value._additionInfo
          : additionInfo // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, ProductMetaData>,
      upsertBonusItemInProgressHashCode: null ==
              upsertBonusItemInProgressHashCode
          ? _value._upsertBonusItemInProgressHashCode
          : upsertBonusItemInProgressHashCode // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_CartState extends _CartState {
  const _$_CartState(
      {required final List<PriceAggregate> cartProducts,
      required this.apiFailureOrSuccessOption,
      required this.isFetching,
      required this.isClearing,
      required this.isFetchingBonus,
      required this.isFetchingCartProductDetail,
      required this.isUpserting,
      required this.isMappingPrice,
      required this.isUpdatingStock,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.config,
      required final Map<MaterialNumber, ProductMetaData> additionInfo,
      required final List<int> upsertBonusItemInProgressHashCode})
      : _cartProducts = cartProducts,
        _additionInfo = additionInfo,
        _upsertBonusItemInProgressHashCode = upsertBonusItemInProgressHashCode,
        super._();

  final List<PriceAggregate> _cartProducts;
  @override
  List<PriceAggregate> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
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
  final bool isFetchingCartProductDetail;
  @override
  final bool isUpserting;
  @override
  final bool isMappingPrice;
  @override
  final bool isUpdatingStock;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final SalesOrganisationConfigs config;
  final Map<MaterialNumber, ProductMetaData> _additionInfo;
  @override
  Map<MaterialNumber, ProductMetaData> get additionInfo {
    if (_additionInfo is EqualUnmodifiableMapView) return _additionInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionInfo);
  }

  final List<int> _upsertBonusItemInProgressHashCode;
  @override
  List<int> get upsertBonusItemInProgressHashCode {
    if (_upsertBonusItemInProgressHashCode is EqualUnmodifiableListView)
      return _upsertBonusItemInProgressHashCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upsertBonusItemInProgressHashCode);
  }

  @override
  String toString() {
    return 'CartState(cartProducts: $cartProducts, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isFetching: $isFetching, isClearing: $isClearing, isFetchingBonus: $isFetchingBonus, isFetchingCartProductDetail: $isFetchingCartProductDetail, isUpserting: $isUpserting, isMappingPrice: $isMappingPrice, isUpdatingStock: $isUpdatingStock, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, config: $config, additionInfo: $additionInfo, upsertBonusItemInProgressHashCode: $upsertBonusItemInProgressHashCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.isClearing, isClearing) ||
                other.isClearing == isClearing) &&
            (identical(other.isFetchingBonus, isFetchingBonus) ||
                other.isFetchingBonus == isFetchingBonus) &&
            (identical(other.isFetchingCartProductDetail,
                    isFetchingCartProductDetail) ||
                other.isFetchingCartProductDetail ==
                    isFetchingCartProductDetail) &&
            (identical(other.isUpserting, isUpserting) ||
                other.isUpserting == isUpserting) &&
            (identical(other.isMappingPrice, isMappingPrice) ||
                other.isMappingPrice == isMappingPrice) &&
            (identical(other.isUpdatingStock, isUpdatingStock) ||
                other.isUpdatingStock == isUpdatingStock) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.config, config) || other.config == config) &&
            const DeepCollectionEquality()
                .equals(other._additionInfo, _additionInfo) &&
            const DeepCollectionEquality().equals(
                other._upsertBonusItemInProgressHashCode,
                _upsertBonusItemInProgressHashCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartProducts),
      apiFailureOrSuccessOption,
      isFetching,
      isClearing,
      isFetchingBonus,
      isFetchingCartProductDetail,
      isUpserting,
      isMappingPrice,
      isUpdatingStock,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      config,
      const DeepCollectionEquality().hash(_additionInfo),
      const DeepCollectionEquality().hash(_upsertBonusItemInProgressHashCode));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
          {required final List<PriceAggregate> cartProducts,
          required final Option<Either<ApiFailure, dynamic>>
              apiFailureOrSuccessOption,
          required final bool isFetching,
          required final bool isClearing,
          required final bool isFetchingBonus,
          required final bool isFetchingCartProductDetail,
          required final bool isUpserting,
          required final bool isMappingPrice,
          required final bool isUpdatingStock,
          required final SalesOrganisation salesOrganisation,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipToInfo,
          required final SalesOrganisationConfigs config,
          required final Map<MaterialNumber, ProductMetaData> additionInfo,
          required final List<int> upsertBonusItemInProgressHashCode}) =
      _$_CartState;
  const _CartState._() : super._();

  @override
  List<PriceAggregate> get cartProducts;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  bool get isClearing;
  @override
  bool get isFetchingBonus;
  @override
  bool get isFetchingCartProductDetail;
  @override
  bool get isUpserting;
  @override
  bool get isMappingPrice;
  @override
  bool get isUpdatingStock;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  SalesOrganisationConfigs get config;
  @override
  Map<MaterialNumber, ProductMetaData> get additionInfo;
  @override
  List<int> get upsertBonusItemInProgressHashCode;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
