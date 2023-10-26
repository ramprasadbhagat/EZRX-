part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _ProductScrollList extends StatelessWidget {
  final CartState cartState;
  const _ProductScrollList({Key? key, required this.cartState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final item = cartState.cartProducts[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0 ||
                      cartState.cartProducts[index].materialInfo.principalData
                              .principalName
                              .getValue() !=
                          cartState.cartProducts[index - 1].materialInfo
                              .principalData.principalName
                              .getValue()
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
                  key: WidgetKeys.cartItemProductTile(
                    item.materialInfo.materialNumber.displayMatNo,
                  ),
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
          key: WidgetKeys.cartItemProductTile(
            cartItem.materialInfo.materialNumber.displayMatNo,
          ),
          cartItem: cartItem,
        ),
        if (cartItem.addedBonusList.isNotEmpty)
          ...cartItem.addedBonusList
              .map(
                (e) => CheckoutOfferBonusItem(
                  bonusItem: e,
                ),
              )
              .toList(),
        if (cartItem.bonusSampleItems.isNotEmpty)
          ...cartItem.bonusSampleItems
              .map(
                (e) => _CheckoutProductBonusItem(
                  bonusItem: e,
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
