import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeAListContainingAnAlbumCalledThriller(
    WidgetTester tester) async {
  expect(find.text('Thriller'), findsAtLeast(1));
  expect(find.text('Michael Jackson'), findsAtLeast(1));
}
