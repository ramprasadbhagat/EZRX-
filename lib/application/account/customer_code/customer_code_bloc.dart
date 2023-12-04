import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_customer_code_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_bloc.freezed.dart';
part 'customer_code_event.dart';
part 'customer_code_state.dart';

class CustomerCodeBloc extends Bloc<CustomerCodeEvent, CustomerCodeState> {
  final ICustomerCodeRepository customerCodeRepository;
  final Config config;

  CustomerCodeBloc({
    required this.customerCodeRepository,
    required this.config,
  }) : super(CustomerCodeState.initial()) {
    on<_Initialized>(
      (e, emit) => emit(
        CustomerCodeState.initial().copyWith(
          hideCustomer: e.hideCustomer,
          userInfo: e.userInfo,
          selectedSalesOrg: e.selectedSalesOrg,
        ),
      ),
    );
    on<_Selected>((e, emit) async {
      await customerCodeRepository.storeCustomerInfo(
        customerCode: e.customerCodeInfo.customerCodeSoldTo,
        shippingAddress: e.shipToInfo.shipToCustomerCode,
      );
      emit(
        state.copyWith(
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
        ),
      );
    });
    on<_Search>(
      (e, emit) async {
        if (e.searchValue == state.searchKey) return;
        if (!e.searchValue.isValid()) {
          emit(
            state.copyWith(
              searchKey: e.searchValue,
            ),
          );

          return;
        }
        emit(
          state.copyWith(
            isFetching: true,
            searchKey: e.searchValue,
            isSearchActive: true,
            canLoadMore: false,
            customerCodeList: <CustomerCodeInfo>[],
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: state.selectedSalesOrg,
          customerCodes: [e.searchValue.getValue()],
          hideCustomer: state.hideCustomer,
          user: state.userInfo,
          pageSize: config.pageSize,
          offset: state.customerCodeList.length,
        );
        failureOrSuccess.fold(
          (failure) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                canLoadMore: false,
                isFetching: false,
                searchKey: e.searchValue,
              ),
            );
          },
          (customerCodeList) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                customerCodeList: customerCodeList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: customerCodeList.length >= config.pageSize,
                searchKey: e.searchValue,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadStoredCustomerCode>((e, emit) async {
      emit(
        state.copyWith(
          isFetching: true,
        ),
      );

      final customerStorageSuccessOrFailure =
          await customerCodeRepository.getCustomerCodeStorage();

      final lastSavedCustomerInfo = customerStorageSuccessOrFailure.fold(
        (_) => AccountSelector.empty(),
        (accountSelector) => accountSelector,
      );

      if (lastSavedCustomerInfo.customerCode.isEmpty) {
        add(
          const CustomerCodeEvent.fetch(),
        );

        return;
      }

      // Using the last saved shippingAddress to fetch current customerInformation
      // as we do not receive all the shipToCodes associated with a customerCode
      // at once. Necessary because when using the last saved customerCode,
      // If the required shipToCode is on a paginated page beyond the first,
      // the default behavior sets the first shipToCode as the shippingAddress.

      final failureOrSuccess = await customerCodeRepository.getCustomerCode(
        salesOrganisation: state.selectedSalesOrg,
        customerCodes: [lastSavedCustomerInfo.shippingAddress],
        hideCustomer: state.hideCustomer,
        user: state.userInfo,
        pageSize: config.pageSize,
        offset: 0,
      );

      final customerCodeInfoList =
          failureOrSuccess.fold<List<CustomerCodeInfo>>(
        (_) => <CustomerCodeInfo>[],
        (customerCodeList) => customerCodeList,
      );

      if (customerCodeInfoList.isEmpty) {
        add(
          const CustomerCodeEvent.fetch(),
        );

        return;
      }

      var shipToInfo = ShipToInfo.empty();
      if (lastSavedCustomerInfo.shippingAddress.isNotEmpty) {
        shipToInfo = customerCodeInfoList.first.shipToInfos.firstWhere(
          (shipToInfo) =>
              shipToInfo.shipToCustomerCode ==
              lastSavedCustomerInfo.shippingAddress,
          orElse: () => ShipToInfo.empty(),
        );
      }

      final customerCodeInfo = customerCodeInfoList.firstWhere(
        (element) =>
            element.customerCodeSoldTo == lastSavedCustomerInfo.customerCode,
        orElse: () => customerCodeInfoList.first,
      );

      emit(
        state.copyWith(
          customerCodeList: customerCodeInfoList,
          isFetching: false,
          isSearchActive: true,
          canLoadMore: customerCodeInfoList.length >= config.pageSize,
          searchKey: SearchKey.search(lastSavedCustomerInfo.shippingAddress),
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo == ShipToInfo.empty()
              ? customerCodeInfoList.first.shipToInfos.first
              : shipToInfo,
        ),
      );
    });
    on<_Fetch>(
      (e, emit) async {
        // We have very bad API design so right now we using ugly implementation
        // will revisit and reduce the complexity when API completed the enhancement
        // https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3442/Enhance-customerInformationSearch-API
        // and
        // https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3513/Enhance-customerInformationSearch-customerListForSalesRep
        var finalCustomerCodeInfoList = <CustomerCodeInfo>[];
        final finalCustomerCodeInfo = state.selectedSalesOrg.customerInfos;
        emit(
          state.copyWith(
            isFetching: true,
            isSearchActive: false,
            searchKey: SearchKey(e.searchText),
            customerCodeList: <CustomerCodeInfo>[],
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: state.selectedSalesOrg,
          customerCodes: finalCustomerCodeInfo
              .map(
                (customerItem) =>
                    customerItem.customerCodeSoldTo.checkAllOrCustomerCode,
              )
              .toList(),
          hideCustomer: state.hideCustomer,
          user: state.userInfo,
          pageSize: config.pageSize,
          offset: 0,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                canLoadMore: false,
                isFetching: false,
              ),
            );
          },
          (customerCodeList) {
            if (finalCustomerCodeInfo.length == 1) {
              finalCustomerCodeInfoList = customerCodeList;
            } else {
              for (final customerData in customerCodeList) {
                finalCustomerCodeInfoList.add(customerData);
              }
            }
            if (!emit.isDone) {
              emit(
                state.copyWith(
                  customerCodeList: finalCustomerCodeInfoList,
                  apiFailureOrSuccessOption: none(),
                  isFetching: false,
                  canLoadMore: customerCodeList.length >= config.pageSize,
                  customerCodeInfo:
                      state.customerCodeInfo != CustomerCodeInfo.empty()
                          ? state.customerCodeInfo
                          : finalCustomerCodeInfoList.isNotEmpty
                              ? finalCustomerCodeInfoList.first
                              : CustomerCodeInfo.empty(),
                  shipToInfo: state.shipToInfo != ShipToInfo.empty()
                      ? state.shipToInfo
                      : finalCustomerCodeInfoList.isNotEmpty
                          ? finalCustomerCodeInfoList.first.shipToInfos.first
                          : ShipToInfo.empty(),
                ),
              );
            }
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMore>((e, emit) async {
      if (!state.canLoadMore || state.isFetching) return;
      emit(state.copyWith(isFetching: true));
      final customerCodeInfo = state.searchKey.isValid()
          ? state.searchKey.getValue()
          : state.selectedSalesOrg.customerInfos.isNotEmpty
              ? state.selectedSalesOrg.customerInfos.first.customerCodeSoldTo
                  .checkAllOrCustomerCode
              : '';
      final failureOrSuccess = await customerCodeRepository.getCustomerCode(
        salesOrganisation: state.selectedSalesOrg,
        customerCodes: [customerCodeInfo],
        hideCustomer: state.hideCustomer,
        user: state.userInfo,
        pageSize: config.pageSize,
        offset: state.customerCodeList.length,
      );
      failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          );
        },
        (customerCodeList) {
          final finalCustomerCodeInfoList =
              List<CustomerCodeInfo>.from(state.customerCodeList)
                ..addAll(customerCodeList);
          emit(
            state.copyWith(
              customerCodeList: finalCustomerCodeInfoList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
              canLoadMore: customerCodeList.length >= config.pageSize,
            ),
          );
        },
      );
    });
    on<_DeletedSearch>(
      (event, emit) {
        add(
          _Fetch(
            searchText: event.searchText,
          ),
        );
      },
    );
  }
}
