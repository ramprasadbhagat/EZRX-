part of 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bonus_offer_tile.dart';

class _MaterialDetailsSection extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const _MaterialDetailsSection({
    Key? key,
    required this.bonusItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(
            bonusItem: bonusItem,
          ),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(
            bonusItem: bonusItem,
          ),
        ],
      ),
    );
  }
}
