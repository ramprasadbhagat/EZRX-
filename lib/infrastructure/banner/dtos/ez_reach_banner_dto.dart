import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/banner/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ez_reach_banner_dto.freezed.dart';
part 'ez_reach_banner_dto.g.dart';

@freezed
class EZReachBannerDto with _$EZReachBannerDto {
  const EZReachBannerDto._();

  const factory EZReachBannerDto({
    @JsonKey(name: 'bannerId', defaultValue: '') required String bannerId,
    @JsonKey(name: 'bannerCampaignName', defaultValue: '')
        required String bannerCampaignName,
    @JsonKey(name: 'startDate', defaultValue: '') required String startDate,
    @JsonKey(name: 'bannerUrl', defaultValue: '') required String tabBannerUrl,
    @JsonKey(name: 'endDate', defaultValue: '') required String endDate,
    @JsonKey(name: 'websiteUrl', defaultValue: '')
        required String navigationalURL,
    @JsonKey(name: 'bannerCountId', defaultValue: 0) required int bannerCountId,
    @JsonKey(name: 'salesRep', defaultValue: false) required bool salesRep,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'customers', defaultValue: false) required bool customers,
    @JsonKey(name: 'companyName', defaultValue: '') required String companyName,
    @JsonKey(name: 'targetProduct', defaultValue: '')
        required String targetProduct,
    @JsonKey(name: 'keyWord', defaultValue: '') required String keyWord,
    @JsonKey(name: 'bannerCampaignLocations', defaultValue: <String>[])
        required List<String> bannerCampaignLocations,
    @JsonKey(name: 'salesOrg', defaultValue: <String>[])
        required List<String> salesOrg,
    @JsonKey(name: 'countryCode', defaultValue: <String>[])
        required List<String> countryCode,
    @JsonKey(name: 'mobileBannerImg', defaultValue: '')
        required String mobileBannerUrl,
  }) = _EZReachBannerDto;

  factory EZReachBannerDto.fromJson(Map<String, dynamic> json) =>
      _$EZReachBannerDtoFromJson(json);

  EZReachBanner toDomain() {
    return EZReachBanner.empty().copyWith(
      id: bannerId,
      mobileBannerUrl: mobileBannerUrl.isEmpty ? tabBannerUrl : mobileBannerUrl,
      title: bannerCampaignName,
      description: targetProduct,
      navigationalURL: EZReachBannerLink(navigationalURL),
      serial: bannerCountId,
      isCustomer: customers,
      tabBannerUrl: tabBannerUrl,
      keyword: StringValue(keyWord),
      isEZRXBanner: false,
    );
  }

  factory EZReachBannerDto.fromDomain(EZReachBanner banner) {
    return EZReachBannerDto(
      bannerId: banner.id,
      tabBannerUrl: banner.tabBannerUrl,
      bannerCampaignName: banner.title,
      targetProduct: banner.description,
      navigationalURL: banner.navigationalURL.getOrDefaultValue(''),
      bannerCountId: banner.serial,
      customers: banner.isCustomer,
      keyWord: banner.keyword.getOrDefaultValue(''),
      salesOrg: [banner.salesOrg],
      mobileBannerUrl: banner.mobileBannerUrl,
      startDate: '',
      endDate: '',
      salesRep: banner.isPreSalesOrg,
      status: '',
      companyName: '',
      bannerCampaignLocations: <String>[],
      countryCode: <String>[],
    );
  }
}
