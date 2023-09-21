import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

class CheckoutProductBonusItem extends StatelessWidget {
  final BonusSampleItem bonusItem;
  const CheckoutProductBonusItem({
    Key? key,
    required this.bonusItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
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

class _ProductDetails extends StatelessWidget {
  final BonusSampleItem bonusItem;
  const _ProductDetails({required this.bonusItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                width: 4,
              ),
              const BonusTag(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              bonusItem.materialDescription,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Text(
            'FREE'.tr(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.extraLightGrey4,
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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${'Qty:'.tr()} ${bonusItem.qty.getOrDefaultValue(0).toString()}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          Text(
            'FREE'.tr(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
        ],
      ),
    );
  }
}
