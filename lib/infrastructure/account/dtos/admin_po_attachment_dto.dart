import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_po_attachment_dto.freezed.dart';
part 'admin_po_attachment_dto.g.dart';

@freezed
class AdminPoAttachmentDto with _$AdminPoAttachmentDto {
  const AdminPoAttachmentDto._();
  const factory AdminPoAttachmentDto({
    @JsonKey(
      name: 'salesOrderNumber',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String salesOrderNumber,
    @JsonKey(
      name: 'ezrxReferenceNumber',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String ezrxReferenceNumber,
    @JsonKey(
      name: 'createdBy',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String createdBy,
    @JsonKey(
      name: 'createdTime',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String createdTime,
    @JsonKey(
      name: 'documentUrl',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String documentUrl,
    @JsonKey(
      name: 'documentName',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String documentName,
    @JsonKey(
      name: 'salesOrg',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String salesOrg,
    @JsonKey(
      name: 'soldToCode',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String soldToCode,
    @JsonKey(
      name: 'shipToCode',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String shipToCode,
    @JsonKey(
      name: 'tempOrderNumber',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String tempOrderNumber,
  }) = _AdminPoAttachmentDto;

  factory AdminPoAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$AdminPoAttachmentDtoFromJson(json);

  factory AdminPoAttachmentDto.fromDomain(
    AdminPoAttachment poAttachment,
  ) {
    return AdminPoAttachmentDto(
      salesOrderNumber: poAttachment.salesOrderNumber,
      ezrxReferenceNumber: poAttachment.ezrxReferenceNumber,
      createdBy: poAttachment.createdBy,
      documentName: poAttachment.documentName,
      createdTime: poAttachment.createdTime,
      documentUrl: poAttachment.documentUrl,
      salesOrg: poAttachment.salesOrg,
      shipToCode: poAttachment.shipToCode,
      soldToCode: poAttachment.soldToCode,
      tempOrderNumber: poAttachment.tempOrderNumber,
    );
  }

  AdminPoAttachment toDomain() => AdminPoAttachment(
        createdBy: createdBy,
        createdTime: createdTime,
        documentName: documentName,
        documentUrl: documentUrl,
        ezrxReferenceNumber: ezrxReferenceNumber,
        salesOrderNumber: salesOrderNumber,
        salesOrg: salesOrg,
        shipToCode: shipToCode,
        soldToCode: soldToCode,
        tempOrderNumber: tempOrderNumber,
      );
}
