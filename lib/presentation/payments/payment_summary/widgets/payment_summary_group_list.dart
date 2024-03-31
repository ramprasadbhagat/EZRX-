part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryGroupList extends StatelessWidget {
  final ScrollController scrollController;
  const _PaymentSummaryGroupList({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentSummaryBloc, PaymentSummaryState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) => ScrollList<PaymentSummaryGroup>(
        noRecordFoundWidget: const NoRecordFound(
          title: 'No Payment Summary Found',
        ),
        controller: scrollController,
        onRefresh: () => context.read<PaymentSummaryBloc>().add(
              PaymentSummaryEvent.fetch(
                appliedFilter: PaymentSummaryFilter.defaultFilter(),
                searchKey: SearchKey.searchFilter(''),
              ),
            ),
        onLoadingMore: () => context.read<PaymentSummaryBloc>().add(
              const PaymentSummaryEvent.loadMore(),
            ),
        isLoading: state.isFetching,
        itemBuilder: (context, index, itemInfo) => _PaymentSummaryGroupItem(
          key: WidgetKeys.paymentSummaryItem,
          paymentSummaryGroup: itemInfo,
          showDivider: index != 0,
        ),
        items: state.details.paymentSummaryGroupList,
      ),
    );
  }
}
