part of 'favourite_bloc.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState({
    required List<Favourite> favouriteItems,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
  }) = _FavouriteState;

  factory FavouriteState.initial() => FavouriteState(
        failureOrSuccessOption: none(),
        isLoading: false,
        favouriteItems: <Favourite>[],
      );
}
