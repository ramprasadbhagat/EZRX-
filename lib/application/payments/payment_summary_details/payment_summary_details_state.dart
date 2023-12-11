part of 'payment_summary_details_bloc.dart';

@freezed
class PaymentSummaryDetailsState with _$PaymentSummaryDetailsState {
  const PaymentSummaryDetailsState._();
  const factory PaymentSummaryDetailsState({
    required PaymentSummaryDetails details,
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required bool isDetailFetching,
    required bool isListLoading,
    required bool isFetchingAdvice,
    required bool isSavingAdvice,
    required ShipToInfo shipToInfo,
    required PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
    required bool isDeletingPayment,
    required bool isCancelingAdvice,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required BankInstruction bankInstruction,
  }) = _PaymentSummaryDetailsState;
  factory PaymentSummaryDetailsState.initial() => PaymentSummaryDetailsState(
        details: PaymentSummaryDetails.empty(),
        isDetailFetching: false,
        failureOrSuccessOption: none(),
        isListLoading: false,
        salesOrganization: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        user: User.empty(),
        isFetchingAdvice: false,
        isSavingAdvice: false,
        shipToInfo: ShipToInfo.empty(),
        paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
        isDeletingPayment: false,
        bankInstruction: BankInstruction.empty(),
        isCancelingAdvice: false,
      );

  bool get isLoading => isDetailFetching || isListLoading;

  bool get isSavingOrDeleting => isSavingAdvice || isDeletingPayment;

  String get adviceExpiryText => salesOrganization.salesOrg.isID 
      ? !details.status.isSuccessful
          ? '-'
          : details.idAdviceExpiryText
      : details.adviceExpiryText;

  String get adviceDeletedMessage =>
      '${salesOrganization.salesOrg.paymentIdPretext} #${details.zzAdvice.displayDashIfEmpty} has been deleted';
}
