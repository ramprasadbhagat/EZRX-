part of 'bonus_material_bloc.dart';

@freezed
class BonusMaterialEvent with _$BonusMaterialEvent {
  const factory BonusMaterialEvent.initialized() = _Initialized;
  const factory BonusMaterialEvent.fetch({
    required User user,
    required SalesOrganisationConfigs configs,
    required String searchKey,
    required CustomerCodeInfo customerInfo,
    required ShipToInfo shipInfo,
    required SalesOrganisation salesOrganisation,
    required String pickAndPack,
  }) = _Fetch;

  const factory BonusMaterialEvent.updateSearchKey({
    required String searchKey,
  }) = _UpdateSearchKey;
  const factory BonusMaterialEvent.reset() = _Reset;
}
