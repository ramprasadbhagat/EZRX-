part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeState with _$CustomerCodeState {
  const CustomerCodeState._();

  const factory CustomerCodeState({
    required bool hideCustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
    required List<CustomerCodeInfo> customerCodeList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool canLoadMore,
    required bool isFetching,
    required bool isSearchActive,
    required SearchKey searchKey,
  }) = _CustomerCodeState;

  factory CustomerCodeState.initial() => CustomerCodeState(
        hideCustomer: false,
        userInfo: User.empty(),
        selectedSalesOrg: SalesOrganisation.empty(),
        customerCodeList: [],
        apiFailureOrSuccessOption: none(),
        canLoadMore: true,
        isFetching: true,
        isSearchActive: false,
        searchKey: SearchKey(''),
      );

  bool get apiSuccess => apiFailureOrSuccessOption.isNone();
}
