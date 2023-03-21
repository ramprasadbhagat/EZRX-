part of 'return_summary_details_bloc.dart';

@freezed
class ReturnSummaryDetailsEvent with _$ReturnSummaryDetailsEvent {
  const factory ReturnSummaryDetailsEvent.initialized() = _Initialized;

  const factory ReturnSummaryDetailsEvent.fetch({
    required ReturnSummaryRequest returnSummaryRequests,
  }) = _Fetch;
}
