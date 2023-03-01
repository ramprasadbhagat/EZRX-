part of 'return_summary_bloc.dart';

@freezed
class ReturnSummaryEvent with _$ReturnSummaryEvent {
  const factory ReturnSummaryEvent.initialized() = _initialized;

  const factory ReturnSummaryEvent.fetch({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required ReturnSummaryFilter returnSummaryFilter,
  }) = _Fetch;
  const factory ReturnSummaryEvent.loadMore({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required ReturnSummaryFilter returnSummaryFilter,
  }) = _LoadMore;
  
}
