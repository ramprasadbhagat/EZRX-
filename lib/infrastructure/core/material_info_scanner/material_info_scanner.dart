import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
// ignore: depend_on_referenced_packages
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'package:ezrxmobile/config.dart';

class MaterialInfoScanner {
  final Config config;
  MaterialInfoScanner({required this.config});

  final Camera? _camera = Camera.defaultCamera;
  final CameraSettings _cameraSettings =
      BarcodeCapture.recommendedCameraSettings;

  late DataCaptureContext _dataCaptureContext;
  late BarcodeCapture _barcodeCapture;
  late DataCaptureView _dataCaptureView;
  late BarcodeCaptureOverlay _overlay;
  final BarcodeCaptureSettings _barcodeCaptureSettings =
      BarcodeCaptureSettings();

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
    await _camera?.applySettings(_cameraSettings);

    _dataCaptureContext =
        DataCaptureContext.forLicenseKey(config.scanditLicenseKey);

    if (_camera != null) await _dataCaptureContext.setFrameSource(_camera!);

    enableSymbologies(Symbology.values);
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
    enableSymbologies(Symbology.values);

    _barcodeCapture =
        BarcodeCapture.forContext(_dataCaptureContext, _barcodeCaptureSettings);

    _dataCaptureView = DataCaptureView.forContext(dataCaptureContext);

    _overlay = BarcodeCaptureOverlay.withBarcodeCaptureForViewWithStyle(
      _barcodeCapture,
      _dataCaptureView,
      BarcodeCaptureOverlayStyle.frame,
    );
  }
}
