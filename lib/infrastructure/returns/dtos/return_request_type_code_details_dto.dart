import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/return_request_type_code_details.dart';

part 'return_request_type_code_details_dto.freezed.dart';
part 'return_request_type_code_details_dto.g.dart';

@freezed
class ReturnRequestTypeCodeDetailsDto with _$ReturnRequestTypeCodeDetailsDto {
  const ReturnRequestTypeCodeDetailsDto._();

  const factory ReturnRequestTypeCodeDetailsDto({
    @JsonKey(name: 'returnCode', defaultValue: '') required String returnCode,
    @JsonKey(name: 'returnDesc', defaultValue: '')
        required String returnDescription,
  }) = _ReturnRequestTypeCodeDetailsDto;

  factory ReturnRequestTypeCodeDetailsDto.fromDomain(
    ReturnRequestTypeCodeDetails returnRequestTypeCode,
  ) {
    return ReturnRequestTypeCodeDetailsDto(
      returnCode: returnRequestTypeCode.returnCode,
      returnDescription: returnRequestTypeCode.returnDescription,
    );
  }

  ReturnRequestTypeCodeDetails toDomain() {
    return ReturnRequestTypeCodeDetails(
      returnCode: returnCode,
      returnDescription: returnDescription,
    );
  }

  factory ReturnRequestTypeCodeDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnRequestTypeCodeDetailsDtoFromJson(json);
}
