import 'package:flutter/material.dart';
import 'package:violin/core/consts.dart';
import 'package:violin/models/search_result_model.dart';
import 'package:violin/widgets/albums/album_details_page.dart';
import 'package:violin/widgets/albums/album_preview.dart';

class AlbumGrid extends StatelessWidget {
  final List<Result> albums;
  final int crossAxisCount;

  const AlbumGrid({
    super.key,
    required this.albums,
    this.crossAxisCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 8,
        ),
        itemCount: albums.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                AlbumDetailsPage.routeName,
                arguments: albums[index],
              );
            },
            child: AlbumPreview(
              path: albums[index].artworkUrl100 ?? '',
            ),
          );
        }),
      ),
    );
  }
}
