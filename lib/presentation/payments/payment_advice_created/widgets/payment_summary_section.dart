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
                      onPressed: state.isLoading ||
                              (!state.salesOrganisation.salesOrg
                                  .isPaymentNeedOpenWebView)
                          ? null
                          : () async {
                              state.salesOrganisation.salesOrg
                                      .isPaymentNeedOpenWebView
                                  ? await context.router
                                      .pushNamed('payments/payments_webview')
                                      .then((uri) {
                                      /// * Document: https://zuelligpharma.atlassian.net/wiki/spaces/EZRX/pages/293306636/MB+-+UPDATE+PAYMENT+GATEWAY+LOGIC
                                      /// If payment is successful (Received redirect url with
                                      /// path payment/thank-you): Update payment gateway,
                                      /// back to the payment overview page and navigate to
                                      /// the payment advice created page
                                      if (uri != null) {
                                        trackMixpanelEvent(
                                          MixpanelEvents.paymentSuccess,
                                          props: {
                                            MixpanelProps.paymentAmount:
                                                state.amountTotal,
                                            MixpanelProps.paymentMethod: state
                                                .selectedPaymentMethod
                                                .paymentMethod
                                                .getOrDefaultValue(''),
                                            MixpanelProps.paymentDocumentCount:
                                                state.allSelectedItems.length,
                                            MixpanelProps.paymentAdviseId: state
                                                .paymentInvoiceInfoPdf.zzAdvice,
                                          },
                                        );
                                        context.read<NewPaymentBloc>().add(
                                              NewPaymentEvent
                                                  .updatePaymentGateway(
                                                paymentUrl: uri as Uri,
                                              ),
                                            );
                                        context.router.pushAndPopUntil(
                                          const PaymentCompletedPageRoute(),
                                          predicate: (Route route) =>
                                              route.settings.name ==
                                              PaymentPageRoute.name,
                                        );
                                      } else {
                                        /// If payment is fails (No received redirect url with
                                        /// path payment/thank-you):
                                        /// * If on TH market: Back to the payment overview
                                        /// page and navigate to the payment advice created page
                                        /// * If on other market: Back to the payment overview page
                                        trackMixpanelEvent(
                                          MixpanelEvents.paymentFailure,
                                          props: {
                                            MixpanelProps.errorMessage:
                                                'Payment failed in webview',
                                            MixpanelProps.paymentMethod: state
                                                .selectedPaymentMethod
                                                .paymentMethod
                                                .getOrDefaultValue(''),
                                            MixpanelProps.paymentDocumentCount:
                                                state.allSelectedItems.length,
                                            MixpanelProps.paymentAdviseId: state
                                                .paymentInvoiceInfoPdf.zzAdvice,
                                          },
                                        );
                                        context
                                                .read<EligibilityBloc>()
                                                .state
                                                .salesOrg
                                                .isTH
                                            ? context.router.pushAndPopUntil(
                                                const PaymentCompletedPageRoute(),
                                                predicate: (Route route) =>
                                                    route.settings.name ==
                                                    PaymentPageRoute.name,
                                              )
                                            : context.router
                                                .popUntilRouteWithPath(
                                                'payments',
                                              );
                                      }
                                    })
                                  : await context.router.pushAndPopUntil(
                                      const PaymentCompletedPageRoute(),
                                      predicate: (Route route) =>
                                          route.settings.name ==
                                          PaymentPageRoute.name,
                                    );
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
}
