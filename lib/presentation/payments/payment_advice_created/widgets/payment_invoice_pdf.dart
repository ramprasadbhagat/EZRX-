part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentInvoicePdf extends StatelessWidget {
  const _PaymentInvoicePdf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 650,
      child: PdfPreview(
        maxPageWidth: double.infinity,
        initialPageFormat: PdfPageFormat.a4,
        allowPrinting: false,
        allowSharing: false,
        canChangeOrientation: false,
        canChangePageFormat: false,
        previewPageMargin: EdgeInsets.zero,
        pdfPreviewPageDecoration: const BoxDecoration(color: ZPColors.white),
        scrollViewDecoration: const BoxDecoration(color: ZPColors.white),
        onError: (_, error) {
          return Text(error.toString());
        },
        build: (_) => CreatePaymentInvoicePdf().createInvoicePdf(
          shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
          paymentInvoiceInfoPdf:
              context.read<NewPaymentBloc>().state.paymentInvoiceInfoPdf,
          salesOrganisation:
              context.read<EligibilityBloc>().state.salesOrganisation,
        ),
      ),
    );
  }
}
