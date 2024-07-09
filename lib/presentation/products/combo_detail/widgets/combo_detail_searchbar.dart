part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboDetailSearchBar extends StatelessWidget {
  const _ComboDetailSearchBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComboDealMaterialDetailBloc,
        ComboDealMaterialDetailState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        final bloc = context.read<ComboDealMaterialDetailBloc>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomSearchBar(
            key: WidgetKeys.genericKey(
              key: state.searchKey.searchValueOrEmpty,
            ),
            initialValue: state.searchKey.getOrDefaultValue(''),
            hintText: context.tr('Search product or code'),
            enabled: true,
            onSearchChanged: (value) => bloc.add(
              ComboDealMaterialDetailEvent.search(
                searchKey: SearchKey.search(value),
              ),
            ),
            onSearchSubmitted: (value) => bloc.add(
              ComboDealMaterialDetailEvent.search(
                searchKey: SearchKey.search(value),
              ),
            ),
            customValidator: (value) => SearchKey.search(value).isValid(),
            onClear: () => bloc.add(
              const ComboDealMaterialDetailEvent.clearSearch(),
            ),
          ),
        );
      },
    );
  }
}
