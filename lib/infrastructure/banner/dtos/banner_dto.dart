import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_dto.freezed.dart';
part 'banner_dto.g.dart';

@freezed
class BannerDto with _$BannerDto {
  const BannerDto._();

  const factory BannerDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'buttonLabel') required String buttonLabel,
    @JsonKey(name: 'urlLink') required String urlLink,
    @JsonKey(name: 'isPreSalesOrg') required bool isPreSalesOrg,
    @JsonKey(name: 'salesOrg') required String salesOrg,
    @JsonKey(name: 'serial') required int serial,
    @JsonKey(name: 'isCustomer') required bool isCustomer,
    @JsonKey(name: 'isKeyword', defaultValue: false) required bool isKeyword,
    @JsonKey(name: 'keyword', defaultValue: '') required String keyword,
    @JsonKey(name: 'category', defaultValue: '') required String category,
  }) = _BannerDto;

  factory BannerDto.fromDomain(BannerItem banner) {
    return BannerDto(
      id: banner.id,
      url: banner.url,
      title: banner.title,
      description: banner.description,
      buttonLabel: banner.buttonLabel,
      urlLink: banner.urlLink,
      isPreSalesOrg: banner.isPreSalesOrg,
      salesOrg: banner.salesOrg,
      serial: banner.serial,
      isCustomer: banner.isCustomer,
      isKeyword: banner.isKeyword,
      keyword: banner.keyword,
      category: banner.category,
    );
  }

  BannerItem toDomain() {
    return BannerItem(
      id: id,
      url: url,
      title: title,
      description: description,
      buttonLabel: buttonLabel,
      urlLink: urlLink,
      isPreSalesOrg: isPreSalesOrg,
      salesOrg: salesOrg,
      serial: serial,
      isCustomer: isCustomer,
      isKeyword: isKeyword,
      keyword: keyword,
      category: category,
      isEZRXBanner: true,
    );
  }

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);

  static const empty = BannerDto(
    id: 0,
    serial: 0,
    isPreSalesOrg: false,
    isCustomer: false,
    url: '',
    title: '',
    description: '',
    buttonLabel: '',
    urlLink: '',
    salesOrg: '',
    isKeyword: false,
    keyword: '',
    category: '',
  );
}
