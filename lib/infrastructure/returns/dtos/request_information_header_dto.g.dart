// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_information_header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestInformationHeaderDto _$$_RequestInformationHeaderDtoFromJson(
        Map<String, dynamic> json) =>
    _$_RequestInformationHeaderDto(
      returnReference: json['returnReference'] as String? ?? '',
      specialInstructions: json['specialInstructions'] as String? ?? '',
      createdDate: json['createdDate'] as String? ?? '',
      createdTime: json['createdTime'] as String? ?? '',
      cName1: json['cName1'] as String? ?? '',
      refundTotal: json['refundTotal'] as String? ?? '',
      soldTo: json['soldTo'] as String? ?? '',
      requestID: json['requestID'] as String? ?? '',
      createdBy: json['createdBy'] as String? ?? '',
      bapiStatus: json['bapiStatus'] as String? ?? '',
      totalItemCount: json['totalItemCount'] as String? ?? '',
    );

Map<String, dynamic> _$$_RequestInformationHeaderDtoToJson(
        _$_RequestInformationHeaderDto instance) =>
    <String, dynamic>{
      'returnReference': instance.returnReference,
      'specialInstructions': instance.specialInstructions,
      'createdDate': instance.createdDate,
      'createdTime': instance.createdTime,
      'cName1': instance.cName1,
      'refundTotal': instance.refundTotal,
      'soldTo': instance.soldTo,
      'requestID': instance.requestID,
      'createdBy': instance.createdBy,
      'bapiStatus': instance.bapiStatus,
      'totalItemCount': instance.totalItemCount,
    };
