import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_history_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_bloc.freezed.dart';

part 'view_by_item_event.dart';

part 'view_by_item_state.dart';

const int _pageSize = 24;

class ViewByItemsBloc extends Bloc<ViewByItemsEvent, ViewByItemsState> {
  final IViewByItemRepository viewByItemRepository;

  ViewByItemsBloc({
    required this.viewByItemRepository,
  }) : super(ViewByItemsState.initial()) {
    on<_Initialized>((event, emit) => emit(ViewByItemsState.initial()));
    on<_Fetch>(
      (e, emit) async {
        emit(
          state.copyWith(
            isFetching: true,
            orderHistoryList: OrderHistory.empty(),
            nextPageIndex: 0,
            failureOrSuccessOption: none(),
            appliedFilter: e.viewByItemHistoryFilter,
            searchKey: e.searchKey,
          ),
        );

        final failureOrSuccess = await viewByItemRepository.getOrderHistory(
          salesOrgConfig: e.salesOrgConfigs,
          soldTo: e.customerCodeInfo,
          shipTo: e.shipToInfo,
          user: e.user,
          pageSize: _pageSize,
          offset: 0,
          viewByItemHistoryFilter: e.viewByItemHistoryFilter,
          searchKey: e.searchKey,
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
                canLoadMore:
                    orderHistoryList.orderHistoryItems.length >= _pageSize,
                nextPageIndex: 1,
                appliedFilter: e.viewByItemHistoryFilter,
              ),
            );
          },
        );
      },
    );
    on<_LoadMore>((e, emit) async {
      if (state.isFetching || !state.canLoadMore) return;
      emit(state.copyWith(isFetching: true, failureOrSuccessOption: none()));

      final failureOrSuccess = await viewByItemRepository.getOrderHistory(
        salesOrgConfig: e.salesOrgConfigs,
        soldTo: e.customerCodeInfo,
        shipTo: e.shipToInfo,
        user: e.user,
        pageSize: _pageSize,
        offset: state.orderHistoryList.orderHistoryItems.length,
        viewByItemHistoryFilter: state.appliedFilter,
        searchKey: state.searchKey,
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
              canLoadMore:
                  orderHistoryList.orderHistoryItems.length >= _pageSize,
              nextPageIndex: state.nextPageIndex + 1,
            ),
          );
        },
      );
    });
  }
}
