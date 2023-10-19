import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
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

  Map<String, dynamic> get trackingInfo {
    final showProductFilter = <String>[];
    if (isFavourite) showProductFilter.add('Favourites');
    if (isProductOffer) showProductFilter.add('Items with offers');
    if (bundleOffers) showProductFilter.add('Bundle offers');

    return {
      if (showProductFilter.isNotEmpty)
        MixpanelProps.filterShowProduct: showProductFilter,
      MixpanelProps.filterSortBy: sortBy.title,
      if (manufactureListSelected.isNotEmpty)
        MixpanelProps.filterManufacturer: manufactureListSelected,
      if (countryListSelected.isNotEmpty)
        MixpanelProps.filterCountryOfOrigin:
            countryListSelected.map((e) => e.name).toList(),
    };
  }
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
