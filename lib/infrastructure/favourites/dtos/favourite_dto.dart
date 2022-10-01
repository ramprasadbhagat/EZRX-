import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_dto.freezed.dart';
part 'favourite_dto.g.dart';

@freezed
class FavouriteDto with _$FavouriteDto {
  const FavouriteDto._();

  const factory FavouriteDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'isTenderContract', defaultValue: false)
        required bool isTenderContract,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'isFOC', defaultValue: false) required bool isFOC,
  }) = _FavouriteDto;

  factory FavouriteDto.fromDomain(Favourite item) {
    return FavouriteDto(
      id: item.id,
      isFOC: item.isFOC,
      isTenderContract: item.isTenderContract,
      materialDescription: item.materialDescription,
      materialNumber: item.materialNumber.getOrCrash(),
    );
  }

  Favourite toDomain() {
    return Favourite(
      id: id,
      isFOC: isFOC,
      isTenderContract: isTenderContract,
      materialDescription: materialDescription,
      materialNumber: MaterialNumber(materialNumber),
    );
  }

  factory FavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$FavouriteDtoFromJson(json);
}
