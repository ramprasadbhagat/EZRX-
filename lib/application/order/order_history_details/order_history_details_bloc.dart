import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_event.dart';
part 'order_history_details_state.dart';
part 'order_history_details_bloc.freezed.dart';

class OrderHistoryDetailsBloc
    extends Bloc<OrderHistoryDetailsEvent, OrderHistoryDetailsState> {
  final IOrderHistoryDetailsRepository orderHistoryDetailsRepository;
  OrderHistoryDetailsBloc({
    required this.orderHistoryDetailsRepository,
  }) : super(OrderHistoryDetailsState.initial()) {
    on<OrderHistoryDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OrderHistoryDetailsEvent event,
    Emitter<OrderHistoryDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(OrderHistoryDetailsState.initial()),
      fetch: (e) async {
        emit(
          OrderHistoryDetailsState.initial().copyWith(
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await orderHistoryDetailsRepository.getOrderHistoryDetails(
          user: e.user,
          orderHistoryItem: e.orderHistoryItem,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
                showErrorMessage: true,
              ),
            );
          },
          (orderHistoryDetails) {
            emit(
              state.copyWith(
                orderHistoryDetails: orderHistoryDetails,
                failureOrSuccessOption: none(),
                isLoading: false,
                materials: {
                  for (final item in orderHistoryDetails.items)
                    item.orderItem.queryInfo: item.toPriceAggregate,
                },
                isLoadingTenderContract: {
                  for (final item in orderHistoryDetails.items)
                    if (item.orderItem.isTenderContractMaterial)
                      item.orderItem.queryInfo: true,
                },
              ),
            );
          },
        );
      },
      updateMaterialTenderContract: (e) async {
        final materialsWithUpdatedTenderContract = state.materials.map(
          (queryInfo, material) {
            if (queryInfo == e.queryInfo) {
              return MapEntry(
                queryInfo,
                material.copyWith(tenderContract: e.selectedTenderContract),
              );
            }

            return MapEntry(queryInfo, material);
          },
        );

        final loadingTenderContractStatus = state.isLoadingTenderContract.map(
          (queryInfo, isLoading) {
            if (queryInfo == e.queryInfo) return MapEntry(queryInfo, false);

            return MapEntry(queryInfo, isLoading);
          },
        );

        emit(
          state.copyWith(
            materials: materialsWithUpdatedTenderContract,
            isLoadingTenderContract: loadingTenderContractStatus,
          ),
        );
      },
    );
  }
}
