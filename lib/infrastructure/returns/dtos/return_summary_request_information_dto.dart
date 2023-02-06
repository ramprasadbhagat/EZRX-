
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_request_header.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_information_request_header_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_information_request_info_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_request_information_dto.freezed.dart';
part 'return_summary_request_information_dto.g.dart';

@freezed
class ReturnSummaryRequestInformationDto with _$ReturnSummaryRequestInformationDto{
  const ReturnSummaryRequestInformationDto._();

  const factory ReturnSummaryRequestInformationDto({
    @JsonKey(name: 'requestHeader', readValue: requestHeaderOverride) required RequestHeaderDto requestHeaderDto,
    @JsonKey(name: 'requestInformationV2', defaultValue: []) required List<RequestInfoDto> requestInfo,
  }) = _ReturnSummaryRequestInformationDto;

  factory ReturnSummaryRequestInformationDto.fromDomain(
      ReturnSummaryRequestInformation returnSummaryRequestInformation,){
    return ReturnSummaryRequestInformationDto(
        requestHeaderDto: RequestHeaderDto.fromDomain(
          returnSummaryRequestInformation.requestHeader,),
        requestInfo: returnSummaryRequestInformation.requestInfo.map((e) => RequestInfoDto.fromDomain(e)).toList(),
    );
  }

  factory ReturnSummaryRequestInformationDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnSummaryRequestInformationDtoFromJson(json);

  ReturnSummaryRequestInformation toDomain(){
    return ReturnSummaryRequestInformation(
        requestHeader: requestHeaderDto.toDomain(),
        requestInfo: requestInfo.map((e) => e.toDomain()).toList(),
    );
  }

}

Map<String, dynamic> requestHeaderOverride(Map json, String key) =>
    json[key] ?? RequestHeaderDto.fromDomain(RequestHeader.empty()).toJson();
