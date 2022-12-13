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
  const factory AdditionalDetailsEvent.flushForm() =
      _AdditionalDetailsFlushForm;
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
