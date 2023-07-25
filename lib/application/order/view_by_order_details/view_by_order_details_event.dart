part of 'view_by_order_details_bloc.dart';

@freezed
class ViewByOrderDetailsEvent with _$ViewByOrderDetailsEvent {
  const factory ViewByOrderDetailsEvent.initialized() = _Initialized;
  const factory ViewByOrderDetailsEvent.fetch({
    required User user,
    required OrderHistoryDetailsOrderHeader orderHeader,
  }) = _Fetch;
  const factory ViewByOrderDetailsEvent.updateMaterialTenderContract({
    required TenderContract selectedTenderContract,
    required MaterialQueryInfo queryInfo,
  }) = _UpdateMaterialTenderContract;

}
