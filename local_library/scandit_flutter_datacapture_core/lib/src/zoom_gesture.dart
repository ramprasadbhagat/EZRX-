import 'package:scandit_flutter_datacapture_core/src/common.dart';

abstract class ZoomGesture extends Serializable {}

class SwipeToZoom extends ZoomGesture {
  SwipeToZoom();

  @override
  Map<String, dynamic> toMap() {
    return {'type': 'swipeToZoom'};
  }
}

extension ZoomGestureDeserializer on ZoomGesture {
  static ZoomGesture? fromJSON(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'swipeToZoom':
        return SwipeToZoom();
      default:
        return null;
    }
  }
}
