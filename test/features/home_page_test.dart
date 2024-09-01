// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_open_the_app.dart';
import './step/i_should_see_the_text_hello_reynan_paiva.dart';
import './step/i_should_see_the_text_review_or_track_albums_youve_watched.dart';
import './step/i_should_see_the_text_your_albums.dart';
import './step/i_should_see_the_names_of_the3_albums_ive_added.dart';

void main() {
  group('''Home Page''', () {
    testWidgets(
        '''Viewing personal information and added albums on the home page''',
        (tester) async {
      await iOpenTheApp(tester);
      await iShouldSeeTheTextHelloReynanPaiva(tester);
      await iShouldSeeTheTextReviewOrTrackAlbumsYouveWatched(tester);
      await iShouldSeeTheTextYourAlbums(tester);
      await iShouldSeeTheNamesOfThe3AlbumsIveAdded(tester);
    });
  });
}
