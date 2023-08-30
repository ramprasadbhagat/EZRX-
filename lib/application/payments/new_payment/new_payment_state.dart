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
  }) = _NewPaymentState;

  factory NewPaymentState.initial() => NewPaymentState(
        selectedInvoices: <CustomerOpenItem>[],
        selectedCredits: <CustomerOpenItem>[],
        isLoading: false,
        paymentInfo: PaymentInfo.empty(),
        failureOrSuccessOption: none(),
      );

  double get amountTotal =>
      selectedInvoices.amountTotal + selectedCredits.amountTotal;
}
