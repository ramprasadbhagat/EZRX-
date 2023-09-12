import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
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

part 'view_by_order_event.dart';
part 'view_by_order_state.dart';
part 'view_by_order_bloc.freezed.dart';

class ViewByOrderBloc extends Bloc<ViewByOrderEvent, ViewByOrderState> {
  final IViewByOrderRepository viewByOrderRepository;
  final Config config;

  // Define a Timer to manage the debounce
  Timer? _debounceTimer;

  ViewByOrderBloc({required this.viewByOrderRepository, required this.config})
      : super(ViewByOrderState.initial()) {
    on<_Initialized>((event, emit) {
      emit(
        ViewByOrderState.initial().copyWith(
          salesOrganisation: event.salesOrganisation,
          salesOrgConfigs: event.salesOrgConfigs,
          customerCodeInfo: event.customerCodeInfo,
          shipToInfo: event.shipToInfo,
          user: event.user,
          sortDirection: event.sortDirection,
        ),
      );

      add(
        _Fetch(
          filter: state.appliedFilter,
          searchKey: state.searchKey,
        ),
      );
    });
    on<_AutoSearchProduct>(
      (e, emit) async {
        // Cancel any existing timer (if it exists)
        _debounceTimer?.cancel();

        // Create a new timer for the debounce
        _debounceTimer =
            Timer(Duration(milliseconds: config.autoSearchTimeout), () {
          // Call the actual search logic for auto search
          if (e.searchKey == state.searchKey) return;
          if (e.searchKey.validateNotEmpty) {
            add(
              _Fetch(
                filter: state.appliedFilter,
                searchKey: e.searchKey,
              ),
            );
          } else {
            if (emit.isDone) return;
            emit(state.copyWith(searchKey: e.searchKey));
          }
        });
      },
    );
    on<_Fetch>(
      (e, emit) async {
        // Cancel the debounce timer (if it exists)
        _debounceTimer?.cancel();

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

        final failureOrSuccess = await viewByOrderRepository.getViewByOrders(
          salesOrganisation: state.salesOrganisation,
          salesOrgConfig: state.salesOrgConfigs,
          soldTo: state.customerCodeInfo,
          shipTo: state.shipToInfo,
          user: state.user,
          pageSize: config.pageSize,
          offset: 0,
          viewByOrdersFilter: e.filter,
          orderBy: 'datetime',
          sort: state.sortDirection,
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
      transformer: restartable(),
    );
    on<_LoadMore>(
      (e, emit) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(state.copyWith(isFetching: true, failureOrSuccessOption: none()));

        final failureOrSuccess = await viewByOrderRepository.getViewByOrders(
          salesOrgConfig: state.salesOrgConfigs,
          soldTo: state.customerCodeInfo,
          shipTo: state.shipToInfo,
          user: state.user,
          pageSize: config.pageSize,
          offset: state.viewByOrderList.orderHeaders.length,
          viewByOrdersFilter: state.appliedFilter,
          orderBy: 'datetime',
          sort: state.sortDirection,
          searchKey: state.searchKey,
          viewByOrder: state.viewByOrderList,
          salesOrganisation: state.salesOrganisation,
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
              canLoadMore: viewByOrder.orderHeaders.length >= config.pageSize,
              nextPageIndex: state.nextPageIndex + 1,
            ),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    // Dispose of the timer when BLoC is closed
    _debounceTimer?.cancel();

    return super.close();
  }
}
