part of 'return_approver_bloc.dart';

@freezed
class ReturnApproverEvent with _$ReturnApproverEvent {

  const factory ReturnApproverEvent.initialized() = _Initialized;

  const factory ReturnApproverEvent.fetch({
    required User user,
    required ReturnApproverFilter approverReturnFilter,
  }) = _Fetch;

  const factory ReturnApproverEvent.loadMore({
    required User user,
    required ReturnApproverFilter approverReturnFilter,
  }) = _LoadMore;
}
