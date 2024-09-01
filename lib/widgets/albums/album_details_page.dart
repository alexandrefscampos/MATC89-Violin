import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:violin/controllers/user_controller.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/core/consts.dart';
import 'package:violin/models/search_result_model.dart';
import 'package:violin/widgets/albums/album_interaction_bottomsheet.dart';
import 'package:violin/widgets/albums/album_preview.dart';
import 'package:violin/widgets/albums/album_rating_chart.dart';
import 'package:violin/widgets/albums/review_section.dart';
import 'package:violin/widgets/profile/review_card.dart';
import 'package:violin/widgets/shared/v_button.dart';

class AlbumDetailsPage extends ConsumerStatefulWidget {
  static const routeName = 'album_details';

  const AlbumDetailsPage({super.key});

  @override
  ConsumerState<AlbumDetailsPage> createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends ConsumerState<AlbumDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final album = ModalRoute.of(context)?.settings.arguments as Result;
    final userAsyncValue = ref.watch(userControllerProvider);
    return Scaffold(
      backgroundColor: VColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: userAsyncValue.when(
          error: (_, __) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          data: (user) {
            final userController = ref.read(userControllerProvider.notifier);

            final currentRating = user?.totalAlbums
                .firstWhere(
                    (element) => element.collectionId == album.collectionId)
                .rating;

            List<Widget> reviews = user?.totalAlbums
                    .firstWhere((element) {
                      return element.collectionId == album.collectionId;
                    })
                    .reviews
                    .map((e) => ReviewCard(
                          user: user.name ?? '',
                          review: e,
                          onDelete: () async {
                            await userController.deleteAlbumReview(album, e);
                          },
                        ))
                    .toList() ??
                [];

            return ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        VButton(
                          onPressed: () => showAlbumInteractionBottomSheet(
                            context,
                            album,
                            currentRating ?? 0,
                          ),
                          label: 'Review or rate',
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 250,
                          child: Text(
                            album.collectionName ?? '',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Text(
                          album.artistName ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        //TODO create rating
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 210,
                          child: const AlbumRatingChart(
                            ratingCounts: [100, 80, 60, 40, 20],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (currentRating != null)
                  Container(
                    decoration: BoxDecoration(
                      color: VColors.secondary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Text(
                      'You rated this album: $currentRating stars',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
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
                ReviewSection(
                  onReviewSubmitted: (review) async {
                    final userController =
                        ref.read(userControllerProvider.notifier);
                    await userController.addAlbumReview(album, review);
                  },
                  reviews: const [],
                ),
                reviews.isNotEmpty
                    ? Column(
                        children: reviews,
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  void showAlbumInteractionBottomSheet(
      BuildContext context, Result album, int initialRating) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AlbumInteractionBottomSheet(
          album: album,
          onTap: (album, rating, isFavorited) async {
            final userController = ref.read(userControllerProvider.notifier);
            await userController.addAlbumRating(album, rating, isFavorited);
          },
          isFavorited: false,
          initialRating: initialRating,
        );
      },
    );
  }
}

const reviewMock =
    'It was less than three years ago that Todd Phillips’ mid-budget but mega-successful “Joker” threateningly pointed toward a future in which superhero movies of all sizes would become so endemic to modern cinema that they no longer had to be superhero movies at all. With Matt Reeves’ “The Batman” — a sprawling, 176-minute latex procedural that often appears to have more in common with serial killer sagas like “Se7en” and “Zodiac” than it does anything in the Snyderverse or the MCU — that future has arrived with shuddering force, for better or worse. Mostly better. ';
