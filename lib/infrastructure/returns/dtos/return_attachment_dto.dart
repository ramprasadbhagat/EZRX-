import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_attachment_dto.freezed.dart';
part 'return_attachment_dto.g.dart';

@freezed
class ReturnAttachmentDto with _$ReturnAttachmentDto {
  const ReturnAttachmentDto._();

  const factory ReturnAttachmentDto({
    @JsonKey(name: 'fileName', defaultValue: '') required String fileName,
    @JsonKey(name: 'fileUrl', defaultValue: '') required String fileUrl,
  }) = _ReturnAttachmentDto;

  ReturnRequestAttachment toDomain() {
    return ReturnRequestAttachment.empty().copyWith(
      path: fileUrl,
      name: fileName,
    );
  }

  factory ReturnAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnAttachmentDtoFromJson(json);
}
