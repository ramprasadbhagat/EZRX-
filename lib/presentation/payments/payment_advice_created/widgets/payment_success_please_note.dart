part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentSuccessPleaseNote extends StatelessWidget {
  const _PaymentSuccessPleaseNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text:
                    'There may be situations where payments fail during the payment process, or it may take longer time. Please make sure to check the payment status of your payment request.'
                        .tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text: '${'You can check your payment status from the'.tr()} "',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
                children: [
                  TextSpan(
                    text: 'Payment Summary'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZPColors.extraDarkGreen,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          context.router.pushNamed('payments/payment_summary'),
                  ),
                  TextSpan(
                    text: '" ${'page.'.tr()}',
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
                text:
                    'If you encountered an error with the payment, delete the system-generated payment advice in the eZRx payment summary section and regenerate a new payment advice by repeating the payment process.'
                        .tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
            ),
          ),
          BulletWidget(
            content: RichText(
              text: TextSpan(
                text:
                    'Please note that system-generated payment advice(s) will be automatically deleted if payment is not received within 30 days.'
                        .tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
