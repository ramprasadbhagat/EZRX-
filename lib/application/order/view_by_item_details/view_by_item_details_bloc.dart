import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
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

  ViewByItemDetailsBloc({
    required this.orderStatusTrackerRepository,
  }) : super(ViewByItemDetailsState.initial()) {
    on<ViewByItemDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ViewByItemDetailsEvent event,
    Emitter<ViewByItemDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ViewByItemDetailsState.initial()),
      setItemOrderDetails: (e) {
        final modifiedList = e.viewByItems.orderHistoryItems
            .where(
              (element) =>
                  element.hashCode != e.orderHistoryItem.hashCode &&
                  element.orderNumber == e.orderHistoryItem.orderNumber,
            )
            .toList();
        emit(
          state.copyWith(
            viewByItemDetails: e.viewByItems.copyWith(
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
                viewByItemDetails: state.viewByItemDetails.copyWith(
                  orderHistoryItems: state.viewByItemDetails.orderHistoryItems
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
