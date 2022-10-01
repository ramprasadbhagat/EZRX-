part of 'favourite_bloc.dart';

@freezed
class FavouriteEvent with _$FavouriteEvent {
  const factory FavouriteEvent.initialized() = _Initialized;
  const factory FavouriteEvent.fetch() = _Fetch;
  const factory FavouriteEvent.add(Favourite item, bool isPackAndPick) = _Add;
  const factory FavouriteEvent.delete(Favourite item) = _Delete;
}
