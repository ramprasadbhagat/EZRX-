part of 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';

class _DownloadEInvoiceButton extends StatelessWidget {
  const _DownloadEInvoiceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DownloadEInvoiceBloc>(
      create: (context) => locator<DownloadEInvoiceBloc>()
        ..add(
          DownloadEInvoiceEvent.fetch(
            invoiceNumber: context
                .read<CreditAndInvoiceDetailsBloc>()
                .state
                .basicInfo
                .searchKey
                .getOrDefaultValue(''),
            salesOrg: context.read<EligibilityBloc>().state.salesOrg,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
          ),
        ),
      child: BlocConsumer<DownloadEInvoiceBloc, DownloadEInvoiceState>(
        listenWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (success) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, downloadEInvoiceState) {
          return downloadEInvoiceState.eInvoice.url.isNotEmpty
              ? BlocBuilder<DownloadPaymentAttachmentsBloc,
                  DownloadPaymentAttachmentsState>(
                  buildWhen: (previous, current) =>
                      previous.isDownloadInProgress !=
                      current.isDownloadInProgress,
                  builder: (context, state) {
                    return SafeArea(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: ZPColors.boxShadowGray,
                              blurRadius: 2.0,
                              offset: Offset(0.1, -2.75),
                            ),
                          ],
                          color: ZPColors.white,
                        ),
                        child: OutlinedButton(
                          key: WidgetKeys.downloadEInvoiceButton,
                          onPressed: downloadEInvoiceState
                                      .isEligibileForEInvoiceButton ||
                                  state.isDownloadInProgress
                              ? null
                              : () {
                                  context
                                      .read<DownloadPaymentAttachmentsBloc>()
                                      .add(
                                        DownloadPaymentAttachmentEvent
                                            .downloadEInvoice(
                                          eInvoice:
                                              downloadEInvoiceState.eInvoice,
                                        ),
                                      );
                                },
                          child: state.isDownloadInProgress
                              ? LoadingAnimationWidget.discreteCircle(
                                  key: WidgetKeys
                                      .downloadEInvoiceloadingAnimationWidget,
                                  color: ZPColors.primary,
                                  secondRingColor: ZPColors.secondary,
                                  thirdRingColor: ZPColors.orange,
                                  size: 18,
                                )
                              : Text(
                                  context.tr('Download e-invoice'),
                                ),
                        ),
                      ),
                    );
                  },
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
