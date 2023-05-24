import 'package:dartz/dartz.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
// ignore: depend_on_referenced_packages
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IScanMaterialInfoRepository {
  Future<Either<ApiFailure, bool>> scanMaterialNumberFromDeviceCamera();
  Future<Either<ApiFailure, bool>> disableMaterialScan();
  Future<Either<ApiFailure, bool>> scanImageFromDeviceStorage();
  BarcodeCapture fetchBarcodeCapture();
  DataCaptureView dataCaptureView();
}
