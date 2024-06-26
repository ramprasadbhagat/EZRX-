import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_repository.dart';
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
      initialized: (e) async => emit(
        ViewByItemDetailsState.initial().copyWith(
          customerCodeInfo: e.customerCodeInfo,
          salesOrgConfig: e.salesOrgConfig,
          salesOrganisation: e.salesOrganisation,
          user: e.user,
          shipToInfo: e.shipToInfo,
        ),
      ),
      fetchOrdersInvoiceData: (e) async {
        final orderNumbers =
            e.orderHistoryItems.map((e) => e.orderNumber).toList();

        if (orderNumbers.isEmpty) return;

        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await viewByItemRepository.getOrdersInvoiceData(
          orderNumbers: orderNumbers,
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
          (invoiceDataMap) {
            final orderHistoryItemsList = List<OrderHistoryItem>.from(
              state.orderHistory.orderHistoryItems,
            )
                .map(
                  (orderItem) => orderItem.copyWith(
                    invoiceNumber:
                        invoiceDataMap[orderItem.hashId]?.invoiceNumber ??
                            orderItem.invoiceNumber,
                  ),
                )
                .toList();

            emit(
              state.copyWith(
                orderHistory: state.orderHistory.copyWith(
                  orderHistoryItems: orderHistoryItemsList,
                ),
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      fetchZyllemStatus: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
        final failureOrSuccess = await orderStatusTrackerRepository
            .getOrderStatusTracker(invoiceNumber: e.invoiceNumber);

        await failureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
            ),
          ),
          (orderHistoryStatuses) {
            emit(
              state.copyWith(
                orderHistoryStatuses: orderHistoryStatuses,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      fetchOrderHistoryDetails: (e) async {
        final searchKey = SearchKey(e.orderNumber.getOrDefaultValue(''));
        if (searchKey.isInvalidSearchKey) return;

        emit(
          state.copyWith(
            isDetailsLoading: true,
          ),
        );

        final failureOrSuccess =
            await viewByItemRepository.getViewByItemDetails(
          soldTo: state.customerCodeInfo,
          user: state.user,
          searchKey: searchKey,
          salesOrganisation: state.salesOrganisation,
          salesOrgConfig: state.salesOrgConfig,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isDetailsLoading: false,
              ),
            );
          },
          (orderHistory) {
            final orderHistoryItem =
                orderHistory.orderHistoryItems.firstWhereOrNull(
                      (item) => item.lineNumber == e.lineNumber,
                    ) ??
                    orderHistory.orderHistoryItems.first;
            emit(
              state.copyWith(
                orderHistory: orderHistory,
                orderHistoryItem: orderHistoryItem,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isDetailsLoading: false,
              ),
            );
            add(
              _FetchOrdersInvoiceData(
                orderHistoryItems: orderHistory.orderHistoryItems,
              ),
            );
            if (orderHistoryItem.invoiceNumber.isNotEmpty) {
              add(
                _FetchZyllemStatus(
                  invoiceNumber: orderHistoryItem.invoiceNumber,
                ),
              );
            }
          },
        );
      },
      updateIsExpanded: (e) async =>
          emit(state.copyWith(isExpanded: e.isExpanded)),
    );
  }
}
