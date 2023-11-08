part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _MaterialDetailsSection extends StatelessWidget {
  final PriceAggregate comboItem;
  final ComboDealMaterial comboDealMaterial;
  final bool isFixed;

  const _MaterialDetailsSection({
    Key? key,
    required this.comboItem,
    required this.comboDealMaterial,
    this.isFixed = false,
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
    if (eligibilityBlocState.isZDP5eligible) {
      context.read<MaterialPriceBloc>().add(
            MaterialPriceEvent.fetchPriceForZDP5Materials(
              materialInfo: materialInfo,
            ),
          );
    }
    context.router.pushNamed('orders/material_details');
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
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
            child: _MaterialImageSection(
              comboItem: comboItem,
              isFixed: isFixed,
            ),
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
  final bool isFixed;

  const _MaterialImageSection({
    required this.comboItem,
    this.isFixed = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCard(
          showShadow: false,
          showBorder: true,
          child: CustomImage(
            imageUrl: '',
            fit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.height * 0.08,
          ),
        ),
        if (isFixed)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: ZPColors.warning,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ).copyWith(
                bottomLeft: const Radius.circular(0),
              ),
            ),
            child: Text(
              context.tr('Fixed'),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.fixedLabel,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
      ],
    );
  }
}
