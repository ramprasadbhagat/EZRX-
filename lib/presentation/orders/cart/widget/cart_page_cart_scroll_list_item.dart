part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageScrollListItem extends StatelessWidget {
  const _CartPageScrollListItem({
    Key? key,
    required this.showManufacturerName,
    required this.item,
  }) : super(key: key);

  final bool showManufacturerName;
  final PriceAggregate item;

  @override
  Widget build(BuildContext context) {
    final isMYPnGSalesRep =
        context.read<EligibilityBloc>().state.isMYExternalSalesRepUser &&
            item.materialInfo.isPnGPrinciple;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showManufacturerName)
          _CartPageManufacturerName(
            cartProduct: item.materialInfo,
          ),
        item.materialInfo.type.typeBundle
            ? CartProductBundle(
                cartItem: item,
              )
            : CartProductTile(
                cartItem: item,
              ),
        if (item.displayOfferBonus || isMYPnGSalesRep)
          Column(
            children: item.addedBonusList
                .map(
                  (e) => CartProductOfferBonus(
                    bonusItem: e,
                  ),
                )
                .toList(),
          ),
        if (item.bonusSampleItems.isNotEmpty)
          Column(
            children: item.bonusSampleItems
                .map(
                  (e) => CartProductTileBonus(
                    bonusItem: e,
                    cartProduct: item,
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}

class _CartPageManufacturerName extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _CartPageManufacturerName({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Text(
        cartProduct.principalData.principalName.getOrDefaultValue(''),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ZPColors.neutralsBlack,
            ),
      ),
    );
  }
}
