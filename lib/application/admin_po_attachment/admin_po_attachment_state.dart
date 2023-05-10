part of 'admin_po_attachment_bloc.dart';

const _downloadLimit = 15;

@freezed
class AdminPoAttachmentState with _$AdminPoAttachmentState {
  const AdminPoAttachmentState._();
  const factory AdminPoAttachmentState({
    required List<AdminPoAttachment> adminPoAttachmentList,
    required bool canLoadMore,
    required bool isFetching,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _AdminPoAttachmentState;
  factory AdminPoAttachmentState.initial() => AdminPoAttachmentState(
        adminPoAttachmentList: <AdminPoAttachment>[],
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        failureOrSuccessOption: none(),
      );

  List<AdminPoAttachment> get selectedItems => adminPoAttachmentList
      .where(
        (AdminPoAttachment adminPoAttachment) => adminPoAttachment.isSelected,
      )
      .toList();

  bool get allSelected =>
      adminPoAttachmentList.length == selectedItems.length &&
      adminPoAttachmentList.isNotEmpty;

  bool get canDownload =>
      selectedItems.length <= _downloadLimit && selectedItems.isNotEmpty;
}
