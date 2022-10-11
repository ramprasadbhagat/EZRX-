import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

part 'saved_order_event.dart';
part 'saved_order_state.dart';
part 'saved_order_bloc.freezed.dart';

const int _defaultPageSize = 10;

class SavedOrderListBloc
    extends Bloc<SavedOrderListEvent, SavedOrderListState> {
  final IOrderRepository repository;

  SavedOrderListBloc({
    required this.repository,
  }) : super(SavedOrderListState.initial()) {
    on<SavedOrderListEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SavedOrderListEvent event,
    Emitter<SavedOrderListState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(SavedOrderListState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            savedOrders: [],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await repository.getSavedOrder(
          user: e.userInfo,
          salesOrg: e.selectedSalesOrganisation,
          customerCode: e.selectedCustomerCode,
          shipToCode: e.selectedShipTo,
          pageSize: _defaultPageSize,
          offset: 0,
        );

        await failureOrSuccess.fold(
          (failure) async {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (savedOrders) async {
            emit(
              state.copyWith(
                savedOrders: savedOrders,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: savedOrders.length >= _defaultPageSize,
                nextPageIndex: 1,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await repository.getSavedOrder(
          user: e.userInfo,
          salesOrg: e.selectedSalesOrganisation,
          customerCode: e.selectedCustomerCode,
          shipToCode: e.selectedShipTo,
          pageSize: _defaultPageSize,
          offset: state.savedOrders.length,
        );

        await failureOrSuccess.fold(
          (failure) async {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (savedOrders) async {
            final newSavedOrders = List<SavedOrder>.from(state.savedOrders)
              ..addAll(savedOrders);
            emit(
              state.copyWith(
                savedOrders: newSavedOrders,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: savedOrders.length >= _defaultPageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
    );
  }
}
