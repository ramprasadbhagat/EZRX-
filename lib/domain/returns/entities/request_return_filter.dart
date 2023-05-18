import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_return_filter.freezed.dart';

@freezed
class RequestReturnFilter with _$RequestReturnFilter {
  const RequestReturnFilter._();
  factory RequestReturnFilter({
    required SearchKey assignmentNumber,
    required SearchKey batch,
    required SearchKey materialDescription,
    required SearchKey materialNumber,
    required SearchKey principalSearch,
    required DateTimeStringValue toInvoiceDate,
    required DateTimeStringValue fromInvoiceDate,
  }) = _RequestReturnFilter;

  factory RequestReturnFilter.empty() => RequestReturnFilter(
        assignmentNumber: SearchKey.searchFilter(''),
        batch: SearchKey.searchFilter(''),
        materialDescription: SearchKey.searchFilter(''),
        materialNumber: SearchKey.searchFilter(''),
        principalSearch: SearchKey.searchFilter(''),
        fromInvoiceDate: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(const Duration(days: 28)),
          ),
        ),
        toInvoiceDate: DateTimeStringValue(
          getDateStringByDateTime(DateTime.now()),
        ),
      );

  bool get areFiltersValid =>
      assignmentNumber.isValid() &&
      batch.isValid() &&
      principalSearch.isValid() &&
      materialDescription.isValid() &&
      materialNumber.isValid();

  int get appliedFilterCount =>
      assignmentNumber.countWhenValid +
      batch.countWhenValid +
      materialNumber.countWhenValid +
      principalSearch.countWhenValid +
      materialDescription.countWhenValid +
      1;

  String get getInvoiceDateFiltered =>
      '${fromInvoiceDate.toValidDateString}  to ${toInvoiceDate.toValidDateString} ';

  DateTimeRange get getInvoiceFilterDateRange => DateTimeRange(
        start: fromInvoiceDate.dateTimeByDateString,
        end: toInvoiceDate.dateTimeByDateString,
      );
}
