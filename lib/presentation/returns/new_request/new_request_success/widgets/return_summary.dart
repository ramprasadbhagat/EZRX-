part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ReturnSummary extends StatelessWidget {
  const _ReturnSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: BlocBuilder<NewRequestBloc, NewRequestState>(
        buildWhen: (previous, current) =>
            previous.selectedItems != current.selectedItems,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Return summary'.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal with tax:'.tr(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.neutralsBlack,
                        ),
                  ),
                  PriceComponent(
                    salesOrgConfig:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    price: state
                        .returnSubtotalWithTax(
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                        )
                        .toString(),
                    type: PriceStyle.summaryPrice,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                indent: 0,
                thickness: 1,
                endIndent: 0,
                height: 1,
                color: ZPColors.extraLightGrey3,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grand total:'.tr(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.neutralsBlack,
                        ),
                  ),
                  PriceComponent(
                    salesOrgConfig:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    price: state
                        .returnSubtotalWithTax(
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                        )
                        .toString(),
                    type: PriceStyle.grandTotalPrice,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
