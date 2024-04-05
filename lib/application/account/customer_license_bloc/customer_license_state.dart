part of 'customer_license_bloc.dart';

@freezed
class CustomerLicenseState with _$CustomerLicenseState {
  const CustomerLicenseState._();
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

  //TODO: will revisit to refine the logic once requirement is confirmed.
  bool get isLicenseExpired => false;

  // bool get isLicenseExpired => customerLicenses
  //     .any((element) => !element.validTo.isDateMoreThanAWeekAway);
}
