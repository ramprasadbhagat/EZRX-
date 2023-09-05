part of 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_offer_bonus_item.dart';

class _ProductDetailsSection extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const _ProductDetailsSection({Key? key, required this.bonusItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImageSection(
            bonusItem: bonusItem,
          ),
          const SizedBox(
            width: 8,
          ),
          _ProductDetails(bonusItem: bonusItem),
        ],
      ),
    );
  }
}
