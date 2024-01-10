import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_attachment_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_request_information_dto.freezed.dart';
part 'return_request_information_dto.g.dart';

@freezed
class ReturnRequestInformationDto with _$ReturnRequestInformationDto {
  const ReturnRequestInformationDto._();

  factory ReturnRequestInformationDto({
    @JsonKey(name: 'invoiceNo', defaultValue: '')
        required String invoiceNo,
    @JsonKey(name: 'expiryDate', defaultValue: '')
        required String expiryDate,
    @JsonKey(name: 'comment', defaultValue: '')
        required String comment,
    @JsonKey(name: 'rejectReason', defaultValue: '')
        required String rejectReason,
    @JsonKey(name: 'returnQuantity', defaultValue: '')
        required String returnQuantity,
    @JsonKey(name: 'unitPrice', defaultValue: '')
        required String unitPrice,
    @JsonKey(name: 'totalPrice', defaultValue: '')
        required String totalPrice,
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'batch', defaultValue: '')
        required String batch,
    @JsonKey(name: 'returnOrderDesc', defaultValue: '')
        required String returnOrderDesc,
    @JsonKey(name: 'materialGroup', defaultValue: '')
        required String materialGroup,
    @JsonKey(name: 'imageUrl', defaultValue: <String>[])
        required List<String> imageUrl,
    @JsonKey(name: 'attachments', defaultValue: <String>[])
        required List<String> attachments,
    @JsonKey(name: 'attachmentUrl', defaultValue: <ReturnAttachmentDto>[])
        required List<ReturnAttachmentDto> attachmentUrl,
    @JsonKey(name: 'createdDate', defaultValue: '')
        required String createdDate,
    @JsonKey(name: 'principal', defaultValue: '')
        required String principal,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'bapiSalesDocNumber', defaultValue: '')
        required String bapiSalesDocNumber,
    @JsonKey(name: 'bapiStatus', defaultValue: '')
        required String bapiStatus,
    @JsonKey(name: 'status', defaultValue: '')
        required String status,
    @JsonKey(name: 'statusReason', defaultValue: '')
        required String statusReason,
    @JsonKey(name: 'outsidePolicy', defaultValue: false)
        required bool outsidePolicy,
    @JsonKey(name: 'invoiceDate', defaultValue: '')
        required String invoiceDate,
    @JsonKey(name: 'prsfd', defaultValue: '')
        required String prsfd,
    @JsonKey(name: 'remarks', defaultValue: '')
        required String remarks,
    @JsonKey(
      name: 'bonusInformation',
      defaultValue: <ReturnRequestInformationDto>[],
    )
        required List<ReturnRequestInformationDto> bonusInformation,
    @StringToDoubleConverter()
    @JsonKey(name: 'overrideValue', defaultValue: 0)
        required double overrideValue,
  }) = _ReturnRequestInformationDto;

  ReturnRequestInformation toDomain() {
    return ReturnRequestInformation(
      invoiceNo: invoiceNo,
      expiryDate: DateTimeStringValue(expiryDate),
      comment: StringValue(comment),
      rejectReason: rejectReason,
      returnQuantity: returnQuantity,
      unitPrice: double.parse(unitPrice),
      totalPrice: double.parse(totalPrice),
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      batch: batch,
      materialGroup: materialGroup,
      attachmentUrl: attachmentUrl.map((e) => e.toDomain()).toList(),
      imageUrl: imageUrl,
      attachments: attachments,
      createdDate: DateTimeStringValue(createdDate),
      returnOrderDesc: returnOrderDesc,
      principal: principal,
      principalName: PrincipalName(principalName),
      bapiSalesDocNumber: bapiSalesDocNumber,
      bapiStatus: StatusType(bapiStatus),
      status: StatusType(status),
      statusReason: statusReason,
      outsidePolicy: outsidePolicy,
      invoiceDate: DateTimeStringValue(invoiceDate),
      prsfd: Prsfd(prsfd),
      bonusInformation: bonusInformation.map((e) => e.toDomain()).toList(),
      remarks: Remarks(remarks),
      overrideValue: overrideValue,
    );
  }

  factory ReturnRequestInformationDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReturnRequestInformationDtoFromJson(json);
}
