import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/repository/i_product_images_repository.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_details_event.dart';
part 'view_by_order_details_state.dart';
part 'view_by_order_details_bloc.freezed.dart';

class ViewByOrderDetailsBloc
    extends Bloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState> {
  final IViewByOrderDetailsRepository viewByOrderDetailsRepository;
  final IProductImagesRepository productImagesRepository;

  ViewByOrderDetailsBloc({
    required this.viewByOrderDetailsRepository,
    required this.productImagesRepository,
  }) : super(ViewByOrderDetailsState.initial()) {
    on<ViewByOrderDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ViewByOrderDetailsEvent event,
    Emitter<ViewByOrderDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ViewByOrderDetailsState.initial()),
      fetch: (e) async {
        emit(
          ViewByOrderDetailsState.initial().copyWith(
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await viewByOrderDetailsRepository.getViewByOrderDetails(
          user: e.user,
          orderHeader: e.orderHeader,
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
            add(const _FetchProductImage());
          },
        );
      },
      fetchProductImage: (e) async {
        emit(
          state.copyWith(
            isImageLoading: true,
          ),
        );

        final failureOrSuccess = await productImagesRepository.getProductImages(
          list: state.orderHistoryDetails.orderHistoryDetailsOrderItem,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isImageLoading: false,
            ),
          ),
          (updatedListWithImages) {
            emit(
              state.copyWith(
                orderHistoryDetails: state.orderHistoryDetails.copyWith(
                  orderHistoryDetailsOrderItem: updatedListWithImages
                      .map((e) => e as OrderHistoryDetailsOrderItem)
                      .toList(),
                ),
                failureOrSuccessOption: none(),
                isImageLoading: false,
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
