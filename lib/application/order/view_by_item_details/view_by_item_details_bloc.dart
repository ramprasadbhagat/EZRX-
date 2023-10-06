import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_details_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_status_tracker_repository.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
part 'view_by_item_details_event.dart';
part 'view_by_item_details_state.dart';
part 'view_by_item_details_bloc.freezed.dart';

class ViewByItemDetailsBloc
    extends Bloc<ViewByItemDetailsEvent, ViewByItemDetailsState> {
  final IViewByItemDetailsRepository viewByItemDetailsRepository;
  final IOrderStatusTrackerRepository orderStatusTrackerRepository;

  ViewByItemDetailsBloc({
    required this.viewByItemDetailsRepository,
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
      fetch: (e) async {
        emit(
          ViewByItemDetailsState.initial().copyWith(
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await viewByItemDetailsRepository.getViewByItemDetails(
          soldTo: e.soldTo,
          user: e.user,
          orderNumber: e.orderNumber,
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
          (viewByItemDetails) {
            final orderHistoryItem =
                viewByItemDetails.orderHistoryItems.isNotEmpty
                    ? viewByItemDetails.orderHistoryItems.firstWhere(
                        (element) => element.materialNumber == e.materialNumber,
                      )
                    : OrderHistoryItem.empty();
            final modifiedList = viewByItemDetails.orderHistoryItems
                .where(
                  (element) => element.materialNumber != e.materialNumber,
                )
                .toList();
            emit(
              state.copyWith(
                viewByItemDetails: viewByItemDetails.copyWith(
                  orderHistoryItems: modifiedList,
                ),
                orderHistoryItem: orderHistoryItem,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
            if (!e.disableDeliveryDateForZyllemStatus &&
                orderHistoryItem.status.getDisplayZyllemStatus) {
              add(
                const _FetchZyllemStatus(),
              );
            }
          },
        );
      },
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
