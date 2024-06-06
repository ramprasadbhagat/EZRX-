/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2020- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:scandit_flutter_datacapture_core/src/function_names.dart';

import 'package:scandit_flutter_datacapture_core/src/camera.dart';
import 'package:scandit_flutter_datacapture_core/src/common.dart';
import 'package:scandit_flutter_datacapture_core/src/focus_gesture.dart';
import 'package:scandit_flutter_datacapture_core/src/zoom_gesture.dart';
import 'package:scandit_flutter_datacapture_core/src/viewfinder.dart';
import 'package:scandit_flutter_datacapture_core/src/logo_style.dart';

import 'package:meta/meta.dart';
import 'package:flutter/services.dart';

@immutable
class CameraSettingsDefaults {
  final VideoResolution preferredResolution;
  final double zoomFactor;
  final FocusRange focusRange;
  final FocusGestureStrategy focusGestureStrategy;
  final double zoomGestureZoomFactor;
  final bool shouldPreferSmoothAutoFocus;
  final Map<String, dynamic> properties;

  const CameraSettingsDefaults(
    this.preferredResolution,
    this.zoomFactor,
    this.focusRange,
    this.focusGestureStrategy,
    this.zoomGestureZoomFactor,
    this.properties, {
    required this.shouldPreferSmoothAutoFocus,
  });

  factory CameraSettingsDefaults.fromJSON(Map<String, dynamic> json) {
    final resolution = VideoResolutionDeserializer.videoResolutionFromJSON(
      json['preferredResolution'],
    );
    final zoomFactor = (json['zoomFactor'] as num).toDouble();
    final focusRange =
        FocusRangeDeserializer.focusRangeFromJSON(json['focusRange']);
    final focusGestureStrategy =
        FocusGestureStrategyDeserializer.focusGestureStrategyFromJSON(
      json['focusGestureStrategy'],
    );
    final zoomGestureZoomFactor =
        (json['zoomGestureZoomFactor'] as num).toDouble();
    final shouldPreferSmoothAutoFocus =
        json['shouldPreferSmoothAutoFocus'] as bool?;
    var properties = <String, dynamic>{};

    if (json.containsKey('properties')) {
      properties = json['properties'] as Map<String, dynamic>;
    }
    return CameraSettingsDefaults(
      resolution,
      zoomFactor,
      focusRange,
      focusGestureStrategy,
      zoomGestureZoomFactor,
      properties,
      shouldPreferSmoothAutoFocus: shouldPreferSmoothAutoFocus ?? false,
    );
  }
}

@immutable
class CameraDefaults {
  final CameraSettingsDefaults settings;
  final CameraPosition? defaultPosition;
  final List<CameraPosition> availablePositions;

  const CameraDefaults(
    this.settings,
    this.defaultPosition,
    this.availablePositions,
  );

  factory CameraDefaults.fromJSON(Map<String, dynamic> json) {
    final cameraSettings = CameraSettingsDefaults.fromJSON(json['Settings']);
    final String? cameraPositionJSON = json['defaultPosition'];
    final position = cameraPositionJSON == null
        ? null
        : CameraPositionDeserializer.cameraPositionFromJSON(cameraPositionJSON);
    final availablePositions = (json['availablePositions'])
        // ignore: unnecessary_lambdas
        .map(
          (position) =>
              CameraPositionDeserializer.cameraPositionFromJSON(position),
        )
        .toList()
        .cast<CameraPosition>();
    return CameraDefaults(cameraSettings, position, availablePositions);
  }
}

@immutable
class DataCaptureViewDefaults {
  final MarginsWithUnit scanAreaMargins;
  final PointWithUnit pointOfInterest;
  final Anchor logoAnchor;
  final PointWithUnit logoOffset;
  final ZoomGesture? zoomGesture;
  final FocusGesture? focusGesture;
  final LogoStyle logoStyle;

  const DataCaptureViewDefaults(
    this.scanAreaMargins,
    this.pointOfInterest,
    this.logoAnchor,
    this.logoOffset,
    this.focusGesture,
    this.zoomGesture,
    this.logoStyle,
  );

