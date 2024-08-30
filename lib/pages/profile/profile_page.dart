import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/core/widgets/album_preview.dart';
import 'package:violin/mocks/albums_mock.dart';
import 'package:violin/mocks/user_mock.dart';
import 'package:violin/pages/profile/widgets/user_statistics.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Image.network(
                //TODO add baner feature
                'https://www.univates.br/radio/media/noticias_responsivo/31049/-1645810170.8855_1440_900.jpg',
                height: 200,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment(0, 0.8),
                child: CircleAvatar(
                  radius: 50, //TODO  add profile pic
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                userMock.name ?? 'User',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              // Row(///TODO create follow feature
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       '${userMock.followers} followers',
              //       style: TextStyle(color: Colors.white, fontSize: 12),
              //     ),
              //     SizedBox(
              //       width: 24,
              //     ),
              //     Text(
              //       '${userMock.following} followings',
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
                    title: userMock.totalAlbums.length,
                    statisticName: 'Total albums',
                    textColor: VColors.secondary,
                  ),
                  UserStatistic(
                    title: userMock.totalAlbumsThisYear,
                    statisticName: 'Albums this year',
                    textColor: VColors.tertiary,
                  ),
                  UserStatistic(
                    title: userMock.lists,
                    statisticName: 'Lists',
                    textColor: VColors.secondary,
                  ),
                  UserStatistic(
                    title: userMock.reviews,
                    statisticName: 'Reviews',
                    textColor: VColors.tertiary,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'User favorite albums', //TODO create fav albums
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [...albumList.map((e) => AlbumPreview(path: e.path))],
              ),
              const SizedBox(height: 32),
              InkWell(
                onTap: () {
                  //TODO navigate to albums page
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Albums',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          userMock.totalAlbums.length.toString(),
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
