import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approver_return_request_information_header.freezed.dart';

@freezed
class ApproverReturnRequestInformationHeader
    with _$ApproverReturnRequestInformationHeader {
  factory ApproverReturnRequestInformationHeader({
    required String soldTo,
    required String shipTo,
    required String createdBy,
    required String returnType,
    required String status,
    required String createdDate,
    required String createdTime,
    required String requestID,
    required SalesOrg salesOrg,
    required RefundTotal refundTotal,
    required String totalItemCount,
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
    required List<ReturnInvoices> returnInvoices,
    required List<ReturnSalesDoc> salesDoc,
  }) = _ApproverReturnRequestInformationHeader;

  factory ApproverReturnRequestInformationHeader.empty() =>
      ApproverReturnRequestInformationHeader(
        cName1: '',
        cName2: '',
        cName3: '',
        cName4: '',
        createdBy: '',
        createdDate: '',
        createdTime: '',
        ppaHeld: false,
        refundTotal: RefundTotal(''),
        requestID: '',
        returnInvoices: [],
        returnType: '',
        returnTypeDesc: '',
        salesDoc: [],
        salesOrg: SalesOrg(''),
        shipTo: '',
        soldTo: '',
        status: '',
        street1: '',
        street2: '',
        street3: '',
        street4: '',
        totalItemCount: '',
      );
}

@freezed
class ReturnInvoices with _$ReturnInvoices {
  factory ReturnInvoices({
    required String invoiceNumber,
    required String invoiceDate,
  }) = _ReturnInvoices;
}

@freezed
class ReturnSalesDoc with _$ReturnSalesDoc {
  factory ReturnSalesDoc({
    required String invoiceNumber,
    required String invoiceDate,
    required String bapiSalesDoc,
    required String ezrxNumber,
    required List<ReturnCreditNotes> creditNotes,
  }) = _ReturnSalesDoc;
}

@freezed
class ReturnCreditNotes with _$ReturnCreditNotes {
  factory ReturnCreditNotes({
    required String creditNoteId,
    required List<ReturnMaterial> materials,
  }) = _ReturnCreditNotes;
}

@freezed
class ReturnMaterial with _$ReturnMaterial {
  factory ReturnMaterial({
    required MaterialNumber materialNumber,
    required String lineNumber,
    required String materialDescription,
    required String qty,
    required String value,
  }) = _ReturnMaterial;
}
