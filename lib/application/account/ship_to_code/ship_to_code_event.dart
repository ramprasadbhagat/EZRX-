part of 'ship_to_code_bloc.dart';

@freezed
class ShipToCodeEvent with _$ShipToCodeEvent {
  const factory ShipToCodeEvent.initialized() = _Initialized;
  const factory ShipToCodeEvent.selected({
    required ShipToInfo shipToInfo,
  }) = _Selected;

  const factory ShipToCodeEvent.load({
    required List<ShipToInfo> shipToInfos,
  }) = _Load;

  const factory ShipToCodeEvent.search({
    required List<ShipToInfo> shipToInfos,
  }) = _Search;

  const factory ShipToCodeEvent.updateSearchKey(String searchKey) =
      _UpdateSearchKey;
}
