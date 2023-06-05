part of 'invoice_details_bloc.dart';

@freezed
class InvoiceDetailsState with _$InvoiceDetailsState {
  const InvoiceDetailsState._();
  const factory InvoiceDetailsState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<CustomerDocumentDetail> details,
  }) = _InvoiceDetailsState;

  factory InvoiceDetailsState.initial() => InvoiceDetailsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        details: <CustomerDocumentDetail>[],
      );
}
