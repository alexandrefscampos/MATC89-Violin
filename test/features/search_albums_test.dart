// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_am_logged_in_as_reynan_paiva.dart';
import './step/i_enter_thriller_into_the_search_field.dart';
import './step/i_navigate_to_the_search_page.dart';
import './step/i_should_see_a_list_containing_an_album_called_thriller.dart';
import './step/i_tap_the_search_button.dart';

void main() {
  group('''Album Search''', () {
    testWidgets('''Searching for an album''', (tester) async {
      await iAmLoggedInAsReynanPaiva(tester);
      await iNavigateToTheSearchPage(tester);
      await iEnterThrillerIntoTheSearchField(tester);
      await iTapTheSearchButton(tester);
      await iShouldSeeAListContainingAnAlbumCalledThriller(tester);
    });
  });
}
