part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ItemSubTotalSection extends StatelessWidget {
  final PriceAggregate comboItem;
  const _ItemSubTotalSection({
    required this.comboItem,
    Key? key,
  }) : super(key: key);

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
                previous.selectedItems != current.selectedItems ||
                previous.totalQuantityUnit != current.totalQuantityUnit,
            builder: (_, state) {
              final materialComboRateDisplay =
                  comboItem.comboDeal.materialComboRateDisplay(
                materialNumber: comboItem.getMaterialNumber,
                totalQuantityUnit: state.totalQuantityUnit,
                currentTotalAmount: state.originalPriceSelectedItems,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (state.isMaterialSelected(comboItem.getMaterialNumber) &&
                      state.currentDeal.scheme.displayDiscountedSubTotal)
                    Row(
                      children: [
                        DiscountTagWidget(
                          rateDisplay: materialComboRateDisplay,
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
                            .getComboOfferPriceSubTotal(
                              comboItem.comboDeal.getMaterialComboRate(
                                materialNumber: comboItem.getMaterialNumber,
                                totalQuantityUnit: state.totalQuantityUnit,
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
