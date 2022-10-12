part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeState with _$CustomerCodeState {
  const CustomerCodeState._();

  const factory CustomerCodeState({
    required CustomerCodeInfo customeCodeInfo,
    required List<CustomerCodeInfo> customerCodeList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool canLoadMore,
    required bool isFetching,
  }) = _CustomerCodeState;

  factory CustomerCodeState.initial() => CustomerCodeState(
        customeCodeInfo: CustomerCodeInfo.empty(),
        customerCodeList: [],
        apiFailureOrSuccessOption: none(),
        canLoadMore: true,
        isFetching: false,
      );

  ShipToInfo? get defaultShipToInfo {
    if (haveShipToInfo) {
      final index = customeCodeInfo.shipToInfos
          .indexWhere((element) => element.defaultShipToAddress);

      return index == -1
          ? customeCodeInfo.shipToInfos.first
          : customeCodeInfo.shipToInfos[index];
    } else {
      return null;
    }
  }

  bool get haveShipToInfo =>
      customeCodeInfo != CustomerCodeInfo.empty() &&
      customeCodeInfo.shipToInfos.isNotEmpty;
}
