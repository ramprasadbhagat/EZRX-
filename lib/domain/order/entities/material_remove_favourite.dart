import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_remove_favourite.freezed.dart';

@freezed
class MaterialRemoveFavourite with _$MaterialRemoveFavourite{
  const MaterialRemoveFavourite._();

  const factory MaterialRemoveFavourite({
    required int removeFavouriteMaterial,
  }) = _MaterialRemoveFavourite;
}