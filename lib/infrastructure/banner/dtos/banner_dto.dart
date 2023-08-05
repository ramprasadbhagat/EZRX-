import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'banner_dto.freezed.dart';
part 'banner_dto.g.dart';

@freezed
class BannerDto with _$BannerDto {
  const BannerDto._();

  @HiveType(typeId: 34, adapterName: 'BannerDtoAdapter')
  const factory BannerDto({
    @HiveField(0, defaultValue: 0) @JsonKey(name: 'id') required int id,
    @HiveField(1, defaultValue: '') @JsonKey(name: 'url') required String url,
    @HiveField(2, defaultValue: '')
    @JsonKey(name: 'title')
        required String title,
    @HiveField(3, defaultValue: '')
    @JsonKey(name: 'description')
        required String description,
    @HiveField(4, defaultValue: '')
    @JsonKey(name: 'buttonLabel')
        required String buttonLabel,
    @HiveField(5, defaultValue: '')
    @JsonKey(name: 'urlLink')
        required String urlLink,
    @HiveField(6, defaultValue: false)
    @JsonKey(name: 'isPreSalesOrg')
        required bool isPreSalesOrg,
    @HiveField(7, defaultValue: '')
    @JsonKey(name: 'salesOrg')
        required String salesOrg,
    @HiveField(8, defaultValue: 0) @JsonKey(name: 'serial') required int serial,
    @HiveField(9, defaultValue: false)
    @JsonKey(name: 'isCustomer')
        required bool isCustomer,
    @HiveField(10, defaultValue: false)
    @JsonKey(name: 'isKeyword', defaultValue: false)
        required bool isKeyword,
    @HiveField(11, defaultValue: '')
    @JsonKey(name: 'keyword', defaultValue: '')
        required String keyword,
    @HiveField(12, defaultValue: '')
    @JsonKey(name: 'category', defaultValue: '')
        required String category,
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
