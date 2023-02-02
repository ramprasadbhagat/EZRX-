import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approver_return_request_information_header_dto.freezed.dart';
part 'approver_return_request_information_header_dto.g.dart';

@freezed
class ApproverReturnRequestInformationHeaderDto
    with _$ApproverReturnRequestInformationHeaderDto {
  const ApproverReturnRequestInformationHeaderDto._();
  factory ApproverReturnRequestInformationHeaderDto({
    @JsonKey(name: 'soldTo', defaultValue: '') required String soldTo,
    @JsonKey(name: 'shipTo', defaultValue: '') required String shipTo,
    @JsonKey(name: 'createdBy', defaultValue: '') required String createdBy,
    @JsonKey(name: 'returnType', defaultValue: '') required String returnType,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'createdDate', defaultValue: '') required String createdDate,
    @JsonKey(name: 'createdTime', defaultValue: '') required String createdTime,
    @JsonKey(name: 'requestID', defaultValue: '') required String requestID,
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'refundTotal', defaultValue: '') required String refundTotal,
    @JsonKey(name: 'totalItemCount', defaultValue: '')
        required String totalItemCount,
    @JsonKey(name: 'returnTypeDesc', defaultValue: '')
        required String returnTypeDesc,
    @JsonKey(name: 'ppaHeld', defaultValue: false) required bool ppaHeld,
    @JsonKey(name: 'cName1', defaultValue: '') required String cName1,
    @JsonKey(name: 'cName2', defaultValue: '') required String cName2,
    @JsonKey(name: 'cName3', defaultValue: '') required String cName3,
    @JsonKey(name: 'cName4', defaultValue: '') required String cName4,
    @JsonKey(name: 'street1', defaultValue: '') required String street1,
    @JsonKey(name: 'street2', defaultValue: '') required String street2,
    @JsonKey(name: 'street3', defaultValue: '') required String street3,
    @JsonKey(name: 'street4', defaultValue: '') required String street4,
    @JsonKey(name: 'returnInvoices', defaultValue: <ReturnInvoicesDto>[])
        required List<ReturnInvoicesDto> returnInvoices,
    @JsonKey(name: 'salesDoc', defaultValue: <RetrunSalesDocDto>[])
        required List<RetrunSalesDocDto> salesDoc,
  }) = _ApproverReturnRequestInformationHeaderDto;

  ApproverReturnRequestInformationHeader toDomain() {
    return ApproverReturnRequestInformationHeader(
      cName1: cName1,
      cName2: cName2,
      cName3: cName3,
      cName4: cName4,
      createdBy: createdBy,
      createdDate: createdDate,
      createdTime: createdTime,
      ppaHeld: ppaHeld,
      refundTotal: RefundTotal(refundTotal),
      requestID: requestID,
      returnType: returnType,
      returnTypeDesc: returnTypeDesc,
      salesOrg: SalesOrg(salesOrg),
      shipTo: shipTo,
      soldTo: soldTo,
      status: status,
      street1: street1,
      street2: street2,
      street3: street3,
      street4: street4,
      totalItemCount: totalItemCount,
      returnInvoices: returnInvoices.map((e) => e.toDomain()).toList(),
      salesDoc: salesDoc.map((e) => e.toDomain()).toList(),
    );
  }

  factory ApproverReturnRequestInformationHeaderDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApproverReturnRequestInformationHeaderDtoFromJson(json);
}

@freezed
class ReturnInvoicesDto with _$ReturnInvoicesDto {
  const ReturnInvoicesDto._();
  factory ReturnInvoicesDto({
    @JsonKey(name: 'invoiceNumber', defaultValue: '')
        required String invoiceNumber,
    @JsonKey(name: 'invoiceDate', defaultValue: '') required String invoiceDate,
  }) = _ReturnInvoicesDto;

  ReturnInvoices toDomain() {
    return ReturnInvoices(
      invoiceNumber: invoiceNumber,
      invoiceDate: invoiceDate,
    );
  }

  factory ReturnInvoicesDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnInvoicesDtoFromJson(json);
}

@freezed
class RetrunSalesDocDto with _$RetrunSalesDocDto {
  const RetrunSalesDocDto._();
  factory RetrunSalesDocDto({
    @JsonKey(name: 'invoiceNumber', defaultValue: '')
        required String invoiceNumber,
    @JsonKey(name: 'invoiceDate', defaultValue: '') required String invoiceDate,
    @JsonKey(name: 'bapiSalesDoc', defaultValue: '')
        required String bapiSalesDoc,
    @JsonKey(name: 'ezrxNumber', defaultValue: '') required String ezrxNumber,
    @JsonKey(name: 'creditNotes', defaultValue: <ReturnCreditNotesDto>[])
        required List<ReturnCreditNotesDto> creditNotes,
  }) = _RetrunSalesDocDto;

  ReturnSalesDoc toDomain() {
    return ReturnSalesDoc(
      bapiSalesDoc: bapiSalesDoc,
      ezrxNumber: ezrxNumber,
      invoiceDate: invoiceDate,
      invoiceNumber: invoiceNumber,
      creditNotes: creditNotes.map((e) => e.toDomain()).toList(),
    );
  }

  factory RetrunSalesDocDto.fromJson(Map<String, dynamic> json) =>
      _$RetrunSalesDocDtoFromJson(json);
}

@freezed
class ReturnCreditNotesDto with _$ReturnCreditNotesDto {
  const ReturnCreditNotesDto._();
  factory ReturnCreditNotesDto({
    @JsonKey(name: 'creditNoteId', defaultValue: '')
        required String creditNoteId,
    @JsonKey(name: 'materials', defaultValue: <ReturnMaterialDto>[])
        required List<ReturnMaterialDto> materials,
  }) = _ReturnCreditNotesDto;

  ReturnCreditNotes toDomain() {
    return ReturnCreditNotes(
      creditNoteId: creditNoteId,
      materials: materials.map((e) => e.toDomain()).toList(),
    );
  }

  factory ReturnCreditNotesDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnCreditNotesDtoFromJson(json);
}

@freezed
class ReturnMaterialDto with _$ReturnMaterialDto {
  const ReturnMaterialDto._();
  factory ReturnMaterialDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'lineNumber', defaultValue: '') required String lineNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'qty', defaultValue: '') required String qty,
    @JsonKey(name: 'value', defaultValue: '') required String value,
  }) = _ReturnMaterialDto;

  ReturnMaterial toDomain() {
    return ReturnMaterial(
      lineNumber: lineNumber,
      materialDescription: materialDescription,
      qty: qty,
      value: value,
      materialNumber: MaterialNumber(materialNumber),
    );
  }

  factory ReturnMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnMaterialDtoFromJson(json);
}
