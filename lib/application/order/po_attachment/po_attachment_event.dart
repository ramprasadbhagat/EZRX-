part of 'po_attachment_bloc.dart';

@freezed
class PoAttachmentEvent with _$PoAttachmentEvent {
  const factory PoAttachmentEvent.initialized() = _Initialized;
  const factory PoAttachmentEvent.downloadFile({
    required List<PoDocuments> files,
  }) = _DownloadFile;
  const factory PoAttachmentEvent.openFile({
    required PoDocuments files,
  }) = _OpenFile;
  const factory PoAttachmentEvent.uploadFile({
    required List<PoDocuments> uploadedPODocument,
    required UploadOptionType uploadOptionType,
    required User user,
  }) = _UpLoadFile;
  const factory PoAttachmentEvent.deleteFile({
    required PoDocuments file,
  }) = _DeleteFile;
}
