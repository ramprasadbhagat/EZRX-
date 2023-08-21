part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required List<CartItem> cartItems,
    required List<PriceAggregate> cartProducts,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required bool isClearing,
    required bool isFetchingBonus,
    required bool isFetchingCartProductDetail,
    required bool isUpserting,
    required bool isMappingPrice,
    required bool isUpdatingStock,
    required Map<MaterialNumber, ProductMetaData> additionInfo,
  }) = _CartState;

  factory CartState.initial() => CartState(
        cartItems: <CartItem>[],
        cartProducts: <PriceAggregate>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        isClearing: false,
        isFetchingBonus: false,
        isFetchingCartProductDetail: false,
        isUpserting: false,
        isMappingPrice: false,
        isUpdatingStock: false,
        additionInfo: <MaterialNumber, ProductMetaData>{},
      );

  double subTotal({
    required bool isMYMarketSalesRep,
  }) =>
      selectedCartItems.fold<double>(
        0,
        (sum, item) =>
            sum +
            item.subTotalPrice(
              isSpecialOrderType: item.materials.first.isSpecialOrderTypeNotTH,
              isMYMarketSalesRep: isMYMarketSalesRep,
            ),
      );

  double grandTotal({
    required bool isMYMarketSalesRep,
  }) =>
      selectedCartItems.fold<double>(
        0,
        (sum, item) =>
            sum +
            item.grandTotalPrice(
              isSpecialOrderType: item.materials.first.isSpecialOrderTypeNotTH,
              isMYMarketSalesRep: isMYMarketSalesRep,
            ),
      );

  double vatTotalOnOrderType({
    required bool isMYMarketSalesRep,
  }) =>
      grandTotal(
        isMYMarketSalesRep: isMYMarketSalesRep,
      ) -
      subTotal(
        isMYMarketSalesRep: isMYMarketSalesRep,
      );

  int zmgMaterialCount({required MaterialGroup itemMaterialGroup}) =>
      cartItems.zmgMaterialsQty(
        itemMaterialGroup,
      );

  bool get containCovidMaterial =>
      cartItems.allMaterials.any((e) => e.materialInfo.materialGroup4.isFOC);

  bool get containFocMaterial =>
      cartItems.allMaterials.any((e) => e.materialInfo.isFOCMaterial);

  bool get containNonFocMaterial =>
      cartItems.allMaterials.any((e) => !e.materialInfo.isFOCMaterial);

  bool get containNonCovidMaterial =>
      cartItems.allMaterials.any((e) => !e.materialInfo.materialGroup4.isFOC);

  bool get containNonFocMaterialOT =>
      cartItems.allMaterials.any((e) => !e.materialInfo.isFOCMaterial);

  bool get containSampleMaterial =>
      cartItems.allMaterials.any((e) => e.materialInfo.isSampleMaterial);

  bool get containNonSampleMaterial => cartItems.allMaterials
      .any((element) => !element.materialInfo.isSampleMaterial);

  bool get containNonRegularMaterial => cartItems.allMaterials.any(
        (element) =>
            !element.materialInfo.isFOCMaterial ||
            !element.materialInfo.isSampleMaterial,
      );

  List<CartItem> get getCartItemMaterialList => cartItems
      .where((element) => element.itemType == CartItemType.material)
      .toList();

  bool get containsSpecialOrderTypeMaterials => cartItems.allMaterials
      .any((element) => element.materialInfo.isSpecialOrderTypeMaterial);

  bool get isBonusRestricted =>
      containsSpecialOrderTypeMaterials || getCartItemMaterialList.isEmpty;

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

  List<CartItem> get selectedCartItems =>
      cartItems.where((item) => item.isSelected).toList();

  int zmgMaterialWithoutMaterial(PriceAggregate material) {
    final cartMaterial = getMaterialCartItem(material: material);
    final itemQty =
        cartMaterial == CartItem.materialEmpty() ? 0 : cartMaterial.totalQty;

    return zmgMaterialCount(
          itemMaterialGroup: material.materialInfo.materialGroup2,
        ) -
        itemQty;
  }

  CartItem getMaterialCartItem({
    required PriceAggregate material,
  }) {
    return cartItems.firstWhere(
      (item) =>
          item.itemType == CartItemType.material &&
          item.materials
              .map((e) => e.getMaterialNumber)
              .contains(material.getMaterialNumber),
      orElse: () => CartItem.materialEmpty(),
    );
  }

  CartItem getComboDealCartItem({
    required PriceComboDeal comboDealQuery,
  }) {
    // Currently, since each ComboDeal will have its id defined as {salesDeal}-{flexibleGroup}-{scheme}
    // so I use startWith() to check if the added material already had its combo deal in cart
    return cartItems.firstWhere(
      (item) =>
          item.itemType == CartItemType.comboDeal &&
          item.materials.first.comboDealId.startsWith(comboDealQuery.id),
      orElse: () => CartItem.comboDeal([]),
    );
  }

  bool get batchNotSelected => selectedCartItems.any(
        (element) =>
            element.itemType == CartItemType.material &&
            element.materials.first.salesOrgConfig.enableBatchNumber &&
            !element.materials.first.stockInfo.batch.isValid(),
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

  double get totalMaterialsPrice => cartProducts
      .where((element) => !element.materialInfo.type.typeBundle)
      .fold(
        0,
        (previousValue, element) =>
            previousValue +
            (element.price.finalPrice.getValue() * element.quantity),
      );

  double get totalMaterialPriceWithTax => totalMaterialsPrice + taxMaterial;

  double get taxMaterial => cartProducts
      .where((element) => !element.materialInfo.type.typeBundle)
      .fold(
        0,
        (previousValue, element) =>
            previousValue +
            (element.price.finalPrice.getValue() *
                element.quantity *
                element.itemTaxPercent /
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

  double totalTaxPercent(SalesOrganisationConfigs config) =>
      config.isMarketEligibleForTaxClassification
          ? materialLevelFinalPriceWithTaxForFullTax /
              materialLevelEligibleTotalFinalPrice
          : config.vatValue.toDouble();
}
