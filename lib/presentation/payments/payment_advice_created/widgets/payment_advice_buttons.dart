part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceButtons extends StatelessWidget {
  const _PaymentAdviceButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            color: ZPColors.boxShadowGray,
          ),
        ],
        color: ZPColors.white,
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: Row(
        key: WidgetKeys.buttonRowKey,
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: ZPColors.primary,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              ),
              child: Text(
                context.tr('Payment summary'),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ZPColors.primary,
                    ),
              ),
              onPressed: () =>
                  context.router.popAndPush(const PaymentSummaryPageRoute()),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: PaymentSavePdfButton(
              text: 'Download advice',
              backgroundColor: ZPColors.primary,
              textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
