part of 'all_invoices_filter_bloc.dart';

@freezed
class AllInvoicesFilterEvent with _$AllInvoicesFilterEvent {
  const factory AllInvoicesFilterEvent.fetch({
    required SalesOrganisation salesOrganisation,
  }) = _Fetch;

  const factory AllInvoicesFilterEvent.initialized() = _Initialized;

  const factory AllInvoicesFilterEvent.openFilterDrawer() = _OpenFilterDrawer;

  const factory AllInvoicesFilterEvent.applyFilters() = _ApplyFilters;
  
  const factory AllInvoicesFilterEvent.clearFilters() = _ClearFilters;

  const factory AllInvoicesFilterEvent.documentNumberChanged(
    DocumentNumber documentNumber,
  ) = _DocumentNumberChanged;

  const factory AllInvoicesFilterEvent.debitValueFromChanged(
    String debitValueFrom,
  ) = _DebitValueFromChanged;

  const factory AllInvoicesFilterEvent.debitValueToChanged(
    String debitValueTo,
  ) = _DebitValueToChanged;

  const factory AllInvoicesFilterEvent.statusChanged(
    String filterStatus,
  ) = _StatusChanged;

  const factory AllInvoicesFilterEvent.setDueDate(
    DateTimeRange dueDateRange,
  ) = _SetDueDate;

  const factory AllInvoicesFilterEvent.setDocumentDate(
    DateTimeRange documentDateRange,
  ) = _SetDocumentDate;
}
