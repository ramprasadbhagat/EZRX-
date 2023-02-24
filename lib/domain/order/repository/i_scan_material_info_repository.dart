import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

abstract class IScanMaterialInfoRepository {
  Future<void> scanMaterialNumberFromdeviceCamera();
  Future<void> disableMaterialScan();
  Future<void> scanImageFromDeviceStorage();
  BarcodeCapture fetchBarcodeCapture();
  DataCaptureView dataCaptureView();
}
