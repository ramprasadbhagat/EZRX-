import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
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
          (customerInformation) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                customerCodeList: customerInformation.soldToInformation,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: customerInformation.shipToCount >= config.pageSize,
                searchKey: e.searchValue,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
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
          (customerInformation) {
            if (finalCustomerCodeInfo.length == 1) {
              finalCustomerCodeInfoList = customerInformation.soldToInformation;
            } else {
              for (final customerData
                  in customerInformation.soldToInformation) {
                finalCustomerCodeInfoList.add(customerData);
              }
            }
            if (!emit.isDone) {
              emit(
                state.copyWith(
                  customerCodeList: finalCustomerCodeInfoList,
                  apiFailureOrSuccessOption: none(),
                  isFetching: false,
                  canLoadMore: customerInformation.shipToCount >= config.pageSize,
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
        (customerInformation) {
          final finalCustomerCodeInfoList =
              List<CustomerCodeInfo>.from(state.customerCodeList)
                ..addAll(customerInformation.soldToInformation);
          emit(
            state.copyWith(
              customerCodeList: finalCustomerCodeInfoList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
              canLoadMore: customerInformation.shipToCount >= config.pageSize,
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
