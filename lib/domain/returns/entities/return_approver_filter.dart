import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_approver_filter.freezed.dart';

@freezed
class ReturnApproverFilter with _$ReturnApproverFilter {
  const ReturnApproverFilter._();
  factory ReturnApproverFilter({
    required SearchKey returnId,
    required SearchKey createdBy,
    required SearchKey soldTo,
    required SearchKey shipTo,
    required DateTimeStringValue fromInvoiceDate,
    required DateTimeStringValue toInvoiceDate,
    required FilterStatus sortBy,
  }) = _ReturnApproverFilter;

  factory ReturnApproverFilter.empty() => ReturnApproverFilter(
        returnId: SearchKey.searchFilter(''),
        createdBy: SearchKey.searchFilter(''),
        soldTo: SearchKey.searchFilter(''),
        shipTo: SearchKey.searchFilter(''),
        fromInvoiceDate: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(const Duration(days: 7)),
          ),
        ),
        toInvoiceDate: DateTimeStringValue(
          getDateStringByDateTime(DateTime.now()),
        ),
        sortBy: FilterStatus('PENDING'),
      );

  String get getFilteredInvoiceDate =>
      '${fromInvoiceDate.toValidDateString} to ${toInvoiceDate.toValidDateString}';

  DateTimeRange get getInvoiceFilterDateRange => DateTimeRange(
        start: fromInvoiceDate.dateTimeByDateString,
        end: toInvoiceDate.dateTimeByDateString,
      );

  int get appliedFilterCount =>
      returnId.countWhenValid +
      createdBy.countWhenValid +
      soldTo.countWhenValid +
      shipTo.countWhenValid +
      1;
}
