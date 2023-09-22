part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentInvoicePdf extends StatefulWidget {
  const _PaymentInvoicePdf({Key? key}) : super(key: key);

  @override
  State<_PaymentInvoicePdf> createState() => _PaymentInvoicePdfState();
}

class _PaymentInvoicePdfState extends State<_PaymentInvoicePdf> {
  @override
  void initState() {
    context.read<NewPaymentBloc>().add(
          const NewPaymentEvent.fetchInvoiceInfoPdf(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPaymentBloc, NewPaymentState>(
      listenWhen: (previous, current) =>
          previous.isFetchingInvoiceInfoPdf != current.isFetchingInvoiceInfoPdf,
      listener: (context, state) {
        if (!state.isFetchingInvoiceInfoPdf) {
          state.failureOrSuccessOption.fold(
            () {},
            (option) => option.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (r) {},
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.isFetchingInvoiceInfoPdf != current.isFetchingInvoiceInfoPdf,
      builder: (context, state) {
        return state.isFetchingInvoiceInfoPdf
            ? LoadingShimmer.logo()
            : SizedBox(
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
                  pdfPreviewPageDecoration:
                      const BoxDecoration(color: ZPColors.white),
                  scrollViewDecoration:
                      const BoxDecoration(color: ZPColors.white),
                  onError: (_, error) {
                    return Text(error.toString());
                  },
                  build: (_) => CreatePaymentInvoicePdf().createInvoicePdf(
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    paymentInvoiceInfoPdf: state.paymentInvoiceInfoPdf,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                  ),
                ),
              );
      },
    );
  }
}
