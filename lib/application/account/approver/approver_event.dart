part of 'approver_bloc.dart';

@freezed
class ApproverEvent with _$ApproverEvent {
  const factory ApproverEvent.initialized() = _Initialized;

  const factory ApproverEvent.fetch({
    required User userInfo,
  }) = _Fetch;
}
