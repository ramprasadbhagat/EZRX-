// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_instruction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankInstructionDTO _$$_BankInstructionDTOFromJson(
        Map<String, dynamic> json) =>
    _$_BankInstructionDTO(
      bank: json['bank'] as String? ?? '',
      transferMethods: (json['transferMethods'] as List<dynamic>?)
              ?.map(
                  (e) => TransferMethodDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_BankInstructionDTOToJson(
        _$_BankInstructionDTO instance) =>
    <String, dynamic>{
      'bank': instance.bank,
      'transferMethods':
          instance.transferMethods.map((e) => e.toJson()).toList(),
    };

_$_TransferMethodDTO _$$_TransferMethodDTOFromJson(Map<String, dynamic> json) =>
    _$_TransferMethodDTO(
      title: json['title'] as String? ?? '',
      paymentInstructions: (json['paymentInstructions'] as List<dynamic>?)
              ?.map((e) =>
                  InstructionDetailsDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_TransferMethodDTOToJson(
        _$_TransferMethodDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'paymentInstructions':
          instance.paymentInstructions.map((e) => e.toJson()).toList(),
    };

_$_InstructionDetailsDTO _$$_InstructionDetailsDTOFromJson(
        Map<String, dynamic> json) =>
    _$_InstructionDetailsDTO(
      instructionType: json['instructionType'] as String? ?? '',
      instructions: (json['instructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_InstructionDetailsDTOToJson(
        _$_InstructionDetailsDTO instance) =>
    <String, dynamic>{
      'instructionType': instance.instructionType,
      'instructions': instance.instructions,
    };
