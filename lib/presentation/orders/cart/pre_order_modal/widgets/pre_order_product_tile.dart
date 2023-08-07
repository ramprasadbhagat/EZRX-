part of '../pre_order_modal.dart';

class _PreOrderProductTile extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _PreOrderProductTile({required this.cartProduct, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageSection(cartProduct: cartProduct),
              const SizedBox(
                width: 8,
              ),
              _MaterialDetails(cartItem: cartProduct),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${"Qty: ".tr()}${cartProduct.quantity.toString()}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(
                width: 8,
              ),
              _PriceSection(cartProduct: cartProduct),
            ],
          ),
        ],
      ),
    );
  }
}
