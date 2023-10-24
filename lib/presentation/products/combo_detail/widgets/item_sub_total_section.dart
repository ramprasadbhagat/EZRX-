part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ItemSubTotalSection extends StatelessWidget {
  final PriceAggregate comboItem;
  const _ItemSubTotalSection({
    required this.comboItem,
    Key? key,
  }) : super(key: key);

  String get _materialComboRateDisplay =>
      comboItem.comboDeal.materialComboRateDisplay(
        materialNumber: comboItem.getMaterialNumber,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            context.tr('Item subtotal:'),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: ZPColors.darkGray,
                ),
          ),
          BlocBuilder<ComboDealMaterialDetailBloc,
              ComboDealMaterialDetailState>(
            buildWhen: (previous, current) =>
                previous.items != current.items ||
                previous.selectedItems != current.selectedItems,
            builder: (_, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (state.isMaterialSelected(comboItem.getMaterialNumber) &&
                      state.currentDeal.scheme.displayDiscountedSubTotal)
                    Row(
                      children: [
                        DiscountTagWidget(
                          rateDisplay: _materialComboRateDisplay,
                        ),
                        const SizedBox(width: 4),
                        PriceComponent(
                          salesOrgConfig: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrgConfigs,
                          type: PriceStyle.comboOfferPrice,
                          price: comboItem.display(PriceType.listPriceTotal),
                        ),
                      ],
                    ),
                  PriceComponent(
                    salesOrgConfig:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    price: state.currentDeal.scheme.displayOriginalPrice
                        ? comboItem.display(PriceType.listPriceTotal)
                        : comboItem
                            .getComboOfferPriceWithDiscount(
                              comboDealRate:
                                  comboItem.comboDeal.getMaterialComboRate(
                                materialNumber: comboItem.getMaterialNumber,
                              ),
                            )
                            .toString(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
