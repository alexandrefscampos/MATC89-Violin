import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSeeText(WidgetTester tester, String partialText) async {
  await tester.pump();

  final finder = find.byWidgetPredicate((widget) {
    if (widget is Text) {
      final textWidget = widget;
      final textData = textWidget.data ?? '';
      return textData.toLowerCase().contains(partialText.toLowerCase());
    }
    return false;
  });

  if (finder.evaluate().isEmpty) {
    final widgetTexts = tester.allWidgets
        .whereType<Text>()
        .map((text) => text.data)
        .where((t) => t != null)
        .join(', ');

    throw TestFailure(
        'Text containing "$partialText" not found. Available texts: $widgetTexts');
  }

  expect(finder, findsWidgets,
      reason: 'Expected to find text containing "$partialText" at least once');
}
