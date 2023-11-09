part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class PaymentSavePdfButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const PaymentSavePdfButton({
    Key? key,
    this.text = 'Download payment advice',
    this.textStyle,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: BlocConsumer<NewPaymentBloc, NewPaymentState>(
        listenWhen: (previous, current) =>
            previous.isSavingInvoicePdf != current.isSavingInvoicePdf,
        listener: (context, state) {
          if (!state.isSavingInvoicePdf) {
            state.failureOrSuccessOption.fold(
              () => CustomSnackBar(
                messageText: 'Download Successful',
              ).show(context),
              (option) => option.fold(
                (failure) => ErrorUtils.handleApiFailure(context, failure),
                (r) {},
              ),
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.isSavingInvoicePdf != current.isSavingInvoicePdf ||
            previous.isFetchingInvoiceInfoPdf !=
                current.isFetchingInvoiceInfoPdf,
        builder: (context, state) {
          return OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: ZPColors.primary,
              ),
              backgroundColor: backgroundColor ?? ZPColors.white,
            ),
            onPressed: state.isSavingInvoicePdf
                ? null
                : () async {
                    context.read<NewPaymentBloc>().add(
                          NewPaymentEvent.saveInvoicePdf(
                            dataInvoicePdf: await CreatePaymentInvoicePdf()
                                .createInvoicePdf(
                              paymentInvoiceInfoPdf:
                                  state.paymentInvoiceInfoPdf,
                              shipToInfo: context
                                  .read<CustomerCodeBloc>()
                                  .state
                                  .shipToInfo,
                              salesOrganisation: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrganisation,
                            ),
                          ),
                        );
                  },
            child: LoadingShimmer.withChild(
              enabled: state.isSavingInvoicePdf,
              child: Text(
                context.tr(text),
                style: textStyle ??
                    Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ZPColors.primary,
                        ),
              ),
            ),
          );
        },
      ),
    );
  }
}
