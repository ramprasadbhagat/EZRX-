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
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${context.tr('Total')}: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: ZPColors.darkGray),
                            ),
                            WidgetSpan(
                              child: PriceComponent(
                                salesOrgConfig:
                                    context.read<SalesOrgBloc>().state.configs,
                                price: state.amountTotal.abs().toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      key: WidgetKeys.payButton,
                      onPressed: state.isFetching ||
                              (!state.salesOrganisation.salesOrg
                                  .isPaymentNeedOpenWebView)
                          ? null
                          : () {
                              trackMixpanelEvent(
                                TrackingEvents.payNowClicked,
                                props: {
                                  TrackingProps.paymentAdviceId:
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
          TrackingEvents.successfulPayment,
          props: {
            TrackingProps.paymentAmount: state.amountTotal,
            TrackingProps.paymentMethod:
                state.selectedPaymentMethod.paymentMethod.getOrDefaultValue(''),
            TrackingProps.paymentDocumentCount: state.allSelectedItems.length,
            TrackingProps.paymentAdviceId: state.paymentInvoiceInfoPdf.zzAdvice,
          },
        );
        trackClevertapEvent(
          TrackingEvents.successfulPayment,
          props: {
            TrackingProps.paymentMethod:
                state.selectedPaymentMethod.paymentMethod.getOrDefaultValue(''),
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
        TrackingEvents.paymentFailure,
        props: {
          TrackingProps.errorMessage: 'Payment failed in webview',
          TrackingProps.paymentMethod:
              state.selectedPaymentMethod.paymentMethod.getOrDefaultValue(''),
          TrackingProps.paymentDocumentCount: state.allSelectedItems.length,
          TrackingProps.paymentAdviceId: state.paymentInvoiceInfoPdf.zzAdvice,
        },
      );
      if (context.mounted) {
        context.router.popUntilRouteWithPath('payments');
      }
    }
  }
}
