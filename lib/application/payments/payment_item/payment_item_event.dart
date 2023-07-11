part of 'payment_item_bloc.dart';

@freezed
class PaymentItemEvent with _$PaymentItemEvent {
  const factory PaymentItemEvent.fetchPaymentItemList({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required String paymentID,
    required String paymentBatchAdditionalInfo,
    required String accountingDocExternalReference,
  }) = _FetchPaymentItemList;
}
