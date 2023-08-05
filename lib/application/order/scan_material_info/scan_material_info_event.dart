part of 'scan_material_info_bloc.dart';

@freezed
class ScanMaterialInfoEvent with _$ScanMaterialInfoEvent {
  const factory ScanMaterialInfoEvent.initialized() = _initialized;
  const factory ScanMaterialInfoEvent.scanMaterialNumberFromCamera({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _scanMaterialNumberFromCamera;
  const factory ScanMaterialInfoEvent.disableScan() = _disableScan;
  const factory ScanMaterialInfoEvent.scanImageFromDeviceStorage({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _scanImageFromDeviceStorage;
  const factory ScanMaterialInfoEvent.emitScannedData({
    required String scannedRes,
  }) = _emitScannedData;
}
