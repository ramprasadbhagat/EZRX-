/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2020- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/src/defaults.dart';

// ignore: avoid_classes_with_only_static_members
class ScanditFlutterDataCaptureCore {
  static Future<void> initialize() {
    return Defaults.initializeDefaultsAsync();
  }
}
