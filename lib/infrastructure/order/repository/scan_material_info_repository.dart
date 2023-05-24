import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
// ignore: depend_on_referenced_packages
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'package:ezrxmobile/domain/order/repository/i_scan_material_info_repository.dart';

import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';

import 'dart:io';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

class ScanMaterialInfoRepository implements IScanMaterialInfoRepository {
  final MaterialInfoScanner materialInfoScanner;
  final MixpanelService mixpanelService;
  final FilePickerService filePickerService;

  ScanMaterialInfoRepository({
    required this.materialInfoScanner,
    required this.mixpanelService,
    required this.filePickerService,
  });

  @override
  DataCaptureView dataCaptureView() {
    return materialInfoScanner.dataCaptureView;
  }

  @override
  BarcodeCapture fetchBarcodeCapture() {
    return materialInfoScanner.barcodeCapture;
  }

  @override
  Future<Either<ApiFailure, bool>> scanMaterialNumberFromDeviceCamera() async {
    try {
      await materialInfoScanner.camera
          ?.switchToDesiredState(FrameSourceState.on);
      materialInfoScanner.barcodeCapture.isEnabled = true;

      mixpanelService.trackEvent(
        eventName: MixpanelEvents.productScannedSuccess,
        properties: {
          MixpanelProps.scanFrom: 'camera',
        },
      );

      return const Right(true);
    } catch (e) {
      mixpanelService.trackEvent(
        eventName: MixpanelEvents.productScannedFailed,
        properties: {
          MixpanelProps.scanFrom: 'camera',
          MixpanelProps.errorMessage: e.toString(),
        },
      );

      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> scanImageFromDeviceStorage() async {
    try {
      final result = await filePickerService.pickFiles();
      if (result != null) {
        final file = File(result.files.single.path!);
        final bytes = await file.readAsBytes();
        final source = ImageFrameSource.create(bytes);
        await materialInfoScanner.scanMaterialNumberfromDeviceStorage(source);
        await source.switchToDesiredState(FrameSourceState.on);
      }
      materialInfoScanner.barcodeCapture.isEnabled = true;

      mixpanelService.trackEvent(
        eventName: MixpanelEvents.productScannedSuccess,
        properties: {
          MixpanelProps.scanFrom: 'gallery',
        },
      );

      return const Right(true);
    } catch (e) {
      mixpanelService.trackEvent(
        eventName: MixpanelEvents.productScannedFailed,
        properties: {
          MixpanelProps.scanFrom: 'gallery',
          MixpanelProps.errorMessage: e.toString(),
        },
      );

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
