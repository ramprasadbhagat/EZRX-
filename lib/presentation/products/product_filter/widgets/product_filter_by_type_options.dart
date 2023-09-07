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
              'Show product'.tr(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            const SizedBox(height: 8.0),
            ListTileTheme(
              horizontalTitleGap: 0,
              child: CheckboxListTile(
                value: state.materialFilter.isFavourite,
                onChanged: (value) => context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        MaterialFilterType.isFavourite,
                        !state.materialFilter.isFavourite,
                      ),
                    ),
                title: Text(
                  'Favourites'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
                side: const BorderSide(color: ZPColors.lightGray2, width: 2),
              ),
            ),
            ListTileTheme(
              horizontalTitleGap: 0,
              child: CheckboxListTile(
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
                title: Text(
                  'Items with offers'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
                side: const BorderSide(color: ZPColors.lightGray2, width: 2),
              ),
            ),
            ListTileTheme(
              horizontalTitleGap: 0,
              child: CheckboxListTile(
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
                title: Text(
                  'Bundle offers'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.only(left: 32.0),
                dense: true,
                side: const BorderSide(color: ZPColors.lightGray2, width: 2),
              ),
            ),
          ],
        );
      },
    );
  }
}
