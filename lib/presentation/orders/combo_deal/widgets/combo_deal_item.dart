import 'package:ezrxmobile/application/order/combo_deal/combo_deal_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComboDealItem extends StatelessWidget {
  final PriceAggregate material;
  final bool isSelected;

  const ComboDealItem({
    Key? key,
    required this.material,
    required this.isSelected,
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
                : (_) => context.read<ComboDealDetailBloc>().add(
                      ComboDealDetailEvent.updateItemSelection(
                        item: material.getMaterialNumber,
                      ),
                    ),
            value: isSelected,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        material.materialInfo.materialNumber.displayMatNo,
                        style: Theme.of(context).textTheme.titleSmall?.apply(
                              color: ZPColors.kPrimaryColor,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 5),
                    _DiscountLabel(material: material),
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
                          _PriceLabel(material: material),
                          if (!material.selfComboDealEligible)
                            Text(
                              'Minimun Quantity should be ${material.selfComboDeal.minQty}',
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

  void onUpdateQuantity({
    required int value,
    required BuildContext context,
  }) {
    context.read<ComboDealDetailBloc>().add(
          ComboDealDetailEvent.updateItemQuantity(
            item: material.getMaterialNumber,
            qty: value,
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
        return DiscountLabel(
          label: StringUtils.displayDiscount(
            material.selfComboDeal.rate,
            material.selfComboDeal.type,
          ),
        );
      case ComboDealScheme.k2:
        return material.comboDeal.groupDeal != ComboDealGroupDeal.empty()
            ? DiscountLabel(
                label: StringUtils.displayDiscount(
                  comboDeal.groupDeal.rate,
                  comboDeal.groupDeal.type,
                ),
              )
            : DiscountLabel(
                label: StringUtils.displayDiscount(
                  comboDeal.flexiQtyTier.first.rate,
                  comboDeal.flexiQtyTier.first.type,
                ),
              );
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
      case ComboDealScheme.k5:
        return const SizedBox();
    }
  }
}

class _PriceLabel extends StatelessWidget {
  final PriceAggregate material;
  const _PriceLabel({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PriceLabel(
          label: 'ZP Price',
          salesConfigs: material.salesOrgConfig,
          discountPrice: material.comboDealUnitPrice(
            rate: rate,
          ),
          price: material.comboDealListPrice,
          discountEnable: false,
        ),
        PriceLabel(
          label: 'Total Price',
          salesConfigs: material.salesOrgConfig,
          discountPrice: material.comboDealTotalUnitPrice(
            rate: rate,
          ),
          price: material.comboDealTotalListPrice,
          discountEnable:
              material.comboDeal.scheme == ComboDealScheme.k4 ? false : true,
        ),
      ],
    );
  }

  double? get rate {
    final comboDeal = material.comboDeal;
    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        return null;
      case ComboDealScheme.k2:
        return comboDeal.groupDeal != ComboDealGroupDeal.empty()
            ? comboDeal.groupDeal.rate
            : comboDeal.flexiQtyTier.first.rate;
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
      case ComboDealScheme.k5:
        return null;
    }
  }
}

class _QuantityInput extends StatefulWidget {
  final PriceAggregate material;
  const _QuantityInput({
    Key? key,
    required this.material,
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
      onFieldChange: (value) {
        _onUpdateQuantity(
          context: context,
          value: value,
        );
      },
      minusPressed: widget.material.selfComboDealEligible &&
              widget.material.quantity != widget.material.selfComboDeal.minQty
          ? (value) {
              _onUpdateQuantity(
                context: context,
                value: value,
              );
            }
          : null,
      addPressed: (value) => _onUpdateQuantity(
        context: context,
        value: value,
      ),
      quantityAddKey: const Key('AddKey'),
      quantityDeleteKey: const Key('DeleteKey'),
      isEnabled: true,
    );
  }

  void _onUpdateQuantity({
    required int value,
    required BuildContext context,
  }) {
    context.read<ComboDealDetailBloc>().add(
          ComboDealDetailEvent.updateItemQuantity(
            item: widget.material.getMaterialNumber,
            qty: value,
          ),
        );
  }
}
