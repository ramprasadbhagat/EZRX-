part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _MaterialDetailsSection extends StatelessWidget {
  final PriceAggregate comboItem;
  final ComboDealMaterial comboDealMaterial;

  const _MaterialDetailsSection({
    Key? key,
    required this.comboItem,
    required this.comboDealMaterial,
  }) : super(key: key);

  void _navigateToDetails(BuildContext context, MaterialInfo materialInfo) {
    final eligibilityBlocState = context.read<EligibilityBloc>().state;
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: materialInfo.materialNumber,
            locale: context.locale,
            type: materialInfo.type,
          ),
        );
    context.router.pushNamed('orders/material_details');
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            salesOrganisation: eligibilityBlocState.salesOrganisation,
            salesConfigs: eligibilityBlocState.salesOrgConfigs,
            customerCodeInfo: eligibilityBlocState.customerCodeInfo,
            shipToInfo: eligibilityBlocState.shipToInfo,
            comboDealEligible: eligibilityBlocState.comboDealEligible,
            materials: [materialInfo],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _navigateToDetails(context, comboItem.materialInfo),
            child: _MaterialImageSection(comboItem: comboItem),
          ),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(
            comboItem: comboItem,
            comboDealMaterial: comboDealMaterial,
            onTapName: () =>
                _navigateToDetails(context, comboItem.materialInfo),
            key: WidgetKeys.cartItemProductTile(
              comboItem.materialInfo.materialNumber.displayMatNo,
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final PriceAggregate comboItem;
  const _MaterialImageSection({required this.comboItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showShadow: false,
      showBorder: true,
      child: CustomImage(
        imageUrl: '',
        fit: BoxFit.fitHeight,
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.height * 0.08,
      ),
    );
  }
}
