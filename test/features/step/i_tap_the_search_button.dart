import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iTapTheSearchButton(WidgetTester tester) async {
  final searchButton = find.byType(TextButton);
  expect(searchButton, findsOneWidget);
  await tester.tap(searchButton);
  await tester.pump();
}
