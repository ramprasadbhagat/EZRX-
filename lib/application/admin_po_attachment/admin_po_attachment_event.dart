part of 'admin_po_attachment_bloc.dart';

@freezed
class AdminPoAttachmentEvent with _$AdminPoAttachmentEvent {
  const factory AdminPoAttachmentEvent.initialized() = _Initialized;
  const factory AdminPoAttachmentEvent.fetch({
    required AdminPoAttachmentFilter adminPoAttachmentFilter,
  }) = _Fetch;
  const factory AdminPoAttachmentEvent.loadMore({
    required AdminPoAttachmentFilter adminPoAttachmentFilter,
  }) = _LoadMore;
  const factory AdminPoAttachmentEvent.selectDeselect({
    required AdminPoAttachment adminPoAttachment,
  }) = _SelectDeselect;
}
