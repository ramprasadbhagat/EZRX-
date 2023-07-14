import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_information_header_dto.freezed.dart';
part 'request_information_header_dto.g.dart';

@freezed
class RequestInformationHeaderDto with _$RequestInformationHeaderDto {
  const RequestInformationHeaderDto._();
  factory RequestInformationHeaderDto({
    @JsonKey(name: 'returnReference', defaultValue: '')
        required String returnReference,
    @JsonKey(name: 'specialInstructions', defaultValue: '')
        required String specialInstructions,
    @JsonKey(name: 'createdDate', defaultValue: '') required String createdDate,
    @JsonKey(name: 'cName1', defaultValue: '') required String cName1,
    @JsonKey(name: 'refundTotal', defaultValue: '') required String refundTotal,
    @JsonKey(name: 'soldTo', defaultValue: '') required String soldTo,
    @JsonKey(name: 'requestID', defaultValue: '') required String requestID,
    @JsonKey(name: 'createdBy', defaultValue: '') required String createdBy,
  }) = _RequestInformationHeaderDto;

  ReturnRequestInformationHeader toDomain() {
    return ReturnRequestInformationHeader(
      returnReference: StringValue(returnReference),
      specialInstructions: SpecialInstructions(specialInstructions),
      cName1: cName1,
      createdBy: createdBy,
      createdDate: DateTimeStringValue(createdDate),
      refundTotal: RefundTotal(refundTotal),
      requestID: requestID,
      soldTo: soldTo,
    );
  }

  factory RequestInformationHeaderDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RequestInformationHeaderDtoFromJson(json);
}
