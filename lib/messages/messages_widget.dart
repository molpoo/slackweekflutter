import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class MessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: MessageWidgetElement(),
    );
  }
}

class MessageWidgetElement extends StatefulWidget {
  @override
  State createState() => _MessageStatefulWidgetState();
}

class _MessageStatefulWidgetState extends State<MessageWidgetElement> {
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(
            "Message pass through constructor: $message",
            key: Key("key_message"),
          ),
          QrImage(
            data: "$message",
            size: 100.0,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        key: Key('key_fab_toast'),
        child: Icon(Icons.add),
        onPressed: () => {
          setState(() {
            message = "coucou";
          })
        },
      ),
    );
  }
}
