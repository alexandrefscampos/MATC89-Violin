import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:violin/pages/album_details/album_details_page.dart';
import 'package:violin/pages/albums/albums_page.dart';
import 'package:violin/pages/home_page.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Violin',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
      routes: {
        AlbumsPage.routeName: (context) => const AlbumsPage(),
        AlbumDetailsPage.routeName: (context) => const AlbumDetailsPage(),
      },
    );
  }
}
