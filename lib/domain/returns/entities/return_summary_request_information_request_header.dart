import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_sales_doc.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_return_invoices.dart';
part 'return_summary_request_information_request_header.freezed.dart';

@freezed
class RequestHeader with _$RequestHeader {
  const RequestHeader._();

  const factory RequestHeader({
    required String soldTo,
    required String shipTo,
    required String createdBy,
    required String returnType,
    required ReturnSummaryStatus status,
    required DateTimeStringValue createdDate,
    required String createdTime,
    required String requestId,
    required String salesOrg,
    required double refundTotal,
    required String totalItemCount,
    required List<ReturnInvoices> returnInvoices,
    required List<SalesDoc> salesDoc,
    required String returnTypeDesc,
    required bool ppaHeld,
    required String cName1,
    required String cName2,
    required String cName3,
    required String cName4,
    required String street1,
    required String street2,
    required String street3,
    required String street4,
  }) = _RequestHeader;

  factory RequestHeader.empty() => RequestHeader(
        soldTo: '',
        shipTo: '',
        createdBy: '',
        returnType: '',
        status: ReturnSummaryStatus(''),
        createdDate: DateTimeStringValue(''),
        createdTime: '',
        requestId: '',
        salesOrg: '',
        refundTotal: 0.0,
        totalItemCount: '',
        returnInvoices: <ReturnInvoices>[],
        salesDoc: <SalesDoc>[],
        returnTypeDesc: '',
        ppaHeld: false,
        cName1: '',
        cName2: '',
        cName3: '',
        cName4: '',
        street1: '',
        street2: '',
        street3: '',
        street4: '',
      );
}
