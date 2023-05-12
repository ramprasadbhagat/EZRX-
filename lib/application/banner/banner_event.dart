part of 'banner_bloc.dart';

@freezed
class BannerEvent with _$BannerEvent {
  const factory BannerEvent.initialized() = _Initialized;
  const factory BannerEvent.fetch({
    required bool isPreSalesOrg,
    required SalesOrganisation salesOrganisation,
    required String country,
    required String role,
  }) = _Fetch;
}
