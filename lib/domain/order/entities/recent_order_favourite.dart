import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_order_favourite.freezed.dart';

@freezed
class RecentOrderFavouriteStatus with _$RecentOrderFavouriteStatus {
  const RecentOrderFavouriteStatus._();

  const factory RecentOrderFavouriteStatus({
    required bool isFavourite,
  }) = _RecentOrderFavouriteStatus;

  factory RecentOrderFavouriteStatus.empty() => const RecentOrderFavouriteStatus(
        isFavourite: false,
      );

}
