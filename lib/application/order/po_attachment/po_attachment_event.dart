part of 'po_attachment_bloc.dart';

@freezed
class PoAttachmentEvent with _$PoAttachmentEvent {
  const factory PoAttachmentEvent.initialized() = _Initialized;
  const factory PoAttachmentEvent.downloadFile({
    required List<PoDocuments> files,
    @Default(AttachmentType.downloadPOAttachment) AttachmentType attachmentType,
  }) = _DownloadFile;
  const factory PoAttachmentEvent.openFile({
    required PoDocuments files,
    @Default(AttachmentType.downloadPOAttachment) AttachmentType attachmentType,
  }) = _OpenFile;
  const factory PoAttachmentEvent.uploadFile({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrg salesOrg,
    required User user,
    required List<PoDocuments> uploadedPODocument,
    required UploadOptionType uploadOptionType,
  }) = _UpLoadFile;
}

enum UploadOptionType { file, gallery }
