import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_details_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_details_event.dart';
part 'view_by_order_details_state.dart';
part 'view_by_order_details_bloc.freezed.dart';

class ViewByOrderDetailsBloc
    extends Bloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState> {
  final IViewByOrderDetailsRepository viewByOrderDetailsRepository;
  final IProductDetailRepository productDetailRepository;

  ViewByOrderDetailsBloc({
    required this.viewByOrderDetailsRepository,
    required this.productDetailRepository,
  }) : super(ViewByOrderDetailsState.initial()) {
    on<ViewByOrderDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ViewByOrderDetailsEvent event,
    Emitter<ViewByOrderDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(
        ViewByOrderDetailsState.initial().copyWith(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          user: e.user,
        ),
      ),
      fetch: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await viewByOrderDetailsRepository.getViewByOrderDetails(
          user: state.user,
          orderNumber: e.orderNumber,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
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
          (orderHistoryDetails) {
            emit(
              state.copyWith(
                orderHistoryDetails: orderHistoryDetails,
                failureOrSuccessOption: optionOf(failureOrSuccess),
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
      setOrderDetails: (e) {
        emit(
          state.copyWith(
            orderHistoryDetails: e.orderHistoryDetails,
            materials: {
              for (final item in e.orderHistoryDetails.items)
                item.orderItem.queryInfo: item.toPriceAggregate,
            },
            isLoadingTenderContract: {
              for (final item in e.orderHistoryDetails.items)
                if (item.orderItem.isTenderContractMaterial)
                  item.orderItem.queryInfo: true,
            },
          ),
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
      expandAttachments: (e) {
        emit(
          state.copyWith(
            isExpanded: !state.isExpanded,
            orderHistoryDetails: state.orderHistoryDetails,
          ),
        );
      },
    );
  }
}
