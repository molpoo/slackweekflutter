import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_slack_week/bluetooth/providers/bluetooth_state.dart';
import 'package:provider/provider.dart';

class BluetoothScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BluetoothStateProvider>(builder: (context, bluetoothProvider, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Bluetooth Test"),
          ),
          body: Container(
              child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text(bluetoothProvider.textScanning),
                onPressed: () => bluetoothProvider.toggleScan(),
              ),
              Container(
                  child: bluetoothProvider.isScanning
                      ? CircularProgressIndicator()
                      : Text("Scanning not started")),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(4.0),
                  itemCount: bluetoothProvider.scanResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(bluetoothProvider.scanResults[index]));
                  })
            ],
          )));
    });
  }
}
