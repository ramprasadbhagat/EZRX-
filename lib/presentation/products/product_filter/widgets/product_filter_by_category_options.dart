part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterByCategoryOptions extends StatelessWidget {
  const _ProductFilterByCategoryOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by'.tr(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 22.0),
        BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
          buildWhen: (previous, current) =>
              previous.materialFilter.manufactureListSelected !=
                  current.materialFilter.manufactureListSelected ||
              previous.isFetching != current.isFetching,
          builder: (context, state) => LoadingShimmer.withChild(
            enabled: state.isFetching,
            child: InkWell(
              onTap: state.isFetching
                  ? null
                  : () => _showFilterByPage(
                        context: context,
                        materialFilterType: MaterialFilterType.manufactured,
                      ),
              child: Row(
                children: [
                  Text(
                    'Manufacturer'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZPColors.neutralsBlack,
                        ),
                  ),
                  const SizedBox(width: 4.0),
                  if (state.materialFilter.manufactureListSelected.isNotEmpty)
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ZPColors.primary,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        child: Text(
                          '${state.materialFilter.manufactureListSelected.length} ${'selected'.tr()}',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: ZPColors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                          textAlign: TextAlign.center,
                          key: WidgetKeys.manufactureListSelectedLength,
                        ),
                      ),
                    ),
                  const SizedBox(width: 4.0),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: ZPColors.orange,
                    size: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 22.0),
        BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
          buildWhen: (previous, current) =>
              previous.materialFilter.countryListSelected !=
                  current.materialFilter.countryListSelected ||
              previous.isFetching != current.isFetching,
          builder: (context, state) => LoadingShimmer.withChild(
            enabled: state.isFetching,
            child: InkWell(
              onTap: state.isFetching
                  ? null
                  : () => _showFilterByPage(
                        context: context,
                        materialFilterType: MaterialFilterType.countryList,
                      ),
              child: Row(
                children: [
                  Text(
                    'Country of origin'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZPColors.neutralsBlack,
                        ),
                  ),
                  const SizedBox(width: 4.0),
                  if (state.materialFilter.countryListSelected.isNotEmpty)
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ZPColors.primary,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        child: Text(
                          '${state.materialFilter.countryListSelected.length} ${'selected'.tr()}',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: ZPColors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                          textAlign: TextAlign.center,
                          key: WidgetKeys.countryListSelectedLength,
                        ),
                      ),
                    ),
                  const SizedBox(width: 4.0),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: ZPColors.orange,
                    size: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFilterByPage({
    required BuildContext context,
    required MaterialFilterType materialFilterType,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      builder: (_) => FilterByPage(
        materialFilterType: materialFilterType,
      ),
    ).then(
      (value) => context.read<MaterialFilterBloc>().add(
            const MaterialFilterEvent.updateSearchKey(''),
          ),
    );
  }
}
