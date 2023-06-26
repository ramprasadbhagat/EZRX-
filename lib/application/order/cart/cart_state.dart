part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required List<CartItem> cartItems,
    required List<CartProduct> cartProducts,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required bool isClearing,
    required bool isFetchingBonus,
  }) = _CartState;

  factory CartState.initial() => CartState(
        cartItems: <CartItem>[],
        cartProducts: <CartProduct>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        isClearing: false,
        isFetchingBonus: false,
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

  bool get containNonRegularMaterial => cartItems.allMaterials.any((element) =>
      !element.materialInfo.isFOCMaterial ||
      !element.materialInfo.isSampleMaterial);

  List<CartItem> get getCartItemMaterialList => cartItems
      .where((element) => element.itemType == CartItemType.material)
      .toList();

  bool get containsSpecialOrderTypeMaterials => cartItems.allMaterials
      .any((element) => element.materialInfo.isSpecialOrderTypeMaterial);

  bool get isBonusRestricted =>
      containsSpecialOrderTypeMaterials || getCartItemMaterialList.isEmpty;

  String dialogContent(OrderDocumentType initial, OrderDocumentType selected) =>
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
}
