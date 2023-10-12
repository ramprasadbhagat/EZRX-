import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

class CartProductComboItem extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  const CartProductComboItem({
    Key? key,
    required this.comboMaterialItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MaterialDetailsSection(comboMaterialItem: comboMaterialItem),
        const SizedBox(height: 8),
        _ComboSubTotalSection(
          comboMaterialItem: comboMaterialItem,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  const _MaterialDetailsSection({
    Key? key,
    required this.comboMaterialItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MaterialImageSection(comboMaterialItem: comboMaterialItem),
        const SizedBox(
          width: 8,
        ),
        _MaterialDetails(
          comboMaterialItem: comboMaterialItem,
          isInvalidCartItem: false,
        ),
      ],
    );
  }
}

class _ComboSubTotalSection extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  const _ComboSubTotalSection({
    required this.comboMaterialItem,
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
            PriceComponent(
              key: WidgetKeys.cartItemProductTotalPrice,
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: comboMaterialItem.subTotal.toString(),
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
        PriceComponent(
          key: WidgetKeys.cartItemProductTotalPrice,
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
          price: comboMaterialItem.subTotalWithTax.toString(),
          title: '= ',
          type: PriceStyle.comboSubTotalItemWithTax,
        ),
      ],
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  final bool isInvalidCartItem;
  const _MaterialDetails({
    Key? key,
    required this.comboMaterialItem,
    required this.isInvalidCartItem,
  }) : super(key: key);

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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: const BoxDecoration(
                  color: ZPColors.discountOfferBgColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Text(
                  context.tr(
                    '{percent}% Discount',
                    namedArgs: {
                      'percent': comboMaterialItem.rate.abs().toString(),
                    },
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: ZPColors.lightBgYellow,
                      ),
                ),
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
          Row(
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
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final ComboMaterialItem comboMaterialItem;
  const _MaterialImageSection({required this.comboMaterialItem, Key? key})
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
          margin: EdgeInsets.zero,
          child: CustomImage(
            imageUrl: state.additionInfo[comboMaterialItem.productId]
                    ?.productImages.firstOrNull?.thumbNail ??
                '',
            fit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.height * 0.09,
          ),
        );
      },
    );
  }
}
