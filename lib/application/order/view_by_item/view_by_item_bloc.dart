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
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_bloc.freezed.dart';

part 'view_by_item_event.dart';

part 'view_by_item_state.dart';

class ViewByItemsBloc extends Bloc<ViewByItemsEvent, ViewByItemsState> {
  final IViewByItemRepository viewByItemRepository;
  final Config config;
  // Define a Timer to manage the debounce
  Timer? _debounceTimer;

  ViewByItemsBloc({
    required this.viewByItemRepository,
    required this.config,
  }) : super(ViewByItemsState.initial()) {
    on<_Initialized>(
      (e, emit) {
        emit(
          ViewByItemsState.initial().copyWith(
            salesOrgConfigs: e.salesOrgConfigs,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            user: e.user,
            salesOrganisation: e.salesOrganisation,
          ),
        );

        add(
          _Fetch(
            viewByItemFilter: state.appliedFilter,
            searchKey: state.searchKey,
          ),
        );
      },
    );
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
                viewByItemFilter: state.appliedFilter,
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
            orderHistoryList: OrderHistory.empty(),
            nextPageIndex: 0,
            failureOrSuccessOption: none(),
            searchKey: e.searchKey,
            appliedFilter: e.viewByItemFilter,
          ),
        );

        final failureOrSuccess = await viewByItemRepository.getViewByItems(
          salesOrgConfig: state.salesOrgConfigs,
          soldTo: state.customerCodeInfo,
          shipTo: state.shipToInfo,
          user: state.user,
          pageSize: config.pageSize,
          offset: 0,
          viewByItemFilter: e.viewByItemFilter,
          searchKey: e.searchKey,
          salesOrganisation: state.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (orderHistoryList) {
            emit(
              state.copyWith(
                orderHistoryList: orderHistoryList,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: orderHistoryList.orderHistoryItems.length >=
                    config.pageSize,
                nextPageIndex: 1,
                appliedFilter: e.viewByItemFilter,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMore>(
      (e, emit) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(state.copyWith(isFetching: true, failureOrSuccessOption: none()));

        final failureOrSuccess = await viewByItemRepository.getViewByItems(
          salesOrgConfig: state.salesOrgConfigs,
          soldTo: state.customerCodeInfo,
          shipTo: state.shipToInfo,
          user: state.user,
          pageSize: config.pageSize,
          offset: state.orderHistoryList.orderHistoryItems.length,
          viewByItemFilter: state.appliedFilter,
          searchKey: state.searchKey,
          salesOrganisation: state.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (orderHistoryList) {
            final newOrderHistoryList = List<OrderHistoryItem>.from(
              state.orderHistoryList.orderHistoryItems,
            )..addAll(orderHistoryList.orderHistoryItems);

            emit(
              state.copyWith(
                orderHistoryList: state.orderHistoryList.copyWith(
                  orderHistoryItems: newOrderHistoryList,
                ),
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: orderHistoryList.orderHistoryItems.length >=
                    config.pageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
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
