part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeState with _$CustomerCodeState {
 const factory CustomerCodeState({
    required CustomerCodeInfo customeCodeInfo,
    required List<CustomerCodeInfo> customerCodeList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isLoadMore,
    required bool isFetching,
  }) = _CustomerCodeState;

  factory CustomerCodeState.initial() => CustomerCodeState(
        customeCodeInfo: CustomerCodeInfo.empty(),
        customerCodeList: [CustomerCodeInfo.empty()],
        apiFailureOrSuccessOption: none(),
        isLoadMore: true,
        isFetching: false,
      );
}
