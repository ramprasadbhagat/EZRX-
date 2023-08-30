part of 'new_payment_bloc.dart';

@freezed
class NewPaymentEvent with _$NewPaymentEvent {
  const factory NewPaymentEvent.initialized() = _initialized;

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

  const factory NewPaymentEvent.pay({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required String paymentMethod,
    required User user,
  }) = _Pay;

  const factory NewPaymentEvent.updatePaymentGateway({
    required SalesOrganisation salesOrganisation,
    required Uri paymentUrl,
  }) = _UpdatePaymentGateway;
}
