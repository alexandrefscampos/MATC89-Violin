import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see the text "Your albums"
Future<void> iShouldSeeTheTextYourAlbums(WidgetTester tester) async {
  expect(find.text('Your albums'), findsOneWidget);
}
