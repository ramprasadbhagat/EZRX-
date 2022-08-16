
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner.freezed.dart';
@freezed
class BannerItem with _$BannerItem{
  const BannerItem._();

  const factory BannerItem({
    required int id,serial,
    required bool isPreSalesOrg,isCustomer,
    required String url,title,description,buttonLabel,urlLink,salesOrg
  }) = _BannerItem;

  factory BannerItem.empty() => const BannerItem(
    id: 0,
    url: '',
    title: '',
    description: '',
    buttonLabel: '',
    urlLink: '',
    isPreSalesOrg: false,
    salesOrg: '',
    serial: '',
    isCustomer: false
  );
}