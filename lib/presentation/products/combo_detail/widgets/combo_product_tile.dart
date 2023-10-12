part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboProductTile extends StatelessWidget {
  final PriceAggregate comboItem;
  const _ComboProductTile({
    Key? key,
    required this.comboItem,
  }) : super(key: key);

  ComboDealMaterial get _comboDealMaterial => comboItem.comboDeal
      .singleDeal(materialNumber: comboItem.getMaterialNumber);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ComboDealMaterialDetailBloc>();

    return Padding(
      key: WidgetKeys.cartItemProductTile(
        comboItem.materialInfo.materialNumber.getValue(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 24),
      child: BlocBuilder<ComboDealMaterialDetailBloc,
          ComboDealMaterialDetailState>(
        buildWhen: (previous, current) =>
            previous.selectedItems != current.selectedItems,
        builder: (_, state) {
          return EdgeCheckbox(
            onChanged: (value) => bloc.add(
              ComboDealMaterialDetailEvent.updateItemSelection(
                item: comboItem.getMaterialNumber,
              ),
            ),
            value: state.selectedItems[comboItem.getMaterialNumber] ?? false,
            body: CustomCard(
              showShadow: true,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  _MaterialDetailsSection(
                    comboItem: comboItem,
                    comboDealMaterial: _comboDealMaterial,
                  ),
                  const Divider(
                    indent: 0,
                    endIndent: 0,
                    color: ZPColors.accentColor,
                  ),
                  _ItemSubTotalSection(
                    comboItem: comboItem,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
