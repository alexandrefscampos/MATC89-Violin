import 'package:flutter/material.dart';
import 'package:violin/pages/album_details/album_details_page.dart';
import 'package:violin/pages/albums/albums_page.dart';
import 'package:violin/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
