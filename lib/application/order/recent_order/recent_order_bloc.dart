import 'dart:async';

import 'package:ezrxmobile/domain/order/repository/i_favourites_repository.dart';
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

part 'recent_order_event.dart';
part 'recent_order_state.dart';
part 'recent_order_bloc.freezed.dart';

class RecentOrderBloc extends Bloc<RecentOrderEvent, RecentOrderState> {
  final IRecentOrderRepository recentOrderRepository;
  final IFavouriteRepository favouriteRepository;
  RecentOrderBloc({
    required this.recentOrderRepository,
    required this.favouriteRepository,
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
        final failureOrSuccess = await favouriteRepository.getFavouritesForList(
          salesConfigs: e.configs,
          list: e.productList,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (updatedFavouritesList) {
            emit(
              state.copyWith(
                recentlyOrderedProducts: updatedFavouritesList
                    .map((e) => e as RecentOrderItem)
                    .toList(),
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
      addFavourite: (_AddFavourite e) async {
        final failureOrSuccess = await favouriteRepository.addToFavourites(
          materialNumber: e.materialCode,
          list: state.recentlyOrderedProducts,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (updatedFavouritesList) {
            emit(
              state.copyWith(
                recentlyOrderedProducts: updatedFavouritesList
                    .map((e) => e as RecentOrderItem)
                    .toList(),
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
      deleteFavourite: (_DeleteFavourite e) async {
        final failureOrSuccess = await favouriteRepository.removeFromFavourites(
          materialNumber: e.materialCode,
          list: state.recentlyOrderedProducts,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (updatedFavouritesList) {
            emit(
              state.copyWith(
                recentlyOrderedProducts: updatedFavouritesList
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
