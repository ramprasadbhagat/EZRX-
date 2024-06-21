// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_approver_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnApproverFilterDtoImpl _$$ReturnApproverFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReturnApproverFilterDtoImpl(
      returnId: json['returnId'] as String? ?? '',
      soldTo: json['soldTo'] as String? ?? '',
      shipTo: json['shipTo'] as String? ?? '',
      createdBy: json['createdBy'] as String? ?? '',
      dateTo: json['dateTo'] as String? ?? '',
      dateFrom: json['dateFrom'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$ReturnApproverFilterDtoImplToJson(
    _$ReturnApproverFilterDtoImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('returnId', valueTojson(instance.returnId));
  writeNotNull('soldTo', valueTojson(instance.soldTo));
  writeNotNull('shipTo', valueTojson(instance.shipTo));
  writeNotNull('createdBy', valueTojson(instance.createdBy));
  val['dateTo'] = instance.dateTo;
  val['dateFrom'] = instance.dateFrom;
  writeNotNull('status', valueTojson(instance.status));
  return val;
}
