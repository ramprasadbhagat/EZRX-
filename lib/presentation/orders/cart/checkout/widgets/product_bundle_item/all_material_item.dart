part of 'checkout_bundle_item.dart';

class _AllMaterialItem extends StatelessWidget {
  final PriceAggregate cartItem;
  const _AllMaterialItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cartItem.bundle.materials
          .map(
            (e) => _MaterialDetailsSection(
              cartItem: e,
            ),
          )
          .toList(),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final MaterialInfo cartItem;
  const _MaterialDetailsSection({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.cartItemProductTile(
        cartItem.materialNumber.displayMatNo,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(cartProduct: cartItem),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(
            cartItem: cartItem,
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _MaterialImageSection({required this.cartProduct, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return CustomCard(
              showShadow: false,
              showBorder: true,
              child: CustomImage(
                imageUrl: state.additionInfo[cartProduct.materialNumber]
                        ?.productImages.first.thumbNail ??
                    '',
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final MaterialInfo cartItem;
  const _MaterialDetails({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  cartItem.combinationCode(
                    showGMCPart: context
                        .read<EligibilityBloc>()
                        .state
                        .salesOrgConfigs
                        .enableGMC,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              PreOrderLabel(inStock: cartItem.inStock),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cartItem.materialDescription,
              key: WidgetKeys.cartItemProductMaterialDescription,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ZPColors.neutralsBlack),
            ),
          ),
          Text(
            cartItem.principalData.principalName.getOrDefaultValue(''),
            key: WidgetKeys.cartItemProductPrincipalName,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10.0,
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          StockInfoWidget(
            stockInfo: cartItem.bundleStockInfoValid,
            materialInfo: cartItem,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Qty: ${cartItem.quantity.getOrDefaultValue(0)}',
              key: WidgetKeys.cartItemProductQty,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ZPColors.neutralsBlack),
            ),
          ),
        ],
      ),
    );
  }
}
