import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_order_bloc.freezed.dart';
part 'saved_order_event.dart';
part 'saved_order_state.dart';

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
            isDraftOrderCreated: false,
            isCreating: false,
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
                isDraftOrderCreated: false,
                isCreating: false,
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
            isDraftOrderCreated: false,
            isCreating: false,
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
                isDraftOrderCreated: false,
                isCreating: false,
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
                isDraftOrderCreated: false,
                isCreating: false,
              ),
            );
          },
        );
      },
      delete: (e) async {
        emit(state.copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
          isDraftOrderCreated: false,
          isCreating: false,
        ));

        final failureOrSuccess = await repository.deleteSavedOrder(
          orderItem: e.order,
          ordersList: state.savedOrders,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                isDraftOrderCreated: false,
                isCreating: false,
              ),
            );
          },
          (savedOrders) {
            emit(
              state.copyWith(
                savedOrders: savedOrders,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                isDraftOrderCreated: false,
                isCreating: false,
              ),
            );
          },
        );
      },
      createDraft: (e) async {
        emit(state.copyWith(
          apiFailureOrSuccessOption: none(),
          isDraftOrderCreated: false,
          isCreating: true,
        ));
        final failureOrSuccess = await repository.createDraftOrder(
          shipToInfo: e.shipToInfo,
          user: e.user,
          cartItems: e.cartItems,
          grandTotal: e.grandTotal,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          data: e.data,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isCreating: false,
              ),
            );
          },
          (createDraftOrder) {
            final newList = List<SavedOrder>.from(e.existingSavedOrderList)
              ..insert(0, createDraftOrder);
            emit(
              state.copyWith(
                isDraftOrderCreated: createDraftOrder.draftorder,
                savedOrders: newList,
                apiFailureOrSuccessOption: none(),
                isCreating: false,
              ),
            );
          },
        );
      },
    );
  }
}
