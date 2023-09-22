part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class PaymentSavePdfButton extends StatelessWidget {
  const PaymentSavePdfButton({Key? key}) : super(key: key);

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
                messageText: 'Download Successful'.tr(),
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
          return ElevatedButton(
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
                                  .read<SalesOrgBloc>()
                                  .state
                                  .salesOrganisation,
                            ),
                          ),
                        );
                  },
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: const MaterialStatePropertyAll(
                    ZPColors.white,
                  ),
                  shape: const MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      side: BorderSide(color: ZPColors.primary),
                    ),
                  ),
                ),
            child: IntrinsicHeight(
              child: LoadingShimmer.withChild(
                enabled: state.isSavingInvoicePdf,
                child: Text(
                  'Download payment advice'.tr(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.primary,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
