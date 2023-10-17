part of '../return_root.dart';

class _FilterReturnByItem extends StatelessWidget {
  const _FilterReturnByItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnListByItemBloc, ReturnListByItemState>(
      buildWhen: (previous, current) =>
          previous.appliedFilter.appliedFilterCount !=
              current.appliedFilter.appliedFilterCount ||
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return CustomBadge(
          Icons.tune,
          count: state.appliedFilter.appliedFilterCount,
          badgeColor: ZPColors.orange,
          onPressed: () => !state.isFetching
              ? _showFilterPage(
                  context: context,
                  stateFilter: state.appliedFilter,
                )
              : null,
        );
      },
    );
  }

  void _showFilterPage({
    required BuildContext context,
    required ReturnFilter stateFilter,
  }) {
    context.read<ViewByItemReturnFilterBloc>().add(
          ViewByItemReturnFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter:
                context.read<ReturnListByItemBloc>().state.appliedFilter,
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
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return const ReturnByItemFilterPage();
      },
    ).then((value) {
      if (value != null && value as ReturnFilter != stateFilter) {
        trackMixpanelEvent(
          MixpanelEvents.returnRequestFiltered,
          props: {
            MixpanelProps.subTabFrom: RouterUtils.buildRouteTrackingName(
              const ReturnByItemPageRoute().path,
            ),
            MixpanelProps.filterUsed: value.trackingInfo,
          },
        );
        context.read<ReturnListByItemBloc>().add(
              ReturnListByItemEvent.fetch(
                appliedFilter: value,
                searchKey: context.read<ReturnListByItemBloc>().state.searchKey,
              ),
            );
      }
    });
  }
}
