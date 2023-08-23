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
import 'package:rxdart/rxdart.dart';

part 'customer_code_bloc.freezed.dart';
part 'customer_code_event.dart';
part 'customer_code_state.dart';

const int _pageSize = 24;

class CustomerCodeBloc extends Bloc<CustomerCodeEvent, CustomerCodeState> {
  final ICustomerCodeRepository customerCodeRepository;

  CustomerCodeBloc({
    required this.customerCodeRepository,
  }) : super(CustomerCodeState.initial()) {
    on<_Initialized>(
      (e, emit) => emit(CustomerCodeState.initial()),
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
    on<_AutoSearch>(
      (event, emit) {
        if (event.searchValue == state.searchKey) return;
        if (event.searchValue.isValid()) {
          add(
            _Search(
              hideCustomer: event.hideCustomer,
              userInfo: event.userInfo,
              selectedSalesOrg: event.selectedSalesOrg,
              searchValue: event.searchValue,
            ),
          );
        } else {
          emit(
            state.copyWith(
              searchKey: event.searchValue,
            ),
          );
        }
      },
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 1500))
          .asyncExpand(mapper),
    );
    on<_Search>(
      (e, emit) async {
        final previousSearchKey = e.searchValue;
        final previousCustomerCodeState = state.customerCodeInfo;
        final previousShipToInfo = state.shipToInfo;
        emit(
          CustomerCodeState.initial().copyWith(
            searchKey: previousSearchKey,
            customerCodeInfo: previousCustomerCodeState,
            shipToInfo: previousShipToInfo,
            isSearchActive: true,
            isFetching: true,
          ),
        );
        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: e.selectedSalesOrg,
          customerCodes: [previousSearchKey.getValue()],
          hideCustomer: e.hideCustomer,
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
                canLoadMore: customerCodeList.length >= _pageSize,
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
          CustomerCodeEvent.fetch(
            hideCustomer: e.hideCustomer,
            userInfo: e.userInfo,
            selectedSalesOrg: e.selectedSalesOrg,
          ),
        );

        return;
      }

      final failureOrSuccess = await customerCodeRepository.getCustomerCode(
        salesOrganisation: e.selectedSalesOrg,
        customerCodes: [lastSavedCustomerInfo.customerCode],
        hideCustomer: e.hideCustomer,
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
            hideCustomer: e.hideCustomer,
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

      emit(
        state.copyWith(
          customerCodeList: customerCodeInfoList,
          isFetching: false,
          isSearchActive: true,
          searchKey:
              SearchKey.search(customerCodeInfoList.first.customerCodeSoldTo),
          customerCodeInfo: customerCodeInfoList.first,
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
        var canLoadMore = true;
        var finalCustomerCodeInfoList = <CustomerCodeInfo>[];
        final finalCustomerCodeInfo = e.selectedSalesOrg.customerInfos;
        emit(CustomerCodeState.initial());
        emit(
          state.copyWith(
            isFetching: true,
            searchKey: SearchKey(e.searchText),
          ),
        );

        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: e.selectedSalesOrg,
          customerCodes: finalCustomerCodeInfo
              .map(
                (customerItem) =>
                    customerItem.customerCodeSoldTo.checkAllOrCustomerCode,
              )
              .toList(),
          hideCustomer: e.hideCustomer,
          user: e.userInfo,
          pageSize: _pageSize,
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
            if (customerCodeList.length < _pageSize) {
              canLoadMore = false;
            }
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
          : e.selectedSalesOrg.customerInfos.isNotEmpty
              ? e.selectedSalesOrg.customerInfos.first.customerCodeSoldTo
                  .checkAllOrCustomerCode
              : '';
      final failureOrSuccess = await customerCodeRepository.getCustomerCode(
        salesOrganisation: e.selectedSalesOrg,
        customerCodes: [customerCodeInfo],
        hideCustomer: e.hideCustomer,
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
          add(
            _Fetch(
              hideCustomer: event.hideCustomer,
              userInfo: event.userInfo,
              selectedSalesOrg: event.selectedSalesOrg,
              searchText: event.searchText,
            ),
          );
        }
      },
    );
  }
}
