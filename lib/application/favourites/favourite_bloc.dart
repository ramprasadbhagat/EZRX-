import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/favourites/repository/i_favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_bloc.freezed.dart';
part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final IFavouriteRepository favouriteRepository;

  FavouriteBloc({
    required this.favouriteRepository,
  }) : super(FavouriteState.initial()) {
    on<FavouriteEvent>(_onEvent);
  }

  Future<void> _onEvent(
    FavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(FavouriteState.initial()),
      fetch: (e) async {
        emit(state.copyWith(failureOrSuccessOption: none(), isLoading: true));

        final failureOrSuccess = await favouriteRepository.getFavourites(
          user: e.user,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
            ));
          },
          (favouriteItems) {
            emit(
              state.copyWith(
                favouriteItems: favouriteItems,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      add: (e) async {
        emit(state.copyWith(failureOrSuccessOption: none(), isLoading: true));

        final failureOrSuccess = await favouriteRepository.addFavourites(
          user: e.user, // userBloc.state.user,
          isPackAndPick: e.isPackAndPick,
          item: e.item,
          favouriteItems: state.favouriteItems,
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
          (favouriteItems) {
            emit(
              state.copyWith(
                favouriteItems: favouriteItems,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      delete: (e) async {
        emit(state.copyWith(failureOrSuccessOption: none(), isLoading: true));

        final failureOrSuccess = await favouriteRepository.deleteFavourites(
          item: e.item,
          favouriteItems: state.favouriteItems,
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
          (favouriteItems) {
            emit(
              state.copyWith(
                favouriteItems: favouriteItems,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> close() async {
    // await _shipToBlocSubscription.cancel();

    return super.close();
  }

  @override
  void onChange(Change<FavouriteState> change) {
    super.onChange(change);
    // print(change);
  }
}
