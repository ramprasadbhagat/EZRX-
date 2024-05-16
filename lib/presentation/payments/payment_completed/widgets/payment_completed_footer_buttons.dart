part of 'package:ezrxmobile/presentation/payments/payment_completed/payment_completed_page.dart';

class _PaymentSummaryButton extends StatelessWidget {
  const _PaymentSummaryButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.paymentSummaryRouteButton,
      onPressed: () => context.router.push(
        PaymentSummaryPageRoute(
          isMarketPlace: context.isMPPayment,
        ),
      ),
      child: FittedBox(
        child: Text(
          context.tr(
            context.isMPPayment ? 'MP Payment summary' : 'Payment summary',
          ),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.white,
              ),
        ),
      ),
    );
  }
}

class _AccountSummaryButton extends StatelessWidget {
  const _AccountSummaryButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: WidgetKeys.accountSummaryButton,
      onPressed: () => context.router.push(
        AccountSummaryRoute(
          isMarketPlace: context.isMPPayment,
        ),
      ),
      child: FittedBox(
        child: Text(
          context.tr(
            context.isMPPayment ? 'MP Account summary' : 'Account summary',
          ),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.primary,
              ),
        ),
      ),
    );
  }
}
