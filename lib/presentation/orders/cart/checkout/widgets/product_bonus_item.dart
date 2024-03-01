part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _CheckoutProductBonusItem extends StatelessWidget {
  final BonusSampleItem bonusItem;
  final MaterialNumber parentMaterialNumber;

  const _CheckoutProductBonusItem({
    Key? key,
    required this.bonusItem,
    required this.parentMaterialNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.cartItemBonus(
        parentMaterialNumber.displayMatNo,
        bonusItem.materialNumber.displayMatNo,
      ),
      showBorder: true,
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          _ProductDetailsSection(
            bonusItem: bonusItem,
          ),
          _QuantityAndPrice(bonusItem: bonusItem),
        ],
      ),
    );
  }
}

class _ProductDetailsSection extends StatelessWidget {
  final BonusSampleItem bonusItem;
  const _ProductDetailsSection({Key? key, required this.bonusItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
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

class _ProductImageSection extends StatelessWidget {
  final BonusSampleItem bonusItem;
  const _ProductImageSection({Key? key, required this.bonusItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
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

class _ProductDetails extends StatelessWidget {
  final BonusSampleItem bonusItem;
  const _ProductDetails({required this.bonusItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                bonusItem.materialNumber.displayMatNo,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              const SizedBox(
                width: 8,
              ),
              if (eligibilityState.salesOrg.showBonus) const BonusTag(),
              if (!bonusItem.inStock.isMaterialInStock)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: StatusLabel(
                    status: eligibilityState.outOfStockProductStatus,
                    valueColor: eligibilityState
                        .outOfStockProductStatus.displayStatusTextColor,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              bonusItem.materialDescription,
              key: WidgetKeys.cartItemBonusMaterialDescription,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityAndPrice extends StatelessWidget {
  final BonusSampleItem bonusItem;
  const _QuantityAndPrice({required this.bonusItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${'Qty:'.tr()} ${bonusItem.qty.getOrDefaultValue(0).toString()}',
            key: WidgetKeys.cartItemBonusQty,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          eligibilityState.isIDMarket
              ? PriceComponent(
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price: '0',
                )
              : Text(
                  'FREE'.tr(),
                  key: WidgetKeys.cartItemBonusFreeLabel,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.textButtonColor,
                      ),
                ),
        ],
      ),
    );
  }
}
