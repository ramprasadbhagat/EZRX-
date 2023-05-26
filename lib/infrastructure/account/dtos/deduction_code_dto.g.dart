// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deduction_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeductionCodeDto _$$_DeductionCodeDtoFromJson(Map<String, dynamic> json) =>
    _$_DeductionCodeDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      salesDistrict: json['salesDistrict'] as String? ?? '',
      deductionCode: json['deductionCode'] as String? ?? '',
      deductionDescription: json['deductionDescription'] as String? ?? '',
      amountType: json['amountType'] as String? ?? '',
    );

Map<String, dynamic> _$$_DeductionCodeDtoToJson(_$_DeductionCodeDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'salesDistrict': instance.salesDistrict,
      'deductionCode': instance.deductionCode,
      'deductionDescription': instance.deductionDescription,
      'amountType': instance.amountType,
    };
