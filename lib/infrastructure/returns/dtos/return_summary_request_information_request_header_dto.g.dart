// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_summary_request_information_request_header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestHeaderDto _$$_RequestHeaderDtoFromJson(Map<String, dynamic> json) =>
    _$_RequestHeaderDto(
      soldTo: json['soldTo'] as String,
      shipTo: json['shipTo'] as String,
      createdBy: json['createdBy'] as String,
      returnType: json['returnType'] as String,
      status: json['status'] as String,
      createdDate: json['createdDate'] as String,
      createdTime: json['createdTime'] as String,
      requestID: json['requestID'] as String,
      salesOrg: json['salesOrg'] as String,
      refundTotal: json['refundTotal'] as String,
      totalItemCount: json['totalItemCount'] as String,
      returnInvoices: (json['returnInvoices'] as List<dynamic>?)
              ?.map((e) => ReturnInvoiceDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      salesDoc: (json['salesDoc'] as List<dynamic>?)
              ?.map((e) => SalesDocDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      returnTypeDesc: json['returnTypeDesc'] as String,
      ppaHeld: json['ppaHeld'] as bool,
      cName1: json['cName1'] as String,
      cName2: json['cName2'] as String,
      cName3: json['cName3'] as String,
      cName4: json['cName4'] as String,
      street1: json['street1'] as String,
      street2: json['street2'] as String,
      street3: json['street3'] as String,
      street4: json['street4'] as String,
    );

Map<String, dynamic> _$$_RequestHeaderDtoToJson(_$_RequestHeaderDto instance) =>
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
      'returnInvoices': instance.returnInvoices.map((e) => e.toJson()).toList(),
      'salesDoc': instance.salesDoc.map((e) => e.toJson()).toList(),
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
    };
