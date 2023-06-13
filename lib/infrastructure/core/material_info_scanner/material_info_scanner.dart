import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
// ignore: depend_on_referenced_packages
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'package:ezrxmobile/config.dart';

class MaterialInfoScanner {
  final Config config;
  MaterialInfoScanner({required this.config});

  late Camera? _camera;
  late CameraSettings _cameraSettings;
  late BarcodeCaptureSettings _barcodeCaptureSettings;
  late DataCaptureContext _dataCaptureContext;
  late BarcodeCapture _barcodeCapture;
  late DataCaptureView _dataCaptureView;
  late BarcodeCaptureOverlay _overlay;

  DataCaptureContext get dataCaptureContext {
    return _dataCaptureContext;
  }

  BarcodeCapture get barcodeCapture {
    return _barcodeCapture;
  }

  Camera? get camera {
    return _camera;
  }

  DataCaptureView get dataCaptureView {
    return _dataCaptureView;
  }

  void switchCameraOff() {
    _camera?.switchToDesiredState(FrameSourceState.off);
  }

  void enableSymbologies(List<Symbology> symbologies) {
    _barcodeCaptureSettings.enableSymbologies(symbologies.toSet());
  }

  void applyCameraSettings() {
    _camera?.applySettings(_cameraSettings);
  }

  void applyBarcodeCaptureSettings() {
    _barcodeCapture.applySettings(_barcodeCaptureSettings);
  }

  Future<void> init() async {
    _camera = Camera.defaultCamera;
    _cameraSettings = BarcodeCapture.recommendedCameraSettings;
    _barcodeCaptureSettings = BarcodeCaptureSettings();
    await _camera?.applySettings(_cameraSettings);

    _dataCaptureContext =
        DataCaptureContext.forLicenseKey(config.scanditLicenseKey);

    if (_camera != null) await _dataCaptureContext.setFrameSource(_camera!);

    enableSymbologies(config.enabledSymbologies);
    _barcodeCaptureSettings.locationSelection =
        RectangularLocationSelection.withSize(
      SizeWithUnit(
        DoubleWithUnit(0.9, MeasureUnit.fraction),
        DoubleWithUnit(0.1, MeasureUnit.fraction),
      ),
    );
    _barcodeCapture =
        BarcodeCapture.forContext(_dataCaptureContext, _barcodeCaptureSettings);

    _dataCaptureView = DataCaptureView.forContext(dataCaptureContext);

    _overlay = BarcodeCaptureOverlay.withBarcodeCaptureForViewWithStyle(
      _barcodeCapture,
      _dataCaptureView,
      BarcodeCaptureOverlayStyle.frame,
    );
    _overlay.shouldShowScanAreaGuides = true;
  }

  Future<void> scanMaterialNumberfromDeviceStorage(ImageFrameSource source) async {
    _dataCaptureContext =
        DataCaptureContext.forLicenseKey(config.scanditLicenseKey);
    await _dataCaptureContext.setFrameSource(source);

    final imageFrameSourceSettings = BarcodeCaptureSettings();

    imageFrameSourceSettings.enableSymbologies(config.enabledSymbologies.toSet());


    _barcodeCapture =
        BarcodeCapture.forContext(_dataCaptureContext, imageFrameSourceSettings);

    _dataCaptureView = DataCaptureView.forContext(dataCaptureContext);

    _overlay = BarcodeCaptureOverlay.withBarcodeCaptureForViewWithStyle(
      _barcodeCapture,
      _dataCaptureView,
      BarcodeCaptureOverlayStyle.frame,
    );
  }
}
