part of 'admin_po_attachment_filter_bloc.dart';

@freezed
class AdminPoAttachmentFilterState with _$AdminPoAttachmentFilterState {
  factory AdminPoAttachmentFilterState({
    required AdminPoAttachmentFilter adminPoAttachmentFilter,
    required bool isSubmitting,
    required bool showErrorMessages,
  }) = _AdminPoAttachmentFilterState;
  
  factory AdminPoAttachmentFilterState.initial() =>
      AdminPoAttachmentFilterState(
        isSubmitting: false,
        adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
        showErrorMessages: false,
      );
}
