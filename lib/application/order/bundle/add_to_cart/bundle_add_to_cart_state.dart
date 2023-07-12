part of 'bundle_add_to_cart_bloc.dart';

@freezed
class BundleAddToCartState with _$BundleAddToCartState {
  const BundleAddToCartState._();
  const factory BundleAddToCartState({
    required MaterialInfo bundle,
    required List<MaterialInfo> bundleMaterials,
  }) = _BundleAddToCartState;

  factory BundleAddToCartState.initial() => BundleAddToCartState(
        bundle: MaterialInfo.empty(),
        bundleMaterials: <MaterialInfo>[],
      );

  int get totalCount =>
      bundleMaterials.fold<int>(0, (sum, element) => sum + element.quantity);

  BundleInfo get bundleOffer =>
      bundle.bundle.sortedBundleInformation.reversed.firstWhere(
        (element) => element.quantity <= totalCount,
        orElse: () => bundle.bundle.sortedBundleInformation.first,
      );
}
