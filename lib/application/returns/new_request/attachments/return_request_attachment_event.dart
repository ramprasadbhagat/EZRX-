part of 'return_request_attachment_bloc.dart';

@freezed
class ReturnRequestAttachmentEvent with _$ReturnRequestAttachmentEvent {
  const factory ReturnRequestAttachmentEvent.initialized() = _Initialized;
  const factory ReturnRequestAttachmentEvent.uploadFile({
    required String returnUuid,
    required String assignmentNumber,
    required UploadOptionType uploadOptionType,
  }) = _UpLoadFile;
  const factory ReturnRequestAttachmentEvent.deleteFile({
    required ReturnRequestAttachment file,
  }) = _DeleteFile;
}

enum UploadOptionType { file, gallery }
