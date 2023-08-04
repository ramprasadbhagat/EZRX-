import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'outstanding_invoice_filter.freezed.dart';

@freezed
class OutstandingInvoiceFilter with _$OutstandingInvoiceFilter {
  const OutstandingInvoiceFilter._();
  factory OutstandingInvoiceFilter({
    required DateTimeStringValue documentDateFrom,
    required DateTimeStringValue documentDateTo,
    required DateTimeStringValue dueDateFrom,
    required DateTimeStringValue dueDateTo,
    required RangeValue amountValueFrom,
    required RangeValue amountValueTo,
    required StatusType outstandingInvoiceStatus,
  }) = _OutstandingInvoiceFilter;

  factory OutstandingInvoiceFilter.empty() => OutstandingInvoiceFilter(
        documentDateFrom: DateTimeStringValue(''),
        documentDateTo: DateTimeStringValue(''),
        dueDateFrom: DateTimeStringValue(''),
        dueDateTo: DateTimeStringValue(''),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        outstandingInvoiceStatus: StatusType(''),
      );

  DateTimeRange get getDocumentDateFilterDateRange => DateTimeRange(
        start: documentDateFrom.dateTime,
        end: documentDateTo.dateTime,
      );

  DateTimeRange get getDueDateFilterDateRange => DateTimeRange(
        start: dueDateFrom.dateTime,
        end: dueDateTo.dateTime,
      );

  bool get isOutstandingInvoiceAmountValueRangeValid =>
      !RangeValue.checkIfAnyIsEmpty(amountValueFrom, amountValueTo) &&
      RangeValue.checkIfRangeIsValid(amountValueFrom, amountValueTo);

  int get appliedFilterCount {
    var count = 0;
    if (documentDateFrom.isNotEmpty && documentDateTo.isNotEmpty) {
      count += 1;
    }
    if (dueDateFrom.isNotEmpty && dueDateTo.isNotEmpty) {
      count += 1;
    }
    if (amountValueFrom != RangeValue('') && amountValueTo != RangeValue('')) {
      count += 1;
    }
    if (outstandingInvoiceStatus != StatusType('')) {
      count += 1;
    }

    return count;
  }
}
