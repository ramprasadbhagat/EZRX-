part of 'po_attachment_bloc.dart';

@freezed
class PoAttachmentState with _$PoAttachmentState {
  const PoAttachmentState._();
  const factory PoAttachmentState({
    required bool isFetching,
    required List<PoDocuments> fileUrl,
    required FileOperationMode fileOperationMode,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PoAttachmentState;
  factory PoAttachmentState.initial() => const PoAttachmentState(
        isFetching: false,
        fileUrl: <PoDocuments>[],
        fileOperationMode: FileOperationMode.none,
        failureOrSuccessOption: None(),
      );

  bool get moreThanOneUploaded => fileUrl.length > 1;

  List<PoDocuments> get fileInOperation => isFetching ? fileUrl : [];

  bool get fileUploading =>
      fileInOperation.isNotEmpty &&
      fileOperationMode == FileOperationMode.upload &&
      isFetching;

  bool get fileUploaded =>
      fileOperationMode == FileOperationMode.upload && !isFetching;

  List<PoDocuments> get uploadInProgressPoDocument =>
      fileOperationMode == FileOperationMode.upload ? fileInOperation : [];

  bool get fileDownloading =>
      fileOperationMode == FileOperationMode.download ||
      fileOperationMode == FileOperationMode.view;

  bool get isDownloadOperation =>
      fileOperationMode == FileOperationMode.download;
}

enum FileOperationMode {
  view,
  download,
  upload,
  none,
}
