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
              padding: const EdgeInsets.all(12),
              child: CustomImage(
                imageUrl: state.additionInfo[cartProduct.materialNumber]
                        ?.productImages.first.thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.height * 0.06,
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
          Text(
            cartItem.materialNumber.displayMatNo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cartItem.materialDescription,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ZPColors.neutralsBlack),
            ),
          ),
          Text(
            cartItem.principalData.principalName.getOrDefaultValue(''),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10.0,
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Qty: ${cartItem.quantity.getOrDefaultValue(0)}',
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
