import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_request_type_code_details.freezed.dart';

@freezed
class ReturnRequestTypeCodeDetails with _$ReturnRequestTypeCodeDetails {
  const ReturnRequestTypeCodeDetails._();

  const factory ReturnRequestTypeCodeDetails({
    required String returnCode,
    required String returnDescription,
  }) = _ReturnRequestTypeCodeDetails;
  factory ReturnRequestTypeCodeDetails.empty() => const ReturnRequestTypeCodeDetails(
        returnCode: '',
        returnDescription: '',
      );
}
