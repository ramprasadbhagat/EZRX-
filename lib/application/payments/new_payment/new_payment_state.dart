part of 'new_payment_bloc.dart';

@freezed
class NewPaymentState with _$NewPaymentState {
  const NewPaymentState._();

  const factory NewPaymentState({
    required PaymentInfo paymentInfo,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required List<CustomerOpenItem> selectedInvoices,
    required List<CustomerOpenItem> selectedCredits,
    required bool isFetchingInvoiceInfoPdf,
    required PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
    required bool isSavingInvoicePdf,
    required bool isFetchingPaymentMethod,
    required List<PaymentMethodValue> paymentMethods,
    required PaymentMethodValue selectedPaymentMethod,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
  }) = _NewPaymentState;

  factory NewPaymentState.initial() => NewPaymentState(
        selectedInvoices: <CustomerOpenItem>[],
        selectedCredits: <CustomerOpenItem>[],
        isLoading: false,
        paymentInfo: PaymentInfo.empty(),
        failureOrSuccessOption: none(),
        isFetchingInvoiceInfoPdf: false,
        paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
        isSavingInvoicePdf: false,
        isFetchingPaymentMethod: false,
        paymentMethods: <PaymentMethodValue>[],
        selectedPaymentMethod: PaymentMethodValue(''),
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        user: User.empty(),
      );

  double get amountTotal =>
      selectedInvoices.amountTotal + selectedCredits.amountTotal;

  bool get negativeAmountPayable => amountTotal.isNegative;

  List<CustomerOpenItem> get allSelectedItems =>
      selectedInvoices + selectedCredits;
}
