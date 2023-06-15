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
    required RangeValue debitValueFrom,
    required RangeValue debitValueTo,
    required String filterStatus,
  }) = _AllInvoicesFilter;

  factory AllInvoicesFilter.fullyEmpty() => AllInvoicesFilter(
        documentNumber: DocumentNumber(''),
        dueDateFrom: DateTimeStringValue(''),
        dueDateTo: DateTimeStringValue(''),
        documentDateFrom: DateTimeStringValue(''),
        documentDateTo: DateTimeStringValue(''),
        debitValueFrom: RangeValue(''),
        debitValueTo: RangeValue(''),
        filterStatus: '',
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
        debitValueFrom: RangeValue(''),
        debitValueTo: RangeValue(''),
        filterStatus: 'All',
      );

  AllInvoicesFilter get _defaultValue => AllInvoicesFilter.empty();

  String get getFilteredDueDate => dueDateFrom.isValid() && dueDateTo.isValid()
      ? '${dueDateFrom.toValidDateString} to ${dueDateTo.toValidDateString}'
      : '';

  DateTimeRange get getDueDateFilterDateRange => DateTimeRange(
        start: dueDateFrom.dateTimeByDateString,
        end: dueDateTo.dateTimeByDateString,
      );

  String get getFilteredDocumentDate => documentDateFrom.isValid() &&
          documentDateTo.isValid()
      ? '${documentDateFrom.toValidDateString} to ${documentDateTo.toValidDateString}'
      : '';

  DateTimeRange get getDocumentDateFilterDateRange => DateTimeRange(
        start: documentDateFrom.dateTimeByDateString,
        end: documentDateTo.dateTimeByDateString,
      );

  int get appliedFilterCount {
    var count = 0;
    if (documentNumber.isValid()) {
      count += 1;
    }
    if (dueDateFrom.isValid() || dueDateTo.isValid()) {
      count += 1;
    }
    if (documentDateFrom.isValid() || documentDateTo.isValid()) {
      count += 1;
    }
    if (debitValueFrom.isValid() || debitValueTo.isValid()) {
      count += 1;
    }

    return count;
  }

  bool get checkIfDebitValueRangeIsValid =>
      RangeValue.checkIfRangeIsValid(debitValueFrom, debitValueTo);

  bool get checkIfAnyDebitValueIsEmpty =>
      RangeValue.checkIfAnyIsEmpty(debitValueFrom, debitValueTo);

  bool get isValid => anyFilterApplied && isDebitValueRangeValid;

  bool get isDebitValueRangeValid =>
      !checkIfAnyDebitValueIsEmpty && checkIfDebitValueRangeIsValid;

  bool get anyFilterApplied => appliedFilterCount > 0;

  bool get isEmpty => this == _defaultValue;
}
