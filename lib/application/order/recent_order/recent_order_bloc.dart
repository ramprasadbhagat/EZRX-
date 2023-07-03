import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/order/repository/i_recent_order_repository.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';

import 'package:ezrxmobile/domain/core/product_images/repository/i_product_images_repository.dart';

part 'recent_order_event.dart';
part 'recent_order_state.dart';
part 'recent_order_bloc.freezed.dart';

class RecentOrderBloc extends Bloc<RecentOrderEvent, RecentOrderState> {
  final IRecentOrderRepository recentOrderRepository;
  final IProductImagesRepository productImagesRepository;
  RecentOrderBloc({
    required this.recentOrderRepository,
    required this.productImagesRepository,
  }) : super(RecentOrderState.initial()) {
    on<RecentOrderEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    RecentOrderEvent event,
    Emitter<RecentOrderState> emit,
  ) async {
    await event.map(
      fetchRecentlyOrderedProducts: (_FetchRecentlyOrderedProducts e) async {
        emit(
          state.copyWith(
            isFetching: true,
            recentlyOrderedProducts: <RecentOrderItem>[],
          ),
        );

        final failureOrSuccess =
            await recentOrderRepository.getRecentlyOrderedProducts(
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (recentlyOrderedProductsList) {
            emit(
              state.copyWith(
                recentlyOrderedProducts: recentlyOrderedProductsList,
                isFetching: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
            add(
              RecentOrderEvent.fetchProductsFavouriteStatus(
                productList: recentlyOrderedProductsList,
                configs: e.configs,
              ),
            );
          },
        );
      },
      fetchProductsFavouriteStatus: (_FetchProductsFavouriteStatus e) async {
        final failureOrSuccess =
            await recentOrderRepository.fetchProductsFavouriteStatus(
          salesConfigs: e.configs,
          productList: e.productList,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (favouriteResponse) {
            emit(
              state.copyWith(
                recentlyOrderedProducts: favouriteResponse,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
            add(
              RecentOrderEvent.getProductImages(),
            );
          },
        );
      },
      addFavourite: (_AddFavourite e) async {
        final failureOrSuccess =
            await recentOrderRepository.addFavouriteProduct(
          materialCode: e.materialCode,
          productList: state.recentlyOrderedProducts,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (favouriteResponse) {
            emit(
              state.copyWith(
                recentlyOrderedProducts: favouriteResponse,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
      deleteFavourite: (_DeleteFavourite e) async {
        final failureOrSuccess =
            await recentOrderRepository.deleteFavouriteProduct(
          materialCode: e.materialCode,
          productList: state.recentlyOrderedProducts,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (favouriteResponse) {
            emit(
              state.copyWith(
                recentlyOrderedProducts: favouriteResponse,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
      getProductImages: (_GetProductImages e) async {
        final failureOrSuccess = await productImagesRepository.getProductImages(
          list: state.recentlyOrderedProducts,
        );

        await failureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (updatedListWithImages) async {
            emit(
              state.copyWith(
                recentlyOrderedProducts: updatedListWithImages
                    .map((e) => e as RecentOrderItem)
                    .toList(),
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
    );
  }
}
