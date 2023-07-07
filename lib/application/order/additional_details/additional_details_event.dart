part of 'additional_details_bloc.dart';

@freezed
class AdditionalDetailsEvent with _$AdditionalDetailsEvent {
  const factory AdditionalDetailsEvent.initialized({
    required SalesOrganisationConfigs config,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Initialized;
  const factory AdditionalDetailsEvent.initFromSavedOrder({
    required SalesOrganisationConfigs config,
    required CustomerCodeInfo customerCodeInfo,
    required String orderId,
  }) = _InitFromSavedOrder;
  const factory AdditionalDetailsEvent.onTextChange({
    required DeliveryInfoLabel label,
    required String newValue,
  }) = _AdditionalDetailsTextOnChange;
  const factory AdditionalDetailsEvent.validateForm({
    required SalesOrganisationConfigs config,
  }) = _AdditionalDetailsValidateForm;
  const factory AdditionalDetailsEvent.addPoDocument({
    required List<PoDocuments> poDocuments,
  }) = _AdditionalDetailsAddPoDocument;
  const factory AdditionalDetailsEvent.removePoDocument({
    required PoDocuments poDocument,
  }) = _AdditionalDetailsRemovePoDocument;
  const factory AdditionalDetailsEvent.removeAllPoDocument() =
      _AdditionalDetailsRemoveAllPoDocument;
  const factory AdditionalDetailsEvent.toggleGreenDelivery() =
      _AdditionalDetailsToggleGreenDelivery;
  const factory AdditionalDetailsEvent.clearSavedOrderId() =
      _AdditionalDetailsClearSavedOrderId;
  const factory AdditionalDetailsEvent.initiateFromHistory({
    required DeliveryInfoData data,
    required CustomerCodeInfo customerCodeInfo,
  }) = _AdditionalDetailsInitiateFromHistory;
}

enum DeliveryInfoLabel {
  poReference,
  deliveryInstruction,
  referenceNote,
  // collectiveNumber,
  contactPerson,
  contactNumber,
  paymentTerm,
  deliveryDate
}
