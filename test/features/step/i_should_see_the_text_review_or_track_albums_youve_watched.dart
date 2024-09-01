import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see the text "Review or track albums you've watched..."
Future<void> iShouldSeeTheTextReviewOrTrackAlbumsYouveWatched(
    WidgetTester tester) async {
  expect(
      find.text('Review or track albums you\'ve watched...'), findsOneWidget);
}
