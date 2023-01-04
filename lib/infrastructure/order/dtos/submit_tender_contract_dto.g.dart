// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_tender_contract_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmitTenderContractDto _$$_SubmitTenderContractDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SubmitTenderContractDto(
      contractNumber: json['contractNumber'] as String? ?? '',
      contractLineItemNumber: json['contractLineItemNumber'] as String? ?? '',
      contractPrice: (json['contractPrice'] as num?)?.toDouble() ?? 0,
      contractPONumber: json['contractPONumber'] as String? ?? '',
      contractUnitOfMeasurement: json['contractUnitOfMeasurement'] as int? ?? 0,
      currency: json['currency'] as String? ?? '',
    );

Map<String, dynamic> _$$_SubmitTenderContractDtoToJson(
        _$_SubmitTenderContractDto instance) =>
    <String, dynamic>{
      'contractNumber': instance.contractNumber,
      'contractLineItemNumber': instance.contractLineItemNumber,
      'contractPrice': instance.contractPrice,
      'contractPONumber': instance.contractPONumber,
      'contractUnitOfMeasurement': instance.contractUnitOfMeasurement,
      'currency': instance.currency,
    };
