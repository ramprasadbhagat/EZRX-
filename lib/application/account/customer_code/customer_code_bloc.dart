import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
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
  final SalesOrgBloc salesOrgBloc;
  final SearchBloc searchBloc;
  final UserBloc userBloc;
  late final StreamSubscription _salesOrgBlocSubscription;
  late final StreamSubscription _searchTextBlocSubscription;
  CustomerCodeBloc({
    required this.salesOrgBloc,
    required this.userBloc,
    required this.searchBloc,
    required this.customerCodeRepository,
  }) : super(CustomerCodeState.initial()) {
    on<CustomerCodeEvent>(_onEvent);
    if (salesOrgBloc.state.salesOrganisation != SalesOrganisation.empty()) {
      _selectCustomer(
        salesOrgBloc.state,
        salesOrgBloc.state.salesOrganisation.customerInfos,
      );
    }

    _salesOrgBlocSubscription = salesOrgBloc.stream.listen(
      (salesOrgState) async {
        if (salesOrgState.salesOrganisation != SalesOrganisation.empty()) {
          _selectCustomer(
            salesOrgState,
            salesOrgBloc.state.salesOrganisation.customerInfos,
          );
        }
      },
    );

    _searchTextBlocSubscription = searchBloc.stream.listen(
      (searchTextState) async {
        if (!searchTextState.isSearchInProgress) return;
        _selectCustomer(
          salesOrgBloc.state,
          searchTextState.searchText.isNotEmpty
              ? [
                  SalesOrgCustomerInfo(
                    customerCodeSoldTo:
                        CustomerCode(searchTextState.searchText),
                    shipToInfos: [],
                  ),
                ]
              : salesOrgBloc.state.salesOrganisation.customerInfos,
        );
      },
    );
  }

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
        if (e.pageIndex > 0) {
          finalCustomerCodeInfoList.addAll(state.customerCodeList);
        } else {
          emit(CustomerCodeState.initial());
        }
        searchBloc.add(const SearchEvent.resetSearchInProgress(true));
        emit(state.copyWith(isFetching: true));
        for (final customerItem in e.salesOrgCustomerInfo) {
          final failureOrSuccess = await customerCodeRepository.getCustomerCode(
            e.salesOrganisation,
            customerItem.customerCodeSoldTo.getOrCrash(),
            e.hidecustomer,
            e.pageIndex,
            e.userRoleType,
            e.userName,
          );
          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                  isLoadMore: false,
                  isFetching: false,
                ),
              );
              if (searchBloc.state.isSearchInProgress) {
                searchBloc.add(const SearchEvent.resetSearchInProgress(false));
              }
              apiFailure = true;
            },
            (customerCodeList) {
              if (customerCodeList.length < 20) {
                canLoadMore = false;
              }
              if (e.pageIndex == 0) {
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
          emit(state.copyWith(
            customerCodeList: finalCustomerCodeInfoList,
            apiFailureOrSuccessOption: none(),
            isFetching: false,
            isLoadMore: canLoadMore,
            customeCodeInfo: finalCustomerCodeInfoList.isNotEmpty
                ? finalCustomerCodeInfoList.first
                : state.customeCodeInfo,
          ));
        }

        if (searchBloc.state.isSearchInProgress) {
          searchBloc.add(const SearchEvent.resetSearchInProgress(false));
        }
      },
    );
  }

  void _selectCustomer(
    SalesOrgState salesOrgState,
    List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
  ) {
    // Always set first available CustomerCode as default selected Customer Code
    add(CustomerCodeEvent.fetch(
      salesOrganisation: salesOrgState.salesOrganisation,
      hidecustomer: salesOrgBloc.state.configs.hideCustomer,
      pageIndex: 0,
      salesOrgCustomerInfo: salesOrgCustomerInfo,
      userRoleType: userBloc.state.user.role.type.loginUserType,
      userName: userBloc.state.user.username.toString(),
    ));
  }

  @override
  Future<void> close() async {
    await _salesOrgBlocSubscription.cancel();
    await _searchTextBlocSubscription.cancel();

    return super.close();
  }

  @override
  void onChange(Change<CustomerCodeState> change) {
    super.onChange(change);
    // print(change);
  }
}
