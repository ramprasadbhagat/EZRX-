import 'package:ezrxmobile/domain/order/entities/material_remove_favourite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_remove_favourite_dto.freezed.dart';
part 'material_remove_favourite_dto.g.dart';

@freezed
class MaterialRemoveFavouriteDto with _$MaterialRemoveFavouriteDto {
  const MaterialRemoveFavouriteDto._();
  const factory MaterialRemoveFavouriteDto({
    @JsonKey(name: 'removeFavouriteMaterial', defaultValue: 0)
        required int removeFavouriteMaterial,
  }) = _MaterialRemoveFavouriteDto;

  MaterialRemoveFavourite toDomain() {
    return MaterialRemoveFavourite(
      removeFavouriteMaterial: removeFavouriteMaterial,
    );
  }

  factory MaterialRemoveFavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialRemoveFavouriteDtoFromJson(json);
}
