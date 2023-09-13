part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentSuccessMessage extends StatelessWidget {
  const _PaymentSuccessMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        children: [
          Icon(
            Icons.check_circle,
            color: ZPColors.green,
            size: MediaQuery.of(context).size.width * 0.2,
          ),
          Text(
            '${'Your payment advice'.tr()} #${context.read<NewPaymentBloc>().state.paymentInvoiceInfoPdf.zzAdvice} ${'has been created, and our payment processor is coordinating with the bank to process your payment request.'.tr()}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${'We’ll send a payment advice copy to'.tr()} ${context.read<UserBloc>().state.user.email.getOrDefaultValue('')} ${'shortly'.tr()}.',
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
