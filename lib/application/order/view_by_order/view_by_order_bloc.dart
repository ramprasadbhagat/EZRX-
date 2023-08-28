import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:rxdart/rxdart.dart';

part 'view_by_order_event.dart';
part 'view_by_order_state.dart';
part 'view_by_order_bloc.freezed.dart';

const int _pageSize = 24;

class ViewByOrderBloc extends Bloc<ViewByOrderEvent, ViewByOrderState> {
  final IViewByOrderRepository viewByOrderRepository;
  ViewByOrderBloc({
    required this.viewByOrderRepository,
  }) : super(ViewByOrderState.initial()) {
    on<_Initialized>(
      (event, emit) => emit(ViewByOrderState.initial()),
    );
    on<_AutoSearchProduct>(
      (e, emit) {
        if (e.searchKey == state.searchKey) return;
        if (e.searchKey.isValid()) {
          add(
            _Fetch(
              customerCodeInfo: e.customerCodeInfo,
              salesOrgConfigs: e.salesOrgConfigs,
              shipToInfo: e.shipToInfo,
              user: e.user,
              filter: e.filter,
              searchKey: e.searchKey,
              sortDirection: e.sortDirection,
            ),
          );
        } else {
          emit(
            state.copyWith(searchKey: e.searchKey),
          );
        }
      },
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 3000))
          .asyncExpand(mapper),
    );
    on<_Fetch>(
      (e, emit) async {
        emit(
          state.copyWith(
            isFetching: true,
            viewByOrderList: ViewByOrder.empty(),
            nextPageIndex: 0,
            failureOrSuccessOption: none(),
            searchKey: e.searchKey,
            appliedFilter: e.filter,
          ),
        );

        final failureOrSuccess =
            await viewByOrderRepository.getViewByOrders(
          salesOrgConfig: e.salesOrgConfigs,
          soldTo: e.customerCodeInfo,
          shipTo: e.shipToInfo,
          user: e.user,
          pageSize: _pageSize,
          offset: 0,
          viewByOrdersFilter: e.filter,
          orderBy: 'datetime',
          sort: e.sortDirection,
          searchKey: e.searchKey,
          viewByOrder: state.viewByOrderList,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
              appliedFilter: e.filter,
            ),
          ),
          (viewByOrderList) => emit(
            state.copyWith(
              viewByOrderList: viewByOrderList,
              failureOrSuccessOption: none(),
              appliedFilter: e.filter,
              isFetching: false,
            ),
          ),
        );
      },
    );
    on<_LoadMore>((e, emit) async {
      if (state.isFetching || !state.canLoadMore) return;
      emit(state.copyWith(isFetching: true, failureOrSuccessOption: none()));

      final failureOrSuccess =
          await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: e.salesOrgConfigs,
        soldTo: e.customerCodeInfo,
        shipTo: e.shipToInfo,
        user: e.user,
        pageSize: _pageSize,
        offset: state.viewByOrderList.orderHeaders.length,
        viewByOrdersFilter: state.appliedFilter,
        orderBy: 'datetime',
        sort: e.sortDirection,
        searchKey: state.searchKey,
        viewByOrder: state.viewByOrderList,
      );

      failureOrSuccess.fold(
        (failure) => emit(
          state.copyWith(
            failureOrSuccessOption: optionOf(failureOrSuccess),
            isFetching: false,
          ),
        ),
        (viewByOrder) => emit(
          state.copyWith(
            viewByOrderList: viewByOrder,
            failureOrSuccessOption: none(),
            isFetching: false,
            canLoadMore: viewByOrder.orderHeaders.length >= _pageSize,
            nextPageIndex: state.nextPageIndex + 1,
          ),
        ),
      );
    });
  }
}
