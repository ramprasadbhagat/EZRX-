part of 'request_return_filter_bloc.dart';

@freezed
class RequestReturnFilterEvent with _$RequestReturnFilterEvent {
  const factory RequestReturnFilterEvent.initialized() = _Initialized;

  const factory RequestReturnFilterEvent.filterRequestReturn() =
      _FilterRequestReturn;

  const factory RequestReturnFilterEvent.setInvoicefromDate({
    required DateTime fromInvoiceDate,
  }) = _SetExpiryfromDate;

  const factory RequestReturnFilterEvent.setInvoiceToDate({
    required DateTime toInvoiceDate,
  }) = _SetExpiryToDate;

  const factory RequestReturnFilterEvent.assignmentNumberChanged(
    String assignmentNumber,
  ) = _AssignmentNumberChanged;

  const factory RequestReturnFilterEvent.batchChanged(
    String batchNumber,
  ) = _BatchChanged;

  const factory RequestReturnFilterEvent.principalSearchChanged(
    String principalSearch,
  ) = _PrincipalSearchChanged;

  const factory RequestReturnFilterEvent.materialDescriptionSearchChanged(
    String materialDescriptionSearch,
  ) = _MaterialDescriptionSearchChanged;

  const factory RequestReturnFilterEvent.materialNumberSearchChanged(
    String materialNumberSearch,
  ) = _MaterialNumberSearchChanged;
}
