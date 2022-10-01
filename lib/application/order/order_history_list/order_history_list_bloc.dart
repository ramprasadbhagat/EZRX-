import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_list_event.dart';
part 'order_history_list_state.dart';
part 'order_history_list_bloc.freezed.dart';

const int _pageSize = 10;

class OrderHistoryListBloc
    extends Bloc<OrderHistoryListEvent, OrderHistoryListState> {
  final IOrderHistoryRepository orderHistoryRepository;
  final CustomerCodeBloc customerCodeBloc;
  final ShipToCodeBloc shipToCodeBloc;
  final UserBloc userBloc;
  late final StreamSubscription _shipToCodeBlocSubscription;
  OrderHistoryListBloc({
    required this.customerCodeBloc,
    required this.shipToCodeBloc,
    required this.orderHistoryRepository,
    required this.userBloc,
  }) : super(OrderHistoryListState.initial()) {
    on<OrderHistoryListEvent>(_onEvent);

    if (shipToCodeBloc.state.shipToInfo != ShipToInfo.empty()) {
      add(const OrderHistoryListEvent.fetch());
    }

    _shipToCodeBlocSubscription = shipToCodeBloc.stream.listen((state) {
      if (state.shipToInfo == ShipToInfo.empty()) {
        add(const OrderHistoryListEvent.initialized());
      } else {
        add(const OrderHistoryListEvent.fetch());
      }
    });
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
            orderHistoryList: <OrderHistory>[],
            nextPageIndex: 0,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await orderHistoryRepository.getOrderHistory(
          soldTo: customerCodeBloc.state.customeCodeInfo,
          shipTo: shipToCodeBloc.state.shipToInfo,
          fromDate: DateTime.now().subtract(const Duration(days: 7)),
          toDate: DateTime.now(),
          orderBy: 'orderDate',
          sort: 'desc',
          user: userBloc.state.user,
          pageSize: _pageSize,
          offset: 0,
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
                canLoadMore: orderHistoryList.length >= _pageSize,
                nextPageIndex: 1,
              ),
            );
          },
        );
      },
      loadMore: (_) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(state.copyWith(isFetching: true, failureOrSuccessOption: none()));

        final failureOrSuccess = await orderHistoryRepository.getOrderHistory(
          soldTo: customerCodeBloc.state.customeCodeInfo,
          shipTo: shipToCodeBloc.state.shipToInfo,
          fromDate: DateTime.now().subtract(const Duration(days: 7)),
          toDate: DateTime.now(),
          orderBy: 'orderDate',
          sort: 'desc',
          user: userBloc.state.user,
          pageSize: _pageSize,
          offset: state.orderHistoryList.length,
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
            final newOrderHistoryList =
                List<OrderHistory>.from(state.orderHistoryList)
                  ..addAll(orderHistoryList);
            emit(
              state.copyWith(
                orderHistoryList: newOrderHistoryList,
                failureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: orderHistoryList.length >= _pageSize,
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
    await _shipToCodeBlocSubscription.cancel();

    return super.close();
  }
}
