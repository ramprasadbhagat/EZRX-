// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ez_reach_banner_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EZReachBannerDtoAdapter extends TypeAdapter<_$_EZReachBannerDto> {
  @override
  final int typeId = 35;

  @override
  _$_EZReachBannerDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_EZReachBannerDto(
      bannerId: fields[0] == null ? '' : fields[0] as String,
      bannerCampaignName: fields[1] == null ? '' : fields[1] as String,
      startDate: fields[2] == null ? '' : fields[2] as String,
      bannerUrl: fields[3] == null ? '' : fields[3] as String,
      endDate: fields[4] == null ? '' : fields[4] as String,
      websiteUrl: fields[5] == null ? '' : fields[5] as String,
      bannerCountId: fields[6] == null ? 0 : fields[6] as int,
      salesRep: fields[7] == null ? false : fields[7] as bool,
      status: fields[8] == null ? '' : fields[8] as String,
      customers: fields[9] == null ? false : fields[9] as bool,
      companyName: fields[10] == null ? '' : fields[10] as String,
      targetProduct: fields[11] == null ? '' : fields[11] as String,
      keyWord: fields[12] == null ? '' : fields[12] as String,
      bannerCampaignLocations:
          fields[13] == null ? [] : (fields[13] as List).cast<String>(),
      salesOrg: fields[14] == null ? [] : (fields[14] as List).cast<String>(),
      countryCode:
          fields[15] == null ? [] : (fields[15] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_EZReachBannerDto obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.bannerId)
      ..writeByte(1)
      ..write(obj.bannerCampaignName)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.bannerUrl)
      ..writeByte(4)
      ..write(obj.endDate)
      ..writeByte(5)
      ..write(obj.websiteUrl)
      ..writeByte(6)
      ..write(obj.bannerCountId)
      ..writeByte(7)
      ..write(obj.salesRep)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.customers)
      ..writeByte(10)
      ..write(obj.companyName)
      ..writeByte(11)
      ..write(obj.targetProduct)
      ..writeByte(12)
      ..write(obj.keyWord)
      ..writeByte(13)
      ..write(obj.bannerCampaignLocations)
      ..writeByte(14)
      ..write(obj.salesOrg)
      ..writeByte(15)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EZReachBannerDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EZReachBannerDto _$$_EZReachBannerDtoFromJson(Map<String, dynamic> json) =>
    _$_EZReachBannerDto(
      bannerId: json['bannerId'] as String? ?? '',
      bannerCampaignName: json['bannerCampaignName'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      bannerUrl: json['bannerUrl'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      websiteUrl: json['websiteUrl'] as String? ?? '',
      bannerCountId: json['bannerCountId'] as int? ?? 0,
      salesRep: json['salesRep'] as bool? ?? false,
      status: json['status'] as String? ?? '',
      customers: json['customers'] as bool? ?? false,
      companyName: json['companyName'] as String? ?? '',
      targetProduct: json['targetProduct'] as String? ?? '',
      keyWord: json['keyWord'] as String? ?? '',
      bannerCampaignLocations:
          (json['bannerCampaignLocations'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              [],
      salesOrg: (json['salesOrg'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      countryCode: (json['countryCode'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_EZReachBannerDtoToJson(_$_EZReachBannerDto instance) =>
    <String, dynamic>{
      'bannerId': instance.bannerId,
      'bannerCampaignName': instance.bannerCampaignName,
      'startDate': instance.startDate,
      'bannerUrl': instance.bannerUrl,
      'endDate': instance.endDate,
      'websiteUrl': instance.websiteUrl,
      'bannerCountId': instance.bannerCountId,
      'salesRep': instance.salesRep,
      'status': instance.status,
      'customers': instance.customers,
      'companyName': instance.companyName,
      'targetProduct': instance.targetProduct,
      'keyWord': instance.keyWord,
      'bannerCampaignLocations': instance.bannerCampaignLocations,
      'salesOrg': instance.salesOrg,
      'countryCode': instance.countryCode,
    };
