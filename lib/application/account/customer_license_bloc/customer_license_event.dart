part of 'customer_license_bloc.dart';

@freezed
class CustomerLicenseEvent with _$CustomerLicenseEvent {
  const factory CustomerLicenseEvent.initialized() = _Initialized;
  const factory CustomerLicenseEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerInfo,
    required User user,
  }) = _Fetch;
  const factory CustomerLicenseEvent.loadMore({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerInfo,
    required User user,
  }) = _LoadMore;

}
