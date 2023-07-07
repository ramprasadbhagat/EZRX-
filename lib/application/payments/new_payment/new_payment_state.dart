part of 'new_payment_bloc.dart';

@freezed
class NewPaymentState with _$NewPaymentState {
  const NewPaymentState._();
  const factory NewPaymentState({
    required List<CustomerOpenItem> selectedInvoices,
    required List<CustomerOpenItem> selectedCredits,
  }) = _NewPaymentState;

  factory NewPaymentState.initial() => const NewPaymentState(
        selectedInvoices: <CustomerOpenItem>[],
        selectedCredits: <CustomerOpenItem>[],
      );
  double get amountTotal =>
      selectedInvoices.amountTotal + selectedCredits.amountTotal;
}
