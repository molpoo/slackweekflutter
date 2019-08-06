import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class Messages extends StatelessWidget {
  String message;
  Messages(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Messages')
      ),
      body: Center(
        child: Column(
          children: [
            Text("Messages: $message"),
            QrImage(
              data: "$message",
              size: 200.0,
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Toast.show("Test message $message", context, duration: Toast.LENGTH_SHORT)
        },
      ),
    );
  }


}