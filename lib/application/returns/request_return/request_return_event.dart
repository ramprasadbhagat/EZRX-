part of 'request_return_bloc.dart';

@freezed
class RequestReturnEvent with _$RequestReturnEvent {
  const factory RequestReturnEvent.initialized() = _Initialized;

  const factory RequestReturnEvent.fetch({
    required SalesOrganisation salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required RequestReturnFilter requestReturnFilter,
  }) = _Fetch;

  const factory RequestReturnEvent.loadMore({
    required SalesOrganisation salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required RequestReturnFilter requestReturnFilter,
  }) = _LoadMore;

  const factory RequestReturnEvent.sortByDate({
    required String sortDirection,
  }) = _SortByDate;

  const factory RequestReturnEvent.updateReturnDetails({
    required ReturnItem updatedItem,
  }) = _UpdateReturnDetails;

  const factory RequestReturnEvent.uploadAttachments({
    required List<PoDocuments> poDocuments,
    required String uniqueId,
  }) = _UploadAttachments;

  const factory RequestReturnEvent.deleteAttachment({
    required PoDocuments poDocuments,
    required String uniqueId,
  }) = _DeletePoAttachment;

  const factory RequestReturnEvent.updateReturnRequestReferenceNumber({
    required String referenceNumber,
  }) = _UpdateReturnRequestReferenceNumber;

  const factory RequestReturnEvent.updateSpecialInstructions({
    required String specialInstructions,
  }) = _UpdateSpecialInstructions;

  const factory RequestReturnEvent.initializeSelectedReturnItems() =
      _InitializeSelectedReturnItems;
}
