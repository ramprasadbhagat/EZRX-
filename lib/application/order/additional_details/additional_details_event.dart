part of 'additional_details_bloc.dart';

@freezed
class AdditionalDetailsEvent with _$AdditionalDetailsEvent {
  const factory AdditionalDetailsEvent.initialized({
    required SalesOrganisationConfigs config,
  }) = _Initialized;
  const factory AdditionalDetailsEvent.onTextChange({
    required AdditionalDetailsLabel label,
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
  const factory AdditionalDetailsEvent.toggleGreenDelivery(bool value) =
      _AdditionalDetailsToggleGreenDelivery;
}

enum AdditionalDetailsLabel {
  customerPoReference,
  specialInstruction,
  referenceNote,
  collectiveNumber,
  contactPerson,
  contactNumber,
  paymentTerm,
  deliveryDate
}
