import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_list_event.dart';
part 'order_history_list_state.dart';
part 'order_history_list_bloc.freezed.dart';

const int _pageSize = 10;

class OrderHistoryListBloc
    extends Bloc<OrderHistoryListEvent, OrderHistoryListState> {
  final IOrderHistoryRepository orderHistoryRepository;
  OrderHistoryListBloc({
    required this.orderHistoryRepository,
  }) : super(OrderHistoryListState.initial()) {
    on<OrderHistoryListEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OrderHistoryListEvent event,
    Emitter<OrderHistoryListState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(OrderHistoryListState.initial()),
      fetch: (e) async { 
        emit(
          state.copyWith(
            isFetching: true,
            orderHistoryList: OrderHistory.empty(),
            nextPageIndex: 0,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: e.salesOrgConfigs,
          soldTo: e.customerCodeInfo,
          shipTo: e.shipToInfo,
          user: e.user,
          // fromDate: e.orderHistoryFilter.fromDate,
          // toDate: e.orderHistoryFilter.toDate,
          orderBy: 'orderDate',
          sort: 'desc',
          pageSize: _pageSize,
          offset: 0,
          orderHistoryFilter: e.orderHistoryFilter,
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
                failureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore:
                    orderHistoryList.orderHistoryItems.length >= _pageSize,
                nextPageIndex: 1,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(state.copyWith(isFetching: true, failureOrSuccessOption: none()));

        final failureOrSuccess = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: e.salesOrgConfigs,
          soldTo: e.customerCodeInfo,
          shipTo: e.shipToInfo,
          user: e.user,
          // fromDate: e.orderHistoryFilter.fromDate,
          // // DateTime.parse(DateFormat('yyyyMMdd')
          // //     .format(DateTime.now().subtract(const Duration(days: 7)))),
          // toDate:e.orderHistoryFilter.toDate,
          // //  DateTime.parse(DateFormat('yyyyMMdd').format(DateTime.now())),
          orderBy: 'orderDate',
          sort: 'desc',
          pageSize: _pageSize,
          offset: state.orderHistoryList.orderHistoryItems.length,
          orderHistoryFilter: e.orderHistoryFilter,
        );

        await failureOrSuccess.fold(
          (failure) async {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (orderHistoryList) async {
            final newOrderHistoryList = List<OrderHistoryItem>.from(
              state.orderHistoryList.orderHistoryItems,
            )..addAll(orderHistoryList.orderHistoryItems);

            emit(
              state.copyWith(
                orderHistoryList: state.orderHistoryList.copyWith(
                  orderHistoryItems: newOrderHistoryList,
                ),
                failureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore:
                    orderHistoryList.orderHistoryItems.length >= _pageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
