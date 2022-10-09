import 'dart:async';
import 'package:dartz/dartz.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_customer_code_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_event.dart';
part 'customer_code_state.dart';
part 'customer_code_bloc.freezed.dart';

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
      selected: (e) async {
        emit(state.copyWith(customeCodeInfo: e.customerCodeInfo));
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
        if (e.isRefresh) {
          emit(CustomerCodeState.initial());
        } else {
          finalCustomerCodeInfoList.addAll(state.customerCodeList);
        }
        emit(state.copyWith(isFetching: true));

        final salesOrgCustomerInfo = e.searchText.isNotEmpty
            ? [
                SalesOrgCustomerInfo(
                  customerCodeSoldTo: CustomerCode(
                    e.searchText,
                  ),
                  shipToInfos: [],
                ),
              ]
            : e.selectedSalesOrg.customerInfos;

        for (final customerItem in salesOrgCustomerInfo) {
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
              if (customerCodeList.length < 20) {
                canLoadMore = false;
              }
              if (e.isRefresh) {
                finalCustomerCodeInfoList = customerCodeList;
              } else {
                for (var customerData in customerCodeList) {
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
    );
  }

  @override
  void onChange(Change<CustomerCodeState> change) {
    super.onChange(change);
    // print(change);
  }
}
