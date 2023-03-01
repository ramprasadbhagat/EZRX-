import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_items.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_requests.freezed.dart';

@freezed
class ReturnSummaryRequest with _$ReturnSummaryRequest {
  const ReturnSummaryRequest._();

  const factory ReturnSummaryRequest({
    required ReturnSummaryStatus requestStatus,
    required DateTimeStringValue submitDate,
    required String returnId,
    required double refundTotal,
    required List<ReturnSummaryRequestItems> items,
  }) = _ReturnSummaryRequest;

  factory ReturnSummaryRequest.empty() => ReturnSummaryRequest(
        requestStatus: ReturnSummaryStatus(''),
        submitDate: DateTimeStringValue(''),
        returnId: '',
        refundTotal: 0.0,
        items: <ReturnSummaryRequestItems>[],
      );
}
