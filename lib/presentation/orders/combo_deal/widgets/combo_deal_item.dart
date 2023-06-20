import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComboDealItem extends StatelessWidget {
  final PriceAggregate material;
  final VoidCallback onCheckBoxPressed;
  final Function(int qty) onQuantityUpdated;
  final bool isSelected;

  const ComboDealItem({
    Key? key,
    required this.material,
    required this.isSelected,
    required this.onCheckBoxPressed,
    required this.onQuantityUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            onChanged: material.selfComboDeal.mandatory
                ? null
                : (_) => onCheckBoxPressed.call(),
            value: isSelected,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        material.materialInfo.materialNumber.displayMatNo.tr(),
                        style: Theme.of(context).textTheme.titleSmall?.apply(
                              color: ZPColors.kPrimaryColor,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 5),
                    _DiscountLabel(
                      material: material,
                    ),
                    const SizedBox(width: 5),
                    if (material.selfComboDeal.mandatory)
                      const MandatoryLabel(),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            material.materialInfo.materialDescription,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          if (material.isDefaultMDEnabled)
                            Text(
                              material.materialInfo.defaultMaterialDescription,
                              style:
                                  Theme.of(context).textTheme.titleSmall?.apply(
                                        color: ZPColors.lightGray,
                                      ),
                            ),
                          Text(
                            material.materialInfo.principalData.principalName
                                .getOrDefaultValue(''),
                            style:
                                Theme.of(context).textTheme.titleSmall?.apply(
                                      color: ZPColors.lightGray,
                                    ),
                          ),
                          _PriceLabel(
                            material: material,
                          ),
                          if (!material.selfComboDealEligible)
                            Text(
                              'Minimum Quantity should be ${material.selfComboDeal.minQty}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: ZPColors.red,
                                  ),
                            ),
                        ],
                      ),
                    ),
                    _QuantityInput(
                      material: material,
                      onQuantityUpdated: onQuantityUpdated,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class _DiscountLabel extends StatelessWidget {
  final PriceAggregate material;

  const _DiscountLabel({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final comboDeal = material.comboDeal;
    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        final discountInfo = material.selfComboDeal.discountInfo;
        if (discountInfo.type.isEmpty) return const SizedBox();

        return DiscountLabel(
          label: discountInfo.text,
        );
      case ComboDealScheme.k2:
        final discountInfo =
            material.comboDeal.groupDeal != ComboDealGroupDeal.empty()
                ? comboDeal.groupDeal.discountInfo
                : comboDeal.flexiQtyTier.first.discountInfo;

        if (discountInfo.type.isEmpty) return const SizedBox();

        return DiscountLabel(
          label: discountInfo.text,
        );

      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
        return const SizedBox();
      case ComboDealScheme.k5:
        return const SizedBox();
      case ComboDealScheme.kWithSuffix:
        final totalSelectedQuantity = context
            .read<ComboDealMaterialDetailBloc>()
            .state
            .totalSelectedQuantity;

        final discountInfo = comboDeal
            .selectedSuffix(
              material: material,
              eligibleComboDealQtyTier:
                  comboDeal.descendingSortedQtyTiers.firstWhere(
                (tier) => totalSelectedQuantity >= tier.minQty,
                orElse: () => ComboDealQtyTier.empty(),
              ),
            )
            .discountInfo;

        if (discountInfo.type.isEmpty) return const SizedBox();

        return DiscountLabel(
          label: discountInfo.text,
        );
    }
  }
}

class _PriceLabel extends StatelessWidget {
  final PriceAggregate material;
  const _PriceLabel({
    Key? key,
    required this.material,
  }) : super(key: key);

  SalesOrganisationConfigs get salesConfigs =>
      material.comboDeal.scheme == ComboDealScheme.k5
          ? SalesOrganisationConfigs.empty().copyWith(
              currency: Currency(
                material.comboDeal.flexiTierRule.first.minTotalCurrency,
              ),
            )
          : material.salesOrgConfig;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PriceLabel(
          label: 'ZP Price',
          salesConfigs: salesConfigs,
          discountPrice: material.comboDealUnitPrice(
            discount: rate(context: context),
          ),
          price: material.comboDealListPrice,
          discountEnable: false,
        ),
        PriceLabel(
          label: 'Total Price',
          salesConfigs: salesConfigs,
          discountPrice: material.comboDealTotalUnitPrice(
            discount: rate(context: context),
          ),
          price: material.comboDealTotalListPrice,
          discountEnable: _enableDiscount,
        ),
      ],
    );
  }

  bool get _enableDiscount {
    switch (material.comboDeal.scheme) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k2:
        return true;
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
        return false;
      case ComboDealScheme.kWithSuffix:
        return true;
      case ComboDealScheme.k5:
        return false;
    }
  }

  DiscountInfo? rate({required BuildContext context}) {
    final comboDeal = material.comboDeal;
    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        return null;
      case ComboDealScheme.k2:
        return comboDeal.groupDeal != ComboDealGroupDeal.empty()
            ? comboDeal.groupDeal.discountInfo
            : comboDeal.flexiQtyTier.first.discountInfo;
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
        return null;
      case ComboDealScheme.kWithSuffix:
        final totalSelectedQuantity = context
            .read<ComboDealMaterialDetailBloc>()
            .state
            .totalSelectedQuantity;
        final selectedSuffix = comboDeal.selectedSuffix(
          material: material,
          eligibleComboDealQtyTier:
              comboDeal.descendingSortedQtyTiers.firstWhere(
            (tier) => totalSelectedQuantity >= tier.minQty,
            orElse: () => ComboDealQtyTier.empty(),
          ),
        );

        return selectedSuffix.discountInfo;
      case ComboDealScheme.k5:
        return null;
    }
  }
}

class _QuantityInput extends StatefulWidget {
  final PriceAggregate material;
  final Function(int qty) onQuantityUpdated;
  const _QuantityInput({
    Key? key,
    required this.material,
    required this.onQuantityUpdated,
  }) : super(key: key);

  @override
  State<_QuantityInput> createState() => __QuantityInputState();
}

class __QuantityInputState extends State<_QuantityInput> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.material.quantity.toString(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QuantityInput(
      controller: controller,
      quantityTextKey: const Key('QuantityInput'),
      onFieldChange: widget.onQuantityUpdated,
      returnZeroOnFieldEmpty: true,
      minusPressed: widget.material.selfComboDealEligible &&
              widget.material.quantity != widget.material.selfComboDeal.minQty
          ? widget.onQuantityUpdated
          : null,
      addPressed: widget.onQuantityUpdated,
      quantityAddKey: const Key('AddKey'),
      quantityDeleteKey: const Key('DeleteKey'),
      isEnabled: true,
    );
  }
}
