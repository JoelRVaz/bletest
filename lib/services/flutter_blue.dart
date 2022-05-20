import 'package:flutter/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';

class FBlue {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  void connectToDevice(String deviceId) {
// Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 100));

    // Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) async {
      // do something with scan results
      for (ScanResult r in results) {
        if (r.device.id.id == deviceId) {
          await r.device.connect(autoConnect: false);
        }
      }
    });

    // Stop scanning
    flutterBlue.stopScan();
  }
}
