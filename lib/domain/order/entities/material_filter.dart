import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_filter.freezed.dart';

@freezed
class MaterialFilter with _$MaterialFilter {
  const MaterialFilter._();

  const factory MaterialFilter({
    @Default(false) bool isFavourite,
    @Default(false) bool isFOCMaterial,
    @Default(false) bool bundleOffers,
    @Default(false) bool comboOffers,
    @Default(false) bool isProductOffer,
    @Default(Sort.az) Sort sortBy,
    required Map<String, bool> manufactureMapOptions,
    required Map<MaterialFilterCountry, bool> countryMapOptions,
    required List<String> brandList,
    @Default(<String>[]) List<String> manufactureListSelected,
    @Default(<MaterialFilterCountry>[])
        List<MaterialFilterCountry> countryListSelected,
  }) = _MaterialFilter;

  factory MaterialFilter.empty() => const MaterialFilter(
        sortBy: Sort.az,
        manufactureMapOptions: <String, bool>{},
        countryMapOptions: <MaterialFilterCountry, bool>{},
        brandList: <String>[],
        manufactureListSelected: <String>[],
        countryListSelected: <MaterialFilterCountry>[],
      );
}

@freezed
class MaterialFilterCountry with _$MaterialFilterCountry {
  const MaterialFilterCountry._();

  const factory MaterialFilterCountry({
    required String code,
    required String name,
  }) = _MaterialFilterCountry;

  factory MaterialFilterCountry.empty() => const MaterialFilterCountry(
        code: '',
        name: '',
      );
}
