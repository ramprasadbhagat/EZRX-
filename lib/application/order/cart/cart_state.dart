part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required List<PriceAggregate> cartItemList,
    required List<MaterialNumber> selectedItemsMaterialNumber,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required Remarks remarks,
    required bool showErrorMessages,
    required bool isRemarksAdding,
  }) = _CartState;

  factory CartState.initial() => CartState(
        cartItemList: <PriceAggregate>[],
        selectedItemsMaterialNumber: <MaterialNumber>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        remarks: Remarks(''),
        showErrorMessages: false,
        isRemarksAdding: false,
      );

  double get subtotal => selectedDisplayCartItems.fold<double>(
        0,
        (sum, item) => sum + item.subTotalPrice,
      );

  double get grandTotal => selectedDisplayCartItems.fold<double>(
        0,
        (sum, item) => sum + item.grandTotalPrice,
      );

  double get vatTotal => grandTotal - subtotal;

  int get zmgMaterialCount => cartItemList.fold<int>(
        0,
        (sum, item) => sum + (item.price.zmgDiscount ? item.quantity : 0),
      );

  bool get containFocMaterial =>
      cartItemList.any((e) => e.materialInfo.materialGroup4.isFOC);

  bool get containNonFocMaterial =>
      cartItemList.any((e) => !e.materialInfo.materialGroup4.isFOC);

  bool get containNonFocMaterialOT =>
      cartItemList.any((e) => !e.materialInfo.isFOCMaterial);

  bool get containSampleMaterial =>
      cartItemList.any((e) => e.materialInfo.isSampleMaterial);

  bool get containNonSampleMaterial =>
      cartItemList.any((element) => !element.materialInfo.isSampleMaterial);

  bool get containNonRegularMaterial => cartItemList.any((element) =>
      !element.materialInfo.isFOCMaterial ||
      !element.materialInfo.isSampleMaterial);

  String get dialogContent => containNonSampleMaterial
      ? 'non-sample'
      : containNonFocMaterialOT
          ? 'non-FOC'
          : containNonRegularMaterial
              ? 'only sample and/or FOC'
              : '';

  bool showDialog(OrderDocumentType orderType) {
    return orderType.isZPFB
        ? containNonSampleMaterial
        : orderType.isZPFC
            ? containNonFocMaterialOT
            : orderType.isZPOR
                ? containNonRegularMaterial
                : false;
  }

  List<PriceAggregate> get selectedItemList => cartItemList
      .where((element) => selectedItemsMaterialNumber
          .contains(element.materialInfo.materialNumber))
      .toList();

  List<CartItem> get selectedDisplayCartItems {
    final selectedItemList = displayCartItems
        .map(
          (cartItem) => cartItem.copyWith(
            materials: cartItem.materials
                .where((material) => selectedItemsMaterialNumber
                    .contains(material.materialInfo.materialNumber))
                .toList(),
          ),
        )
        .toList();

    return selectedItemList;
  }

  List<CartItem> get displayCartItems {
    final displayCartItems = <String, CartItem>{};
    for (final material in cartItemList) {
      if (material.isFromBundle) {
        final bundleCode = material.bundle.bundleCode;
        if (displayCartItems[bundleCode] == null) {
          displayCartItems.addAll(
            {
              bundleCode: CartItem(
                materials: [material],
                itemType: CartItemType.bundle,
              ),
            },
          );
        } else {
          displayCartItems[bundleCode] =
              displayCartItems[bundleCode]!.copyWithNewItem(material);
        }
      } else {
        final materialCode = material.materialNumberString;
        displayCartItems.addAll(
          {
            materialCode: CartItem(
              materials: [material],
              itemType: CartItemType.material,
            ),
          },
        );
      }
    }

    return displayCartItems.values.toList();
  }

  int onAddCartDiscountMaterialCount(PriceAggregate addedCartItem) =>
      cartItemList.fold<int>(
        0,
        (sum, item) =>
            sum +
            ((item.price.zmgDiscount && addedCartItem.price.zmgDiscount) ||
                    (addedCartItem.price.isTireDiscountEligible &&
                        item.price.isTireDiscountEligible &&
                        item.getMaterialNumber ==
                            addedCartItem.getMaterialNumber)
                ? item.quantity
                : 0),
      );

  int onUpdateDiscountMaterialCount(PriceAggregate ubdatedCartItem) =>
      cartItemList.fold<int>(
        0,
        (sum, item) =>
            sum +
            ((item.price.zmgDiscount &&
                    ubdatedCartItem.price.zmgDiscount &&
                    item.getMaterialNumber != ubdatedCartItem.getMaterialNumber)
                ? item.quantity
                : 0),
      );
}
