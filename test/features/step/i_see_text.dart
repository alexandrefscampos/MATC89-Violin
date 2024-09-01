import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSeeText(WidgetTester tester, String text) async {
  await tester.pumpAndSettle();

  final finder = find.byWidgetPredicate((widget) {
    if (widget is Text) {
      final textWidget = widget;
      final textData = textWidget.data ?? '';
      return textData.contains(text);
    }
    return false;
  });

  if (finder.evaluate().isEmpty) {
    final widgetTexts = tester.allWidgets
        .whereType<Text>()
        .map((text) => text.data)
        .where((t) => t != null)
        .join(', ');

    throw TestFailure('Text "$text" not found. Available texts: $widgetTexts');
  }

  expect(finder, findsWidgets,
      reason: 'Expected to find "$text" at least once');
}
