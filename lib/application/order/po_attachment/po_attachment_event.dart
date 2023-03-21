part of 'po_attachment_bloc.dart';

@freezed
class PoAttachmentEvent with _$PoAttachmentEvent {
  const factory PoAttachmentEvent.initialized() = _Initialized;
  const factory PoAttachmentEvent.downloadFile({
    required List<PoDocuments> files,
    required FileOperationMode fetchMode,
    @Default(AttachmentType.downloadPOAttachment) AttachmentType attachmentType,
  }) = _DownloadFile;
  const factory PoAttachmentEvent.uploadFile({
    required List<PlatformFile> files,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrg salesOrg,
    required User user,
    required List<PoDocuments> uploadedPODocument,
  }) = _UpLoadFile;
}

