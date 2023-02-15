part of 'return_approver_filter_bloc.dart';

@freezed
class ReturnApproverFilterEvent with _$ReturnApproverFilterEvent {
  const factory ReturnApproverFilterEvent.initialized() = _Initialized;

  const factory ReturnApproverFilterEvent.applyFilters() = _ApplyFilters;

  const factory ReturnApproverFilterEvent.setfromInvoiceDate({
    required DateTime fromDate,
  }) = _SetfromInvoiceDate;

  const factory ReturnApproverFilterEvent.setToInvoiceDate({
    required DateTime toDate,
  }) = _SetToInvoiceDate;

  const factory ReturnApproverFilterEvent.returnIdChanged(String returnId) =
      _ReturnIdChanged;

  const factory ReturnApproverFilterEvent.soldToChanged(String soldTo) =
      _SoldToChanged;

  const factory ReturnApproverFilterEvent.shipToChanged(
    String shitTo,
  ) = _ShipToChanged;

  const factory ReturnApproverFilterEvent.createdByChanged(
    String createdBy,
  ) = _CreatedByChanged;

  const factory ReturnApproverFilterEvent.sortByChanged(
    FilterStatus sortBy,
  ) = _SortByChanged;
}
