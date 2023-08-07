part of '../pre_order_modal.dart';

class _ImageSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _ImageSection({required this.cartProduct, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showBorder: true,
      showShadow: false,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.fromLTRB(0, 10, 8, 0),
      child: ProductImage(
        width: MediaQuery.of(context).size.height * 0.06,
        height: MediaQuery.of(context).size.height * 0.06,
        materialNumber: cartProduct.getMaterialNumber,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
