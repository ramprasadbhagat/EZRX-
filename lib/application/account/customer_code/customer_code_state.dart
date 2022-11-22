part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeState with _$CustomerCodeState {
  const CustomerCodeState._();

  const factory CustomerCodeState({
    required CustomerCodeInfo customerCodeInfo,
    required List<CustomerCodeInfo> customerCodeList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool canLoadMore,
    required bool isFetching,
    required bool isSearchActive,
    required SearchKey searchKey,
  }) = _CustomerCodeState;

  factory CustomerCodeState.initial() => CustomerCodeState(
        customerCodeInfo: CustomerCodeInfo.empty(),
        customerCodeList: [],
        apiFailureOrSuccessOption: none(),
        canLoadMore: true,
        isFetching: false,
        isSearchActive: false,
        searchKey: SearchKey(''),
      );

  ShipToInfo get defaultShipToInfo {
    if (haveShipToInfo) {
      final index = customerCodeInfo.shipToInfos
          .indexWhere((element) => element.defaultShipToAddress);

      return index == -1
          ? customerCodeInfo.shipToInfos.first
          : customerCodeInfo.shipToInfos[index];
    } else {
      return ShipToInfo.empty();
    }
  }

  bool get haveShipToInfo =>
      customerCodeInfo != CustomerCodeInfo.empty() &&
      customerCodeInfo.shipToInfos.isNotEmpty;

  List<ShipToInfo> get shipToInfos => customerCodeInfo.shipToInfos;

  bool get apiSuccess => apiFailureOrSuccessOption.isNone();
}
