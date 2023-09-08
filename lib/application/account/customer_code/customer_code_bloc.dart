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
import 'package:rxdart/rxdart.dart';

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
    on<_AutoSearch>(
      (event, emit) {
        if (event.searchValue == state.searchKey) return;
        if (event.searchValue.isValid()) {
          add(
            _Search(
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
          .debounceTime(
            Duration(milliseconds: config.autoSearchTimeout),
          )
          .asyncExpand(mapper),
    );
    on<_Search>(
      (e, emit) async {
        final previousSearchKey = e.searchValue;
        final previousCustomerCodeState = state.customerCodeInfo;
        final previousShipToInfo = state.shipToInfo;
        emit(
          CustomerCodeState.initial().copyWith(
            selectedSalesOrg: state.selectedSalesOrg,
            hideCustomer: state.hideCustomer,
            userInfo: state.userInfo,
            searchKey: previousSearchKey,
            customerCodeInfo: previousCustomerCodeState,
            shipToInfo: previousShipToInfo,
            isSearchActive: true,
            isFetching: true,
          ),
        );
        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: state.selectedSalesOrg,
          customerCodes: [previousSearchKey.getValue()],
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

      final failureOrSuccess = await customerCodeRepository.getCustomerCode(
        salesOrganisation: state.selectedSalesOrg,
        customerCodes: [lastSavedCustomerInfo.customerCode],
        hideCustomer: state.hideCustomer,
        user: state.userInfo,
        pageSize: config.pageSize,
        offset: 0,
      );

      final customerCodeInfoList =
          failureOrSuccess.fold<List<CustomerCodeInfo>>(
        (_) => [],
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
        final finalCustomerCodeInfo = state.selectedSalesOrg.customerInfos;
        emit(
          CustomerCodeState.initial().copyWith(
            selectedSalesOrg: state.selectedSalesOrg,
            hideCustomer: state.hideCustomer,
            userInfo: state.userInfo,
          ),
        );
        emit(
          state.copyWith(
            isFetching: true,
            searchKey: SearchKey(e.searchText),
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
            if (customerCodeList.length < config.pageSize) {
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
        if (event.searchText != state.searchKey.getValue()) {
          add(
            _Fetch(
              searchText: event.searchText,
            ),
          );
        }
      },
    );
  }
}
