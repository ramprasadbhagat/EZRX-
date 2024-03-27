part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentSummarySection extends StatelessWidget {
  const _PaymentSummarySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configs = context.read<SalesOrgBloc>().state.configs;

    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      key: WidgetKeys.paymentSummarySection,
      builder: (context, state) {
        return SafeArea(
          key: WidgetKeys.createAdviceSummary,
          top: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: ZPColors.lightGray2,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    PriceText(
                      data: StringUtils.displayNumber(
                        state.selectedInvoices.amountTotal,
                      ),
                      title: 'Amount payable',
                      salesOrgConfig: configs,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Text(
                        '-',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    PriceText(
                      data: '(${StringUtils.displayNumber(
                        state.selectedCredits.amountTotal.abs(),
                      )})',
                      title: 'Credit applied',
                      salesOrgConfig: configs,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${context.tr('Total')}: ',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ZPColors.darkGray,
                          ),
                    ),
                    PriceComponent(
                      salesOrgConfig:
                          context.read<SalesOrgBloc>().state.configs,
                      price: state.amountTotal.abs().toString(),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      key: WidgetKeys.payButton,
                      onPressed: state.isFetching ||
                              (!state.salesOrganisation.salesOrg
                                  .isPaymentNeedOpenWebView)
                          ? null
                          : () {
                              trackMixpanelEvent(
                                MixpanelEvents.payNowClicked,
                                props: {
                                  MixpanelProps.paymentAdviceId:
                                      state.paymentInvoiceInfoPdf.zzAdvice,
                                },
                              );
                              if (state.salesOrganisation.salesOrg
                                  .isPaymentNeedOpenWebView) {
                                _handleOpenWebview(state, context);
                              } else {
                                context.router.pushAndPopUntil(
                                  const PaymentCompletedPageRoute(),
                                  predicate: (Route route) =>
                                      route.settings.name ==
                                      PaymentPageRoute.name,
                                );
                              }
                            },
                      child: LoadingShimmer.withChild(
                        enabled: state.isLoading,
                        child: Text(
                          context.tr('Pay now'),
                          style: const TextStyle(
                            color: ZPColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _handleOpenWebview(
    NewPaymentState state,
    BuildContext context,
  ) async {
    Uri? uri;
    uri = state.salesOrganisation.salesOrg.isTH
        ? await showDialog(
            context: context,
            useSafeArea: false,
            barrierDismissible: false,
            builder: (dialogContext) => Dialog(
              insetPadding: EdgeInsets.only(
                top: MediaQuery.of(dialogContext).viewPadding.top,
              ),
              clipBehavior: Clip.hardEdge,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    24,
                  ),
                ),
              ),
              child: const PaymentWebviewPage(),
            ),
          )
        : await context.router.pushNamed('payments/payments_webview');

    /// * Document: https://zuelligpharma.atlassian.net/wiki/spaces/EZRX/pages/293306636/MB+-+UPDATE+PAYMENT+GATEWAY+LOGIC
    /// If payment is successful (Received redirect url with
    /// path payment/thank-you): Update payment gateway,
    /// back to the payment overview page and navigate to
    /// the payment advice created page
    if (uri != null && context.mounted) {
      if (uri.toString().isNotEmpty) {
        trackMixpanelEvent(
          MixpanelEvents.paymentSuccess,
          props: {
            MixpanelProps.paymentAmount: state.amountTotal,
            MixpanelProps.paymentMethod:
                state.selectedPaymentMethod.paymentMethod.getOrDefaultValue(''),
            MixpanelProps.paymentDocumentCount: state.allSelectedItems.length,
            MixpanelProps.paymentAdviceId: state.paymentInvoiceInfoPdf.zzAdvice,
          },
        );
        context.read<NewPaymentBloc>().add(
              NewPaymentEvent.updatePaymentGateway(
                paymentUrl: uri,
              ),
            );
        unawaited(
          context.router.pushAndPopUntil(
            const PaymentCompletedPageRoute(),
            predicate: (Route route) =>
                route.settings.name == PaymentPageRoute.name,
          ),
        );
      }
    } else {
      /// If payment is fails (No received redirect url with
      /// path payment/thank-you): Back to the payment overview page
      trackMixpanelEvent(
        MixpanelEvents.paymentFailure,
        props: {
          MixpanelProps.errorMessage: 'Payment failed in webview',
          MixpanelProps.paymentMethod:
              state.selectedPaymentMethod.paymentMethod.getOrDefaultValue(''),
          MixpanelProps.paymentDocumentCount: state.allSelectedItems.length,
          MixpanelProps.paymentAdviceId: state.paymentInvoiceInfoPdf.zzAdvice,
        },
      );
      if (context.mounted) {
        context.router.popUntilRouteWithPath('payments');
      }
    }
  }
}
