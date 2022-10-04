part of 'ship_to_code_bloc.dart';

@freezed
class ShipToCodeEvent with _$ShipToCodeEvent {
  const factory ShipToCodeEvent.initialized() = _Initialized;
  const factory ShipToCodeEvent.selected({
    required ShipToInfo shipToInfo,
  }) = _Selected;
}
