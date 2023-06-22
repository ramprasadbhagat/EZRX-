import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
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

const int _pageSize = 24;

class CustomerCodeBloc extends Bloc<CustomerCodeEvent, CustomerCodeState> {
  final ICustomerCodeRepository customerCodeRepository;

  CustomerCodeBloc({
    required this.customerCodeRepository,
  }) : super(CustomerCodeState.initial()) {
    on<_Initialized>((e, emit) async {
      emit(CustomerCodeState.initial());
    });
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
    on<_AutoSearch>(
      (event, emit) {
        if (event.searchValue != state.searchKey.getValue()) {
          add(_Search(
            hidecustomer: event.hidecustomer,
            userInfo: event.userInfo,
            selectedSalesOrg: event.selectedSalesOrg,
            searchValue: event.searchValue,
          ));
        }
      },
    );
    on<_Search>(
      (e, emit) async {
        if (state.isFetching) return;
        final previousSearchKey = SearchKey(e.searchValue);
        final previousCustomerCodeState = state.customerCodeInfo;
        emit(CustomerCodeState.initial().copyWith(
          searchKey: previousSearchKey,
          customerCodeInfo: previousCustomerCodeState,
          isSearchActive: true,
          isFetching: true,
        ));
        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: e.selectedSalesOrg,
          customerCode: previousSearchKey.getValue(),
          hideCustomer: e.hidecustomer,
          user: e.userInfo,
          pageSize: _pageSize,
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
                searchKey: SearchKey(e.searchValue),
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
                canLoadMore: customerCodeList.length >= _pageSize,
                searchKey: SearchKey(e.searchValue),
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadStoredCustomerCode>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
      ));

      final customerStorageSuccessOrFailure =
          await customerCodeRepository.getCustomerCodeStorage();

      final lastSavedCustomerInfo = customerStorageSuccessOrFailure.fold(
        (_) => AccountSelector.empty(),
        (accountSelector) => accountSelector,
      );

      if (lastSavedCustomerInfo.customerCode.isEmpty) {
        add(
          CustomerCodeEvent.fetch(
            hidecustomer: e.hidecustomer,
            userInfo: e.userInfo,
            selectedSalesOrg: e.selectedSalesOrg,
          ),
        );

        return;
      }

      final failureOrSuccess = await customerCodeRepository.getCustomerCode(
        salesOrganisation: e.selectedSalesOrg,
        customerCode: lastSavedCustomerInfo.customerCode,
        hideCustomer: e.hidecustomer,
        user: e.userInfo,
        pageSize: _pageSize,
        offset: state.customerCodeList.length,
      );

      final customerCodeInfoList =
          failureOrSuccess.fold<List<CustomerCodeInfo>>(
        (_) => [],
        (customerCodeList) => customerCodeList,
      );

      if (customerCodeInfoList.isEmpty) {
        add(
          CustomerCodeEvent.fetch(
            hidecustomer: e.hidecustomer,
            userInfo: e.userInfo,
            selectedSalesOrg: e.selectedSalesOrg,
          ),
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

      emit(state.copyWith(
        customerCodeList: customerCodeInfoList,
        isFetching: false,
        isSearchActive: true,
        searchKey:
            SearchKey.search(customerCodeInfoList.first.customerCodeSoldTo),
        customerCodeInfo: customerCodeInfoList.first,
        shipToInfo: shipToInfo == ShipToInfo.empty()
            ? customerCodeInfoList.first.shipToInfos.first
            : shipToInfo,
      ));
    });
    on<_Fetch>(
      (e, emit) async {
        // We have very bad API design so right now we using ugly implementation
        // will revisit and reduce the complexity when API completed the enhancement
        // https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3442/Enhance-customerInformationSearch-API
        // and
        // https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3513/Enhance-customerInformationSearch-customerListForSalesRep
        var canLoadMore = true;
        var finalCustomerCodeInfoList = <CustomerCodeInfo>[];
        var apiFailure = false;
        final finalCustomerCodeinfo = e.selectedSalesOrg.customerInfos;
        emit(CustomerCodeState.initial());
        emit(
          state.copyWith(
            isFetching: true,
            searchKey: SearchKey(e.searchText),
          ),
        );

        for (final customerItem in finalCustomerCodeinfo) {
          final failureOrSuccess = await customerCodeRepository.getCustomerCode(
            salesOrganisation: e.selectedSalesOrg,
            customerCode:
                customerItem.customerCodeSoldTo.checkAllOrCustomerCode,
            hideCustomer: e.hidecustomer,
            user: e.userInfo,
            pageSize: _pageSize,
            offset: state.customerCodeList.length,
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
              apiFailure = true;
            },
            (customerCodeList) {
              if (customerCodeList.length < _pageSize) {
                canLoadMore = false;
              }
              if (finalCustomerCodeinfo.length == 1) {
                finalCustomerCodeInfoList = customerCodeList;
              } else {
                for (final customerData in customerCodeList) {
                  finalCustomerCodeInfoList.add(customerData);
                }
              }
            },
          );
          if (apiFailure) {
            break;
          }
          if (!emit.isDone) {
            emit(
              state.copyWith(
                customerCodeList: finalCustomerCodeInfoList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: canLoadMore,
                customerCodeInfo: finalCustomerCodeInfoList.isNotEmpty
                    ? finalCustomerCodeInfoList.first
                    : CustomerCodeInfo.empty(),
                shipToInfo: finalCustomerCodeInfoList.isNotEmpty
                    ? finalCustomerCodeInfoList.first.shipToInfos.first
                    : ShipToInfo.empty(),
              ),
            );
          }
        }
      },
      transformer: restartable(),
    );
    on<_LoadMore>((e, emit) async {
      if (!state.canLoadMore || state.isFetching) return;
      emit(state.copyWith(isFetching: true));
      final customerCodeInfo = state.searchKey.isValid()
          ? state.searchKey.getValue()
          : e.selectedSalesOrg.customerInfos.isNotEmpty
              ? e.selectedSalesOrg.customerInfos.first.customerCodeSoldTo
                  .checkAllOrCustomerCode
              : '';
      final failureOrSuccess = await customerCodeRepository.getCustomerCode(
        salesOrganisation: e.selectedSalesOrg,
        customerCode: customerCodeInfo,
        hideCustomer: e.hidecustomer,
        user: e.userInfo,
        pageSize: _pageSize,
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
              canLoadMore: customerCodeList.length >= _pageSize,
            ),
          );
        },
      );
    });
    on<_DeletedSearch>(
      (event, emit) {
        if (event.searchText != state.searchKey.getValue()) {
          add(_Fetch(
            hidecustomer: event.hidecustomer,
            userInfo: event.userInfo,
            selectedSalesOrg: event.selectedSalesOrg,
            searchText: event.searchText,
          ));
        }
      },
    );
  }
}
