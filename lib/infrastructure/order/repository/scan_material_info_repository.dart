import 'package:dartz/dartz.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
// ignore: depend_on_referenced_packages
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'package:ezrxmobile/domain/order/repository/i_scan_material_info_repository.dart';

import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';

import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

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
  Future<Either<ApiFailure, bool>> scanMaterialNumberFromdeviceCamera() async {
    try {
      await materialInfoScanner.camera
          ?.switchToDesiredState(FrameSourceState.on);
      materialInfoScanner.barcodeCapture.isEnabled = true;

      return const Right(true);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> scanImageFromDeviceStorage() async {
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

      return const Right(true);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> disableMaterialScan() async {
    try {
      await materialInfoScanner.camera
          ?.switchToDesiredState(FrameSourceState.off);

      return const Right(true);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
