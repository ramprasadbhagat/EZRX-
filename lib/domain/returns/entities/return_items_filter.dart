import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_items_filter.freezed.dart';

@freezed
class ReturnItemsFilter with _$ReturnItemsFilter {
  const ReturnItemsFilter._();
  factory ReturnItemsFilter({
    required DateTimeStringValue invoiceDateFrom,
    required DateTimeStringValue invoiceDateTo,
  }) = _ReturnItemsFilter;

  factory ReturnItemsFilter.empty() => ReturnItemsFilter(
        invoiceDateFrom: DateTimeStringValue(''),
        invoiceDateTo: DateTimeStringValue(''),
      );

  DateTimeRange get getInvoiceDateFilterDateRange => DateTimeRange(
        start: invoiceDateFrom.dateTime,
        end: invoiceDateTo.dateTime,
      );

  int get appliedFilterCount => invoiceDateFrom.isValid() ? 1 : 0;
}
