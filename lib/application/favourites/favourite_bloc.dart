import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/favourites/repository/i_favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';
part 'favourite_bloc.freezed.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final IFavouriteRepository favouriteRepository;
  // final ShipToCodeBloc shipToCodeBloc;
  // late final StreamSubscription _shipToBlocSubscription;
  FavouriteBloc({
    required this.favouriteRepository,
    // required this.shipToCodeBloc,
  }) : super(FavouriteState.initial()) {
    on<FavouriteEvent>(_onEvent);

    // if (shipToCodeBloc.state.shipToInfo != ShipToInfo.empty()) {
    add(const FavouriteEvent.fetch());
    // }
    // _shipToBlocSubscription = shipToCodeBloc.stream.listen((state) {
    //   if (state.shipToInfo == ShipToInfo.empty()) {
    //     add(const FavouriteEvent.initialized());
    //   } else {
    //     add(const FavouriteEvent.fetch());
    //   }
    // });
  }

  Future<void> _onEvent(
    FavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(FavouriteState.initial()),
      fetch: (_) async {
        emit(state.copyWith(failureOrSuccessOption: none(), isLoading: true));

        final failureOrSuccess = await favouriteRepository.getFavourites();
        failureOrSuccess.fold(
          (failure) {
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
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
      add: (e) async {
        emit(state.copyWith(failureOrSuccessOption: none(), isLoading: true));

        final failureOrSuccess = await favouriteRepository.addFavourites(
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
