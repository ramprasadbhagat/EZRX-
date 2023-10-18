part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceMessage extends StatelessWidget {
  const _PaymentAdviceMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewPaymentBloc>();
    final firstMessage = bloc
            .state.salesOrganisation.salesOrg.isPaymentNeedOpenWebView
        ? 'has been generated. Please proceed to complete payment via your selected payment method “Payment Gateway” by clicking on the “Pay now” button below.'
        : 'has been generated. Scan the QR code and complete payment.';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        children: [
          if (!bloc.state.salesOrganisation.salesOrg.isPaymentNeedOpenWebView)
            Icon(
              Icons.check_circle,
              color: ZPColors.green,
              size: MediaQuery.of(context).size.width * 0.2,
            ),
          Text(
            '${context.tr('Your payment advice')} #${bloc.state.paymentInvoiceInfoPdf.zzAdvice} ${context.tr(firstMessage)}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${context.tr('We’ll send a payment advice copy to')} ${context.read<EligibilityBloc>().state.user.email.getOrDefaultValue('')} ${context.tr('shortly')}.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(height: 24.0),
          const Divider(
            indent: 0,
            thickness: 1,
            endIndent: 0,
            height: 1,
            color: ZPColors.extraLightGrey3,
          ),
        ],
      ),
    );
  }
}
