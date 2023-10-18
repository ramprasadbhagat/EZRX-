part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _PayerInformation extends StatelessWidget {
  const _PayerInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.read<EligibilityBloc>().state.isBillToInfo
        ? ExpansionTile(
            initiallyExpanded: true,
            tilePadding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20,
            ),
            title: Text(
              '${context.tr('Payer')}: ${context.read<EligibilityBloc>().state.customerCodeInfo.getBillToInfo.billToCustomerCode}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.black,
                  ),
            ),
            subtitle: Text(
              '${context.read<EligibilityBloc>().state.customerCodeInfo.getBillToInfo.billToAddress}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ZPColors.black,
                  ),
            ),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              BalanceTextRow(
                keyText: 'Name'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
                valueText:
                    '${context.read<EligibilityBloc>().state.customerCodeInfo.getBillToInfo.billToName}',
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
              BalanceTextRow(
                keyText: 'Email'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
                valueText: context
                    .read<CustomerCodeBloc>()
                    .state
                    .customerCodeInfo
                    .getBillToInfo
                    .emailAddresses
                    .first,
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
              BalanceTextRow(
                keyText: context.tr('Tax number'),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
                valueText: context
                    .read<CustomerCodeBloc>()
                    .state
                    .customerCodeInfo
                    .getBillToInfo
                    .taxNumber,
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
              BalanceTextRow(
                keyText: context.tr('Phone'),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
                valueText: context
                    .read<CustomerCodeBloc>()
                    .state
                    .customerCodeInfo
                    .getBillToInfo
                    .telephoneNumber,
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
