part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboDetailBodyContent extends StatelessWidget {
  final bool haveFixedMaterials;
  const _ComboDetailBodyContent({this.haveFixedMaterials = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComboDealMaterialDetailBloc,
        ComboDealMaterialDetailState>(
      listenWhen: (previous, current) =>
          (previous.isFetchingComboInfo != current.isFetchingComboInfo &&
              !current.isFetchingComboInfo) ||
          (previous.isLoadMore != current.isLoadMore && !current.isLoadMore),
      listener: (context, state) {
        final eligibilityBlocState = context.read<EligibilityBloc>().state;
        context.read<MaterialPriceBloc>().add(
              MaterialPriceEvent.fetchPriceCartProduct(
                salesOrganisation: eligibilityBlocState.salesOrganisation,
                salesConfigs: eligibilityBlocState.salesOrgConfigs,
                customerCodeInfo: eligibilityBlocState.customerCodeInfo,
                shipToInfo: eligibilityBlocState.shipToInfo,
                comboDealEligible: eligibilityBlocState.comboDealEligible,
                products: state.allMaterialsInfo,
              ),
            );
      },
      buildWhen: (previous, current) =>
          previous.isFetchingPrice != current.isFetchingPrice ||
          previous.isLoadMore != current.isLoadMore ||
          previous.searchableList != current.searchableList,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ScrollList<PriceAggregate>(
            noRecordFoundWidget: const NoRecordFound(
              svgImage: SvgImage.faqSearch,
            ),
            header: Column(
              children: [
                if (haveFixedMaterials) ...[
                  BlocBuilder<ComboDealMaterialDetailBloc,
                      ComboDealMaterialDetailState>(
                    buildWhen: (previous, current) =>
                        previous.isFetchingPrice != current.isFetchingPrice ||
                        previous.mandatoryMaterials !=
                            current.mandatoryMaterials,
                    builder: (context, state) {
                      return state.mandatoryMaterials.isEmpty
                          ? const SizedBox.shrink()
                          : Column(
                              children: state.mandatoryMaterials.values
                                  .map(
                                    (item) => LoadingShimmer.withChild(
                                      enabled: state.isFetchingPrice,
                                      child: _ComboProductTile(
                                        comboItem: item,
                                        isMandatory: true,
                                        isFixed: true,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12)
                        .copyWith(bottom: 24),
                    child: Text(
                      context.tr(
                        'Select at least one product from the below section to receive offered price',
                      ),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
                const _ComboDetailSearchBar(),
                const _TotalComboCount(),
                const Divider(
                  endIndent: 0,
                  indent: 0,
                  thickness: 0.5,
                ),
                const SizedBox(height: 24),
              ],
            ),
            controller: ScrollController(),
            onRefresh: () {},
            onLoadingMore: () {
              if (state.currentDeal.scheme.comboDealCanLoadmore &&
                  state.canLoadMore) {
                context.read<ComboDealMaterialDetailBloc>().add(
                      ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal(
                        comboDeal: state.currentDeal,
                        principles: [state.currentPrincipalCode],
                      ),
                    );
              }
            },
            isLoading: state.isLoadMore,
            itemBuilder: (context, index, item) => _ComboProductTile(
              comboItem: item,
              isMandatory: haveFixedMaterials,
            ),
            items: state.searchableList.values.toList(),
          ),
        );
      },
    );
  }
}
