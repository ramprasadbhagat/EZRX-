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
                    namedArgs: {'percent': comboDealMaterial.rateDisplay},
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
          Row(
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
                price: comboItem.display(PriceType.priceWithComboOffer),
                type: PriceStyle.comboOfferPriceDiscounted,
              ),
            ],
          ),
          _MaterialQuantitySection(
            comboItem: comboItem,
            comboDealMaterial: comboDealMaterial,
          ),
        ],
      ),
    );
  }
}