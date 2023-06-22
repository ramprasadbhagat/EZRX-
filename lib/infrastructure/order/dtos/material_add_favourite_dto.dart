import 'package:ezrxmobile/domain/order/entities/material_add_favourite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_add_favourite_dto.freezed.dart';
part 'material_add_favourite_dto.g.dart';

@freezed
class MaterialAddFavouriteDto with _$MaterialAddFavouriteDto {
  const MaterialAddFavouriteDto._();
  const factory MaterialAddFavouriteDto({
    @JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
        required int addFavouriteMaterial,
  }) = _MaterialAddFavouriteDto;

  MaterialAddFavourite toDomain() {
    return MaterialAddFavourite(
      addFavouriteMaterial: addFavouriteMaterial,
    );
  }

  factory MaterialAddFavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialAddFavouriteDtoFromJson(json);
}
