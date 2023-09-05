part of 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bonus_offer_tile.dart';

class _MaterialImageSection extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const _MaterialImageSection({required this.bonusItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.additionInfo != current.additionInfo,
      builder: (context, state) {
        return CustomCard(
          showShadow: false,
          showBorder: true,
          padding: const EdgeInsets.all(12),
          child: CustomImage(
            imageUrl: state.additionInfo[bonusItem.materialNumber]
                    ?.productImages.first.thumbNail ??
                '',
            fit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.height * 0.06,
          ),
        );
      },
    );
  }
}
