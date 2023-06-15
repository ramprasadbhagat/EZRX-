import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_credits_filter.freezed.dart';

@freezed
class AllCreditsFilter with _$AllCreditsFilter {
  const AllCreditsFilter._();
  factory AllCreditsFilter({
    required DocumentNumber documentNumber,
    required DateTimeStringValue documentDateFrom,
    required DateTimeStringValue documentDateTo,
    required RangeValue creditAmountFrom,
    required RangeValue creditAmountTo,
    required String sortBy,
  }) = _AllCreditsFilter;

  factory AllCreditsFilter.fullyEmpty() => AllCreditsFilter(
        documentNumber: DocumentNumber(''),
        documentDateFrom: DateTimeStringValue(''),
        documentDateTo: DateTimeStringValue(''),
        creditAmountTo: RangeValue(''),
        creditAmountFrom: RangeValue(''),
        sortBy: 'All',
      );

  factory AllCreditsFilter.empty() => AllCreditsFilter(
        documentNumber: DocumentNumber(''),
        documentDateFrom: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(
              const Duration(days: 28),
            ),
          ),
        ),
        documentDateTo: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now(),
          ),
        ),
        creditAmountTo: RangeValue(''),
        creditAmountFrom: RangeValue(''),
        sortBy: 'All',
      );

  //to convert if amountInTransactionCurrency value is negative

  String get getFilteredDocumentDate => documentDateFrom.isValid() &&
          documentDateTo.isValid()
      ? '${documentDateFrom.toValidDateString} to ${documentDateTo.toValidDateString}'
      : '';

  DateTimeRange get getDocumentDateFilterDateRange => DateTimeRange(
        start: documentDateFrom.dateTimeByDateString,
        end: documentDateTo.dateTimeByDateString,
      );

// to check Credit Amount validation
  bool get checkIfCreditAmountRangeIsValid =>
      RangeValue.checkIfRangeIsValid(creditAmountFrom, creditAmountTo);

//to check if both the Credit Amount fields are empty
  bool get checkIfAnyCreditAmountIsEmpty =>
      RangeValue.checkIfAnyIsEmpty(creditAmountFrom, creditAmountTo);

  // to check the filter validation
  bool get areFiltersValid =>
      !checkIfAnyCreditAmountIsEmpty && checkIfCreditAmountRangeIsValid;

// to check if any filter applied
  bool get anyFilterApplied => this != AllCreditsFilter.empty();

//filter count
  int get appliedFilterCount {
    var count = 0;
    if (documentNumber.isValid()) {
      count += 1;
    }

    if (documentDateFrom.isValid() || documentDateTo.isValid()) {
      count += 1;
    }
    if (creditAmountTo.isValid() || creditAmountFrom.isValid()) {
      count += 1;
    }

    return count;
  }

  bool get isValid => (appliedFilterCount > 0) && areFiltersValid;
}
