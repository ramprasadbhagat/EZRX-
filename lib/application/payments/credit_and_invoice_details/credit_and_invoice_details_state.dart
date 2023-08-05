part of 'credit_and_invoice_details_bloc.dart';

@freezed
class CreditAndInvoiceDetailsState with _$CreditAndInvoiceDetailsState {
  const CreditAndInvoiceDetailsState._();
  const factory CreditAndInvoiceDetailsState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<CustomerDocumentDetail> details,
  }) = _CreditAndInvoiceDetailsState;

  factory CreditAndInvoiceDetailsState.initial() =>
      CreditAndInvoiceDetailsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        details: <CustomerDocumentDetail>[],
      );
}
