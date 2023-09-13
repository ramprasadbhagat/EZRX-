part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _PriceSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _PriceSection({required this.cartProduct, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PriceComponent(
          salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          price: cartProduct.finalPriceTotalForAllMaterial,
        ),
        if (cartProduct.showTaxBreakDown &&
            !cartProduct.materialInfo.isFOCMaterial)
          ItemTax(
            cartItem: cartProduct,
          ),
      ],
    );
  }
}
