part of 'package:ezrxmobile/presentation/home/product_offer_section.dart/product_offer_section.dart';

class _PriceLabel extends StatelessWidget {
  final MaterialInfo product;
  const _PriceLabel({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        final itemPrice = state.materialPrice[product.materialNumber];
        if (itemPrice != null) {
          return PriceComponent(
            price: itemPrice.lastPrice.getOrDefaultValue(0).toString(),
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          );
        }

        if (state.isFetching) {
          return SizedBox(
            key: WidgetKeys.priceLoading,
            width: 40,
            child: LoadingShimmer.tile(),
          );
        }

        return Text(
          'Price Not Available'.tr(),
          style: Theme.of(context).textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}
