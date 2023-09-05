part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryGroupList extends StatelessWidget {
  const _PaymentSummaryGroupList({Key? key}) : super(key: key);

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
        controller: ScrollController(),
        onRefresh: () => context.read<PaymentSummaryBloc>().add(
              PaymentSummaryEvent.fetchPaymentSummaryList(
                salesOrganization:
                    context.read<EligibilityBloc>().state.salesOrganisation,
                customerCodeInfo:
                    context.read<EligibilityBloc>().state.customerCodeInfo,
              ),
            ),
        onLoadingMore: () => context.read<PaymentSummaryBloc>().add(
              PaymentSummaryEvent.loadMorePaymentSummary(
                salesOrganization:
                    context.read<EligibilityBloc>().state.salesOrganisation,
                customerCodeInfo:
                    context.read<EligibilityBloc>().state.customerCodeInfo,
              ),
            ),
        isLoading: state.isFetching,
        itemBuilder: (context, index, itemInfo) => _PaymentSummaryGroupItem(
          paymentSummaryGroup: itemInfo,
          showDivider: index != 0,
        ),
        items: state.paymentSummaryDetailsResponse.paymentSummaryList
            .getPaymentSummaryGroupList,
      ),
    );
  }
}
