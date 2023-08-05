part of 'submit_return_bloc.dart';

@freezed
class SubmitReturnEvent with _$SubmitReturnEvent {
  const factory SubmitReturnEvent.submitReturnRequest({
    required List<ReturnItem> returnItemsList,
    required User user,
    required SalesOrganisation salesOrg,
    required CustomerCodeInfo customerCodeInfo,
    required String returnReferenceNumber,
    required String specialInstructions,
  }) = _SubmitReturnRequest;
}
