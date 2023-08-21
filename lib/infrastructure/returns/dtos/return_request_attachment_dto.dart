import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_request_attachment_dto.freezed.dart';
part 'return_request_attachment_dto.g.dart';

@freezed
class ReturnRequestAttachmentDto with _$ReturnRequestAttachmentDto {
  const ReturnRequestAttachmentDto._();

  const factory ReturnRequestAttachmentDto({
    @JsonKey(name: 'path', defaultValue: '') required String path,
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'size', defaultValue: 0) required int size,
  }) = _ReturnRequestAttachmentDto;

  ReturnRequestAttachment toDomain() {
    return ReturnRequestAttachment(
      path: path,
      id: id,
      name: name,
      size: FileSize(size),
    );
  }

  factory ReturnRequestAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnRequestAttachmentDtoFromJson(json);
}
