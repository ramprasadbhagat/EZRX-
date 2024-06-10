import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connectivityStreamController = StreamController<bool>.broadcast();

  StreamSubscription init() {
    return Connectivity().onConnectivityChanged.listen(handleConnectivity);
  }

  Stream<bool> get getStream => _connectivityStreamController.stream;

  void handleConnectivity(ConnectivityResult connectivityResult) {
    _connectivityStreamController.add(
      connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi,
    );
  }
}
