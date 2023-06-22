part of 'all_invoices_filter_bloc.dart';

@freezed
class AllInvoicesFilterEvent with _$AllInvoicesFilterEvent {
  const factory AllInvoicesFilterEvent.fetch({
    required SalesOrganisation salesOrganisation,
  }) = _Fetch;

  const factory AllInvoicesFilterEvent.initialized() = _Initialized;

  const factory AllInvoicesFilterEvent.openFilterBottomSheet() =
      _OpenFilterBottomSheet;

  const factory AllInvoicesFilterEvent.closeFilterBottomSheet() =
      _CloseFilterBottomSheet;

  const factory AllInvoicesFilterEvent.applyFilters() = _ApplyFilters;

  const factory AllInvoicesFilterEvent.resetFilters() = _ResetFilters;

  const factory AllInvoicesFilterEvent.amountValueFromChanged(
    String amountValueFrom,
  ) = _AmountValueFromChanged;

  const factory AllInvoicesFilterEvent.amountValueToChanged(
    String amountValueTo,
  ) = _AmountValueToChanged;

  const factory AllInvoicesFilterEvent.statusChanged(
    String filterStatus,
    bool selected,
  ) = _StatusChanged;

  const factory AllInvoicesFilterEvent.setDueDate(
    DateTimeRange dateRange,
  ) = _SetDueDate;

  const factory AllInvoicesFilterEvent.setDocumentDate(
    DateTimeRange dateRange,
  ) = _SetDocumentDate;
  
}
