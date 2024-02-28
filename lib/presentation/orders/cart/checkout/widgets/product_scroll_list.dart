part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _ProductScrollList extends StatelessWidget {
  final CartState cartState;
  const _ProductScrollList({Key? key, required this.cartState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          final list = cartState.cartProducts.sortToDisplay;
          final item = list[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              list.showManufacturerName(index)
                  ? _TitleScrollList(
                      cartProduct: item.materialInfo,
                    )
                  : const SizedBox.shrink(),
              if (item.materialInfo.type.typeBundle)
                CheckoutBundleItem(
                  key: WidgetKeys.cartItemBundleTile(
                    item.bundle.bundleCode,
                  ),
                  cartItem: item,
                ),
              if (item.materialInfo.type.typeMaterial)
                _CheckoutProductMaterialWithBonus(
                  cartItem: item,
                ),
              if (item.materialInfo.type.typeCombo)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(bottom: 20),
                  child: CartProductCombo(cartItem: item),
                ),
            ],
          );
        },
        childCount: cartState.cartProducts.length, // 1000 list items
      ),
    );
  }
}

class _CheckoutProductMaterialWithBonus extends StatelessWidget {
  final PriceAggregate cartItem;

  const _CheckoutProductMaterialWithBonus({required this.cartItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckoutMaterialItem(
          cartItem: cartItem,
        ),
        if (cartItem.sortedBonusList.isNotEmpty)
          ...cartItem.sortedBonusList
              .map(
                (e) => _CheckoutProductBonusItem(
                  bonusItem: e,
                  parentMaterialNumber: cartItem.getMaterialNumber,
                ),
              )
              .toList(),
      ],
    );
  }
}

class _TitleScrollList extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _TitleScrollList({Key? key, required this.cartProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        cartProduct.principalData.principalName.getValue(),
        key: WidgetKeys.cartPrincipalLabel,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ZPColors.neutralsBlack,
            ),
      ),
    );
  }
}
