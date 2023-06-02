import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_summary_filter.freezed.dart';

@freezed
class ReturnSummaryFilter with _$ReturnSummaryFilter {
  const ReturnSummaryFilter._();
  factory ReturnSummaryFilter({
    required SearchKey requestId,
    required DateTimeStringValue dateFrom,
    required DateTimeStringValue dateTo,
    required RangeValue refundTotalTo,
    required RangeValue refundTotalFrom,
    required ReturnSummaryStatus sortBy,
  }) = _ReturnSummaryFilter;

  factory ReturnSummaryFilter.empty() => ReturnSummaryFilter(
        requestId: SearchKey.searchFilter(''),
        refundTotalTo: RangeValue(''),
        refundTotalFrom: RangeValue(''),
        dateFrom: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(
              const Duration(days: 28),
            ),
          ),
        ),
        dateTo: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now(),
          ),
        ),
        sortBy: ReturnSummaryStatus('All'),
      );

  String get getSubmittedDateFiltered =>
      '${dateFrom.toValidDateString}  to ${dateTo.toValidDateString} ';

  DateTimeRange get getSubmittedFilterDateRange => DateTimeRange(
        start: dateFrom.dateTimeByDateString,
        end: dateTo.dateTimeByDateString,
      );
  List<ReturnSummaryStatus> get returnSummaryFilteredStatus =>
      returnSummaryStatus.map((e) => ReturnSummaryStatus(e)).toList();

  ReturnSummaryStatus get activeStatus => sortBy;
// to check total value validation
  bool get checkIfTotalRangeIsValid =>
      RangeValue.checkIfRangeIsValid(refundTotalFrom, refundTotalTo);

// to check if any filter applied
  bool get anyFilterApplied => this != ReturnSummaryFilter.empty();

//to check if any TotalValue fields are empty
  bool get checkIfAnyRefundTotalIsEmpty =>
      RangeValue.checkIfAnyIsEmpty(refundTotalFrom, refundTotalTo);

// to check the filter validation

  bool get areFiltersValid =>
      requestId.isValid() &&
      (!checkIfAnyRefundTotalIsEmpty && checkIfTotalRangeIsValid);

  int get appliedFilterCount =>
      (refundTotalTo.isValid() && refundTotalFrom.isValid() ? 1 : 0) +
      requestId.countWhenValid +
      1;
}

const List<String> returnSummaryStatus = [
  'All',
  'Active',
  'Completed',
];
