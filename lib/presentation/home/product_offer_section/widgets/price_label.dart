part of 'package:ezrxmobile/presentation/home/product_offer_section/product_offer_section.dart';

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
        final eligibilityState = context.read<EligibilityBloc>().state;
        final isMYPnGSalesRep =
            eligibilityState.isMYExternalSalesRepUser && product.isPnGPrinciple;

        if (itemPrice != null && !isMYPnGSalesRep) {
          return PriceComponent(
            price: itemPrice.lastPrice.getOrDefaultValue(0).toString(),
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
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
          context.tr('Price Not Available'),
          style: Theme.of(context).textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}
