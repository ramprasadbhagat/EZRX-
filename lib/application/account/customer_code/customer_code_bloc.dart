import 'dart:async';
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

part 'customer_code_event.dart';
part 'customer_code_state.dart';
part 'customer_code_bloc.freezed.dart';

const int _pageSize = 10;

class CustomerCodeBloc extends Bloc<CustomerCodeEvent, CustomerCodeState> {
  final ICustomerCodeRepository customerCodeRepository;

  CustomerCodeBloc({
    required this.customerCodeRepository,
  }) : super(CustomerCodeState.initial()) {
    on<CustomerCodeEvent>(_onEvent);
  }

  //TODO: Implement case have search text
  Future<void> _onEvent(
    CustomerCodeEvent event,
    Emitter<CustomerCodeState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(CustomerCodeState.initial()),
      updateSearchKey: (e) {
        emit(state.copyWith(searchKey: SearchKey.search(e.searchKey)));
      },
      selected: (e) async {
        emit(state.copyWith(customeCodeInfo: e.customerCodeInfo));
      },
      search: (e) async {
        if (state.isFetching) return;
        final previousSearchKey = state.searchKey;
        final previousCustomerCodeState = state.customeCodeInfo;
        emit(CustomerCodeState.initial().copyWith(
          searchKey: previousSearchKey,
          customeCodeInfo: previousCustomerCodeState,
          isSearchActive: true,
          isFetching: true,
        ));
        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          e.selectedSalesOrg,
          state.searchKey.getValue(),
          e.hidecustomer,
          state.customerCodeList.length,
          e.userInfo,
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
      },
      fetch: (e) async {
        // We have very bad API design so right now we using ugly implementation
        // will revisit and reduce the complexity when API completed the enhancement
        // https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3442/Enhance-customerInformationSearch-API
        // and
        // https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3513/Enhance-customerInformationSearch-customerListForSalesRep
        if (state.isFetching) return;
        var canLoadMore = true;
        var finalCustomerCodeInfoList = <CustomerCodeInfo>[];
        var apiFailure = false;
        final finalCustomerCodeinfo = e.selectedSalesOrg.customerInfos;
        emit(CustomerCodeState.initial());
        emit(state.copyWith(isFetching: true));

        for (final customerItem in finalCustomerCodeinfo) {
          final failureOrSuccess = await customerCodeRepository.getCustomerCode(
            e.selectedSalesOrg,
            customerItem.customerCodeSoldTo.getOrCrash(),
            e.hidecustomer,
            state.customerCodeList.length,
            e.userInfo,
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
        }
        if (!apiFailure) {
          emit(
            state.copyWith(
              customerCodeList: finalCustomerCodeInfoList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
              canLoadMore: canLoadMore,
              customeCodeInfo: finalCustomerCodeInfoList.isNotEmpty
                  ? finalCustomerCodeInfoList.first
                  : state.customeCodeInfo,
            ),
          );
        }
      },
      loadMore: (e) async {
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
          e.selectedSalesOrg,
          customerCodeInfo,
          e.hidecustomer,
          state.customerCodeList.length,
          e.userInfo,
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
      },
    );
  }

  @override
  void onChange(Change<CustomerCodeState> change) {
    super.onChange(change);
    // print(change);
  }
}
