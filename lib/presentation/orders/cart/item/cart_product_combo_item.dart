import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/products/combo_detail/widgets/discount_tag_widget.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

class CartProductComboItem extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  final ComboDealScheme comboScheme;
  const CartProductComboItem({
    Key? key,
    required this.comboMaterialItem,
    required this.comboScheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MaterialDetailsSection(
          comboMaterialItem: comboMaterialItem,
          comboScheme: comboScheme,
        ),
        const SizedBox(height: 8),
        _ComboSubTotalSection(
          comboMaterialItem: comboMaterialItem,
          comboScheme: comboScheme,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  final ComboDealScheme comboScheme;
  const _MaterialDetailsSection({
    Key? key,
    required this.comboMaterialItem,
    required this.comboScheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MaterialImageSection(
          comboMaterialItem: comboMaterialItem,
          comboScheme: comboScheme,
        ),
        const SizedBox(
          width: 8,
        ),
        _MaterialDetails(
          comboMaterialItem: comboMaterialItem,
          comboScheme: comboScheme,
        ),
      ],
    );
  }
}

class _ComboSubTotalSection extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  final ComboDealScheme comboScheme;

  const _ComboSubTotalSection({
    required this.comboMaterialItem,
    required this.comboScheme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Handle tax display later in here
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr(
                'Qty: {numbers}',
                namedArgs: {
                  'numbers': comboMaterialItem.quantity.toString(),
                },
              ),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (comboScheme.displayDiscountedSubTotal)
                  Row(
                    children: [
                      DiscountTagWidget(
                        rateDisplay: comboMaterialItem.comboRateDisplay,
                      ),
                      const SizedBox(width: 4),
                      PriceComponent(
                        salesOrgConfig: context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrgConfigs,
                        type: PriceStyle.comboOfferPrice,
                        price: comboMaterialItem.originalSubTotal.toString(),
                      ),
                    ],
                  ),
                PriceComponent(
                  key: WidgetKeys.cartItemProductTotalPrice,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: (comboScheme.displayOriginalPrice
                          ? comboMaterialItem.originalSubTotal
                          : comboMaterialItem.discountedSubTotal)
                      .toString(),
                  type: PriceStyle.summaryPrice,
                ),
              ],
            ),
          ],
        ),
        PriceComponent(
          key: WidgetKeys.cartItemProductTotalPrice,
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
          price: (comboScheme.displayOriginalPrice
                  ? comboMaterialItem.originalTotalWithTax
                  : comboMaterialItem.discountedSubTotalWithTax)
              .toString(),
          title: '= ',
          type: PriceStyle.comboSubTotalItemWithTax,
        ),
      ],
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  final ComboDealScheme comboScheme;
  const _MaterialDetails({
    Key? key,
    required this.comboMaterialItem,
    required this.comboScheme,
  }) : super(key: key);

  bool get _canDisplayDiscountTag => comboScheme.displayDiscountedPrice;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                comboMaterialItem.productId.displayMatNo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              const SizedBox(
                width: 4,
              ),
              if (_canDisplayDiscountTag)
                DiscountTagWidget(
                  rateDisplay: comboMaterialItem.comboRateDisplay,
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            comboMaterialItem.materialDescription,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            comboMaterialItem.principalName.name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: ZPColors.neutralsGrey1,
                ),
          ),
          comboScheme.displayDiscountedPrice
              ? Row(
                  children: [
                    PriceComponent(
                      salesOrgConfig:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      price: comboMaterialItem.originalPriceDisplay,
                      type: PriceStyle.comboOfferPrice,
                    ),
                    const SizedBox(width: 4),
                    PriceComponent(
                      salesOrgConfig:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      price: comboMaterialItem.discountedPriceDisplay,
                      type: PriceStyle.comboOfferPriceDiscounted,
                    ),
                  ],
                )
              : PriceComponent(
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: comboMaterialItem.originalPriceDisplay,
                  type: PriceStyle.comboOfferPriceDiscounted,
                ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  final ComboDealScheme comboScheme;

  const _MaterialImageSection({
    required this.comboMaterialItem,
    required this.comboScheme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.additionInfo != current.additionInfo,
      builder: (context, state) {
        return Stack(
          children: [
            CustomCard(
              showShadow: false,
              showBorder: true,
              margin: EdgeInsets.zero,
              child: CustomImage(
                imageUrl: state.additionInfo[comboMaterialItem.productId]
                        ?.productImages.firstOrNull?.thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.height * 0.09,
              ),
            ),
            if (comboMaterialItem.mandatory &&
                comboScheme.displayDiscountedSubTotal)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: ZPColors.warning,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ).copyWith(
                    bottomLeft: const Radius.circular(0),
                  ),
                ),
                child: Text(
                  context.tr('Fixed'),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.fixedLabel,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
          ],
        );
      },
    );
  }
}
