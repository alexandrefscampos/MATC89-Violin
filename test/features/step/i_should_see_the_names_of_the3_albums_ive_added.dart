import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeTheNamesOfThe3AlbumsIveAdded(WidgetTester tester) async {
  expect(find.text('Album 1'), findsOneWidget);
  expect(find.text('Album 2'), findsOneWidget);
  expect(find.text('Album 3'), findsOneWidget);
  expect(find.text('Artist 1'), findsOneWidget);
  expect(find.text('Artist 2'), findsOneWidget);
  expect(find.text('Artist 3'), findsOneWidget);
}
