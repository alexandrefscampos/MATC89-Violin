import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:violin/controllers/user_controller.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/models/user_model.dart';
import 'package:violin/widgets/albums/album_grid.dart';
import 'package:violin/widgets/albums/album_preview.dart';
import 'package:violin/widgets/albums/albums_page.dart';
import 'package:violin/widgets/profile/user_statistics.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userControllerProvider);
    final allowImages = ref.read(userControllerProvider.notifier).allowImages();

    return userAsyncValue.when(
      data: (user) => _buildProfileContent(context, user, allowImages),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
          child: Text(
        'Error: $error',
        style: const TextStyle(color: Colors.white),
      )),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    UserModel? user,
    bool allowImages,
  ) {
    if (user == null) {
      return const Center(child: Text('No user data available'));
    }

    return ListView(
      children: [
        Stack(
          children: [
            allowImages
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Image.network(
                      //TODO add banner feature
                      'https://www.univates.br/radio/media/noticias_responsivo/31049/-1645810170.8855_1440_900.jpg',
                      height: 200,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox.shrink(),
            allowImages
                ? Positioned.fill(
                    child: Align(
                      alignment: const Alignment(0, 0.8),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: user.avatarUrl ??
                                "https://static.vecteezy.com/ti/vetor-gratis/p1/9292244-default-avatar-icon-vector-of-social-media-user-vetor.jpg",
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                user.name ?? 'User',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              // Row(///TODO create follow feature
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       '${user.followers} followers',
              //       style: TextStyle(color: Colors.white, fontSize: 12),
              //     ),
              //     SizedBox(
              //       width: 24,
              //     ),
              //     Text(
              //       '${user.following} followings',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 12,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserStatistic(
                    title: user.totalAlbums.length,
                    statisticName: 'Total albums',
                    textColor: VColors.secondary,
                  ),
                  UserStatistic(
                    title: user.totalAlbumsThisYear,
                    statisticName: 'Albums this year',
                    textColor: VColors.tertiary,
                  ),
                  UserStatistic(
                    title: user.lists,
                    statisticName: 'Lists',
                    textColor: VColors.secondary,
                  ),
                  UserStatistic(
                    title: user.reviews,
                    statisticName: 'Reviews',
                    textColor: VColors.tertiary,
                  ),
                ],
              ),
              if (user.totalAlbums.isNotEmpty) ...[
                const SizedBox(height: 24),
                const Text(
                  'Favorite albums',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...user.totalAlbums
                        .where((e) => e.isFavorite ?? false)
                        .take(4)
                        .map((e) => AlbumPreview(path: e.artworkUrl100 ?? '')),
                  ],
                ),
              ],
              const SizedBox(height: 32),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AlbumsPage.routeName);
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Added albums',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          user.totalAlbums.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: AlbumGrid(
                  albums: user.totalAlbums,
                  crossAxisCount: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
