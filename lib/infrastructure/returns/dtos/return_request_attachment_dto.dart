import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_request_attachment_dto.freezed.dart';
part 'return_request_attachment_dto.g.dart';

@freezed
class ReturnRequestAttachmentDto with _$ReturnRequestAttachmentDto {
  const ReturnRequestAttachmentDto._();

  const factory ReturnRequestAttachmentDto({
    @JsonKey(name: 'url', defaultValue: '') required String path,
    @JsonKey(name: 'filename', defaultValue: '') required String name,
  }) = _ReturnRequestAttachmentDto;

  ReturnRequestAttachment toDomain() {
    return ReturnRequestAttachment(
      path: path,
      name: name,
      size: FileSize(0),
    );
  }

  factory ReturnRequestAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnRequestAttachmentDtoFromJson(json);
}
