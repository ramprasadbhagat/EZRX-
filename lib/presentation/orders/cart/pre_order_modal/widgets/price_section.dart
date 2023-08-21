part of '../pre_order_modal.dart';

class _PriceSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _PriceSection({required this.cartProduct, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showTaxBreakdown =
        context.read<SalesOrgBloc>().state.configs.displayItemTaxBreakdown;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PriceComponent(
          salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          price: cartProduct.finalPriceTotal.toString(),
        ),
        if (showTaxBreakdown)
          ItemTax(
            cartItem: cartProduct,
          ),
      ],
    );
  }
}
