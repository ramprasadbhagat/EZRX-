import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_history_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_event.dart';
part 'view_by_order_state.dart';
part 'view_by_order_bloc.freezed.dart';

const int _pageSize = 24;

class ViewByOrderHistoryBloc
    extends Bloc<ViewByOrderHistoryEvent, ViewByOrderHistoryState> {
  final IViewByOrderHistoryRepository viewByOrderHistoryRepository;
  ViewByOrderHistoryBloc({
    required this.viewByOrderHistoryRepository,
  }) : super(ViewByOrderHistoryState.initial()) {
    on<_Initialized>((event, emit) async {
      emit(ViewByOrderHistoryState.initial());
    });
    on<_Fetch>(
      (e, emit) async {
        emit(
          state.copyWith(
            isFetching: true,
            viewByOrderHistoryList: ViewByOrderHistory.empty(),
            nextPageIndex: 0,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await viewByOrderHistoryRepository.getViewByOrderHistory(
          salesOrgConfig: e.salesOrgConfigs,
          soldTo: e.customerCodeInfo,
          shipTo: e.shipToInfo,
          user: e.user,
          pageSize: _pageSize,
          offset: 0,
          viewByOrderHistoryFilter: e.viewByOrderHistoryFilter,
          orderBy: 'datetime',
          sort: e.sortDirection,
          searchKey: '',
          creatingOrderIds: <String>[],
        );
        if (emit.isDone) return;

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (viewByOrderHistoryList) {
            emit(
              state.copyWith(
                viewByOrderHistoryList: viewByOrderHistoryList,
                failureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore:
                    viewByOrderHistoryList.orderHeaders.length >= _pageSize,
                nextPageIndex: 1,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMore>((e, emit) async {
      if (state.isFetching || !state.canLoadMore) return;
      emit(state.copyWith(isFetching: true, failureOrSuccessOption: none()));

      final failureOrSuccess =
          await viewByOrderHistoryRepository.getViewByOrderHistory(
        salesOrgConfig: e.salesOrgConfigs,
        soldTo: e.customerCodeInfo,
        shipTo: e.shipToInfo,
        user: e.user,
        pageSize: _pageSize,
        offset: 0,
        viewByOrderHistoryFilter: e.viewByOrderHistoryFilter,
        orderBy: 'datetime',
        sort: e.sortDirection,
        searchKey: '',
        creatingOrderIds: <String>[],
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
        (viewByOrderHistoryList) async {
          final newViewByOrderHistoryList =
              List<OrderHistoryDetailsOrderHeader>.from(
            state.viewByOrderHistoryList.orderHeaders,
          )..addAll(viewByOrderHistoryList.orderHeaders);

          emit(
            state.copyWith(
              viewByOrderHistoryList: state.viewByOrderHistoryList.copyWith(
                orderHeaders: newViewByOrderHistoryList,
              ),
              failureOrSuccessOption: none(),
              isFetching: false,
              canLoadMore:
                  viewByOrderHistoryList.orderHeaders.length >= _pageSize,
              nextPageIndex: state.nextPageIndex + 1,
            ),
          );
        },
      );
    });
  }
}
