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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
      ShipToInfo shipToInfo,
      User user});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
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
    Object? user = null,
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user});

  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'CartEvent.initialized(salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user)';
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
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisationConfigs,
      salesOrganisation, customerCodeInfo, shipToInfo, user);

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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return initialized(salesOrganisationConfigs, salesOrganisation,
        customerCodeInfo, shipToInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return initialized?.call(salesOrganisationConfigs, salesOrganisation,
        customerCodeInfo, shipToInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisationConfigs, salesOrganisation,
          customerCodeInfo, shipToInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
      required final ShipToInfo shipToInfo,
      required final User user}) = _$_Initialized;

  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
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
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return verifyMaterialDealBonus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return verifyMaterialDealBonus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
abstract class _$$_AddBonusToCartItemCopyWith<$Res> {
  factory _$$_AddBonusToCartItemCopyWith(_$_AddBonusToCartItem value,
          $Res Function(_$_AddBonusToCartItem) then) =
      __$$_AddBonusToCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MaterialInfo bonusMaterial,
      StringValue bonusItemId,
      RequestCounterOfferDetails counterOfferDetails});

  $MaterialInfoCopyWith<$Res> get bonusMaterial;
  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails;
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
}

/// @nodoc

class _$_AddBonusToCartItem implements _AddBonusToCartItem {
  const _$_AddBonusToCartItem(
      {required this.bonusMaterial,
      required this.bonusItemId,
      required this.counterOfferDetails});

  @override
  final MaterialInfo bonusMaterial;
  @override
  final StringValue bonusItemId;
  @override
  final RequestCounterOfferDetails counterOfferDetails;

