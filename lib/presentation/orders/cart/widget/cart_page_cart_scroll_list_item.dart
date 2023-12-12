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
    if (item.materialInfo.type.typeCombo) {
      return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: CartProductCombo(
          cartItem: item,
          canEditable: true,
        ),
      );
    } else if (item.materialInfo.type.typeBundle) {
      return CartProductBundle(
        cartItem: item,
      );
    } else {
      return _CartProductMaterial(
        item: item,
        showManufacturerName: showManufacturerName,
      );
    }
  }
}

class _CartProductMaterial extends StatelessWidget {
  final PriceAggregate item;
  final bool showManufacturerName;

  const _CartProductMaterial({
    Key? key,
    required this.item,
    required this.showManufacturerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.cartProducts != current.cartProducts,
      listener: (context, state) {
        if (context.read<EligibilityBloc>().state.isZDP5eligible) {
          final product = state.cartProducts.firstWhere(
            (element) =>
                element.materialInfo.materialNumber ==
                item.materialInfo.materialNumber,
            orElse: () => PriceAggregate.empty(),
          );
          if (product.isPriceUpdateAvailable) {
            context.read<MaterialPriceBloc>().add(
                  MaterialPriceEvent.fetchPriceForZDP5Materials(
                    materialInfo: product.materialInfo,
                  ),
                );
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showManufacturerName)
            _CartPageManufacturerName(
              key: WidgetKeys.cartPrincipalLabel,
              cartProduct: item.materialInfo,
            ),
          CartProductTile(
            cartItem: item,
          ),
          if (item.bonusSampleItems.isNotEmpty)
            ...item.bonusSampleItems
                .map(
                  (e) => CartProductTileBonus(
                    bonusItem: e,
                    cartProduct: item,
                  ),
                )
                .toList(),
        ],
      ),
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
