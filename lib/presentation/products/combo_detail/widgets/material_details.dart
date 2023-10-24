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

  String get _materialComboRateDisplay =>
      comboItem.comboDeal.materialComboRateDisplay(
        materialNumber: comboItem.getMaterialNumber,
      );

  bool get _canDisplayDiscountTag =>
      comboItem.comboDeal.scheme.displayDiscountedPrice;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                comboItem.materialInfo.materialNumber.displayMatNo,
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
                DiscountTagWidget(rateDisplay: _materialComboRateDisplay),
            ],
          ),
          const SizedBox(height: 4),
          InkWell(
            onTap: onTapName,
            child: Text(
              comboItem.materialInfo.materialDescription,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Text(
            comboItem.materialInfo.principalData.principalName.name,
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
          _MaterialPriceSection(comboItem: comboItem),
          _MaterialQuantitySection(
            comboItem: comboItem,
            comboDealMaterial: comboDealMaterial,
          ),
        ],
      ),
    );
  }
}

class _MaterialPriceSection extends StatelessWidget {
  final PriceAggregate comboItem;

  const _MaterialPriceSection({required this.comboItem, Key? key})
      : super(key: key);

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
