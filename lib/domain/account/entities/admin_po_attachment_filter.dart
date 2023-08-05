import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_po_attachment_filter.freezed.dart';

@freezed
class AdminPoAttachmentFilter with _$AdminPoAttachmentFilter {
  AdminPoAttachmentFilter._();
  factory AdminPoAttachmentFilter({
    required SearchKey orderNumber,
    required SearchKey exRxNo,
    required SalesOrg salesOrg,
    required CustomerCodeInfo soldTo,
    required DateTimeStringValue toDate,
    required DateTimeStringValue fromDate,
  }) = _AdminPoAttachmentFilter;

  factory AdminPoAttachmentFilter.empty() => AdminPoAttachmentFilter(
        orderNumber: SearchKey.searchFilter(''),
        exRxNo: SearchKey.searchFilter(''),
        salesOrg: SalesOrg(''),
        soldTo: CustomerCodeInfo.empty(),
        fromDate: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(const Duration(days: 28)),
          ),
        ),
        toDate: DateTimeStringValue(
          getDateStringByDateTime(DateTime.now()),
        ),
      );

  String get dateFiltered => '${fromDate.dateString}  to ${toDate.dateString} ';

  DateTimeRange get filterDateRange => DateTimeRange(
        start: fromDate.dateTime,
        end: toDate.dateTime,
      );

  int get appliedFilterCount =>
      orderNumber.countWhenValid +
      exRxNo.countWhenValid +
      salesOrg.countWhenValid +
      soldTo.countWhenValid +
      1;

  bool get areFiltersValid => orderNumber.isValid() && exRxNo.isValid();
}
