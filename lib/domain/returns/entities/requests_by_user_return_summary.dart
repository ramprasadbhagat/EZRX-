import 'package:freezed_annotation/freezed_annotation.dart';
part 'requests_by_user_return_summary.freezed.dart';

@freezed
class ReturnSummaryRequestByUser with _$ReturnSummaryRequestByUser {
  const ReturnSummaryRequestByUser._();

  const factory ReturnSummaryRequestByUser({
    required String requestID,
  }) = _ReturnSummaryRequestByUser;
  factory ReturnSummaryRequestByUser.empty() =>
      const ReturnSummaryRequestByUser(
        requestID: '',
      );
}
