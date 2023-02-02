// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approver_return_request_information_header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApproverReturnRequestInformationHeaderDto
    _$$_ApproverReturnRequestInformationHeaderDtoFromJson(
            Map<String, dynamic> json) =>
        _$_ApproverReturnRequestInformationHeaderDto(
          soldTo: json['soldTo'] as String? ?? '',
          shipTo: json['shipTo'] as String? ?? '',
          createdBy: json['createdBy'] as String? ?? '',
          returnType: json['returnType'] as String? ?? '',
          status: json['status'] as String? ?? '',
          createdDate: json['createdDate'] as String? ?? '',
          createdTime: json['createdTime'] as String? ?? '',
          requestID: json['requestID'] as String? ?? '',
          salesOrg: json['salesOrg'] as String? ?? '',
          refundTotal: json['refundTotal'] as String? ?? '',
          totalItemCount: json['totalItemCount'] as String? ?? '',
          returnTypeDesc: json['returnTypeDesc'] as String? ?? '',
          ppaHeld: json['ppaHeld'] as bool? ?? false,
          cName1: json['cName1'] as String? ?? '',
          cName2: json['cName2'] as String? ?? '',
          cName3: json['cName3'] as String? ?? '',
          cName4: json['cName4'] as String? ?? '',
          street1: json['street1'] as String? ?? '',
          street2: json['street2'] as String? ?? '',
          street3: json['street3'] as String? ?? '',
          street4: json['street4'] as String? ?? '',
          returnInvoices: (json['returnInvoices'] as List<dynamic>?)
                  ?.map((e) =>
                      ReturnInvoicesDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          salesDoc: (json['salesDoc'] as List<dynamic>?)
                  ?.map((e) =>
                      RetrunSalesDocDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$$_ApproverReturnRequestInformationHeaderDtoToJson(
        _$_ApproverReturnRequestInformationHeaderDto instance) =>
    <String, dynamic>{
      'soldTo': instance.soldTo,
      'shipTo': instance.shipTo,
      'createdBy': instance.createdBy,
      'returnType': instance.returnType,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'createdTime': instance.createdTime,
      'requestID': instance.requestID,
      'salesOrg': instance.salesOrg,
      'refundTotal': instance.refundTotal,
      'totalItemCount': instance.totalItemCount,
      'returnTypeDesc': instance.returnTypeDesc,
      'ppaHeld': instance.ppaHeld,
      'cName1': instance.cName1,
      'cName2': instance.cName2,
      'cName3': instance.cName3,
      'cName4': instance.cName4,
      'street1': instance.street1,
      'street2': instance.street2,
      'street3': instance.street3,
      'street4': instance.street4,
      'returnInvoices': instance.returnInvoices.map((e) => e.toJson()).toList(),
      'salesDoc': instance.salesDoc.map((e) => e.toJson()).toList(),
    };

_$_ReturnInvoicesDto _$$_ReturnInvoicesDtoFromJson(Map<String, dynamic> json) =>
    _$_ReturnInvoicesDto(
      invoiceNumber: json['invoiceNumber'] as String? ?? '',
      invoiceDate: json['invoiceDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnInvoicesDtoToJson(
        _$_ReturnInvoicesDto instance) =>
    <String, dynamic>{
      'invoiceNumber': instance.invoiceNumber,
      'invoiceDate': instance.invoiceDate,
    };

_$_RetrunSalesDocDto _$$_RetrunSalesDocDtoFromJson(Map<String, dynamic> json) =>
    _$_RetrunSalesDocDto(
      invoiceNumber: json['invoiceNumber'] as String? ?? '',
      invoiceDate: json['invoiceDate'] as String? ?? '',
      bapiSalesDoc: json['bapiSalesDoc'] as String? ?? '',
      ezrxNumber: json['ezrxNumber'] as String? ?? '',
      creditNotes: (json['creditNotes'] as List<dynamic>?)
              ?.map((e) =>
                  ReturnCreditNotesDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_RetrunSalesDocDtoToJson(
        _$_RetrunSalesDocDto instance) =>
    <String, dynamic>{
      'invoiceNumber': instance.invoiceNumber,
      'invoiceDate': instance.invoiceDate,
      'bapiSalesDoc': instance.bapiSalesDoc,
      'ezrxNumber': instance.ezrxNumber,
      'creditNotes': instance.creditNotes.map((e) => e.toJson()).toList(),
    };

_$_ReturnCreditNotesDto _$$_ReturnCreditNotesDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnCreditNotesDto(
      creditNoteId: json['creditNoteId'] as String? ?? '',
      materials: (json['materials'] as List<dynamic>?)
              ?.map(
                  (e) => ReturnMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ReturnCreditNotesDtoToJson(
        _$_ReturnCreditNotesDto instance) =>
    <String, dynamic>{
      'creditNoteId': instance.creditNoteId,
      'materials': instance.materials.map((e) => e.toJson()).toList(),
    };

_$_ReturnMaterialDto _$$_ReturnMaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_ReturnMaterialDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      lineNumber: json['lineNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      qty: json['qty'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnMaterialDtoToJson(
        _$_ReturnMaterialDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'lineNumber': instance.lineNumber,
      'materialDescription': instance.materialDescription,
      'qty': instance.qty,
      'value': instance.value,
    };
