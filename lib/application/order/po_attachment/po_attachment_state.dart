part of 'po_attachment_bloc.dart';

@freezed
class PoAttachmentState with _$PoAttachmentState {
  const PoAttachmentState._();
  const factory PoAttachmentState({
    required bool isFetching,
    required List<PoDocumentsBuffer> fileData,
    required List<PoDocuments> fileUrl,
    required FileFetchMode fileFetchMode,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PoAttachmentState;
  factory PoAttachmentState.initial() => const PoAttachmentState(
        isFetching: false,
        fileData: <PoDocumentsBuffer>[],
        fileUrl: <PoDocuments>[],
        fileFetchMode: FileFetchMode.none,
        failureOrSuccessOption: None(),
      );

  bool get moreThanOneUploaded => fileUrl.length > 1;
}

enum FileFetchMode {
  view,
  download,
  none,
}
