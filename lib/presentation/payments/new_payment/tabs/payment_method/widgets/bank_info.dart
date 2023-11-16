part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _BankInfo extends StatelessWidget {
  const _BankInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankInAccountsBloc, BankInAccountsState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.bankInAccounts != current.bankInAccounts,
      builder: (context, state) {
        return state.isFetching
            ? LoadingShimmer.logo(
                key: const Key('loaderImage'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      context.tr('Bank-in account information'),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  ...state.bankInAccounts
                      .mapIndexed(
                        (index, bankInAccount) => _BankInfoDetail(
                          bankBeneficiary: bankInAccount,
                          displayDivider:
                              index != state.bankInAccounts.length - 1,
                        ),
                      )
                      .toList(),
                  const _InstructionNote(),
                ],
              );
      },
    );
  }
}
