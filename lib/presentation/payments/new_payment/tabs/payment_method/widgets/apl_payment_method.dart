part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _APLPaymentSelectorWidget extends StatelessWidget {
  final List<NewPaymentMethod> paymentMethods;
  final NewPaymentMethod selectedPaymentMethod;

  const _APLPaymentSelectorWidget({
    required this.paymentMethods,
    required this.selectedPaymentMethod,
    Key? key,
  }) : super(key: key);

  Future<bool?> _showConfirmBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => ConfirmBottomSheet(
        key: WidgetKeys.confirmBottomSheet,
        title: 'Unable to create new payment',
        content:
            'You have a pending payment which has not been completed. Please create a new payment only after the existing one has been cleared.',
        confirmButtonText: 'Close',
        displayCancelButton: false,
        iconWidget: SvgPicture.asset(
          SvgImage.alert,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPaymentBloc, NewPaymentState>(
      listenWhen: (previous, current) =>
          previous.isCreatingVirtualAccount !=
              current.isCreatingVirtualAccount &&
          !current.isCreatingVirtualAccount,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            context.read<PaymentSummaryDetailsBloc>().add(
                  PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
                    details: PaymentSummaryDetails.fromCreateVirtualAccount(
                      state.createVirtualAccount,
                    ),
                  ),
                );
            context.router.pushAndPopUntil(
              const PaymentAdviceCreatedPageRoute(),
              predicate: (Route route) =>
                  route.settings.name == PaymentPageRoute.name,
            );
          },
          (either) => either.fold(
            (failure) {
              _showConfirmBottomSheet(context);
            },
            (_) {},
          ),
        );
      },
      child: Column(
        children: paymentMethods
            .map(
              (paymentMethod) => CustomCard(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Radio(
                            key: WidgetKeys.paymentMethodRadio,
                            value: paymentMethod.paymentMethod,
                            groupValue: selectedPaymentMethod.paymentMethod,
                            onChanged: null,
                          ),
                          Text(
                            context.tr(paymentMethod.paymentMethod.getValue()),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: ZPColors.inputBorderColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.tr(
                              'Select your virtual bank account to proceed',
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: ZPColors.primary),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            context.tr(
                              'Please note that if you select any bank account below, you have to transfer payment from the same bank.',
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: ZPColors.neutralsGrey1),
                          ),
                          const SizedBox(height: 8),
                          ...paymentMethod.banksOnlyAllowTransferSameBank
                              .map(
                                (e) => _PaymentOptionItem(
                                  paymentMethodOption: e,
                                ),
                              )
                              .toList(),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(
                              indent: 0,
                              endIndent: 0,
                              thickness: 0.5,
                              color: ZPColors.darkGray,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.info,
                                size: 24,
                                color: ZPColors.skyBlueColor,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  context.tr(
                                    'If you don\'t have any of the bank account above, please select BNI Syariah or Bank BCA bank, which can accept payments from different banks.',
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: ZPColors.neutralsGrey1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ...paymentMethod.banksAllowTransferDifferenceBank
                              .map(
                                (e) => _PaymentOptionItem(
                                  paymentMethodOption: e,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
