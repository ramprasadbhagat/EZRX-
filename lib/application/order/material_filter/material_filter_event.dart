part of 'material_filter_bloc.dart';

@freezed
class MaterialFilterEvent with _$MaterialFilterEvent {
  const factory MaterialFilterEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisationConfigs salesOrgConfig,
  }) = _fetch;
  const factory MaterialFilterEvent.updateMaterialSelected(
    MaterialFilterType filterType,
    String selectedFilter,
  ) = _updateMaterialSelected;
  const factory MaterialFilterEvent.updateSearchKey(String searchkey) =
      _updateSearchKey;
}

enum MaterialFilterType {
  principal,
  therapeutic,
  brand,
}
