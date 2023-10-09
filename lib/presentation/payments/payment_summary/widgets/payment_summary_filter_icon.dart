part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryFilterIcon extends StatelessWidget {
  const _PaymentSummaryFilterIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryBloc, PaymentSummaryState>(
      buildWhen: (previous, current) =>
          previous.appliedFilter.appliedFilterCount !=
              current.appliedFilter.appliedFilterCount ||
          previous.isFetching != current.isFetching,
      builder: (context, state) => CustomBadge(
        Icons.tune,
        key: WidgetKeys.paymentSummaryFilterIcon,
        badgeColor: ZPColors.orange,
        count: state.appliedFilter.appliedFilterCount,
        onPressed: () {
          context.read<PaymentSummaryFilterBloc>().add(
                PaymentSummaryFilterEvent.openFilterBottomSheet(
                  appliedFilter: state.appliedFilter,
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
            builder: (_) => const _PaymentSummaryFilterBottomSheet(),
          );
        },
      ),
    );
  }
}
