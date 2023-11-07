part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterByTypeOptions extends StatelessWidget {
  const _ProductFilterByTypeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) =>
          previous.materialFilter != current.materialFilter,
      builder: (context, state) {
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
              key: WidgetKeys.showProductCheckbox('Favourites'),
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
              key: WidgetKeys.showProductCheckbox('Items with offers'),
              value: state.materialFilter.isProductOffer,
              onChanged: (value) {
                if (state.materialFilter.bundleOffers) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.bundleOffers,
                          !state.materialFilter.bundleOffers,
                        ),
                      );
                }
                context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        MaterialFilterType.productOffers,
                        !state.materialFilter.isProductOffer,
                      ),
                    );
              },
              title: 'Items with offers',
            ),
            _ListTileThemeWidget(
              key: WidgetKeys.showProductCheckbox('Bundle offers'),
              value: state.materialFilter.bundleOffers,
              onChanged: (value) {
                if (!state.materialFilter.isProductOffer) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.productOffers,
                          !state.materialFilter.isProductOffer,
                        ),
                      );
                }
                context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        MaterialFilterType.bundleOffers,
                        !state.materialFilter.bundleOffers,
                      ),
                    );
              },
              title: 'Bundle offers',
            ),
            if (context.read<EligibilityBloc>().state.comboDealEligible)
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
          ],
        );
      },
    );
  }
}
