part of 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';

class _FilterTuneIcon extends StatelessWidget {
  final bool isInvoiceTabActive;
  const _FilterTuneIcon({
    Key? key,
    required this.isInvoiceTabActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isInvoiceTabActive
        ? BlocBuilder<AllInvoicesBloc, AllInvoicesState>(
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
          )
        : BlocBuilder<AllCreditsBloc, AllCreditsState>(
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
    final isInvoiceTabActive =
        context.tabsRouter.current.name == AllInvoicesPageRoute.name;
    isInvoiceTabActive
        ? context.read<AllInvoicesFilterBloc>().add(
              AllInvoicesFilterEvent.openFilterBottomSheet(
                appliedFilter:
                    context.read<AllInvoicesBloc>().state.appliedFilter,
              ),
            )
        : context.read<AllCreditsFilterBloc>().add(
              AllCreditsFilterEvent.openFilterBottomSheet(
                appliedFilter:
                    context.read<AllCreditsBloc>().state.appliedFilter,
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
        return isInvoiceTabActive
            ? const AllInvoicesFilterBottomSheet()
            : const AllCreditsFilterBottomSheet();
      },
    );
  }
}
