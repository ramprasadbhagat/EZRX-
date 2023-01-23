part of 'po_attachment_bloc.dart';

@freezed
class PoAttachmentState with _$PoAttachmentState {
  const PoAttachmentState._();
  const factory PoAttachmentState({
    required bool isFetching,
    required List<PoDocumentsBuffer> fileData,
    required List<PoDocuments> fileUrl,
    required FileOperationhMode fileOperationhMode,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PoAttachmentState;
  factory PoAttachmentState.initial() => const PoAttachmentState(
        isFetching: false,
        fileData: <PoDocumentsBuffer>[],
        fileUrl: <PoDocuments>[],
        fileOperationhMode: FileOperationhMode.none,
        failureOrSuccessOption: None(),
      );

  bool get moreThanOneUploaded => fileUrl.length > 1;

  List<PoDocuments> get fileInOperation => isFetching ? fileUrl : [];

  bool get fileUploading =>
      fileInOperation.isNotEmpty &&
      fileOperationhMode == FileOperationhMode.upload &&
      isFetching;

  bool get fileUploaded =>
      fileOperationhMode == FileOperationhMode.upload && !isFetching;

  List<PoDocuments> get uploadInProgressPoDocument =>
      fileOperationhMode == FileOperationhMode.upload ? fileInOperation : [];

  bool get fileDownloaing =>
      fileOperationhMode == FileOperationhMode.download ||
      fileOperationhMode == FileOperationhMode.view;
}

enum FileOperationhMode {
  view,
  download,
  upload,
  none,
}
