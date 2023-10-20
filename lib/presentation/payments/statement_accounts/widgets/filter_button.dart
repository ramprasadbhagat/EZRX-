part of 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';

class _Filter extends StatelessWidget {
  const _Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoaBloc, SoaState>(
      buildWhen: (previous, current) =>
          previous.filterList != current.filterList,
      builder: (context, state) {
        return state.filterList.isNotEmpty
            ? Column(
                children: <Widget>[
                  const _FilterButton(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 6,
                    ),
                    child: Row(
                      children: [
                        Text(
                          context.tr('Search results'),
                          style: Theme.of(context).textTheme.labelMedium,
                          key: WidgetKeys.soaSearchResultsKey,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: ZPColors.paleBlueGray,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            state.filterList.length.toString(),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          BlocBuilder<SoaBloc, SoaState>(
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return Stack(
                children: <Widget>[
                  IconButton(
                    key: WidgetKeys.soaFilterButton,
                    onPressed: state.isFetching || state.filterList.isEmpty
                        ? null
                        : () => _showFilterBottomSheet(context),
                    icon: const Icon(Icons.tune_outlined),
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ZPColors.orange,
                      ),
                      padding: const EdgeInsets.all(3),
                      alignment: Alignment.center,
                      child: Text(
                        state.appliedFilter.appliedFilterCount.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                              color: ZPColors.white,
                            ),
                        key: WidgetKeys.genericKey(
                          key:
                              'soaFilterCount#${state.appliedFilter.appliedFilterCount.toString()}',
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Text(
            context.tr('Filter by month'),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ZPColors.neutralsBlack),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    context.read<SoaFilterBloc>().add(
          SoaFilterEvent.setFilter(
            context.read<SoaBloc>().state.appliedFilter,
          ),
        );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (_) {
        return const _SOAFilterBottomSheet(
          key: WidgetKeys.soaFilterbottomSheetKey,
        );
      },
    ).then(
      (value) {
        if (value == null) return;
        applyFilter(context: context, filter: value as SoaFilter);
      },
    );
  }

  void applyFilter({
    required BuildContext context,
    required SoaFilter filter,
  }) {
    final soaBloc = context.read<SoaBloc>();
    if (soaBloc.state.appliedFilter == filter) return;
    soaBloc.add(SoaEvent.updateFilter(soaFilter: filter));
  }
}
