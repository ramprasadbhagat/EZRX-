part of 'admin_po_attachment_filter_bloc.dart';

@freezed
class AdminPoAttachmentFilterEvent with _$AdminPoAttachmentFilterEvent {
  const factory AdminPoAttachmentFilterEvent.initialized() = _Initialized;

  const factory AdminPoAttachmentFilterEvent.applyFilters() = _ApplyFilters;

  const factory AdminPoAttachmentFilterEvent.orderNoChanged(
    String orderNumber,
  ) = _OrderNoChanged;

  const factory AdminPoAttachmentFilterEvent.ezrxNoChanged(
    String exRxNo,
  ) = _EzrxNoChanged;

  const factory AdminPoAttachmentFilterEvent.salesOrgChanged(
    SalesOrg salesOrg,
  ) = _SalesOrgChanged;

  const factory AdminPoAttachmentFilterEvent.soldToChanged(
    CustomerCodeInfo soldTo,
  ) = _CustomerCodeChanged;

  const factory AdminPoAttachmentFilterEvent.setOrderDate({
    required DateTimeRange orderDateRange,
  }) = _SetOrderDate;
}
