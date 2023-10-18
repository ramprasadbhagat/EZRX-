part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required List<PriceAggregate> cartProducts,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required bool isClearing,
    required bool isFetchingBonus,
    required bool isFetchingCartProductDetail,
    required bool isUpserting,
    required bool isMappingPrice,
    required bool isUpdatingStock,
    required bool isBuyAgain,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrganisationConfigs config,
    required User user,
    required Map<MaterialNumber, ProductMetaData> additionInfo,
    required List<int> upsertBonusItemInProgressHashCode,
  }) = _CartState;

  factory CartState.initial() => CartState(
        cartProducts: <PriceAggregate>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        isClearing: false,
        isFetchingBonus: false,
        isFetchingCartProductDetail: false,
        isUpserting: false,
        isMappingPrice: false,
        isUpdatingStock: false,
        isBuyAgain: false,
        config: SalesOrganisationConfigs.empty(),
        user: User.empty(),
        additionInfo: <MaterialNumber, ProductMetaData>{},
        upsertBonusItemInProgressHashCode: [],
        shipToInfo: ShipToInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
      );

  bool get containCovidMaterial =>
      cartProducts.any((e) => e.materialInfo.materialGroup4.isFOC);

  bool get containFocMaterial =>
      cartProducts.any((e) => e.materialInfo.isFOCMaterial);

  bool get containFocMaterialInCartProduct =>
      cartProducts.any((e) => e.materialInfo.isFOCMaterial);

  bool get containNonFocMaterial =>
      cartProducts.any((e) => !e.materialInfo.isFOCMaterial);

  bool get containNonCovidMaterial =>
      cartProducts.any((e) => !e.materialInfo.materialGroup4.isFOC);

  bool get containNonFocMaterialOT =>
      cartProducts.any((e) => !e.materialInfo.isFOCMaterial);

  bool get containSampleMaterial =>
      cartProducts.any((e) => e.materialInfo.isSampleMaterial);

  bool get containNonSampleMaterial =>
      cartProducts.any((element) => !element.materialInfo.isSampleMaterial);

  bool get containsSampleBonus => cartProducts
      .any((element) => element.convertedSampleBonusList.isNotEmpty);

  bool get containNonRegularMaterial => cartProducts.any(
        (element) =>
            !element.materialInfo.isFOCMaterial ||
            !element.materialInfo.isSampleMaterial,
      );

  bool get containsSpecialOrderTypeMaterials => cartProducts
      .any((element) => element.materialInfo.isSpecialOrderTypeMaterial);

  bool get isBonusRestricted =>
      containsSpecialOrderTypeMaterials || cartProducts.isEmpty;

  int zmgMaterialQuantityForGroupDiscount(PriceAggregate material) {
    return zmgMaterialsQty(
          material.materialInfo.materialGroup2,
        ) -
        totalQty;
  }

  int get totalQty =>
      cartProducts.fold<int>(0, (sum, item) => sum + item.quantity);

  int zmgMaterialsQty(MaterialGroup group2) => cartProducts
      .where(
        (e) => e.price.zmgDiscount && e.materialInfo.materialGroup2 == group2,
      )
      .fold(0, (sum, e) => sum + e.quantity);

  String dialogContent(OrderDocumentType selected) =>
      selected.documentType.isSpecialOrderType
          ? selected.documentType.isZPFB && containNonSampleMaterial
              ? 'non-sample'
              : selected.documentType.isZPFC && containNonFocMaterialOT
                  ? 'non-FOC'
                  : ''
          : containNonRegularMaterial
              ? 'FOC and/or sample'
              : '';

  bool showDialog(OrderDocumentType orderType) {
    return orderType.documentType.isZPFB
        ? containNonSampleMaterial
        : orderType.documentType.isZPFC
            ? containNonFocMaterialOT
            : orderType.documentType.isZPOR
                ? containNonRegularMaterial
                : false;
  }

  double get grandTotal =>
      totalBundlePriceWithTax +
      cartProducts
          .where(
            (item) =>
                !item.materialInfo.hidePrice &&
                !item.materialInfo.type.typeBundle,
          )
          .fold<double>(
            0,
            (sum, item) => sum + item.finalPriceTotal,
          ) +
      taxMaterial +
      totalComboPriceWithTax;

  double get subTotal =>
      totalBundlesPrice +
      cartProducts
          .where(
            (item) =>
                !item.materialInfo.hidePrice &&
                !item.materialInfo.type.typeBundle,
          )
          .fold<double>(
            0,
            (sum, item) => sum + item.finalPriceTotal,
          );

  int getQuantityOfProduct({required MaterialNumber productNumber}) {
    return cartProducts
            .where(
              (element) => element.materialInfo.materialNumber == productNumber,
            )
            .elementAtOrNull(0)
            ?.quantity ??
        0;
  }

  int getQuantityOfBundle({
    required String bundleCode,
    required MaterialNumber materialNumber,
  }) {
    return cartProducts
            .where((element) => element.bundle.bundleCode == bundleCode)
            .elementAtOrNull(0)
            ?.bundle
            .materials
            .where((element) => element.materialNumber == materialNumber)
            .elementAtOrNull(0)
            ?.quantity
            .getOrDefaultValue(0) ??
        0;
  }

  double get totalMaterialsPrice => cartProducts.fold(
        0,
        (previousValue, element) => element.materialInfo.type.typeBundle
            ? previousValue
            : previousValue +
                (element.price.finalPrice.getValue() * element.quantity),
      );

  double get taxMaterial => config.displaySubtotalTaxBreakdown
      ? cartProducts
          .where(
            (item) =>
                !item.materialInfo.hidePrice &&
                !item.materialInfo.type.typeBundle,
          )
          .fold<double>(
            0,
            (sum, item) =>
                sum +
                (item.price.finalPrice.getValue() *
                    item.quantity *
                    _totalTaxPercentInDouble /
                    100),
          )
      : 0.0;

  double itemPrice({required int index}) {
    final cartProductsTemp = cartProducts.elementAt(index);

    return cartProductsTemp.price.finalPrice.getValue() *
        cartProductsTemp.quantity;
  }

  int getTotalQuantityOfProductBundle({required String bundleCode}) {
    return cartProducts
            .where((element) => element.bundle.bundleCode == bundleCode)
            .elementAtOrNull(0)
            ?.bundle
            .materials
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.quantity.intValue,
            ) ??
        0;
  }

  BundleInfo currentBundleOffer({required String bundleCode}) {
    final bundle = cartProducts
            .where((element) => element.bundle.bundleCode == bundleCode)
            .elementAtOrNull(0)
            ?.bundle ??
        Bundle.empty();

    return bundle.sortedBundleInformation.reversed.firstWhere(
      (element) =>
          element.quantity <=
          getTotalQuantityOfProductBundle(bundleCode: bundleCode),
      orElse: () =>
          bundle.sortedBundleInformation.firstOrNull ?? BundleInfo.empty(),
    );
  }

  double itemBundlePrice({required String bundleCode}) =>
      currentBundleOffer(bundleCode: bundleCode).rate *
      getTotalQuantityOfProductBundle(bundleCode: bundleCode);

  double get totalBundlesPrice => cartProducts
      .where((element) => element.materialInfo.type.typeBundle)
      .fold(
        0,
        (previousValue, element) =>
            previousValue +
            itemBundlePrice(bundleCode: element.bundle.bundleCode),
      );

  double get totalComboPrice =>
      cartProducts.where((element) => element.materialInfo.type.typeCombo).fold(
            0,
            (previousValue, element) =>
                previousValue + element.comboSubTotalExclTax,
          );

  PriceAggregate updatedCartProduct(MaterialNumber matNumber) =>
      cartProducts.firstWhere(
        (element) => element.getMaterialNumber == matNumber,
        orElse: () => PriceAggregate.empty(),
      );

  double get taxBundle => cartProducts
      .where((element) => element.materialInfo.type.typeBundle)
      .fold(
        0,
        (previousValue, element) =>
            previousValue +
            (itemBundlePrice(bundleCode: element.bundle.bundleCode) *
                element.salesOrgConfig.vatValue /
                100),
      );

  double get totalComboPriceWithTax => totalComboPrice;

  /*
    It's there just as a placeholder but for now we don't have much clarity 
    that we have any tax calculation for bundle materials
  */
  double get totalBundlePriceWithTax => totalBundlesPrice;

  double get totalMaterialPriceWithTax => totalMaterialsPrice + taxMaterial;

  double get totalPriceWithTax =>
      totalMaterialPriceWithTax +
      totalBundlePriceWithTax +
      totalComboPriceWithTax;

  int get totalItems => cartProducts.fold(
        0,
        (previousValue, element) => !element.materialInfo.type.typeBundle
            ? previousValue + 1
            : previousValue + element.bundle.materials.length,
      );

  bool get isOOSOrderPresent =>
      cartProducts.any((element) => element.isAnyOOSItemPresentInCart);

  bool get isBundleQuantitySatisfies => cartProducts
      .where((element) => element.materialInfo.type.typeBundle)
      .map((e) => e.bundle)
      .every(
        (element) =>
            getTotalQuantityOfProductBundle(
              bundleCode: element.bundleCode,
            ) >=
            element.minimumQuantityBundleMaterial.quantity,
      );

  bool showManufacturerName(int index) {
    return index == 0 ||
        cartProducts[index]
                .materialInfo
                .principalData
                .principalName
                .getValue() !=
            cartProducts[index - 1]
                .materialInfo
                .principalData
                .principalName
                .getValue();
  }

  double get materialLevelFinalPriceWithTaxForFullTax => cartProducts
      .where((element) => element.materialInfo.taxClassification.isFullTax)
      .fold<double>(
        0.0,
        (previousValue, element) =>
            previousValue + (element.finalPrice * element.materialInfo.tax),
      );

  double get materialLevelEligibleTotalFinalPrice => cartProducts
      .where((element) => element.materialInfo.taxClassification.isFullTax)
      .fold<double>(
        0.0,
        (previousValue, element) => previousValue + element.finalPrice,
      );

  String get totalTaxPercent => _totalTaxPercentInDouble
      .toString()
      .replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');

  double get _totalTaxPercentInDouble {
    if (!config.isMarketEligibleForTaxClassification) {
      return config.vatValue.toDouble();
    }

    final taxPercent = materialLevelFinalPriceWithTaxForFullTax /
        materialLevelEligibleTotalFinalPrice;

    if (taxPercent.isNaN) {
      // Handle the case where the division results in NaN.
      return 0.0; // or any other suitable value
    }

    return taxPercent;
  }

  bool isEligibleForCheckout(bool isOOSOrderEligibleToProceed) =>
      ((isOOSOrderPresent && isOOSOrderEligibleToProceed) ||
          !isOOSOrderPresent) &&
      isBundleQuantitySatisfies;

  List<PriceAggregate> get allMaterial => cartProducts
      .expand(
        (e) => e.materialInfo.type.typeBundle
            ? e.bundleMaterialsPriceAggregate
            : [e],
      )
      .toList();

  bool get isHavingMoreThanOnePreOrderInCart =>
      cartProducts.where((e) => e.isPreOrder).toList().length > 1;

  bool get priceUnderLoadingShimmer =>
      isFetchingCartProductDetail ||
      isUpserting ||
      isUpdatingStock ||
      isMappingPrice;

  List<MaterialInfo> get invalidSampleBonusList =>
      cartProducts.expand((item) => item.convertedSampleBonusList).toList();

  bool get isCartDetailsFetching =>
      isUpdatingStock ||
      isUpserting ||
      isFetchingCartProductDetail ||
      isMappingPrice;

  List<MaterialInfo> get productsWithCounterOfferPrice => cartProducts
      .where(
        (element) =>
            isPriceOverrideDisabled &&
            element.materialInfo.counterOfferDetails.counterOfferPrice
                .isValid(),
      )
      .map(
        (e) => e.materialInfo.copyWith(
          counterOfferDetails: e.materialInfo.counterOfferDetails
              .copyWith(counterOfferPrice: CounterOfferValue('0')),
        ),
      )
      .toList();

  List<MaterialInfo> get productsWithCounterOfferDiscount => cartProducts
      .where(
        (element) =>
            !config.enableZDP8Override &&
            element.materialInfo.counterOfferDetails.discountOverridePercentage
                .isValid(),
      )
      .map(
        (e) => e.materialInfo.copyWith(
          counterOfferDetails: e.materialInfo.counterOfferDetails.copyWith(
            discountOverridePercentage: CounterOfferDiscountValue('0'),
          ),
        ),
      )
      .toList();

  bool get isPriceOverrideDisabled =>
      !user.role.type.isSalesRepRole && !config.priceOverride;

  bool get isCounterOfferProductResetRequired =>
      productsWithCounterOfferPrice.isNotEmpty ||
      productsWithCounterOfferDiscount.isNotEmpty;
}
