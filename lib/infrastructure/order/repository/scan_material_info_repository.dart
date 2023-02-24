import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'package:ezrxmobile/domain/order/repository/i_scan_material_info_repository.dart';

import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';

import 'dart:io';

import 'package:file_picker/file_picker.dart';

class ScanMaterialInfoRepository implements IScanMaterialInfoRepository {
  final MaterialInfoScanner materialInfoScanner;

  ScanMaterialInfoRepository({required this.materialInfoScanner});

  @override
  DataCaptureView dataCaptureView() {
    return materialInfoScanner.dataCaptureView;
  }

  @override
  BarcodeCapture fetchBarcodeCapture() {
    return materialInfoScanner.barcodeCapture;
  }

  @override
  Future<void> scanMaterialNumberFromdeviceCamera() async {
    await materialInfoScanner.camera?.switchToDesiredState(FrameSourceState.on);
    materialInfoScanner.barcodeCapture.isEnabled = true;
  }

  @override
  Future<void> scanImageFromDeviceStorage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
      );
      if (result != null) {
        final file = File(result.files.single.path!);
        final bytes = await file.readAsBytes();
        final source = ImageFrameSource.create(bytes);
        await materialInfoScanner.scanMaterialNumberfromDeviceStorage(source);
        await source.switchToDesiredState(FrameSourceState.on);
      }
      materialInfoScanner.barcodeCapture.isEnabled = true;
    } catch (e) {}
  }

  @override
  Future<void> disableMaterialScan() async {
    await materialInfoScanner.camera
        ?.switchToDesiredState(FrameSourceState.off);
  }
}
