// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ez_reach_banner_dto.dart';

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
      mobileBannerImg: json['mobileBannerImg'] as String? ?? '',
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
      'mobileBannerImg': instance.mobileBannerImg,
    };
