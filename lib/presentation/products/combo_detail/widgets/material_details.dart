part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate comboItem;
  final ComboDealMaterial comboDealMaterial;
  final VoidCallback onTapName;
  const _MaterialDetails({
    Key? key,
    required this.comboItem,
    required this.comboDealMaterial,
    required this.onTapName,
  }) : super(key: key);

  bool get _canDisplayDiscountTag =>
      comboItem.comboDeal.scheme.displayDiscountedPrice;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComboDealMaterialDetailBloc,
        ComboDealMaterialDetailState>(
      buildWhen: (previous, current) =>
          previous.totalQuantityUnit != current.totalQuantityUnit,
      builder: (context, state) {
        final materialComboRateDisplay =
            comboItem.comboDeal.materialComboRateDisplay(
          materialNumber: comboItem.getMaterialNumber,
          totalQuantityUnit: state.totalQuantityUnit,
          currentTotalAmount: state.originalPriceSelectedItems,
        );

        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      comboItem.materialInfo.combinationCode(
                        showGMCPart: context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrgConfigs
                            .enableGMC,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.darkGray,
                          ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  if (_canDisplayDiscountTag)
                    DiscountTagWidget(rateDisplay: materialComboRateDisplay),
                ],
              ),
              const SizedBox(height: 4),
              InkWell(
                onTap: onTapName,
                child: Text(
                  comboItem.materialInfo.displayDescription,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Text(
                comboItem.materialInfo.getManufactured,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      color: ZPColors.neutralsGrey1,
                    ),
              ),
              Text(
                context.tr(
                  'EXP: {date}',
                  namedArgs: {
                    'date': comboItem.stockInfo.expiryDate.dateOrNaString,
                  },
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      color: ZPColors.neutralsGrey1,
                    ),
              ),
              _MaterialPriceSection(
                comboItem: comboItem,
                totalQuantityUnit: state.totalQuantityUnit,
              ),
              _MaterialQuantitySection(
                comboItem: comboItem,
                comboDealMaterial: comboDealMaterial,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MaterialPriceSection extends StatelessWidget {
  final PriceAggregate comboItem;
  final int totalQuantityUnit;
  const _MaterialPriceSection({
    required this.comboItem,
    Key? key,
    required this.totalQuantityUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return comboItem.comboDeal.scheme.displayDiscountedPrice
        ? Row(
            children: [
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: comboItem.display(PriceType.listPrice),
                type: PriceStyle.comboOfferPrice,
              ),
              const SizedBox(width: 4),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: comboItem
                    .getComboOfferPriceWithDiscount(
                      comboDealRate: comboItem.comboDeal.getMaterialComboRate(
                        materialNumber: comboItem.getMaterialNumber,
                        totalQuantityUnit: totalQuantityUnit,
                      ),
                    )
                    .toString(),
                type: PriceStyle.comboOfferPriceDiscounted,
              ),
            ],
          )
        : PriceComponent(
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: comboItem.display(PriceType.listPrice),
            type: PriceStyle.comboOfferPriceDiscounted,
          );
  }
}
