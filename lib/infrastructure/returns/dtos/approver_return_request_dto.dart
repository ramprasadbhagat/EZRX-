import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/approver_return_request_information_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/approver_return_request_information_header_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approver_return_request_dto.freezed.dart';
part 'approver_return_request_dto.g.dart';

@freezed
class ApproverReturnRequestDto with _$ApproverReturnRequestDto {
  const ApproverReturnRequestDto._();
  factory ApproverReturnRequestDto({
    @JsonKey(name: 'requestHeader')
        required ApproverReturnRequestInformationHeaderDto requestHeader,
    @JsonKey(
      name: 'requestInformationV2',
      defaultValue: <ApproverReturnRequestInformationDto>[],
    )
        required List<ApproverReturnRequestInformationDto> requestInformation,
  }) = _ApproverReturnRequestDto;

  ApproverReturnRequest toDomain() {
    return ApproverReturnRequest(
      requestHeader: requestHeader.toDomain(),
      requestInformation: requestInformation.map((e) => e.toDomain()).toList(),
    );
  }

  factory ApproverReturnRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ApproverReturnRequestDtoFromJson(json);
}
