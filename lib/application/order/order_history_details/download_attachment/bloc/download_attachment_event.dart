part of 'download_attachment_bloc.dart';

@freezed
class DownloadAttachmentEvent with _$DownloadAttachmentEvent {
  const factory DownloadAttachmentEvent.initialized() = _Initialized;
  const factory DownloadAttachmentEvent.downloadFile({
    required Map<String, String> files,
    required FileFetchMode fetchMode,
  }) = _DownloadFile;
}
