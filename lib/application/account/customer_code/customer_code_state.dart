part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeState with _$CustomerCodeState {
  const CustomerCodeState._();

  const factory CustomerCodeState({
    required bool hideCustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
    required CustomerCodeInfo customerCodeInfo,
    required List<CustomerCodeInfo> customerCodeList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool canLoadMore,
    required bool isFetching,
    required bool isSearchActive,
    required SearchKey searchKey,
    required ShipToInfo shipToInfo,
  }) = _CustomerCodeState;

  factory CustomerCodeState.initial() => CustomerCodeState(
        hideCustomer: false,
        userInfo: User.empty(),
        selectedSalesOrg: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        customerCodeList: [],
        apiFailureOrSuccessOption: none(),
        canLoadMore: true,
        isFetching: true,
        shipToInfo: ShipToInfo.empty(),
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

  String get displayShipTo {
    if (customerCodeInfo == CustomerCodeInfo.empty()) {
      return 'NA';
    }
    if (haveShipTo) {
      return shipToInfo.fullDeliveryAddress;
    }

    return defaultShipToInfo.fullDeliveryAddress;
  }

  bool get haveShipTo => shipToInfo != ShipToInfo.empty();

  bool get haveShipToInfo =>
      customerCodeInfo != CustomerCodeInfo.empty() &&
      customerCodeInfo.shipToInfos.isNotEmpty;

  List<ShipToInfo> get shipToInfos => customerCodeInfo.shipToInfos;

  bool get apiSuccess => apiFailureOrSuccessOption.isNone();
}
