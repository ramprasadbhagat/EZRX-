part of 'ship_to_code_bloc.dart';

@freezed
class ShipToCodeState with _$ShipToCodeState {
  const ShipToCodeState._();
  const factory ShipToCodeState({
    required ShipToInfo shipToInfo,
  }) = _ShipToCodeState;

  factory ShipToCodeState.initial() => ShipToCodeState(
        shipToInfo: ShipToInfo.empty(),
      );

  bool get haveShipTo => shipToInfo != ShipToInfo.empty();
}
