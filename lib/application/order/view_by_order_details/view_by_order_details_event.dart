part of 'view_by_order_details_bloc.dart';

@freezed
class ViewByOrderDetailsEvent with _$ViewByOrderDetailsEvent {
  const factory ViewByOrderDetailsEvent.initialized({
    required User user,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
  }) = _Initialized;
  const factory ViewByOrderDetailsEvent.fetch({
    required OrderNumber orderNumber,
  }) = _Fetch;
  const factory ViewByOrderDetailsEvent.setOrderDetails({
    required OrderHistoryDetails orderHistoryDetails,
  }) = _SetOrderDetails;
  const factory ViewByOrderDetailsEvent.updateMaterialTenderContract({
    required TenderContract selectedTenderContract,
    required MaterialQueryInfo queryInfo,
  }) = _UpdateMaterialTenderContract;
  const factory ViewByOrderDetailsEvent.expandAttachments() =
      _ExpandAttachments;
}
