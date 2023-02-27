import 'package:ezrxmobile/application/order/combo_deal/combo_deal_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
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
    return Card(
      child: Padding(
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
                      if (material.comboDeal.scheme == ComboDealScheme.k1)
                        DiscountLabel(
                          label: StringUtils.displayDiscount(
                            material.selfComboDeal.rate,
                            material.selfComboDeal.type,
                          ),
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
                                material
                                    .materialInfo.defaultMaterialDescription,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.apply(
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
                            PriceLabel(
                              label: 'ZP Price',
                              discountPrice: material.display(
                                PriceType.comboDealUnitPrice,
                              ),
                              price: material.comboDealListPrice
                                  .toStringAsFixed(2),
                            ),
                            PriceLabel(
                              label: 'Total Price',
                              discountPrice: material.display(
                                PriceType.comboDealTotalUnitPrice,
                              ),
                              price: material.comboDealTotalListPrice
                                  .toStringAsFixed(2),
                            ),
                            if (!material.comboDealQtyEligible)
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
                      //TODO: Revisit to fix quantity input update text issue
                      QuantityInput(
                        controller: TextEditingController(
                          text: material.quantity.toString(),
                        ),
                        quantityTextKey: const Key('QuantityInput'),
                        onFieldChange: (value) {
                          context.read<ComboDealDetailBloc>().add(
                                ComboDealDetailEvent.updateItemQuantity(
                                  item: material.getMaterialNumber,
                                  qty: value,
                                ),
                              );
                        },
                        minusPressed: material.comboDealQtyEligible &&
                                material.quantity !=
                                    material.selfComboDeal.minQty
                            ? (value) {
                                context.read<ComboDealDetailBloc>().add(
                                      ComboDealDetailEvent.updateItemQuantity(
                                        item: material.getMaterialNumber,
                                        qty: value,
                                      ),
                                    );
                              }
                            : null,
                        addPressed: (value) =>
                            context.read<ComboDealDetailBloc>().add(
                                  ComboDealDetailEvent.updateItemQuantity(
                                    item: material.getMaterialNumber,
                                    qty: value,
                                  ),
                                ),
                        quantityAddKey: const Key('AddKey'),
                        quantityDeleteKey: const Key('DeleteKey'),
                        isEnabled: true,
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
      ),
    );
  }
}

class PriceLabel extends StatelessWidget {
  final String price;
  final String discountPrice;
  final String label;
  const PriceLabel({
    Key? key,
    required this.label,
    required this.price,
    required this.discountPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: $discountPrice ',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
          ),
          TextSpan(
            text: price,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.lightGray,
                  decoration: TextDecoration.lineThrough,
                ),
          ),
        ],
      ),
    );
  }
}
