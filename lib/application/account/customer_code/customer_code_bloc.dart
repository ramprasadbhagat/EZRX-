import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
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

const int _pageSize = 10;

class CustomerCodeBloc extends Bloc<CustomerCodeEvent, CustomerCodeState> {
  final ICustomerCodeRepository customerCodeRepository;

  CustomerCodeBloc({
    required this.customerCodeRepository,
  }) : super(CustomerCodeState.initial()) {
    on<_Initialized>((e, emit) async {
      emit(CustomerCodeState.initial());
    });
    on<_UpdateSearchKey>((e, emit) async {
      emit(state.copyWith(searchKey: SearchKey.search(e.searchKey)));
    });
    on<_Selected>((e, emit) async {
      await customerCodeRepository.storeCustomerCode(
        customerCode: e.customerCodeInfo.customerCodeSoldTo,
      );
      emit(state.copyWith(customerCodeInfo: e.customerCodeInfo));
    });
    on<_Search>((e, emit) async {
      if (state.isFetching) return;
      final previousSearchKey = state.searchKey;
      final previousCustomerCodeState = state.customerCodeInfo;
      emit(CustomerCodeState.initial().copyWith(
        searchKey: previousSearchKey,
        customerCodeInfo: previousCustomerCodeState,
        isSearchActive: true,
        isFetching: true,
      ));
      final failureOrSuccess = await customerCodeRepository.getCustomerCode(
        salesOrganisation: e.selectedSalesOrg,
        customerCode: state.searchKey.getValue(),
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
        },
        (customerCodeList) {
          emit(
            state.copyWith(
              customerCodeList: customerCodeList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
              canLoadMore: customerCodeList.length >= _pageSize,
            ),
          );
        },
      );
    });
    on<_LoadStoredCustomerCode>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
      ));

      final customerStorageSuccessOrFailure =
          await customerCodeRepository.getCustomerCodeStorage();

      final lastSavedCustomerCode = customerStorageSuccessOrFailure.fold(
        (_) => '',
        (accountSelector) => accountSelector.customerCode,
      );

      if (lastSavedCustomerCode.isEmpty) {
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
        customerCode: lastSavedCustomerCode,
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

      emit(state.copyWith(
        customerCodeList: customerCodeInfoList,
        isFetching: false,
        isSearchActive: true,
        searchKey:
            SearchKey.search(customerCodeInfoList.first.customerCodeSoldTo),
        customerCodeInfo: customerCodeInfoList.first,
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
        emit(state.copyWith(isFetching: true));

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
                  .getOrCrash()
              : '';
      if (customerCodeInfo.isEmpty) return;
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
  }
}
