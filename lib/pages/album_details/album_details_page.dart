import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/core/consts.dart';
import 'package:violin/core/widgets/album_preview.dart';
import 'package:violin/mocks/user_mock.dart';

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

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

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

class AlbumInteractionBottomSheet extends StatefulWidget {
  final Function(double) onRatingSelected;
  final Function(bool) onFavoriteToggled;
  final Function(bool) onHeardToggled;
  final bool initiallyFavorited;
  final bool initiallyHeard;

  const AlbumInteractionBottomSheet({
    super.key,
    required this.onRatingSelected,
    required this.onFavoriteToggled,
    required this.onHeardToggled,
    this.initiallyFavorited = false,
    this.initiallyHeard = false,
  });

  @override
  _AlbumInteractionBottomSheetState createState() =>
      _AlbumInteractionBottomSheetState();
}

class _AlbumInteractionBottomSheetState
    extends State<AlbumInteractionBottomSheet> {
  double _rating = 0;
  late bool _isFavorited;
  late bool _isHeard;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.initiallyFavorited;
    _isHeard = widget.initiallyHeard;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Album Interaction',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: VColors.secondary,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      _isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _isFavorited = !_isFavorited;
                      });
                      widget.onFavoriteToggled(_isFavorited);
                    },
                  ),
                  const Text('Favorite'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      _isHeard ? Icons.headphones : Icons.headphones_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _isHeard = !_isHeard;
                      });
                      widget.onHeardToggled(_isHeard);
                    },
                  ),
                  const Text('Heard'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              widget.onRatingSelected(_rating);
              Navigator.pop(context);
            },
          ),
        ],
      ),
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
        initiallyFavorited: false,
        initiallyHeard: true,
      );
    },
  );
}

class AlbumRatingChart extends StatelessWidget {
  final List<int> ratingCounts;

  const AlbumRatingChart({
    super.key,
    required this.ratingCounts,
  });

  @override
  Widget build(BuildContext context) {
    int maxCount =
        ratingCounts.reduce((max, element) => max > element ? max : element);

    return Container(
      color: VColors.secondary.withOpacity(0.05),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(5, (index) {
          final rating = index + 1;
          final count = ratingCounts[index];
          return Expanded(
            child: Column(
              children: [
                const Icon(Icons.star, color: VColors.secondary, size: 16),
                const SizedBox(height: 4),
                Flexible(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: 20,
                            color: Colors.grey[800],
                          ),
                          Container(
                            width: 20,
                            height: constraints.maxHeight * (count / maxCount),
                            color: VColors.secondary,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 4),
                //TODO ADD AVERAGE RATING
                Text(
                  '$rating',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
