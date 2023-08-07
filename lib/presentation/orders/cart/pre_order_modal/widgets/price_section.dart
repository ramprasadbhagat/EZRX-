part of '../pre_order_modal.dart';

class _PriceSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _PriceSection({required this.cartProduct, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PriceComponent(
      salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
      price: cartProduct.finalPriceTotal.toString(),
      currencyCodeTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ZPColors.primary,
          ),
      priceTextStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: ZPColors.primary,
          ),
    );
  }
}
