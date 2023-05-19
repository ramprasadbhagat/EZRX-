import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'ez_reach_banner_dto.freezed.dart';
part 'ez_reach_banner_dto.g.dart';

@freezed
class EZReachBannerDto with _$EZReachBannerDto {
  const EZReachBannerDto._();

  @HiveType(typeId: 35, adapterName: 'EZReachBannerDtoAdapter')
  const factory EZReachBannerDto({
    @HiveField(0, defaultValue: '')
    @JsonKey(name: 'bannerId', defaultValue: '')
        required String bannerId,
    @HiveField(1, defaultValue: '')
    @JsonKey(name: 'bannerCampaignName', defaultValue: '')
        required String bannerCampaignName,
    @HiveField(2, defaultValue: '')
    @JsonKey(name: 'startDate', defaultValue: '')
        required String startDate,
    @HiveField(3, defaultValue: '')
    @JsonKey(name: 'bannerUrl', defaultValue: '')
        required String bannerUrl,
    @HiveField(4, defaultValue: '')
    @JsonKey(name: 'endDate', defaultValue: '')
        required String endDate,
    @HiveField(5, defaultValue: '')
    @JsonKey(name: 'websiteUrl', defaultValue: '')
        required String websiteUrl,
    @HiveField(6, defaultValue: 0)
    @JsonKey(name: 'bannerCountId', defaultValue: 0)
        required int bannerCountId,
    @HiveField(7, defaultValue: false)
    @JsonKey(name: 'salesRep', defaultValue: false)
        required bool salesRep,
    @HiveField(8, defaultValue: '')
    @JsonKey(name: 'status', defaultValue: '')
        required String status,
    @HiveField(9, defaultValue: false)
    @JsonKey(name: 'customers', defaultValue: false)
        required bool customers,
    @HiveField(10, defaultValue: '')
    @JsonKey(name: 'companyName', defaultValue: '')
        required String companyName,
    @HiveField(11, defaultValue: '')
    @JsonKey(name: 'targetProduct', defaultValue: '')
        required String targetProduct,
    @HiveField(12, defaultValue: '')
    @JsonKey(name: 'keyWord', defaultValue: '')
        required String keyWord,
    @HiveField(13, defaultValue: <String>[])
    @JsonKey(name: 'bannerCampaignLocations', defaultValue: <String>[])
        required List<String> bannerCampaignLocations,
    @HiveField(14, defaultValue: <String>[])
    @JsonKey(name: 'salesOrg', defaultValue: <String>[])
        required List<String> salesOrg,
    @HiveField(15, defaultValue: <String>[])
    @JsonKey(name: 'countryCode', defaultValue: <String>[])
        required List<String> countryCode,
    @HiveField(16, defaultValue: '')
    @JsonKey(name: 'mobileBannerImg', defaultValue: '')
        required String mobileBannerImg,
  }) = _EZReachBannerDto;

  factory EZReachBannerDto.fromJson(Map<String, dynamic> json) =>
      _$EZReachBannerDtoFromJson(json);

  BannerItem toDomain() {
    return BannerItem.empty().copyWith(
      url: mobileBannerImg.isEmpty ? bannerUrl : mobileBannerImg,
      title: bannerCampaignName,
      description: targetProduct,
      urlLink: websiteUrl,
      serial: bannerCountId,
      isCustomer: customers,
      keyword: keyWord,
      isEZRXBanner: false,
    );
  }
}
