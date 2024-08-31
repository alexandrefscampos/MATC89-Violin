import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/core/consts.dart';
import 'package:violin/core/widgets/album_preview.dart';
import 'package:violin/mocks/user_mock.dart';
import 'package:violin/pages/album_details/widgets/album_interaction_bottomsheet.dart';
import 'package:violin/pages/album_details/widgets/album_rating_chart.dart';
import 'package:violin/pages/album_details/widgets/review_card.dart';

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
                    // const SizedBox(height: 8),
                    // const Row(
                    //   children: [
                    //     AlbumStatistic(
                    //       icon: Icons.remove_red_eye,
                    //       iconColor: Colors.green,
                    //       value: 0,
                    //     ),
                    //     SizedBox(width: 8),
                    //     AlbumStatistic(
                    //       icon: Icons.heart_broken,
                    //       iconColor: Colors.red,
                    //       value: 0,
                    //     ),
                    //     SizedBox(width: 8),
                    //     // AlbumStatistic(
                    //     //   icon: Icons.list,//TODO ADD WHEN LIST FEATURE DONE
                    //     //   iconColor: Colors.blue,
                    //     //   value: 0,
                    //     // ),
                    //   ],
                    // ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      label: const Text(
                        'Review or rate',
                        style: TextStyle(color: VColors.primary),
                      ),
                      onPressed: () {
                        showAlbumInteractionBottomSheet(context);
                      },
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(
                          const Size(160, 40),
                        ),
                        backgroundColor: WidgetStateProperty.all(
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
                    const SizedBox(
                      height: 200,
                      width: 200,
                      child: AlbumRatingChart(
                        ratingCounts: [
                          100,
                          80,
                          60,
                          40,
                          20
                        ], // 5 stars to 1 star
                        // averageRating: 2.5,
                        // totalRatings: 300,
                      ),
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

class AlbumStatistic extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final int value;
  const AlbumStatistic({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.value,
  });

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

// Usage example:
void showAlbumInteractionBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return AlbumInteractionBottomSheet(
        onRatingSelected: (rating) {
          print('Selected rating: $rating');
        },
        onFavoriteToggled: (isFavorited) {
          print('Album favorited: $isFavorited');
        },
        onHeardToggled: (isHeard) {
          print('Album marked as heard: $isHeard');
        },
        isFavorited: false,
        isHeard: true,
      );
    },
  );
}
