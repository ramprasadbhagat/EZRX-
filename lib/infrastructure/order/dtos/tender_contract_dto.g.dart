// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tender_contract_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TenderContractDtoAdapter extends TypeAdapter<_$_TenderContractDto> {
  @override
  final int typeId = 20;

  @override
  _$_TenderContractDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_TenderContractDto(
      contractNumber: fields[0] == null ? '' : fields[0] as String,
      contractItemNumber: fields[1] == null ? '' : fields[1] as String,
      contractReference: fields[2] == null ? '' : fields[2] as String,
      tenderOrderReason: fields[3] == null ? '' : fields[3] as String,
      tenderVisaNumber: fields[4] == null ? '' : fields[4] as String,
      salesDistrict: fields[5] == null ? '' : fields[5] as String,
      tenderPackageDescription: fields[6] == null ? '' : fields[6] as String,
      tenderPrice: fields[7] == null ? '' : fields[7] as String,
      pricingUnit: fields[8] == null ? 0 : fields[8] as int,
      remainingTenderQuantity: fields[9] == null ? 0 : fields[9] as int,
      contractQuantity: fields[10] == null ? 0 : fields[10] as int,
      contractExpiryDate: fields[11] == null ? '' : fields[11] as String,
      announcementLetterNumber: fields[12] == null ? '' : fields[12] as String,
      isNearToExpire: fields[13] == null ? false : fields[13] as bool,
      contractPaymentTerm: fields[14] == null ? '' : fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_TenderContractDto obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.contractNumber)
      ..writeByte(1)
      ..write(obj.contractItemNumber)
      ..writeByte(2)
      ..write(obj.contractReference)
      ..writeByte(3)
      ..write(obj.tenderOrderReason)
      ..writeByte(4)
      ..write(obj.tenderVisaNumber)
      ..writeByte(5)
      ..write(obj.salesDistrict)
      ..writeByte(6)
      ..write(obj.tenderPackageDescription)
      ..writeByte(7)
      ..write(obj.tenderPrice)
      ..writeByte(8)
      ..write(obj.pricingUnit)
      ..writeByte(9)
      ..write(obj.remainingTenderQuantity)
      ..writeByte(10)
      ..write(obj.contractQuantity)
      ..writeByte(11)
      ..write(obj.contractExpiryDate)
      ..writeByte(12)
      ..write(obj.announcementLetterNumber)
      ..writeByte(13)
      ..write(obj.isNearToExpire)
      ..writeByte(14)
      ..write(obj.contractPaymentTerm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TenderContractDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TenderContractDto _$$_TenderContractDtoFromJson(Map<String, dynamic> json) =>
    _$_TenderContractDto(
      contractNumber: json['contractNumber'] as String,
      contractItemNumber: json['contractItemNumber'] as String,
      contractReference: json['contractReference'] as String,
      tenderOrderReason: json['tenderOrderReason'] as String,
      tenderVisaNumber: json['tenderVisaNumber'] as String,
      salesDistrict: json['salesDistrict'] as String,
      tenderPackageDescription: json['tenderPackageDescription'] as String,
      tenderPrice: json['tenderPrice'] as String,
      pricingUnit: json['pricingUnit'] as int,
      remainingTenderQuantity: json['remainingTenderQuantity'] as int,
      contractQuantity: json['contractQuantity'] as int,
      contractExpiryDate: json['contractExpiryDate'] as String,
      announcementLetterNumber: json['announcementLetterNumber'] as String,
      isNearToExpire: json['isNearToExpire'] as bool,
      contractPaymentTerm: json['contractPaymentTerm'] as String,
    );

Map<String, dynamic> _$$_TenderContractDtoToJson(
        _$_TenderContractDto instance) =>
    <String, dynamic>{
      'contractNumber': instance.contractNumber,
      'contractItemNumber': instance.contractItemNumber,
      'contractReference': instance.contractReference,
      'tenderOrderReason': instance.tenderOrderReason,
      'tenderVisaNumber': instance.tenderVisaNumber,
      'salesDistrict': instance.salesDistrict,
      'tenderPackageDescription': instance.tenderPackageDescription,
      'tenderPrice': instance.tenderPrice,
      'pricingUnit': instance.pricingUnit,
      'remainingTenderQuantity': instance.remainingTenderQuantity,
      'contractQuantity': instance.contractQuantity,
      'contractExpiryDate': instance.contractExpiryDate,
      'announcementLetterNumber': instance.announcementLetterNumber,
      'isNearToExpire': instance.isNearToExpire,
      'contractPaymentTerm': instance.contractPaymentTerm,
    };
