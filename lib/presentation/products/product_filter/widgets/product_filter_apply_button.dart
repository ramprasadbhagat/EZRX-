part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterApplyButton extends StatelessWidget {
  const _ProductFilterApplyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.filterApplyButton,
      onPressed: () {
        final selectedFilter =
            context.read<MaterialFilterBloc>().state.materialFilter;
        _trackFilterAppliedEvent(selectedFilter);
        Navigator.of(context).pop(selectedFilter);
      },
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: const MaterialStatePropertyAll(
              ZPColors.primary,
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: ZPColors.primary),
              ),
            ),
          ),
      child: Text(
        'Apply'.tr(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: ZPColors.white,
            ),
      ),
    );
  }

  void _trackFilterAppliedEvent(MaterialFilter filter) {
    final showProductFilter = [];
    if (filter.isFavourite) showProductFilter.add('Favourites');
    if (filter.isProductOffer) showProductFilter.add('Items with offers');
    if (filter.bundleOffers) showProductFilter.add('Bundle offers');

    trackMixpanelEvent(
      MixpanelEvents.productFilterApplied,
      props: {
        if (showProductFilter.isNotEmpty)
          MixpanelProps.filterShowProduct: showProductFilter,
        MixpanelProps.filterSortBy: filter.sortBy.title,
        if (filter.manufactureListSelected.isNotEmpty)
          MixpanelProps.filterManufacturer: filter.manufactureListSelected,
        if (filter.countryListSelected.isNotEmpty)
          MixpanelProps.filterCountryOfOrigin: filter.countryListSelected,
      },
    );
  }
}
