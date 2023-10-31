part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceNextStep extends StatelessWidget {
  const _PaymentAdviceNextStep({Key? key}) : super(key: key);

  Future<bool?> _showConfirmBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => const ConfirmBottomSheet(
        title: 'Leave page?',
        content: 'Payment has not been completed.',
        confirmButtonText: 'Leave',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 24),
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
                  'If you encountered an error with the payment, delete the system-generated payment advice in the eZRx payment summary section and regenerate a new payment advice by repeating the payment process.',
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
                  'If there\'s any error in the selected invoice/credit notes, please go to ',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
                children: [
                  TextSpan(
                    text: context.tr(
                      'Payment Advice #${context.read<NewPaymentBloc>().state.paymentInvoiceInfoPdf.zzAdvice}',
                    ),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZPColors.extraDarkGreen,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final confirmed =
                            await _showConfirmBottomSheet(context);
                        if (confirmed ?? false) {
                          if (context.mounted) {
                            context.read<PaymentSummaryDetailsBloc>().add(
                                  PaymentSummaryDetailsEvent
                                      .fetchPaymentSummaryDetailsInfo(
                                    paymentSummaryDetails:
                                        PaymentSummaryDetails.empty().copyWith(
                                      paymentID: StringValue(
                                        context
                                            .read<NewPaymentBloc>()
                                            .state
                                            .paymentInvoiceInfoPdf
                                            .paymentID,
                                      ),
                                    ),
                                  ),
                                );

                            unawaited(
                              context.router
                                  .push(const PaymentSummaryDetailsPageRoute()),
                            );
                          }
                        }
                      },
                  ),
                  TextSpan(
                    text: context.tr(' to delete this payment advice.'),
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