  @override
  String toString() {
    return 'CartEvent.addBonusToCartItem(bonusMaterial: $bonusMaterial, bonusItemId: $bonusItemId, counterOfferDetails: $counterOfferDetails)';
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
                other.counterOfferDetails == counterOfferDetails));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, bonusMaterial, bonusItemId, counterOfferDetails);

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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return addBonusToCartItem(bonusMaterial, bonusItemId, counterOfferDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return addBonusToCartItem?.call(
        bonusMaterial, bonusItemId, counterOfferDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (addBonusToCartItem != null) {
      return addBonusToCartItem(
          bonusMaterial, bonusItemId, counterOfferDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return addBonusToCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return addBonusToCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
          required final RequestCounterOfferDetails counterOfferDetails}) =
      _$_AddBonusToCartItem;

  MaterialInfo get bonusMaterial;
  StringValue get bonusItemId;
  RequestCounterOfferDetails get counterOfferDetails;
  @JsonKey(ignore: true)
  _$$_AddBonusToCartItemCopyWith<_$_AddBonusToCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveSampleBonusFromCartConfigCopyWith<$Res> {
  factory _$$_RemoveSampleBonusFromCartConfigCopyWith(
          _$_RemoveSampleBonusFromCartConfig value,
          $Res Function(_$_RemoveSampleBonusFromCartConfig) then) =
      __$$_RemoveSampleBonusFromCartConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RemoveSampleBonusFromCartConfigCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_RemoveSampleBonusFromCartConfig>
    implements _$$_RemoveSampleBonusFromCartConfigCopyWith<$Res> {
  __$$_RemoveSampleBonusFromCartConfigCopyWithImpl(
      _$_RemoveSampleBonusFromCartConfig _value,
      $Res Function(_$_RemoveSampleBonusFromCartConfig) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RemoveSampleBonusFromCartConfig
    implements _RemoveSampleBonusFromCartConfig {
  const _$_RemoveSampleBonusFromCartConfig();

  @override
  String toString() {
    return 'CartEvent.removeSampleBonusFromCartConfig()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveSampleBonusFromCartConfig);
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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return removeSampleBonusFromCartConfig();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return removeSampleBonusFromCartConfig?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (removeSampleBonusFromCartConfig != null) {
      return removeSampleBonusFromCartConfig();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return removeSampleBonusFromCartConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return removeSampleBonusFromCartConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (removeSampleBonusFromCartConfig != null) {
      return removeSampleBonusFromCartConfig(this);
    }
    return orElse();
  }
}

abstract class _RemoveSampleBonusFromCartConfig implements CartEvent {
  const factory _RemoveSampleBonusFromCartConfig() =
      _$_RemoveSampleBonusFromCartConfig;
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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
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
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
abstract class _$$_FetchProductsAddedToCartCopyWith<$Res> {
  factory _$$_FetchProductsAddedToCartCopyWith(
          _$_FetchProductsAddedToCart value,
          $Res Function(_$_FetchProductsAddedToCart) then) =
      __$$_FetchProductsAddedToCartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchProductsAddedToCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_FetchProductsAddedToCart>
    implements _$$_FetchProductsAddedToCartCopyWith<$Res> {
  __$$_FetchProductsAddedToCartCopyWithImpl(_$_FetchProductsAddedToCart _value,
      $Res Function(_$_FetchProductsAddedToCart) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchProductsAddedToCart implements _FetchProductsAddedToCart {
  const _$_FetchProductsAddedToCart();

  @override
  String toString() {
    return 'CartEvent.fetchProductsAddedToCart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchProductsAddedToCart);
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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return fetchProductsAddedToCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return fetchProductsAddedToCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (fetchProductsAddedToCart != null) {
      return fetchProductsAddedToCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return fetchProductsAddedToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return fetchProductsAddedToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (fetchProductsAddedToCart != null) {
      return fetchProductsAddedToCart(this);
    }
    return orElse();
  }
}

abstract class _FetchProductsAddedToCart implements CartEvent {
  const factory _FetchProductsAddedToCart() = _$_FetchProductsAddedToCart;
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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
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
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return upsertCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return upsertCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
      {List<MaterialInfo> items,
      RequestCounterOfferDetails counterOfferDetails});

  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails;
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
    Object? items = null,
    Object? counterOfferDetails = null,
  }) {
    return _then(_$_addHistoryItemsToCart(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      counterOfferDetails: null == counterOfferDetails
          ? _value.counterOfferDetails
          : counterOfferDetails // ignore: cast_nullable_to_non_nullable
              as RequestCounterOfferDetails,
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
}

/// @nodoc

class _$_addHistoryItemsToCart implements _addHistoryItemsToCart {
  const _$_addHistoryItemsToCart(
      {required final List<MaterialInfo> items,
      required this.counterOfferDetails})
      : _items = items;

  final List<MaterialInfo> _items;
  @override
  List<MaterialInfo> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final RequestCounterOfferDetails counterOfferDetails;

  @override
  String toString() {
    return 'CartEvent.addHistoryItemsToCart(items: $items, counterOfferDetails: $counterOfferDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addHistoryItemsToCart &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.counterOfferDetails, counterOfferDetails) ||
                other.counterOfferDetails == counterOfferDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), counterOfferDetails);

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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return addHistoryItemsToCart(items, counterOfferDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return addHistoryItemsToCart?.call(items, counterOfferDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (addHistoryItemsToCart != null) {
      return addHistoryItemsToCart(items, counterOfferDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return addHistoryItemsToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return addHistoryItemsToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
          {required final List<MaterialInfo> items,
          required final RequestCounterOfferDetails counterOfferDetails}) =
      _$_addHistoryItemsToCart;

  List<MaterialInfo> get items;
  RequestCounterOfferDetails get counterOfferDetails;
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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
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
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return upsertCartItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return upsertCartItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
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
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
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
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return getDetailsProductsAddedToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return getDetailsProductsAddedToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
  $Res call({Map<MaterialNumber, Price> priceProducts});
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
  }) {
    return _then(_$_UpdatePriceProduct(
      priceProducts: null == priceProducts
          ? _value._priceProducts
          : priceProducts // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, Price>,
    ));
  }
}

/// @nodoc

class _$_UpdatePriceProduct implements _UpdatePriceProduct {
  const _$_UpdatePriceProduct(
      {required final Map<MaterialNumber, Price> priceProducts})
      : _priceProducts = priceProducts;

  final Map<MaterialNumber, Price> _priceProducts;
  @override
  Map<MaterialNumber, Price> get priceProducts {
    if (_priceProducts is EqualUnmodifiableMapView) return _priceProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_priceProducts);
  }

  @override
  String toString() {
    return 'CartEvent.updatePriceProduct(priceProducts: $priceProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePriceProduct &&
            const DeepCollectionEquality()
                .equals(other._priceProducts, _priceProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_priceProducts));

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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return updatePriceProduct(priceProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return updatePriceProduct?.call(priceProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (updatePriceProduct != null) {
      return updatePriceProduct(priceProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return updatePriceProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return updatePriceProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
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
          {required final Map<MaterialNumber, Price> priceProducts}) =
      _$_UpdatePriceProduct;

  Map<MaterialNumber, Price> get priceProducts;
  @JsonKey(ignore: true)
  _$$_UpdatePriceProductCopyWith<_$_UpdatePriceProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateProductStockCopyWith<$Res> {
  factory _$$_UpdateProductStockCopyWith(_$_UpdateProductStock value,
          $Res Function(_$_UpdateProductStock) then) =
      __$$_UpdateProductStockCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateProductStockCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateProductStock>
    implements _$$_UpdateProductStockCopyWith<$Res> {
  __$$_UpdateProductStockCopyWithImpl(
      _$_UpdateProductStock _value, $Res Function(_$_UpdateProductStock) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateProductStock implements _UpdateProductStock {
  const _$_UpdateProductStock();

  @override
  String toString() {
    return 'CartEvent.updateProductStock()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdateProductStock);
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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return updateProductStock();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return updateProductStock?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (updateProductStock != null) {
      return updateProductStock();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return updateProductStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return updateProductStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (updateProductStock != null) {
      return updateProductStock(this);
    }
    return orElse();
  }
}

abstract class _UpdateProductStock implements CartEvent {
  const factory _UpdateProductStock() = _$_UpdateProductStock;
}

/// @nodoc
abstract class _$$_RemoveInvalidProductsCopyWith<$Res> {
  factory _$$_RemoveInvalidProductsCopyWith(_$_RemoveInvalidProducts value,
          $Res Function(_$_RemoveInvalidProducts) then) =
      __$$_RemoveInvalidProductsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialInfo> invalidCartItems});
}

/// @nodoc
class __$$_RemoveInvalidProductsCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_RemoveInvalidProducts>
    implements _$$_RemoveInvalidProductsCopyWith<$Res> {
  __$$_RemoveInvalidProductsCopyWithImpl(_$_RemoveInvalidProducts _value,
      $Res Function(_$_RemoveInvalidProducts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invalidCartItems = null,
  }) {
    return _then(_$_RemoveInvalidProducts(
      invalidCartItems: null == invalidCartItems
          ? _value._invalidCartItems
          : invalidCartItems // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ));
  }
}

/// @nodoc

class _$_RemoveInvalidProducts implements _RemoveInvalidProducts {
  const _$_RemoveInvalidProducts(
      {required final List<MaterialInfo> invalidCartItems})
      : _invalidCartItems = invalidCartItems;

  final List<MaterialInfo> _invalidCartItems;
  @override
  List<MaterialInfo> get invalidCartItems {
    if (_invalidCartItems is EqualUnmodifiableListView)
      return _invalidCartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invalidCartItems);
  }

  @override
  String toString() {
    return 'CartEvent.removeInvalidProducts(invalidCartItems: $invalidCartItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveInvalidProducts &&
            const DeepCollectionEquality()
                .equals(other._invalidCartItems, _invalidCartItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_invalidCartItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveInvalidProductsCopyWith<_$_RemoveInvalidProducts> get copyWith =>
      __$$_RemoveInvalidProductsCopyWithImpl<_$_RemoveInvalidProducts>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return removeInvalidProducts(invalidCartItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return removeInvalidProducts?.call(invalidCartItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (removeInvalidProducts != null) {
      return removeInvalidProducts(invalidCartItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return removeInvalidProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return removeInvalidProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (removeInvalidProducts != null) {
      return removeInvalidProducts(this);
    }
    return orElse();
  }
}

abstract class _RemoveInvalidProducts implements CartEvent {
  const factory _RemoveInvalidProducts(
          {required final List<MaterialInfo> invalidCartItems}) =
      _$_RemoveInvalidProducts;

  List<MaterialInfo> get invalidCartItems;
  @JsonKey(ignore: true)
  _$$_RemoveInvalidProductsCopyWith<_$_RemoveInvalidProducts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpsertCartItemsWithComboOffersCopyWith<$Res> {
  factory _$$_UpsertCartItemsWithComboOffersCopyWith(
          _$_UpsertCartItemsWithComboOffers value,
          $Res Function(_$_UpsertCartItemsWithComboOffers) then) =
      __$$_UpsertCartItemsWithComboOffersCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PriceAggregate> priceAggregates, bool isDeleteCombo});
}

/// @nodoc
class __$$_UpsertCartItemsWithComboOffersCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpsertCartItemsWithComboOffers>
    implements _$$_UpsertCartItemsWithComboOffersCopyWith<$Res> {
  __$$_UpsertCartItemsWithComboOffersCopyWithImpl(
      _$_UpsertCartItemsWithComboOffers _value,
      $Res Function(_$_UpsertCartItemsWithComboOffers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceAggregates = null,
    Object? isDeleteCombo = null,
  }) {
    return _then(_$_UpsertCartItemsWithComboOffers(
      priceAggregates: null == priceAggregates
          ? _value._priceAggregates
          : priceAggregates // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      isDeleteCombo: null == isDeleteCombo
          ? _value.isDeleteCombo
          : isDeleteCombo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpsertCartItemsWithComboOffers
    implements _UpsertCartItemsWithComboOffers {
  const _$_UpsertCartItemsWithComboOffers(
      {required final List<PriceAggregate> priceAggregates,
      required this.isDeleteCombo})
      : _priceAggregates = priceAggregates;

  final List<PriceAggregate> _priceAggregates;
  @override
  List<PriceAggregate> get priceAggregates {
    if (_priceAggregates is EqualUnmodifiableListView) return _priceAggregates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceAggregates);
  }

  @override
  final bool isDeleteCombo;

  @override
  String toString() {
    return 'CartEvent.upsertCartItemsWithComboOffers(priceAggregates: $priceAggregates, isDeleteCombo: $isDeleteCombo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpsertCartItemsWithComboOffers &&
            const DeepCollectionEquality()
                .equals(other._priceAggregates, _priceAggregates) &&
            (identical(other.isDeleteCombo, isDeleteCombo) ||
                other.isDeleteCombo == isDeleteCombo));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_priceAggregates), isDeleteCombo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpsertCartItemsWithComboOffersCopyWith<_$_UpsertCartItemsWithComboOffers>
      get copyWith => __$$_UpsertCartItemsWithComboOffersCopyWithImpl<
          _$_UpsertCartItemsWithComboOffers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return upsertCartItemsWithComboOffers(priceAggregates, isDeleteCombo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return upsertCartItemsWithComboOffers?.call(priceAggregates, isDeleteCombo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (upsertCartItemsWithComboOffers != null) {
      return upsertCartItemsWithComboOffers(priceAggregates, isDeleteCombo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return upsertCartItemsWithComboOffers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return upsertCartItemsWithComboOffers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (upsertCartItemsWithComboOffers != null) {
      return upsertCartItemsWithComboOffers(this);
    }
    return orElse();
  }
}

abstract class _UpsertCartItemsWithComboOffers implements CartEvent {
  const factory _UpsertCartItemsWithComboOffers(
      {required final List<PriceAggregate> priceAggregates,
      required final bool isDeleteCombo}) = _$_UpsertCartItemsWithComboOffers;

  List<PriceAggregate> get priceAggregates;
  bool get isDeleteCombo;
  @JsonKey(ignore: true)
  _$$_UpsertCartItemsWithComboOffersCopyWith<_$_UpsertCartItemsWithComboOffers>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateCartProductWithCounterOfferCopyWith<$Res> {
  factory _$$_UpdateCartProductWithCounterOfferCopyWith(
          _$_UpdateCartProductWithCounterOffer value,
          $Res Function(_$_UpdateCartProductWithCounterOffer) then) =
      __$$_UpdateCartProductWithCounterOfferCopyWithImpl<$Res>;
  @useResult
  $Res call({Price overriddenProductPrice});

  $PriceCopyWith<$Res> get overriddenProductPrice;
}

/// @nodoc
class __$$_UpdateCartProductWithCounterOfferCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateCartProductWithCounterOffer>
    implements _$$_UpdateCartProductWithCounterOfferCopyWith<$Res> {
  __$$_UpdateCartProductWithCounterOfferCopyWithImpl(
      _$_UpdateCartProductWithCounterOffer _value,
      $Res Function(_$_UpdateCartProductWithCounterOffer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overriddenProductPrice = null,
  }) {
    return _then(_$_UpdateCartProductWithCounterOffer(
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

class _$_UpdateCartProductWithCounterOffer
    implements _UpdateCartProductWithCounterOffer {
  const _$_UpdateCartProductWithCounterOffer(
      {required this.overriddenProductPrice});

  @override
  final Price overriddenProductPrice;

  @override
  String toString() {
    return 'CartEvent.updateCartProductWithCounterOffer(overriddenProductPrice: $overriddenProductPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateCartProductWithCounterOffer &&
            (identical(other.overriddenProductPrice, overriddenProductPrice) ||
                other.overriddenProductPrice == overriddenProductPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, overriddenProductPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCartProductWithCounterOfferCopyWith<
          _$_UpdateCartProductWithCounterOffer>
      get copyWith => __$$_UpdateCartProductWithCounterOfferCopyWithImpl<
          _$_UpdateCartProductWithCounterOffer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return updateCartProductWithCounterOffer(overriddenProductPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return updateCartProductWithCounterOffer?.call(overriddenProductPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (updateCartProductWithCounterOffer != null) {
      return updateCartProductWithCounterOffer(overriddenProductPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return updateCartProductWithCounterOffer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return updateCartProductWithCounterOffer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (updateCartProductWithCounterOffer != null) {
      return updateCartProductWithCounterOffer(this);
    }
    return orElse();
  }
}

abstract class _UpdateCartProductWithCounterOffer implements CartEvent {
  const factory _UpdateCartProductWithCounterOffer(
          {required final Price overriddenProductPrice}) =
      _$_UpdateCartProductWithCounterOffer;

  Price get overriddenProductPrice;
  @JsonKey(ignore: true)
  _$$_UpdateCartProductWithCounterOfferCopyWith<
          _$_UpdateCartProductWithCounterOffer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatePriceForIdMarketCopyWith<$Res> {
  factory _$$_UpdatePriceForIdMarketCopyWith(_$_UpdatePriceForIdMarket value,
          $Res Function(_$_UpdatePriceForIdMarket) then) =
      __$$_UpdatePriceForIdMarketCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialInfo> product});
}

/// @nodoc
class __$$_UpdatePriceForIdMarketCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdatePriceForIdMarket>
    implements _$$_UpdatePriceForIdMarketCopyWith<$Res> {
  __$$_UpdatePriceForIdMarketCopyWithImpl(_$_UpdatePriceForIdMarket _value,
      $Res Function(_$_UpdatePriceForIdMarket) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$_UpdatePriceForIdMarket(
      product: null == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ));
  }
}

/// @nodoc

class _$_UpdatePriceForIdMarket implements _UpdatePriceForIdMarket {
  const _$_UpdatePriceForIdMarket({required final List<MaterialInfo> product})
      : _product = product;

  final List<MaterialInfo> _product;
  @override
  List<MaterialInfo> get product {
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_product);
  }

  @override
  String toString() {
    return 'CartEvent.updatePriceForIdMarket(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePriceForIdMarket &&
            const DeepCollectionEquality().equals(other._product, _product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_product));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePriceForIdMarketCopyWith<_$_UpdatePriceForIdMarket> get copyWith =>
      __$$_UpdatePriceForIdMarketCopyWithImpl<_$_UpdatePriceForIdMarket>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return updatePriceForIdMarket(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return updatePriceForIdMarket?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (updatePriceForIdMarket != null) {
      return updatePriceForIdMarket(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return updatePriceForIdMarket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return updatePriceForIdMarket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (updatePriceForIdMarket != null) {
      return updatePriceForIdMarket(this);
    }
    return orElse();
  }
}

abstract class _UpdatePriceForIdMarket implements CartEvent {
  const factory _UpdatePriceForIdMarket(
      {required final List<MaterialInfo> product}) = _$_UpdatePriceForIdMarket;

  List<MaterialInfo> get product;
  @JsonKey(ignore: true)
  _$$_UpdatePriceForIdMarketCopyWith<_$_UpdatePriceForIdMarket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchGrandTotalPriceForIdMarketCopyWith<$Res> {
  factory _$$_FetchGrandTotalPriceForIdMarketCopyWith(
          _$_FetchGrandTotalPriceForIdMarket value,
          $Res Function(_$_FetchGrandTotalPriceForIdMarket) then) =
      __$$_FetchGrandTotalPriceForIdMarketCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchGrandTotalPriceForIdMarketCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_FetchGrandTotalPriceForIdMarket>
    implements _$$_FetchGrandTotalPriceForIdMarketCopyWith<$Res> {
  __$$_FetchGrandTotalPriceForIdMarketCopyWithImpl(
      _$_FetchGrandTotalPriceForIdMarket _value,
      $Res Function(_$_FetchGrandTotalPriceForIdMarket) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchGrandTotalPriceForIdMarket
    implements _FetchGrandTotalPriceForIdMarket {
  const _$_FetchGrandTotalPriceForIdMarket();

  @override
  String toString() {
    return 'CartEvent.fetchGrandTotalPriceForIdMarket()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchGrandTotalPriceForIdMarket);
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
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(PriceAggregate priceAggregate, int quantity)
        upsertCart,
    required TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)
        addHistoryItemsToCart,
    required TResult Function(PriceAggregate priceAggregate) upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function(List<MaterialInfo> product)
        updatePriceForIdMarket,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
  }) {
    return fetchGrandTotalPriceForIdMarket();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult? Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
  }) {
    return fetchGrandTotalPriceForIdMarket?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, int quantity)? upsertCart,
    TResult Function(List<MaterialInfo> items,
            RequestCounterOfferDetails counterOfferDetails)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate)? upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function(List<MaterialInfo> product)? updatePriceForIdMarket,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (fetchGrandTotalPriceForIdMarket != null) {
      return fetchGrandTotalPriceForIdMarket();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
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
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
  }) {
    return fetchGrandTotalPriceForIdMarket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
  }) {
    return fetchGrandTotalPriceForIdMarket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    required TResult orElse(),
  }) {
    if (fetchGrandTotalPriceForIdMarket != null) {
      return fetchGrandTotalPriceForIdMarket(this);
    }
    return orElse();
  }
}

abstract class _FetchGrandTotalPriceForIdMarket implements CartEvent {
  const factory _FetchGrandTotalPriceForIdMarket() =
      _$_FetchGrandTotalPriceForIdMarket;
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
  bool get isBuyAgain => throw _privateConstructorUsedError;
  bool get isAplProductLoading => throw _privateConstructorUsedError;
  bool get isDeleteCombo => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get config => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  Map<MaterialNumber, ProductMetaData> get additionInfo =>
      throw _privateConstructorUsedError;
  List<int> get upsertBonusItemInProgressHashCode =>
      throw _privateConstructorUsedError;
  AplSimulatorOrder get aplSimulatorOrder => throw _privateConstructorUsedError;

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
      bool isBuyAgain,
      bool isAplProductLoading,
      bool isDeleteCombo,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisationConfigs config,
      User user,
      Map<MaterialNumber, ProductMetaData> additionInfo,
      List<int> upsertBonusItemInProgressHashCode,
      AplSimulatorOrder aplSimulatorOrder});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get config;
  $UserCopyWith<$Res> get user;
  $AplSimulatorOrderCopyWith<$Res> get aplSimulatorOrder;
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
    Object? isBuyAgain = null,
    Object? isAplProductLoading = null,
    Object? isDeleteCombo = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? config = null,
    Object? user = null,
    Object? additionInfo = null,
    Object? upsertBonusItemInProgressHashCode = null,
    Object? aplSimulatorOrder = null,
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
      isBuyAgain: null == isBuyAgain
          ? _value.isBuyAgain
          : isBuyAgain // ignore: cast_nullable_to_non_nullable
              as bool,
      isAplProductLoading: null == isAplProductLoading
          ? _value.isAplProductLoading
          : isAplProductLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteCombo: null == isDeleteCombo
          ? _value.isDeleteCombo
          : isDeleteCombo // ignore: cast_nullable_to_non_nullable
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      additionInfo: null == additionInfo
          ? _value.additionInfo
          : additionInfo // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, ProductMetaData>,
      upsertBonusItemInProgressHashCode: null ==
              upsertBonusItemInProgressHashCode
          ? _value.upsertBonusItemInProgressHashCode
          : upsertBonusItemInProgressHashCode // ignore: cast_nullable_to_non_nullable
              as List<int>,
      aplSimulatorOrder: null == aplSimulatorOrder
          ? _value.aplSimulatorOrder
          : aplSimulatorOrder // ignore: cast_nullable_to_non_nullable
              as AplSimulatorOrder,
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

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AplSimulatorOrderCopyWith<$Res> get aplSimulatorOrder {
    return $AplSimulatorOrderCopyWith<$Res>(_value.aplSimulatorOrder, (value) {
      return _then(_value.copyWith(aplSimulatorOrder: value) as $Val);
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
      bool isBuyAgain,
      bool isAplProductLoading,
      bool isDeleteCombo,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisationConfigs config,
      User user,
      Map<MaterialNumber, ProductMetaData> additionInfo,
      List<int> upsertBonusItemInProgressHashCode,
      AplSimulatorOrder aplSimulatorOrder});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get config;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $AplSimulatorOrderCopyWith<$Res> get aplSimulatorOrder;
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
    Object? isBuyAgain = null,
    Object? isAplProductLoading = null,
    Object? isDeleteCombo = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? config = null,
    Object? user = null,
    Object? additionInfo = null,
    Object? upsertBonusItemInProgressHashCode = null,
    Object? aplSimulatorOrder = null,
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
      isBuyAgain: null == isBuyAgain
          ? _value.isBuyAgain
          : isBuyAgain // ignore: cast_nullable_to_non_nullable
              as bool,
      isAplProductLoading: null == isAplProductLoading
          ? _value.isAplProductLoading
          : isAplProductLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteCombo: null == isDeleteCombo
          ? _value.isDeleteCombo
          : isDeleteCombo // ignore: cast_nullable_to_non_nullable
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      additionInfo: null == additionInfo
          ? _value._additionInfo
          : additionInfo // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, ProductMetaData>,
      upsertBonusItemInProgressHashCode: null ==
              upsertBonusItemInProgressHashCode
          ? _value._upsertBonusItemInProgressHashCode
          : upsertBonusItemInProgressHashCode // ignore: cast_nullable_to_non_nullable
              as List<int>,
      aplSimulatorOrder: null == aplSimulatorOrder
          ? _value.aplSimulatorOrder
          : aplSimulatorOrder // ignore: cast_nullable_to_non_nullable
              as AplSimulatorOrder,
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
      required this.isBuyAgain,
      required this.isAplProductLoading,
      required this.isDeleteCombo,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.config,
      required this.user,
      required final Map<MaterialNumber, ProductMetaData> additionInfo,
      required final List<int> upsertBonusItemInProgressHashCode,
      required this.aplSimulatorOrder})
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
  final bool isBuyAgain;
  @override
  final bool isAplProductLoading;
  @override
  final bool isDeleteCombo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final SalesOrganisationConfigs config;
  @override
  final User user;
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
  final AplSimulatorOrder aplSimulatorOrder;

  @override
  String toString() {
    return 'CartState(cartProducts: $cartProducts, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isFetching: $isFetching, isClearing: $isClearing, isFetchingBonus: $isFetchingBonus, isFetchingCartProductDetail: $isFetchingCartProductDetail, isUpserting: $isUpserting, isMappingPrice: $isMappingPrice, isUpdatingStock: $isUpdatingStock, isBuyAgain: $isBuyAgain, isAplProductLoading: $isAplProductLoading, isDeleteCombo: $isDeleteCombo, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, config: $config, user: $user, additionInfo: $additionInfo, upsertBonusItemInProgressHashCode: $upsertBonusItemInProgressHashCode, aplSimulatorOrder: $aplSimulatorOrder)';
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
            (identical(other.isBuyAgain, isBuyAgain) ||
                other.isBuyAgain == isBuyAgain) &&
            (identical(other.isAplProductLoading, isAplProductLoading) ||
                other.isAplProductLoading == isAplProductLoading) &&
            (identical(other.isDeleteCombo, isDeleteCombo) ||
                other.isDeleteCombo == isDeleteCombo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._additionInfo, _additionInfo) &&
            const DeepCollectionEquality().equals(
                other._upsertBonusItemInProgressHashCode,
                _upsertBonusItemInProgressHashCode) &&
            (identical(other.aplSimulatorOrder, aplSimulatorOrder) ||
                other.aplSimulatorOrder == aplSimulatorOrder));
  }

  @override
  int get hashCode => Object.hashAll([
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
        isBuyAgain,
        isAplProductLoading,
        isDeleteCombo,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        config,
        user,
        const DeepCollectionEquality().hash(_additionInfo),
        const DeepCollectionEquality().hash(_upsertBonusItemInProgressHashCode),
        aplSimulatorOrder
      ]);

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
      required final bool isBuyAgain,
      required final bool isAplProductLoading,
      required final bool isDeleteCombo,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final SalesOrganisationConfigs config,
      required final User user,
      required final Map<MaterialNumber, ProductMetaData> additionInfo,
      required final List<int> upsertBonusItemInProgressHashCode,
      required final AplSimulatorOrder aplSimulatorOrder}) = _$_CartState;
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
  bool get isBuyAgain;
  @override
  bool get isAplProductLoading;
  @override
  bool get isDeleteCombo;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  SalesOrganisationConfigs get config;
  @override
  User get user;
  @override
  Map<MaterialNumber, ProductMetaData> get additionInfo;
  @override
  List<int> get upsertBonusItemInProgressHashCode;
  @override
  AplSimulatorOrder get aplSimulatorOrder;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
