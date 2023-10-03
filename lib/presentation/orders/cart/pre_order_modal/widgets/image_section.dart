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
          margin: const EdgeInsets.fromLTRB(0, 10, 8, 0),
          child: ProductImage(
            materialNumber: cartProduct.getMaterialNumber,
            fit: BoxFit.fitHeight,
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
