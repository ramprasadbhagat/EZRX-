part of 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';

class _FilterTuneIcon extends StatelessWidget {
  final String currentActiveTabName;
  const _FilterTuneIcon({
    Key? key,
    required this.currentActiveTabName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentActiveTabName == AllInvoicesPageRoute.name) {
      return BlocBuilder<AllInvoicesBloc, AllInvoicesState>(
        buildWhen: (previous, current) =>
            previous.appliedFilter.appliedFilterCount !=
                current.appliedFilter.appliedFilterCount ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return _FilterElement(
            isActive: !state.isLoading,
            appliedFilterCount: state.appliedFilter.appliedFilterCount,
          );
        },
      );
    }
    if (currentActiveTabName == AllCreditsPageRoute.name) {
      return BlocBuilder<AllCreditsBloc, AllCreditsState>(
        buildWhen: (previous, current) =>
            previous.appliedFilter.appliedFilterCount !=
                current.appliedFilter.appliedFilterCount ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return _FilterElement(
            isActive: !state.isLoading,
            appliedFilterCount: state.appliedFilter.appliedFilterCount,
          );
        },
      );
    }
    if (currentActiveTabName == FullSummaryPageRoute.name) {
      return BlocBuilder<FullSummaryBloc, FullSummaryState>(
        buildWhen: (previous, current) =>
            previous.appliedFilter.appliedFilterCount !=
                current.appliedFilter.appliedFilterCount ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return _FilterElement(
            isActive: !state.isLoading,
            appliedFilterCount: state.appliedFilter.appliedFilterCount,
          );
        },
      );
    }

    return const SizedBox.shrink();
  }
}

class _FilterElement extends StatelessWidget {
  const _FilterElement({
    Key? key,
    required this.isActive,
    required this.appliedFilterCount,
  }) : super(key: key);
  final bool isActive;
  final int appliedFilterCount;

  @override
  Widget build(BuildContext context) {
    return CustomBadge(
      Icons.tune_outlined,
      key: WidgetKeys.paymentSummaryFilterIcon,
      badgeColor: ZPColors.orange,
      count: appliedFilterCount,
      onPressed: isActive
          ? () {
              _showFilterPage(context);
            }
          : () {},
    );
  }

  void _showFilterPage(BuildContext context) {
    final currentActiveTabName = context.tabsRouter.current.name;
    if (currentActiveTabName == AllInvoicesPageRoute.name) {
      context.read<AllInvoicesFilterBloc>().add(
            AllInvoicesFilterEvent.openFilterBottomSheet(
              appliedFilter:
                  context.read<AllInvoicesBloc>().state.appliedFilter,
            ),
          );
    }
    if (currentActiveTabName == AllCreditsPageRoute.name) {
      context.read<AllCreditsFilterBloc>().add(
            AllCreditsFilterEvent.openFilterBottomSheet(
              appliedFilter: context.read<AllCreditsBloc>().state.appliedFilter,
            ),
          );
    }

    if (currentActiveTabName == FullSummaryPageRoute.name) {
      context.read<FullSummaryFilterBloc>().add(
            FullSummaryFilterEvent.openFilterBottomSheet(
              appliedFilter:
                  context.read<FullSummaryBloc>().state.appliedFilter,
            ),
          );
    }

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
        if (currentActiveTabName == AllInvoicesPageRoute.name) {
          return const AllInvoicesFilterBottomSheet();
        }
        if (currentActiveTabName == AllCreditsPageRoute.name) {
          return const AllCreditsFilterBottomSheet();
        }
        if (currentActiveTabName == FullSummaryPageRoute.name) {
          return const FullSummaryFilterBottomSheet();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
