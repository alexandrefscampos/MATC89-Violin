import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I delete review
Future<void> iDeleteReview(WidgetTester tester) async {
 
  await tester.tap(find.byIcon(Icons.delete));
  
  await tester.pump();
}
