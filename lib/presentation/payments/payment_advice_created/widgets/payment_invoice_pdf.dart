part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentInvoicePdf extends StatelessWidget {
  const _PaymentInvoicePdf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.read<NewPaymentBloc>().state.paymentInvoiceInfoPdf.isEmpty
        ? const SizedBox.shrink()
        : Container(
            width: double.infinity,
            height: 650,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PdfPreview(
              maxPageWidth: double.infinity,
              initialPageFormat: PdfPageFormat.a4,
              allowPrinting: false,
              allowSharing: false,
              canChangeOrientation: false,
              canChangePageFormat: false,
              previewPageMargin: EdgeInsets.zero,
              pdfPreviewPageDecoration:
                  const BoxDecoration(color: ZPColors.white),
              scrollViewDecoration: const BoxDecoration(color: ZPColors.white),
              onError: (_, error) {
                final eligibilityState = context.read<EligibilityBloc>().state;
                final newPaymentState = context.read<NewPaymentBloc>().state;
                if (eligibilityState.salesOrganisation.salesOrg.isSg) {
                  trackMixpanelEvent(
                    MixpanelEvents.paymentFailure,
                    props: {
                      MixpanelProps.errorMessage: 'Generating QR failed',
                      MixpanelProps.paymentMethod: newPaymentState
                          .selectedPaymentMethod.paymentMethod
                          .getOrDefaultValue(''),
                      MixpanelProps.paymentDocumentCount:
                          newPaymentState.allSelectedItems.length,
                      MixpanelProps.paymentAdviseId:
                          newPaymentState.paymentInvoiceInfoPdf.zzAdvice,
                    },
                  );
                }

                return Text(error.toString());
              },
              build: (_) async {
                final eligibilityState = context.read<EligibilityBloc>().state;
                final newPaymentState = context.read<NewPaymentBloc>().state;

                final pdf = await CreatePaymentInvoicePdf().createInvoicePdf(
                  shipToInfo: eligibilityState.shipToInfo,
                  paymentInvoiceInfoPdf: newPaymentState.paymentInvoiceInfoPdf,
                  salesOrganisation: eligibilityState.salesOrganisation,
                  createdDate: newPaymentState.customerPaymentInfo.createdDate,
                  adviceExpiry:
                      newPaymentState.customerPaymentInfo.adviceExpiry,
                );

                if (eligibilityState.salesOrganisation.salesOrg.isSg) {
                  trackMixpanelEvent(
                    MixpanelEvents.paymentSuccess,
                    props: {
                      MixpanelProps.paymentAmount: newPaymentState.amountTotal,
                      MixpanelProps.paymentMethod: newPaymentState
                          .selectedPaymentMethod.paymentMethod
                          .getOrDefaultValue(''),
                      MixpanelProps.paymentDocumentCount:
                          newPaymentState.allSelectedItems.length,
                      MixpanelProps.paymentAdviseId:
                          newPaymentState.paymentInvoiceInfoPdf.zzAdvice,
                    },
                  );
                }

                return pdf;
              },
            ),
          );
  }
}
