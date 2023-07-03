import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_favourite.dart';

part 'recent_order_favourite_dto.freezed.dart';
part 'recent_order_favourite_dto.g.dart';

@freezed
class RecentOrderFavouriteDto with _$RecentOrderFavouriteDto {
  const RecentOrderFavouriteDto._();

  factory RecentOrderFavouriteDto({
    @JsonKey(name: 'isFavourite', defaultValue: false)
        required bool isFavourite,
  }) = _RecentOrderFavouriteDto;

  factory RecentOrderFavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$RecentOrderFavouriteDtoFromJson(json);

  RecentOrderFavouriteStatus toDomain() =>
      RecentOrderFavouriteStatus(isFavourite: isFavourite);
}
