import 'package:flutter/material.dart';
import 'package:violin/app/core/colors.dart';
import 'package:violin/app/core/consts.dart';
import 'package:violin/app/mocks/user_mock.dart';
import 'package:violin/app/presentation/albums/album_details_page.dart';
import 'package:violin/app/presentation/shared/widgets/album_preview.dart';

class AlbumsPage extends StatelessWidget {
  static const routeName = 'albums';

  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Albums'),
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
              //TODO make it bigger
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
