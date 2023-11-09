part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _BankAccountSection extends StatelessWidget {
  const _BankAccountSection({
    Key? key,
    required this.widgetKey,
    required this.details,
    required this.visible,
    required this.isLoading,
  }) : super(key: key);
  final Key widgetKey;
  final PaymentSummaryDetails details;
  final bool visible;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return visible
        ? _DetailsInfoSection(
            label: 'Transfer to Virtual Bank Account',
            child: CustomCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(12),
              showBorder: false,
              showShadow: false,
              key: widgetKey,
              backgroundColor: ZPColors.lightSilver,
              child: Column(
                children: [
                  _BankAccountInfoRow(
                    title: 'Recipient bank',
                    text: '${details.bankIdentification} ${context.tr('Bank')}',
                  ),
                  _BankAccountInfoRow(
                    title: 'Recipient name',
                    text: details.bankName.displayNAIfEmpty,
                    isLoading: isLoading,
                  ),
                  _BankAccountInfoRow(
                    title: 'Virtual bank account number',
                    text: details.bankAccountNumber.displayNAIfEmpty,
                    isLoading: isLoading,
                  ),
                  _BankAccountInfoRow(
                    title: 'Total amount to transfer',
                    text: details.paymentAmount.toString(),
                    isPrice: true,
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _BankAccountInfoRow extends StatelessWidget {
  const _BankAccountInfoRow({
    Key? key,
    required this.title,
    required this.text,
    this.isLoading = false,
    this.isPrice = false,
  }) : super(key: key);
  final String title;
  final String text;
  final bool isLoading;
  final bool isPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(title),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.passwordValidationsColor,
                ),
          ),
          isLoading
              ? SizedBox(
                  child: LoadingShimmer.tile(),
                )
              : Row(
                  children: [
                    isPrice
                        ? PriceComponent(
                            salesOrgConfig: context
                                .read<EligibilityBloc>()
                                .state
                                .salesOrgConfigs,
                            price: text,
                          )
                        : Text(
                            text,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ZPColors.primary,
                                    ),
                          ),
                  ],
                ),
        ],
      ),
    );
  }
}
