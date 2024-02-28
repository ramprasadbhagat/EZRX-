part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _ImageSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _ImageSection({required this.cartProduct, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCard(
          showBorder: true,
          showShadow: false,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          child: ProductImage(
            materialNumber: cartProduct.getMaterialNumber,
            height: 80,
            width: 80,
          ),
        ),
        if (!cartProduct.materialInfo.type.typeDealOrOverrideBonus)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.011,
            child: OfferLabel(
              materialInfo: cartProduct.materialInfo,
              iconOnly: true,
            ),
          ),
        if (cartProduct.materialInfo.isFOCMaterial)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            child: const CovidTag(),
          ),
      ],
    );
  }
}
