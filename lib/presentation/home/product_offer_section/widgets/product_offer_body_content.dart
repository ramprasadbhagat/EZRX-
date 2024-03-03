part of 'package:ezrxmobile/presentation/home/product_offer_section/product_offer_section.dart';

class _ProductOfferBodyContent extends StatelessWidget {
  final BuildContext ctx;
  const _ProductOfferBodyContent({Key? key, required this.ctx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialListBloc, MaterialListState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.materialList != current.materialList,
      builder: (context, state) {
        return state.isFetching || state.materialList.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: SectionTitle(
                      key: WidgetKeys.productsOnOffer,
                      title: 'Products on offer',
                      onTapIconButton: () => state.isFetching
                          ? null
                          : _navigateForMoreProductWithOffers(ctx),
                    ),
                  ),
                  SizedBox(
                    height: context
                        .read<EligibilityBloc>()
                        .state
                        .salesOrgConfigs
                        .homeOfferListHeight,
                    child: state.isFetching
                        ? LoadingShimmer.logo(
                            key: WidgetKeys.productOfferSectionLoaderImage,
                          )
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            children: state.materialList
                                .map((e) => _ProductTile(materialInfo: e))
                                .toList(),
                          ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }

  void _navigateForMoreProductWithOffers(BuildContext context) {
    context.read<MaterialListBloc>().add(
          MaterialListEvent.fetch(
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              isProductOffer: true,
            ),
          ),
        );
    context.navigateTo(const ProductsTabRoute());
  }
}
