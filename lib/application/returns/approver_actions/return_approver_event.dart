part of 'return_approver_bloc.dart';

@freezed
class ReturnApproverEvent with _$ReturnApproverEvent {
  const factory ReturnApproverEvent.initialized() = _initialized;
  const factory ReturnApproverEvent.fetch({
    required User user,
  }) = _fetch;
}
