import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_slack_week/messages/messages_widget.dart';

void main() {
  testWidgets('Message Widget has a text', (WidgetTester tester) async {

    // Instanciate the tested widget inside a MaterialApp (otherwise it won't work :/)
    await tester.pumpWidget(MaterialApp(
      home: MessageWidget(),
    ));

    // Expect to see the message
    expect(find.text('Message pass through constructor: '), findsOneWidget);

    // Click on the FAB and expect a Toast with "Text message"
    // Tap the '+' icon inside the FAB and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Expect the message to change
    expect(find.text('Message pass through constructor: coucou'), findsOneWidget);
  });
}
