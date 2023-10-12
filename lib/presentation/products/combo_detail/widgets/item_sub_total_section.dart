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
            buildWhen: (previous, current) => previous.items != current.items,
            builder: (_, state) {
              return PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: (state.items[comboItem.getMaterialNumber] ??
                        PriceAggregate.empty())
                    .display(PriceType.priceWithComboOfferTotal),
              );
            },
          ),
        ],
      ),
    );
  }
}
