part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _SuggestedProductTile extends StatelessWidget {
  final MaterialInfo product;
  const _SuggestedProductTile({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: WidgetKeys.searchedProduct(product.materialNumber.displayMatNo),
          onTap: () => _onTap(context, product),
          horizontalTitleGap: 0,
          leading: const Icon(
            Icons.search,
            color: ZPColors.unselectedLabelColor,
          ),
          title: Text(
            product.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: ZPColors.accentColor,
        ),
      ],
    );
  }

  void _onTap(BuildContext context, MaterialInfo product) {
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: product.materialNumber,
            locale: context.locale,
            type: product.type,
          ),
        );
    product.type.typeMaterial
        ? _toProductDetails(context, product)
        : _toBundleDetails(context);
  }

  void _toProductDetails(BuildContext context, MaterialInfo product) {
    final eligibilityBlocState = context.read<EligibilityBloc>().state;
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            salesOrganisation: eligibilityBlocState.salesOrganisation,
            salesConfigs: eligibilityBlocState.salesOrgConfigs,
            customerCodeInfo: eligibilityBlocState.customerCodeInfo,
            shipToInfo: eligibilityBlocState.shipToInfo,
            comboDealEligible: eligibilityBlocState.comboDealEligible,
            materials: [product],
          ),
        );
    context.router.pushNamed('orders/material_details');
  }

  void _toBundleDetails(BuildContext context) =>
      context.router.pushNamed('orders/bundle_detail_page');
}
