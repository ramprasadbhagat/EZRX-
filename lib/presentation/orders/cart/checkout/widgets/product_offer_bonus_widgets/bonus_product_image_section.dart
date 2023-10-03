part of 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_offer_bonus_item.dart';

class _ProductImageSection extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const _ProductImageSection({Key? key, required this.bonusItem})
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
          child: CustomImage(
            imageUrl: state.additionInfo[bonusItem.materialNumber]
                    ?.productImages.first.thumbNail ??
                '',
            fit: BoxFit.fitHeight,
          ),
        );
      },
    );
  }
}
