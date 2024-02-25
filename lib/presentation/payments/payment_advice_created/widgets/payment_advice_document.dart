part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceDocument extends StatelessWidget {
  const _PaymentAdviceDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.isFetchingInvoiceInfoPdf != current.isFetchingInvoiceInfoPdf,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: state.selectedPaymentMethod.paymentMethod.isPaymentGateway
              ? custom.ExpansionTile(
                  key: WidgetKeys.paymentAdviceDocumentHeader,
                  headerBackgroundColor: ZPColors.lightSilver,
                  radius: 8,
                  trailingWidgetPadding: 16,
                  threeLineTitle: true,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      context.tr('Payment Advice Document'),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ZPColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  children: [
                    state.isFetchingInvoiceInfoPdf
                        ? Container(
                            height: 400,
                            color: ZPColors.accentColor,
                            child: LoadingShimmer.logo(
                              key: WidgetKeys.paymentAdviceScreenLoader,
                            ),
                          )
                        : const _PDFAdviceSection(),
                  ],
                )
              : state.paymentInvoiceInfoPdf != PaymentInvoiceInfoPdf.empty()
                  ? const _PDFAdviceSection()
                  : const SizedBox.shrink(),
        );
      },
    );
  }
}

class _PDFAdviceSection extends StatelessWidget {
  const _PDFAdviceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final newPaymentState = context.read<NewPaymentBloc>().state;

    return Column(
      children: [
        PdfPreviewCustom(
          maxPageWidth: double.infinity,
          key: WidgetKeys.pdfView,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          loadingWidget: Container(
            height: 400,
            color: ZPColors.accentColor,
            child: LoadingShimmer.logo(
              key: WidgetKeys.paymentAdviceScreenLoader,
            ),
          ),
          previewPageMargin: EdgeInsets.zero,
          shrinkWrap: true,
          pdfPreviewPageDecoration: const BoxDecoration(color: ZPColors.white),
          scrollViewDecoration: const BoxDecoration(color: ZPColors.white),
          onError: (_, error) {
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
            final pdf = await CreatePaymentInvoicePdf().createInvoicePdf(
              shipToInfo: eligibilityState.shipToInfo,
              paymentInvoiceInfoPdf: newPaymentState.paymentInvoiceInfoPdf,
              salesOrganisation: eligibilityState.salesOrganisation,
              createdDate: newPaymentState.customerPaymentInfo.createdDate,
              adviceExpiry: newPaymentState.customerPaymentInfo.adviceExpiry,
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
        if (!newPaymentState.isFetchingInvoiceInfoPdf &&
            newPaymentState
                .selectedPaymentMethod.paymentMethod.isPaymentGateway)
          const Padding(
            key: WidgetKeys.paymentSavePdfButtonSection,
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: PaymentSavePdfButton(),
          ),
      ],
    );
  }
}
