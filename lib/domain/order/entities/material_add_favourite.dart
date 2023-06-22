import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_add_favourite.freezed.dart';

@freezed
class MaterialAddFavourite with _$MaterialAddFavourite{
  const MaterialAddFavourite._();

  const factory MaterialAddFavourite({
    required int addFavouriteMaterial,
  }) = _MaterialAddFavourite;
}