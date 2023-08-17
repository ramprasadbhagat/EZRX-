part of 'customer_license_bloc.dart';

@freezed
class CustomerLicenseState with _$CustomerLicenseState {
  const factory CustomerLicenseState({
    required bool isFetching,
    required bool canLoadMore,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<CustomerLicense> customerLicenses,
  }) = _CustomerLicenseState;

  factory CustomerLicenseState.initial() => CustomerLicenseState(
        isFetching: false,
        canLoadMore: false,
        failureOrSuccessOption: none(),
        customerLicenses: <CustomerLicense>[],
      );
}
