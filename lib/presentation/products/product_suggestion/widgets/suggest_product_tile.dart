part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _SuggestedProductTile extends StatelessWidget {
  final MaterialInfo product;
  final String parentRoute;
  const _SuggestedProductTile({
    Key? key,
    required this.product,
    required this.parentRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: WidgetKeys.searchedProduct(product.materialNumber.displayMatNo),
          onTap: () {
            trackMixpanelEvent(
              MixpanelEvents.productSearch,
              props: {
                MixpanelProps.searchKeyword: context
                    .read<ProductSearchBloc>()
                    .state
                    .searchKey
                    .getOrDefaultValue(''),
                MixpanelProps.searchFrom:
                    RouterUtils.buildRouteTrackingName(parentRoute),
                MixpanelProps.searchMethod: 'drop down list',
              },
            );
            product.type.typeMaterial
                ? context.router
                    .push(ProductDetailsPageRoute(materialInfo: product))
                : context.router
                    .push(BundleDetailPageRoute(materialInfo: product));
          },
          horizontalTitleGap: 0,
          leading: const Icon(
            Icons.search,
            color: ZPColors.unselectedLabelColor,
          ),
          title: Text(
            product.name,
            style: Theme.of(context).textTheme.titleSmall,
            key: WidgetKeys.suggestedProductsTile,
          ),
          trailing: product.isMarketPlace ? const MarketPlaceLogo() : null,
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: ZPColors.accentColor,
        ),
      ],
    );
  }
}
