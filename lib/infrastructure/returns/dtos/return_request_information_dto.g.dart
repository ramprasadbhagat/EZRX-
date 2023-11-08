// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnRequestInformationDto _$$_ReturnRequestInformationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnRequestInformationDto(
      invoiceNo: json['invoiceNo'] as String? ?? '',
      expiryDate: json['expiryDate'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      rejectReason: json['rejectReason'] as String? ?? '',
      returnQuantity: json['returnQuantity'] as String? ?? '',
      unitPrice: json['unitPrice'] as String? ?? '',
      totalPrice: json['totalPrice'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      returnOrderDesc: json['returnOrderDesc'] as String? ?? '',
      materialGroup: json['materialGroup'] as String? ?? '',
      imageUrl: (json['imageUrl'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      createdDate: json['createdDate'] as String? ?? '',
      principal: json['principal'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      bapiSalesDocNumber: json['bapiSalesDocNumber'] as String? ?? '',
      bapiStatus: json['bapiStatus'] as String? ?? '',
      status: json['status'] as String? ?? '',
      statusReason: json['statusReason'] as String? ?? '',
      outsidePolicy: json['outsidePolicy'] as bool? ?? false,
      invoiceDate: json['invoiceDate'] as String? ?? '',
      prsfd: json['prsfd'] as String? ?? '',
      remarks: json['remarks'] as String? ?? '',
      bonusInformation: (json['bonusInformation'] as List<dynamic>?)
              ?.map((e) => ReturnRequestInformationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ReturnRequestInformationDtoToJson(
        _$_ReturnRequestInformationDto instance) =>
    <String, dynamic>{
      'invoiceNo': instance.invoiceNo,
      'expiryDate': instance.expiryDate,
      'comment': instance.comment,
      'rejectReason': instance.rejectReason,
      'returnQuantity': instance.returnQuantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'batch': instance.batch,
      'returnOrderDesc': instance.returnOrderDesc,
      'materialGroup': instance.materialGroup,
      'imageUrl': instance.imageUrl,
      'attachments': instance.attachments,
      'createdDate': instance.createdDate,
      'principal': instance.principal,
      'principalName': instance.principalName,
      'bapiSalesDocNumber': instance.bapiSalesDocNumber,
      'bapiStatus': instance.bapiStatus,
      'status': instance.status,
      'statusReason': instance.statusReason,
      'outsidePolicy': instance.outsidePolicy,
      'invoiceDate': instance.invoiceDate,
      'prsfd': instance.prsfd,
      'remarks': instance.remarks,
      'bonusInformation':
          instance.bonusInformation.map((e) => e.toJson()).toList(),
    };
