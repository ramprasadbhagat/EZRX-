part of 'new_payment_bloc.dart';

@freezed
class NewPaymentEvent with _$NewPaymentEvent {
  const factory NewPaymentEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
  }) = _initialized;

  const factory NewPaymentEvent.updateAllInvoices({
    required List<CustomerOpenItem> items,
  }) = _SelectAllInvoices;

  const factory NewPaymentEvent.toggleInvoice({
    required CustomerOpenItem item,
    required bool selected,
  }) = _ToggleInvoice;

  const factory NewPaymentEvent.updateAllCredits({
    required List<CustomerOpenItem> items,
  }) = _SelectAllCredits;

  const factory NewPaymentEvent.toggleCredit({
    required CustomerOpenItem item,
    required bool selected,
  }) = _ToggleCredit;

  const factory NewPaymentEvent.pay() = _Pay;

  const factory NewPaymentEvent.getCustomerPayment({
    required PaymentInfo paymentInfo,
  }) = _GetCustomerPayment;

  const factory NewPaymentEvent.updatePaymentGateway({
    required Uri paymentUrl,
  }) = _UpdatePaymentGateway;

  const factory NewPaymentEvent.fetchInvoiceInfoPdf() = _FetchInvoiceInfoPdf;

  const factory NewPaymentEvent.saveInvoicePdf({
    required Uint8List dataInvoicePdf,
  }) = _SaveInvoicePdf;

  const factory NewPaymentEvent.updatePaymentMethodSelected({
    required PaymentMethodValue paymentMethodSelected,
  }) = _UpdatePaymentMethodSelected;
}
