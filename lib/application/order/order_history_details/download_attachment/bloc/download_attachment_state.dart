part of 'download_attachment_bloc.dart';

@freezed
class DownloadAttachmentState with _$DownloadAttachmentState {
  const factory DownloadAttachmentState({
    required List<OrderHistoryDetailsPoDocumentsBuffer> fileData,
    required FileFetchMode fileFetchMode,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _DownloadAttachmentState;
  factory DownloadAttachmentState.initial() => const DownloadAttachmentState(
        fileData: <OrderHistoryDetailsPoDocumentsBuffer>[],
        fileFetchMode: FileFetchMode.none,
        failureOrSuccessOption: None(),
      );
}

enum FileFetchMode {
  view,
  download,
  none,
}
