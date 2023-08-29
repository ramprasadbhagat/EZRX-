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
                isActive: !context.read<AllInvoicesBloc>().state.isLoading,
                appliedFilterCount: context
                    .read<AllInvoicesBloc>()
                    .state
                    .appliedFilter
                    .appliedFilterCount,
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
                isActive: !context.read<AllCreditsBloc>().state.isLoading,
                appliedFilterCount: context
                    .read<AllCreditsBloc>()
                    .state
                    .appliedFilter
                    .appliedFilterCount,
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
    return Stack(
      children: [
        IconButton(
          onPressed: () => isActive ? _showFilterPage(context) : null,
          icon: const Icon(
            Icons.tune,
          ),
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
              appliedFilterCount.toString(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 10,
                    color: ZPColors.white,
                  ),
            ),
          ),
        ),
      ],
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
