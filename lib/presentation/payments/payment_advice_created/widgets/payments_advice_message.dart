part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentBankInAdviceMessage extends StatelessWidget {
  const _PaymentBankInAdviceMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<NewPaymentBloc>().state;

    return Padding(
      key: WidgetKeys.paymentBankInAdviceMessage,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            key: WidgetKeys.paymentNeedOpenWebViewIcon,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              SvgImage.checkCircle,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${context.tr('Your payment advice')} #${state.paymentInvoiceInfoPdf.zzAdvice} ${context.tr('has been generated')}.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${context.tr('Bank-in to either one of the bank accounts provided to complete the payment')}.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${context.tr('We’ll send a payment advice copy to')} ${context.read<EligibilityBloc>().state.user.email.maskedValue} ${context.tr('shortly')}.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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

class _PaymentGatewayAdviceMessage extends StatelessWidget {
  const _PaymentGatewayAdviceMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<NewPaymentBloc>().state;
    final firstMessage = state
            .salesOrganisation.salesOrg.isPaymentNeedOpenWebView
        ? 'has been generated. Please proceed to complete payment via your selected payment method “Payment Gateway” by clicking on the “Pay now” button below.'
        : 'has been generated. Scan the QR code and complete payment.';

    return Padding(
      key: WidgetKeys.paymentGatewayAdviceMessage,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        children: [
          if (!state.salesOrganisation.salesOrg.isPaymentNeedOpenWebView)
            Align(
              key: WidgetKeys.paymentNeedOpenWebViewIcon,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                SvgImage.checkCircle,
                alignment: Alignment.center,
              ),
            ),
          Text(
            '${context.tr('Your payment advice')} #${state.paymentInvoiceInfoPdf.zzAdvice} ${context.tr(firstMessage)}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${context.tr('We’ll send a payment advice copy to')} ${context.read<EligibilityBloc>().state.user.email.maskedValue} ${context.tr('shortly')}.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