  factory DataCaptureViewDefaults.fromJSON(Map<String, dynamic> json) {
    final scanAreaMargins =
        MarginsWithUnit.fromJSON(jsonDecode(json['scanAreaMargins']));
    final pointOfInterest =
        PointWithUnit.fromJSON(jsonDecode(json['pointOfInterest']));
    final logoAnchor = AnchorDeserializer.fromJSON(json['logoAnchor']);
    final logoOffset = PointWithUnit.fromJSON(jsonDecode(json['logoOffset']));
    FocusGesture? focusGesture;
    if (json.containsKey('focusGesture')) {
      focusGesture =
          FocusGestureDeserializer.fromJSON(jsonDecode(json['focusGesture']));
    }
    ZoomGesture? zoomGesture;
    if (json.containsKey('zoomGesture')) {
      zoomGesture =
          ZoomGestureDeserializer.fromJSON(jsonDecode(json['zoomGesture']));
    }
    final logoStyle = LogoStyleDeserializer.fromJSON(json['logoStyle']);
    return DataCaptureViewDefaults(
      scanAreaMargins,
      pointOfInterest,
      logoAnchor,
      logoOffset,
      focusGesture,
      zoomGesture,
      logoStyle,
    );
  }
}

@immutable
class BrushDefaults {
  final Color fillColor;
  final Color strokeColor;
  final double strokeWidth;

  const BrushDefaults(this.fillColor, this.strokeColor, this.strokeWidth);

  factory BrushDefaults.fromJSON(Map<String, dynamic> json) {
    final fillColor =
        ColorDeserializer.fromRgbaHex(json['fillColor'] as String);
    final strokeColor =
        ColorDeserializer.fromRgbaHex(json['strokeColor'] as String);
    final strokeWidth = (json['strokeWidth'] as num).toDouble();
    return BrushDefaults(fillColor, strokeColor, strokeWidth);
  }

  Brush toBrush() => Brush(fillColor, strokeColor, strokeWidth);
}

// This class is used to deserialize the brush json serialized on the native sdk
@immutable
class NativeBrushDefaults {
  final Color fillColor;
  final Color strokeColor;
  final double strokeWidth;

  const NativeBrushDefaults(this.fillColor, this.strokeColor, this.strokeWidth);

  factory NativeBrushDefaults.fromJSON(Map<String, dynamic> json) {
    final fillColor =
        ColorDeserializer.fromRgbaHex(json['fill']['color'] as String);
    final strokeColor =
        ColorDeserializer.fromRgbaHex(json['stroke']['color'] as String);
    final strokeWidth = (json['stroke']['width'] as num).toDouble();
    return NativeBrushDefaults(fillColor, strokeColor, strokeWidth);
  }

  Brush toBrush() => Brush(fillColor, strokeColor, strokeWidth);
}

@immutable
class LaserlineViewfinderDefaults {
  final LaserlineViewfinderStyleDefaults defaultStyle;
  final Map<LaserlineViewfinderStyle, LaserlineViewfinderStyleDefaults> styles;

  const LaserlineViewfinderDefaults(this.defaultStyle, this.styles);

  factory LaserlineViewfinderDefaults.fromJSON(Map<String, dynamic> json) {
    final styles = (json['styles'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(
        LaserlineViewfinderStyleDeserializer.fromJSON(key),
        LaserlineViewfinderStyleDefaults.fromJSON(value),
      ),
    );

    final defaultStyle = styles[LaserlineViewfinderStyleDeserializer.fromJSON(
      json['defaultStyle'] as String,
    )];

    if (defaultStyle == null) {
      throw Exception('Default style not found for LaserlineViewfinder');
    }

    return LaserlineViewfinderDefaults(defaultStyle, styles);
  }
}

@immutable
class LaserlineViewfinderStyleDefaults {
  final DoubleWithUnit width;
  final Color enabledColor;
  final Color disabledColor;
  final LaserlineViewfinderStyle style;

  const LaserlineViewfinderStyleDefaults(
    this.width,
    this.enabledColor,
    this.disabledColor,
    this.style,
  );

  factory LaserlineViewfinderStyleDefaults.fromJSON(Map<String, dynamic> json) {
    final width = DoubleWithUnit.fromJSON(
      jsonDecode(json['width']) as Map<String, dynamic>,
    );
    final enabledColor =
        ColorDeserializer.fromRgbaHex(json['enabledColor'] as String);
    final disabledColor =
        ColorDeserializer.fromRgbaHex(json['disabledColor'] as String);
    final style =
        LaserlineViewfinderStyleDeserializer.fromJSON(json['style'] as String);
    return LaserlineViewfinderStyleDefaults(
      width,
      enabledColor,
      disabledColor,
      style,
    );
  }
}

@immutable
class RectangularViewfinderDefaults {
  final RectangularViewfinderStyleDefaults defaultStyle;
  final Map<RectangularViewfinderStyle, RectangularViewfinderStyleDefaults>
      styles;

  const RectangularViewfinderDefaults(this.defaultStyle, this.styles);

