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

  setScanResults(ScanResult newValue) {
    if (!_scanResults.contains(newValue.device.name) && newValue.device.name.isNotEmpty) {
      _scanResults.add(newValue.device.name);
      notifyListeners();
    }
  }

  startScan() {
    isScanning = true;
    FlutterBlue.instance.scan().listen((scanResult) {
      setScanResults(scanResult);
    });
  }

  stopScan() {
    isScanning = false;
    FlutterBlue.instance.stopScan();
  }
}
