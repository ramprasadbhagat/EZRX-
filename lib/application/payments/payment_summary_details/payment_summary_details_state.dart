part of 'payment_summary_details_bloc.dart';

@freezed
class PaymentSummaryDetailsState with _$PaymentSummaryDetailsState {
  const PaymentSummaryDetailsState._();
  const factory PaymentSummaryDetailsState({
    required PaymentSummaryDetails paymentSummaryDetails,
    required List<PaymentItem> paymentItemList,
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
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PaymentSummaryDetailsState;
  factory PaymentSummaryDetailsState.initial() => PaymentSummaryDetailsState(
        paymentSummaryDetails: PaymentSummaryDetails.empty(),
        isDetailFetching: false,
        failureOrSuccessOption: none(),
        paymentItemList: <PaymentItem>[],
        isListLoading: false,
        salesOrganization: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        user: User.empty(),
        isFetchingAdvice: false,
        isSavingAdvice: false,
        shipToInfo: ShipToInfo.empty(),
        paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
        isDeletingPayment: false,
      );

  bool get isLoading => isDetailFetching || isListLoading;

  bool get isSavingOrDeleting => isSavingAdvice || isDeletingPayment;
}
