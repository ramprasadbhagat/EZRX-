part of 'sales_district_bloc.dart';

@freezed
class SalesDistrictState with _$SalesDistrictState {
  const SalesDistrictState._();

  const factory SalesDistrictState({
    required List<SalesDistrict> salesDistrictList,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _SalesDistrictState;

  factory SalesDistrictState.initial() => SalesDistrictState(
        salesDistrictList: <SalesDistrict>[],
        isFetching: false,
        failureOrSuccessOption: none(),
      );

}
