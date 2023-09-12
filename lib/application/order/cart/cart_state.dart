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
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrganisationConfigs config,
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
        config: SalesOrganisationConfigs.empty(),
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
          .where((item) =>
              !item.materialInfo.hidePrice &&
              !item.materialInfo.type.typeBundle,)
          .fold<double>(
            0,
            (sum, item) => sum + item.unitPriceTotal + taxMaterial,
          );

  double get subTotal =>
      totalBundlesPrice +
      cartProducts
          .where((item) =>
              !item.materialInfo.hidePrice &&
              !item.materialInfo.type.typeBundle,)
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

  double get totalMaterialsPrice => cartProducts.fold(
        0,
        (previousValue, element) => element.materialInfo.type.typeBundle
            ? previousValue
            : previousValue +
                (element.price.finalPrice.getValue() * element.quantity),
      );

  double get totalMaterialPriceWithTax => totalMaterialsPrice + taxMaterial;

  double get taxMaterial => cartProducts
      .where((item) =>
          !item.materialInfo.hidePrice && !item.materialInfo.type.typeBundle,)
      .fold<double>(
        0,
        (sum, item) =>
            sum +
            (item.price.finalPrice.getValue() *
                item.quantity *
                _totalTaxPercentInDouble /
                100),
      );

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
                  (previousValue ?? 0) + element.quantity,
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

  PriceAggregate updatedCartProduct(MaterialNumber matNumber) => cartProducts
      .firstWhere((element) => element.getMaterialNumber == matNumber);

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
/*
    It's there just as a placeholder but for now we don't have much clarity 
    that we have any tax calculation for bundle materials
  */
  double get totalBundlePriceWithTax => totalBundlesPrice;

  double get totalTax => taxMaterial;

  double get totalPrice => totalMaterialsPrice + totalBundlesPrice;

  double get totalPriceWithTax =>
      totalMaterialPriceWithTax + totalBundlePriceWithTax;

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
            previousValue +
            (element.finalPrice * element.materialInfo.materialTax),
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

  double get _totalTaxPercentInDouble => config
          .isMarketEligibleForTaxClassification
      ? materialLevelFinalPriceWithTaxForFullTax /
          materialLevelEligibleTotalFinalPrice
      : config.vatValue.toDouble();

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
}
