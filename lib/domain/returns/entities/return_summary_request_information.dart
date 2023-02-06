import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_request_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_request_info.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_request_information.freezed.dart';

@freezed
class ReturnSummaryRequestInformation with _$ReturnSummaryRequestInformation {
  const ReturnSummaryRequestInformation._();

  const factory ReturnSummaryRequestInformation({
    required RequestHeader requestHeader,
    required List<RequestInfo> requestInfo,
  }) = _ReturnSummaryRequestInformation;

  factory ReturnSummaryRequestInformation.empty() => ReturnSummaryRequestInformation(
        requestHeader: RequestHeader.empty(),
        requestInfo: <RequestInfo>[],
      );
}