  factory RectangularViewfinderDefaults.fromJSON(Map<String, dynamic> json) {
    final styles = (json['styles'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(
        RectangularViewfinderStyleDeserializer.fromJSON(key),
        RectangularViewfinderStyleDefaults.fromJSON(value),
      ),
    );
    final defaultStyle = styles[RectangularViewfinderStyleDeserializer.fromJSON(
      json['defaultStyle'] as String,
    )];

    if (defaultStyle == null) {
      throw Exception('Default style not found for RectangularViewfinder');
    }

    return RectangularViewfinderDefaults(defaultStyle, styles);
  }
}

@immutable
class RectangularViewfinderStyleDefaults {
  final SizeWithUnitAndAspect size;
  final Color color;
  final Color disabledColor;
  final RectangularViewfinderStyle style;
  final double dimming;
  final RectangularViewfinderLineStyle lineStyle;
  final RectangularViewfinderAnimation? animation;
  final double disabledDimming;

  const RectangularViewfinderStyleDefaults(
    this.style,
    this.size,
    this.color,
    this.dimming,
    this.lineStyle,
    this.animation,
    this.disabledDimming,
    this.disabledColor,
  );

  factory RectangularViewfinderStyleDefaults.fromJSON(
    Map<String, dynamic> json,
  ) {
    final size = SizeWithUnitAndAspect.fromJSON(
      jsonDecode(json['size']) as Map<String, dynamic>,
    );
    final color = ColorDeserializer.fromRgbaHex(json['color'] as String);
    final disabledColor =
        ColorDeserializer.fromRgbaHex(json['disabledColor'] as String);
    final style = RectangularViewfinderStyleDeserializer.fromJSON(
      json['style'] as String,
    );
    final dimming = (json['dimming'] as num).toDouble();
    final lineStyle = RectangularViewfinderLineStyleDeserializer.fromJSON(
      json['lineStyle'] as String,
    );
    RectangularViewfinderAnimation? animation;
    if (json.containsKey('animation') && json['animation'] != null) {
      final animationJson = jsonDecode(json['animation']);
      animation = RectangularViewfinderAnimation(
        isLooping: animationJson['looping'] as bool,
      );
    }
    final disabledDimming = (json['disabledDimming'] as num).toDouble();

    return RectangularViewfinderStyleDefaults(
      style,
      size,
      color,
      dimming,
      lineStyle,
      animation,
      disabledDimming,
      disabledColor,
    );
  }
}

@immutable
class AimerViewfinderDefaults {
  final Color frameColor;
  final Color dotColor;

  const AimerViewfinderDefaults(this.frameColor, this.dotColor);

  factory AimerViewfinderDefaults.fromJSON(Map<String, dynamic> json) {
    final frameColor =
        ColorDeserializer.fromRgbaHex(json['frameColor'] as String);
    final dotColor = ColorDeserializer.fromRgbaHex(json['dotColor'] as String);
    return AimerViewfinderDefaults(frameColor, dotColor);
  }
}

// ignore: avoid_classes_with_only_static_members
class Defaults {
  static MethodChannel channel =
      const MethodChannel(FunctionNames.methodsChannelName);
  static late CameraDefaults cameraDefaults;
  static late DataCaptureViewDefaults captureViewDefaults;
  static late LaserlineViewfinderDefaults laserlineViewfinderDefaults;
  static late RectangularViewfinderDefaults rectangularViewfinderDefaults;
  static late BrushDefaults brushDefaults;
  static late String sdkVersion;
  static late String deviceId;
  static late AimerViewfinderDefaults aimerViewfinderDefaults;

  static bool _isInitialized = false;

  static void initializeDefaults(String defaultsJSON) {
    _isInitialized = false;
    final Map<String, dynamic> defaults = jsonDecode(defaultsJSON);
    cameraDefaults = CameraDefaults.fromJSON(defaults['Camera']);
    captureViewDefaults =
        DataCaptureViewDefaults.fromJSON(defaults['DataCaptureView']);
    rectangularViewfinderDefaults = RectangularViewfinderDefaults.fromJSON(
      defaults['RectangularViewfinder'],
    );
    laserlineViewfinderDefaults =
        LaserlineViewfinderDefaults.fromJSON(defaults['LaserlineViewfinder']);
    brushDefaults = BrushDefaults.fromJSON(defaults['Brush']);
    sdkVersion = defaults['Version'] as String;
    deviceId = defaults['deviceID'] as String;
    aimerViewfinderDefaults =
        AimerViewfinderDefaults.fromJSON(defaults['AimerViewfinder']);
    _isInitialized = true;
  }

  static Future<dynamic> initializeDefaultsAsync() async {
    if (_isInitialized) return;

    final String result = await channel.invokeMethod('getDefaults');
    initializeDefaults(result);
  }
}
