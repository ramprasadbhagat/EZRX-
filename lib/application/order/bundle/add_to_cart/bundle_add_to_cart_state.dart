part of 'bundle_add_to_cart_bloc.dart';

@freezed
class BundleAddToCartState with _$BundleAddToCartState {
  const BundleAddToCartState._();
  const factory BundleAddToCartState({
    required MaterialInfo bundle,
    required List<MaterialInfo> bundleMaterials,
    required bool showErrorMessage,
  }) = _BundleAddToCartState;

  factory BundleAddToCartState.initial() => BundleAddToCartState(
        bundle: MaterialInfo.empty(),
        bundleMaterials: <MaterialInfo>[],
        showErrorMessage: false,
      );

  int get totalCount => bundleMaterials.fold<int>(
        0,
        (sum, element) => sum + element.quantity.intValue,
      );

  BundleInfo get bundleOffer =>
      bundle.bundle.sortedBundleInformation.reversed.firstWhere(
        (element) => element.quantity <= totalCount,
        orElse: () =>
            bundle.bundle.sortedBundleInformation.firstOrNull ??
            BundleInfo.empty(),
      );

  List<MaterialInfo> get bundleMaterialsSelected => bundleMaterials
      .where((element) => element.quantity.intValue > 0)
      .toList();

  bool get isBundleCountSatisfied =>
      totalCount >= bundle.bundle.minimumQuantityBundleMaterial.quantity;

  int _materialInCart(PriceAggregate materialInCart, MaterialInfo info) =>
      materialInCart.bundle.materials
          .firstWhere(
            (element) => element.materialNumber == info.materialNumber,
            orElse: () => MaterialInfo.empty(),
          )
          .quantity
          .intValue;

  List<MaterialInfo> selectedMaterialInfo(PriceAggregate materialInCart) =>
      bundleMaterialsSelected
          .map(
            (e) => e.copyWith(
              quantity: MaterialQty(
                e.quantity.intValue + _materialInCart(materialInCart, e),
              ),
            ),
          )
          .toList();

  bool get displayErrorMessage => showErrorMessage && !isBundleCountSatisfied;
}
