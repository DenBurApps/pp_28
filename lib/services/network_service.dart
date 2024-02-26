import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  Future<bool> checkConnection() async =>
      await Connectivity().checkConnectivity() != ConnectivityResult.none;
}
