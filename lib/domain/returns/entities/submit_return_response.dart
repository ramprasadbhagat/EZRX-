import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_return_response.freezed.dart';

@freezed
class SubmitReturnResponse with _$SubmitReturnResponse {
  const SubmitReturnResponse._();

  const factory SubmitReturnResponse({
    required String requestID,
    required String message,
  }) = _SubmitReturnResponse;

  factory SubmitReturnResponse.empty() => const SubmitReturnResponse(
        requestID: '',
        message: '',
      );
}
