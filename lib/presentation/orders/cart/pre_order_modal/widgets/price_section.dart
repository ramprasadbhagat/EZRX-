part of '../pre_order_modal.dart';

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
          price: cartProduct.display(PriceType.finalPriceTotal),
        ),
        if (cartProduct.showTaxBreakDown)
          ItemTax(
            cartItem: cartProduct,
          ),
      ],
    );
  }
}
