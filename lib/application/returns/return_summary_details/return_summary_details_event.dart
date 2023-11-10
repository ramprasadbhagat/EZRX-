part of 'return_summary_details_bloc.dart';

@freezed
class ReturnSummaryDetailsEvent with _$ReturnSummaryDetailsEvent {
  const factory ReturnSummaryDetailsEvent.initialized() = _Initialized;
  const factory ReturnSummaryDetailsEvent.fetch({
    required ReturnRequestsId returnId,
  }) = _Fetch;
    const factory ReturnSummaryDetailsEvent.downloadFile({
    required ReturnRequestAttachment file,
  }) = _DownloadFile;
}
