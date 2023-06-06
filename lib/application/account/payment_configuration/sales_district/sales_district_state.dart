part of 'sales_district_bloc.dart';

@freezed
class SalesDistrictState with _$SalesDistrictState {
  const SalesDistrictState._();

  const factory SalesDistrictState({
    required List<SalesDistrict> salesDistrictList,
    required SalesOrg selectedSalesOrg,
    required SalesDistrictInfo selectedSalesDistrictInfo,
    required bool isFetching,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required SalesDistrictResponseMessage salesDistrictResponseMessage,
  }) = _SalesDistrictState;

  factory SalesDistrictState.initial() => SalesDistrictState(
        salesDistrictList: <SalesDistrict>[],
        isFetching: false,
        showErrorMessages: false,
        isSubmitting: false,
        failureOrSuccessOption: none(),
        selectedSalesOrg: SalesOrg(''),
        selectedSalesDistrictInfo: SalesDistrictInfo.empty(),
        salesDistrictResponseMessage: SalesDistrictResponseMessage.empty(),
      );

  bool get isAllFieldValid =>
      selectedSalesOrg.isValid() &&
      selectedSalesDistrictInfo.salesDistrictHeader.isValid() &&
      selectedSalesDistrictInfo.salesDistrictLabel.isValid();
}
