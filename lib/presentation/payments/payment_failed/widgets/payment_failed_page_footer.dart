part of 'package:ezrxmobile/presentation/payments/payment_failed/payment_failed_page.dart';

class _PaymentFailedPageFooter extends StatelessWidget {
  const _PaymentFailedPageFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ZPColors.boxShadowGray,
            blurRadius: 2.0,
            offset: Offset(0.1, -2.75),
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 40,
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      child: SafeArea(
        top: false,
        child: ElevatedButton(
          key: WidgetKeys.paymentSummaryRouteButton,
          onPressed: () => context.router.push(
            PaymentSummaryPageRoute(isMarketPlace: context.isMPPayment),
          ),
          child: Text(
            context.tr(
              context.isMPPayment ? 'MP Payment summary' : 'Payment summary',
            ),
          ),
        ),
      ),
    );
  }
}
