import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/submit_return_response.dart';

part 'submit_return_response_dto.freezed.dart';
part 'submit_return_response_dto.g.dart';

@freezed
class SubmitReturnResponseDto with _$SubmitReturnResponseDto {
  const SubmitReturnResponseDto._();

  const factory SubmitReturnResponseDto({
    @JsonKey(name: 'requestID', defaultValue: '') required String requestID,
    @JsonKey(name: 'messages', defaultValue: '') required String messages,
  }) = _SubmitReturnResponseDto;

  SubmitReturnResponse toDomain() {
    return SubmitReturnResponse(
      message: messages,
      requestID: requestID,
    );
  }

  factory SubmitReturnResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitReturnResponseDtoFromJson(json);
}
