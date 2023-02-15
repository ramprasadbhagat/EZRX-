import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
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
    required InvoiceDate toInvoiceDate,
    required InvoiceDate fromInvoiceDate,
    required FilterStatus sortBy,
  }) = _ReturnApproverFilter;

  factory ReturnApproverFilter.empty() => ReturnApproverFilter(
        returnId: SearchKey.searchFilter(''),
        createdBy: SearchKey.searchFilter(''),
        soldTo: SearchKey.searchFilter(''),
        shipTo: SearchKey.searchFilter(''),
        toInvoiceDate: InvoiceDate(''),
        fromInvoiceDate: InvoiceDate(''),
        sortBy: FilterStatus('PENDING'),
      );

}
