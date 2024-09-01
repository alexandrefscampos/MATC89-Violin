import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iEnterThrillerIntoTheSearchField(WidgetTester tester) async {
  await tester.enterText(find.byType(TextField), 'Thriller');
  await tester.pump();
}
