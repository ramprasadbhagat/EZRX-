part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceNextStep extends StatelessWidget {
  const _PaymentAdviceNextStep({Key? key}) : super(key: key);

  Future<bool?> _showDeleteBottomSheet(
    BuildContext context, {
    required String paymentAdviceNumber,
  }) {
    return showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => DeleteCancelAdviceBottomSheet.delete(
        paymentAdviceNumber: paymentAdviceNumber,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.paymentAdviceNextStep,
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Next steps and notes'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 16),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: '${context.tr(
                  'Click on the “Pay now” button on the bottom right to proceed with the payment via your selected payment method ‘Payment Gateway’',
                )}.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: context.tr(
                  'It may take a few seconds for the payment gateway to open in a new browser tab.',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: context.tr(
                  'Please do not click on the back button or refresh/cancel the page while the payment gateway is loading.',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.warningTextColor,
                    ),
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: context.tr(
                  'You may download the payment advice after the payment process or through the payment summary page.',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: context.tr(
                  'The payment advice copy will be sent to the email associated with this account.',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: context.tr(
                  'If there\'s any error in the selected invoice/credit notes, please ',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
                children: [
                  TextSpan(
                    text: context.tr(
                      'delete',
                    ),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZPColors.extraDarkGreen,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        final paymentInvoicePDF = context
                            .read<NewPaymentBloc>()
                            .state
                            .paymentInvoiceInfoPdf;
                        context.read<PaymentSummaryDetailsBloc>().add(
                              PaymentSummaryDetailsEvent
                                  .fetchPaymentSummaryDetailsInfo(
                                details:
                                    PaymentSummaryDetails.fromPaymentInvoicePDF(
                                  paymentInvoicePDF,
                                ),
                                isMarketPlace: context.isMPPayment,
                              ),
                            );

                        _showDeleteBottomSheet(
                          context,
                          paymentAdviceNumber: paymentInvoicePDF.zzAdvice,
                        );
                      },
                  ),
                  TextSpan(
                    text: context.tr(
                      ' this payment advice and generate a new payment advice.',
                    ),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZPColors.extraLightGrey4,
                        ),
                  ),
                ],
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: context.tr(
                  'Disclaimer: eZRx+ does not store your card information',
                ),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
