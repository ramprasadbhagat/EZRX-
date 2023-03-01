import 'package:ezrxmobile/domain/returns/entities/return_summary_requests.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'requests_by_user_return_summary.freezed.dart';

@freezed
class ReturnSummaryRequestByUser with _$ReturnSummaryRequestByUser {
  const ReturnSummaryRequestByUser._();

  const factory ReturnSummaryRequestByUser({
    required List<String> requestIds,
    required List<ReturnSummaryRequest> requests,
  }) = _ReturnSummaryRequestByUser;
  factory ReturnSummaryRequestByUser.empty() =>
      const ReturnSummaryRequestByUser(
        requestIds: [],
        requests: <ReturnSummaryRequest>[],
      );
}
