part of 'ship_to_code_bloc.dart';

@freezed
class ShipToCodeState with _$ShipToCodeState {
  const ShipToCodeState._();
  const factory ShipToCodeState({
    required List<ShipToInfo> shipToInfoList,
    required ShipToInfo shipToInfo,
    required bool isSearching,
    required SearchKey searchKey,
  }) = _ShipToCodeState;

  factory ShipToCodeState.initial() => ShipToCodeState(
        shipToInfoList: <ShipToInfo>[],
        shipToInfo: ShipToInfo.empty(),
        isSearching: false,
        searchKey: SearchKey(''),
      );

  bool get haveShipTo => shipToInfo != ShipToInfo.empty();
}
