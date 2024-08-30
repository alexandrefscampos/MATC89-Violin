import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:violin/app/core/colors.dart';
import 'package:violin/app/core/consts.dart';
import 'package:violin/app/mocks/user_mock.dart';
import 'package:violin/app/presentation/shared/widgets/album_preview.dart';

class AlbumDetailsPage extends StatelessWidget {
  static const routeName = 'album_details';

  const AlbumDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final album = userMock.totalAlbums.first;
    return Scaffold(
      backgroundColor: VColors.primary,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    AlbumPreview(
                      height: 200,
                      width: 130,
                      path: album.artworkUrl100 ?? '',
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        AlbumStatistic(
                          icon: Icons.remove_red_eye,
                          iconColor: Colors.green,
                          value: 0,
                        ),
                        SizedBox(width: 8),
                        AlbumStatistic(
                          icon: Icons.heart_broken,
                          iconColor: Colors.red,
                          value: 0,
                        ),
                        SizedBox(width: 8),
                        // AlbumStatistic(
                        //   icon: Icons.list,//TODO ADD WHEN LIST FEATURE DONE
                        //   iconColor: Colors.blue,
                        //   value: 0,
                        // ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      label: const Text(
                        'Review or rate',
                        style: TextStyle(color: VColors.primary),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(160, 40),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          VColors.secondary,
                        ),
                      ),
                      icon: const Icon(
                        Icons.abc,
                        color: VColors.primary,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      album.collectionName ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      album.artistName ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    //TODO create rating
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'All Reviews',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 24),
            const ReviewCard(),
            const SizedBox(height: 24),
            const ReviewCard(),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: VColors.secondary.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Review by User',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  //TODO ADD USER RATING
                  //TODO ADD COMMENT A REVIEW
                ),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 300,
                  child: Text(
                    reviewMock,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const reviewMock =
    'It was less than three years ago that Todd Phillips’ mid-budget but mega-successful “Joker” threateningly pointed toward a future in which superhero movies of all sizes would become so endemic to modern cinema that they no longer had to be superhero movies at all. With Matt Reeves’ “The Batman” — a sprawling, 176-minute latex procedural that often appears to have more in common with serial killer sagas like “Se7en” and “Zodiac” than it does anything in the Snyderverse or the MCU — that future has arrived with shuddering force, for better or worse. Mostly better. ';

class AlbumStatistic extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final int value;
  const AlbumStatistic({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        Text(
          value.toString(),
          style: TextStyle(
            color: Colors.white.withOpacity(0.55),
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
