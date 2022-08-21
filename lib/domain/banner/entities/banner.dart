import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner.freezed.dart';

@freezed
class BannerItem with _$BannerItem {
  const BannerItem._();

  const factory BannerItem({
    required int id,
    required int serial,
    required bool isPreSalesOrg,
    required bool isCustomer,
    required String url,
    required String title,
    required String description,
    required String buttonLabel,
    required String urlLink,
    required String salesOrg,
  }) = _BannerItem;

  factory BannerItem.empty() => const BannerItem(
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
      );
}
