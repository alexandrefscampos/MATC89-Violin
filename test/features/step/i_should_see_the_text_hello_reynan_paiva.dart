import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeTheTextHelloReynanPaiva(WidgetTester tester) async {
  expect(find.text('Hello, Reynan Paiva!'), findsOneWidget);
}
