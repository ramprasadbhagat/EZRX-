part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _BankInfo extends StatelessWidget {
  const _BankInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.selectedPaymentMethod != current.selectedPaymentMethod,
      builder: (context, state) {
        return state.selectedPaymentMethod.isBankIn
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      context.tr('Bank-in account information'),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  //TODO: will get data for Bank name, Account number, Account holder from new API
                  //and cover this in another ticket
                  BalanceTextRow(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    keyText: context.tr('Bank name'),
                    keyTextStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.black,
                            ),
                    valueText: 'lorem ipsum',
                  ),
                  BalanceTextRow(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    keyText: context.tr('Account number'),
                    keyTextStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.black,
                            ),
                    valueText: 'lorem ipsum',
                  ),
                  BalanceTextRow(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    keyText: context.tr('Account holder'),
                    keyTextStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.black,
                            ),
                    valueText: 'lorem ipsum',
                  ),
                  const OrDivider(),
                  BalanceTextRow(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    keyText: context.tr('Bank name'),
                    keyTextStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.black,
                            ),
                    valueText: 'lorem ipsum',
                  ),
                  BalanceTextRow(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    keyText: context.tr('Account number'),
                    keyTextStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.black,
                            ),
                    valueText: 'lorem ipsum',
                  ),
                  BalanceTextRow(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    keyText: context.tr('Account holder'),
                    keyTextStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.black,
                            ),
                    valueText: 'lorem ipsum',
                  ),
                  const _InstructionNote(),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
