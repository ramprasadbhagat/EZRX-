import 'package:freezed_annotation/freezed_annotation.dart';

part 'ez_reach_banner.freezed.dart';

@freezed
class EZReachBanner with _$EZReachBanner {
  const EZReachBanner._();

  const factory EZReachBanner({
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
    required bool isKeyword,
    required String keyword,
    required String category,
    required bool isEZRXBanner,
  }) = _EZReachBanner;

  factory EZReachBanner.empty() => const EZReachBanner(
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
        isEZRXBanner: true,
      );
}
