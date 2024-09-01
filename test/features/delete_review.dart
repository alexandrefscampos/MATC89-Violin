// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_navigate_to_album_review.dart';
import './step/i_see_text.dart';
import './step/i_delete_review.dart';

void main() {
  group('''Delete Reviews''', () {
    testWidgets('''Successfully deleting a review''', (tester) async {
      await iNavigateToAlbumReview(tester);
      await iSeeText(tester, 'muito ruim');
      await iDeleteReview(tester);
    });
  });
}
