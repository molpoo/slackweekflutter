import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothStateProvider with ChangeNotifier {
  List<String> _scanResults = [];
  bool _isScanning = false;

  List<String> get scanResults => _scanResults;
  bool get isScanning => _isScanning;
  set isScanning(bool newValue) {
    _isScanning = newValue;
    notifyListeners();
  }
  String get textScanning => !_isScanning ? "Start scanning" : "Stop scanning";

  setScanResults(ScanResult newValue) {
    if (!_scanResults.contains(newValue.device.name) && newValue.device.name.isNotEmpty) {
      _scanResults.add(newValue.device.name);
      notifyListeners();
    }
  }

  toggleScan() {
    if(isScanning) {
      isScanning = false;
      FlutterBlue.instance.stopScan();
    } else {
      isScanning = true;
      FlutterBlue.instance.scan().listen((scanResult) {
        setScanResults(scanResult);
      });
    }
  }
}
