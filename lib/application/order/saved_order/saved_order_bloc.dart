import 'dart:async';

import 'package:dartz/dartz.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
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
                isCreating: false,
              ),
            );
          },
        );
      },
      delete: (e) async {
        emit(state.copyWith(
          apiFailureOrSuccessOption: none(),
          isDeleting: true,
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
                isDeleting: false,
              ),
            );
          },
          (savedOrders) {
            emit(
              state.copyWith(
                savedOrders: savedOrders,
                apiFailureOrSuccessOption: none(),
                isDeleting: false,
              ),
            );
          },
        );
      },
      createDraft: (e) async {
        emit(state.copyWith(
          apiFailureOrSuccessOption: none(),
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
            final newList = List<SavedOrder>.from(state.savedOrders)
              ..insert(0, createDraftOrder);
            emit(
              state.copyWith(
                savedOrders: newList,
                apiFailureOrSuccessOption: none(),
                isCreating: false,
              ),
            );
          },
        );
      },
      updateDraft: (e) async {
        emit(state.copyWith(
          apiFailureOrSuccessOption: none(),
          isCreating: true,
        ));
        final failureOrSuccess = await repository.updateDraftOrder(
          shipToInfo: e.shipToInfo,
          user: e.user,
          cartItems: e.cartItems,
          grandTotal: e.grandTotal,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          data: e.data,
          orderId: e.orderId,
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
          (updatedDraftOrder) {
            final newList = state.savedOrders
                .map(
                  (order) => order.id == e.orderId ? updatedDraftOrder : order,
                )
                .toList();
            emit(
              state.copyWith(
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
