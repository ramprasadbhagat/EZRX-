part of 'all_credits_filter_bloc.dart';

@freezed
class AllCreditsFilterEvent with _$AllCreditsFilterEvent {
  const factory AllCreditsFilterEvent.initialized() = _Initialized;

  const factory AllCreditsFilterEvent.fetch({
    required SalesOrganisation salesOrganisation,
  }) = _Fetch;

  const factory AllCreditsFilterEvent.applyFilters() = _ApplyFilters;
  
  const factory AllCreditsFilterEvent.clearFilters() = _ClearFilters;

  const factory AllCreditsFilterEvent.documentNumberChanged(
    DocumentNumber documentNumber,
  ) = _DocumentNumberChanged;

  const factory AllCreditsFilterEvent.setDocumentDate(
    DateTimeRange documentDateRange,
  ) = _SetDocumentDate;

  const factory AllCreditsFilterEvent.creditAmountToChanged(
    String creditAmountTo,
  ) = _CreditAmountToChanged;

  const factory AllCreditsFilterEvent.creditAmountFromChanged(
    String creditAmountFrom,
  ) = _CreditAmountFromChanged;

  const factory AllCreditsFilterEvent.sortByChanged(
    String sortBy,
  ) = _SortByChanged;
}
