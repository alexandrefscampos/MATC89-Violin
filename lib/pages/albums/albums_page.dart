import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/core/consts.dart';
import 'package:violin/core/widgets/album_preview.dart';
import 'package:violin/mocks/user_mock.dart';
import 'package:violin/pages/album_details/album_details_page.dart';

class AlbumsPage extends StatelessWidget {
  static const routeName = 'albums';

  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VColors.primary,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Albums',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
          ),
          itemCount: userMock.totalAlbums.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AlbumDetailsPage.routeName);
              },
              child: AlbumPreview(
                path: userMock.totalAlbums[index].artworkUrl100 ?? '',
              ),
            );
          }),
        ),
      ),
    );
  }
}
