import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_status_tracker_repository.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

part 'view_by_item_details_event.dart';
part 'view_by_item_details_state.dart';
part 'view_by_item_details_bloc.freezed.dart';

class ViewByItemDetailsBloc
    extends Bloc<ViewByItemDetailsEvent, ViewByItemDetailsState> {
  final IOrderStatusTrackerRepository orderStatusTrackerRepository;
  final IViewByItemRepository viewByItemRepository;

  ViewByItemDetailsBloc({
    required this.orderStatusTrackerRepository,
    required this.viewByItemRepository,
  }) : super(ViewByItemDetailsState.initial()) {
    on<ViewByItemDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ViewByItemDetailsEvent event,
    Emitter<ViewByItemDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ViewByItemDetailsState.initial()),
      searchOrderHistory: (e) async {
        if (!e.searchKey.validateNotEmpty || !e.searchKey.isValid()) return;

        emit(
          state.copyWith(
            isLoading: true,
            orderHistory: OrderHistory.empty(),
            orderHistoryItem: OrderHistoryItem.empty(),
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await viewByItemRepository.searchOrderHistory(
          soldTo: e.customerCodeInfo,
          user: e.user,
          searchKey: e.searchKey,
          salesOrganisation: e.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (orderHistory) {
            emit(
              state.copyWith(
                orderHistory: orderHistory,
                orderHistoryItem: orderHistory.orderHistoryItems.firstOrNull ??
                    state.orderHistoryItem,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
            if (!e.disableDeliveryDateForZyllemStatus &&
                state.orderHistoryItem.status.getDisplayZyllemStatus) {
              add(
                const _FetchZyllemStatus(),
              );
            }
          },
        );
      },
      setItemOrderDetails: (e) {
        final modifiedList = e.orderHistory.orderHistoryItems
            .where(
              (element) =>
                  element.hashCode != e.orderHistoryItem.hashCode &&
                  element.orderNumber == e.orderHistoryItem.orderNumber,
            )
            .toList();
        emit(
          state.copyWith(
            orderHistory: e.orderHistory.copyWith(
              orderHistoryItems: modifiedList,
            ),
            orderHistoryItem: e.orderHistoryItem,
          ),
        );
        if (!e.disableDeliveryDateForZyllemStatus &&
            e.orderHistoryItem.status.getDisplayZyllemStatus) {
          add(
            const _FetchZyllemStatus(),
          );
        }
      },
      fetchZyllemStatus: (e) async {
        final failureOrSuccess =
            await orderStatusTrackerRepository.getOrderStatusTracker();

        await failureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (updatedListWithStatus) {
            emit(
              state.copyWith(
                orderHistory: state.orderHistory.copyWith(
                  orderHistoryItems: state.orderHistory.orderHistoryItems
                      .map(
                        (e) => e.copyWith(
                          orderStatusTracker: updatedListWithStatus,
                        ),
                      )
                      .toList(),
                ),
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      updateIsExpanded: (e) async =>
          emit(state.copyWith(isExpanded: e.isExpanded)),
    );
  }
}
