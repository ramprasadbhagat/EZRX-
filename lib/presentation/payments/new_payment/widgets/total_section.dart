part of 'package:ezrxmobile/presentation/payments/new_payment/new_payment_page.dart';

class _TotalAmountSection extends StatelessWidget {
  final int currentStep;
  final TabController tabController;
  const _TotalAmountSection({
    required this.currentStep,
    required this.tabController,
    Key? key,
  }) : super(key: key);

  Future<bool?> _showConfirmPaymentPopup(BuildContext context) {
    final newPaymentState = context.read<NewPaymentBloc>().state;

    final content = newPaymentState.onlyAllowMakePaymentSameBank
        ? 'You have selected {optionName} for the virtual bank account payment. Please make payment from the same bank you have selected. Once confirmed, you will need to make the payment within 3 days.'
        : 'You have selected {optionName} for the virtual bank account payment. You may make payment from the same bank, or a different bank. Once confirmed, you will need to make the payment within 3 days.';

    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => ConfirmBottomSheet(
        key: WidgetKeys.confirmBottomSheet,
        title: 'Confirm payment settings?',
        content: context.tr(
          content,
          namedArgs: {
            'optionName': newPaymentState.selectedPaymentMethod
                .firstSelectedOption.displayName.displayNAIfEmpty,
          },
        ),
        iconWidget: SvgPicture.asset(
          SvgImage.alert,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isID = context.read<EligibilityBloc>().state.salesOrg.isID;
    final state = context.read<NewPaymentBloc>().state;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Text(
            context.tr('Total: '),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          PriceComponent(
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
            price: state.amountTotal.abs().toString(),
            type: state.negativeAmount
                ? PriceStyle.negativePrice
                : PriceStyle.commonPrice,
          ),
          const Spacer(),
          if (currentStep == 1)
            _NextButton(
              tabController: tabController,
              enabled: state.selectedInvoices.isNotEmpty,
            ),
          if (currentStep == 2)
            isID
                ? BlocBuilder<NewPaymentBloc, NewPaymentState>(
                    buildWhen: (previous, current) =>
                        previous.isCreatingVirtualAccount !=
                            current.isCreatingVirtualAccount ||
                        previous.selectedPaymentMethod.options !=
                            current.selectedPaymentMethod.options,
                    builder: (context, state) {
                      return LoadingShimmer.withChild(
                        enabled: state.isCreatingVirtualAccount,
                        child: ElevatedButton(
                          key: WidgetKeys.nextButton,
                          onPressed: state.enableCreateVirtualAccount
                              ? () async {
                                  final confirmed =
                                      await _showConfirmPaymentPopup(
                                    context,
                                  );
                                  if ((confirmed ?? false) && context.mounted) {
                                    context.read<NewPaymentBloc>().add(
                                          const NewPaymentEvent
                                              .createVirtualAccount(),
                                        );
                                  }
                                }
                              : null,
                          child: Text(
                            context.tr('Next'),
                            style: const TextStyle(
                              color: ZPColors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : _NextButton(
                    tabController: tabController,
                    enabled: !state.negativeAmount,
                  ),
        ],
      ),
    );
  }
}
