part of 'recent_order_bloc.dart';

@freezed
class RecentOrderEvent with _$RecentOrderEvent {
  const factory RecentOrderEvent.fetchRecentlyOrderedProducts({
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _FetchRecentlyOrderedProducts;

  factory RecentOrderEvent.fetchProductsFavouriteStatus({
    required List<RecentOrderItem> productList,
    required SalesOrganisationConfigs configs,
  }) = _FetchProductsFavouriteStatus;

  factory RecentOrderEvent.addFavourite({
    required MaterialNumber materialCode,
  }) = _AddFavourite;

  factory RecentOrderEvent.deleteFavourite({
    required MaterialNumber materialCode,
  }) = _DeleteFavourite;
}