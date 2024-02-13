part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterByTypeOptions extends StatelessWidget {
  const _ProductFilterByTypeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) =>
          previous.materialFilter != current.materialFilter,
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('Show product'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            const SizedBox(height: 8.0),
            _ListTileThemeWidget(
              value: state.materialFilter.isFavourite,
              onChanged: (value) => context.read<MaterialFilterBloc>().add(
                    MaterialFilterEvent.updateSelectedMaterialFilter(
                      MaterialFilterType.isFavourite,
                      !state.materialFilter.isFavourite,
                    ),
                  ),
              title: 'Favourites',
            ),
            _ListTileThemeWidget(
              value: state.materialFilter.isProductOffer,
              onChanged: (value) => context.read<MaterialFilterBloc>().add(
                    MaterialFilterEvent.updateSelectedMaterialFilter(
                      MaterialFilterType.productOffers,
                      !state.materialFilter.isProductOffer,
                    ),
                  ),
              title: 'Items with offers',
            ),
            if (!eligibilityState.salesOrgConfigs.disableBundles)
              _ListTileThemeWidget(
                value: state.materialFilter.bundleOffers,
                onChanged: (value) => context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        MaterialFilterType.bundleOffers,
                        !state.materialFilter.bundleOffers,
                      ),
                    ),
                title: 'Bundle offers',
              ),
            if (eligibilityState.salesOrgConfigs.enableComboDeals)
              _ListTileThemeWidget(
                value: state.materialFilter.comboOffers,
                onChanged: (value) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.comboOffers,
                          !state.materialFilter.comboOffers,
                        ),
                      );
                },
                title: 'Combo offers',
              ),
            if (eligibilityState.canOrderCovidMaterial)
              _ListTileThemeWidget(
                value: state.materialFilter.isCovidSelected,
                onChanged: (value) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.isCovidSelected,
                          !state.materialFilter.isCovidSelected,
                        ),
                      );
                },
                title: 'Covid-19',
              ),
          ],
        );
      },
    );
  }
}
