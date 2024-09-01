import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:violin/widgets/search/search_page.dart';

Future<void> iNavigateToTheSearchPage(WidgetTester tester) async {
  await tester.tap(find.byIcon(Icons.search));
  await tester.pump();
  expect(find.byType(SearchPage), findsOneWidget);
}
