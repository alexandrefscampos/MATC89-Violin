import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSeeText(WidgetTester tester, String text) async {
  await tester.pumpAndSettle();

  final finder = find.text(text);

  if (finder.evaluate().isEmpty) {
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();
  }

  if (finder.evaluate().isEmpty) {
    final widgetTexts = find
        .byType(Text)
        .evaluate()
        .map((element) => (element.widget as Text).data)
        .where((t) => t != null)
        .join(', ');

    throw TestFailure('Text "$text" not found. Available texts: $widgetTexts');
  }

  expect(finder, findsOneWidget,
      reason: 'Expected to find "$text" exactly once');
}
