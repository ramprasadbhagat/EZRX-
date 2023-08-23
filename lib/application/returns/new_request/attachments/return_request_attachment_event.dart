part of 'return_request_attachment_bloc.dart';

@freezed
class ReturnRequestAttachmentEvent with _$ReturnRequestAttachmentEvent {
  const factory ReturnRequestAttachmentEvent.initialized() = _Initialized;
  const factory ReturnRequestAttachmentEvent.uploadFile({
    required String assignmentNumber,
    required String returnUuid,
    required UploadOptionType uploadOptionType,
  }) = _UpLoadFile;
  const factory ReturnRequestAttachmentEvent.deleteFile({
    required ReturnRequestAttachment file,
  }) = _DeleteFile;
  const factory ReturnRequestAttachmentEvent.downloadFile({
    required ReturnRequestAttachment file,
  }) = _DownloadFile;
}

enum UploadOptionType { file, gallery }
