part of 'new_payment_bloc.dart';

@freezed
class NewPaymentState with _$NewPaymentState {
  const NewPaymentState._();

  const factory NewPaymentState({
    required CustomerPaymentInfo customerPaymentInfo,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required List<CustomerOpenItem> selectedInvoices,
    required List<CustomerOpenItem> selectedCredits,
    required bool isFetchingInvoiceInfoPdf,
    required PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
    required bool isSavingInvoicePdf,
    required bool isFetchingPaymentMethod,
    required List<NewPaymentMethod> paymentMethods,
    required NewPaymentMethod selectedPaymentMethod,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required bool isCreatingVirtualAccount,
    required CreateVirtualAccount createVirtualAccount,
  }) = _NewPaymentState;

  factory NewPaymentState.initial() => NewPaymentState(
        selectedInvoices: <CustomerOpenItem>[],
        selectedCredits: <CustomerOpenItem>[],
        isLoading: false,
        customerPaymentInfo: CustomerPaymentInfo.empty(),
        failureOrSuccessOption: none(),
        isFetchingInvoiceInfoPdf: false,
        paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
        isSavingInvoicePdf: false,
        isFetchingPaymentMethod: false,
        paymentMethods: <NewPaymentMethod>[],
        selectedPaymentMethod: NewPaymentMethod.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        user: User.empty(),
        isCreatingVirtualAccount: false,
        createVirtualAccount: CreateVirtualAccount.empty(),
      );

  double get amountTotal =>
      selectedInvoices.amountTotal + selectedCredits.amountTotal;

  bool get negativeAmount => amountTotal.isNegative;

  bool get virtualBankPayable =>
      selectedPaymentMethod.firstSelectedOption != PaymentMethodOption.empty();

  List<CustomerOpenItem> get allSelectedItems =>
      selectedInvoices + selectedCredits;

  bool get needOpenWebViewAndNotBankIn =>
      salesOrganisation.salesOrg.isPaymentNeedOpenWebView &&
      !selectedPaymentMethod.paymentMethod.isBankIn;

  bool get canDisplayCrossButton =>
      (salesOrganisation.salesOrg.isSg ||
          salesOrganisation.salesOrg.isID ||
          selectedPaymentMethod.paymentMethod.isBankIn) &&
      !isFetchingInvoiceInfoPdf;

  bool get onlyAllowMakePaymentSameBank => paymentMethods
      .firstWhere(
        (paymentMethod) =>
            paymentMethod.paymentMethod == selectedPaymentMethod.paymentMethod,
      )
      .banksOnlyAllowTransferSameBank
      .contains(selectedPaymentMethod.firstSelectedOption);

  bool get enableCreateVirtualAccount =>
      !negativeAmount && !isCreatingVirtualAccount && virtualBankPayable;
}
