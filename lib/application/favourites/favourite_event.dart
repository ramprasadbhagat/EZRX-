part of 'favourite_bloc.dart';

@freezed
class FavouriteEvent with _$FavouriteEvent {
  const factory FavouriteEvent.initialized() = _Initialized;
  const factory FavouriteEvent.fetch({required User user}) = _Fetch;
  const factory FavouriteEvent.add({
    required Favourite item,
    required bool isPackAndPick,
    required User user,
  }) = _Add;
  const factory FavouriteEvent.delete({
    required Favourite item,
    required User user,
  }) = _Delete;
}
