import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_invoices_filter.freezed.dart';

@freezed
class AllInvoicesFilter with _$AllInvoicesFilter {
  const AllInvoicesFilter._();
  factory AllInvoicesFilter({
    required DocumentNumber documentNumber,
    required DateTimeStringValue dueDateFrom,
    required DateTimeStringValue dueDateTo,
    required DateTimeStringValue documentDateFrom,
    required DateTimeStringValue documentDateTo,
    required RangeValue amountValueFrom,
    required RangeValue amountValueTo,
    required List<String> filterStatuses,
  }) = _AllInvoicesFilter;

  factory AllInvoicesFilter.fullyEmpty() => AllInvoicesFilter(
        documentNumber: DocumentNumber(''),
        dueDateFrom: DateTimeStringValue(''),
        dueDateTo: DateTimeStringValue(''),
        documentDateFrom: DateTimeStringValue(''),
        documentDateTo: DateTimeStringValue(''),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        filterStatuses: [],
      );

  factory AllInvoicesFilter.empty() => AllInvoicesFilter(
        documentNumber: DocumentNumber(''),
        dueDateFrom: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(
              const Duration(days: 28),
            ),
          ),
        ),
        dueDateTo: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now(),
          ),
        ),
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
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        filterStatuses: <String>[],
      );

  AllInvoicesFilter get _defaultValue => AllInvoicesFilter.empty();


  DateTimeRange get getDueDateFilterDateRange => DateTimeRange(
        start: dueDateFrom.dateTimeByDateString,
        end: dueDateTo.dateTimeByDateString,
      );

  DateTimeRange get getDocumentDateFilterDateRange => DateTimeRange(
        start: documentDateFrom.dateTimeByDateString,
        end: documentDateTo.dateTimeByDateString,
      );

  int get appliedFilterCount {
    var count = 0;
    if (filterStatuses.isNotEmpty) {
      count += 1;
    }
    if (dueDateFrom.isValid() || dueDateTo.isValid()) {
      count += 1;
    }
    if (documentDateFrom.isValid() || documentDateTo.isValid()) {
      count += 1;
    }
    if (amountValueFrom.isValid() || amountValueTo.isValid()) {
      count += 1;
    }

    return count;
  }

  bool get isValid => anyFilterApplied && isAmountValueRangeValid;

  bool get isAmountValueRangeValid =>
      !RangeValue.checkIfAnyIsEmpty(amountValueFrom, amountValueTo) &&
      RangeValue.checkIfRangeIsValid(amountValueFrom, amountValueTo);

  bool get anyFilterApplied => appliedFilterCount > 0;

  bool get isEmpty => this == _defaultValue;
}
