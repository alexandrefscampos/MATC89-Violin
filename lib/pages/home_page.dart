import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/domain/user/user_controller.dart';
import 'package:violin/domain/user/user_model.dart';
import 'package:violin/mocks/albums_mock.dart';
import 'package:violin/pages/profile/profile_page.dart' as profile_page;
import 'package:violin/pages/search/search_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  var _actualIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userAsyncValue = ref.watch(userControllerProvider);

    return Scaffold(
      backgroundColor: VColors.primary,
      drawer: const Drawer(
        backgroundColor: VColors.primary,
        child: Column(children: []),
      ),
      appBar: AppBar(
        backgroundColor: VColors.primary,
        elevation: 0,
        actions: const [CircleAvatar()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _actualIndex,
        onTap: (value) => setState(() {
          _actualIndex = value;
        }),
        backgroundColor: VColors.primary,
        selectedItemColor: VColors.secondary,
        unselectedItemColor: VColors.white.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
        ],
      ),
      body: IndexedStack(
        index: _actualIndex,
        children: [
          HomeBody(userAsyncValue: userAsyncValue),
          const SearchPage(),
          const profile_page.ProfilePage(),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final AsyncValue<UserModel?> userAsyncValue;

  const HomeBody({super.key, required this.userAsyncValue});

  @override
  Widget build(BuildContext context) {
    return userAsyncValue.when(
      data: (user) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, ${user?.name ?? 'User'}!',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 1),
              const Text(
                'Review or track albums you\'ve watched...',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Popular this month',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: albumList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    child: Card(
                      child: Image.network(
                        albumList[index].path,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Your albums',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: user?.totalAlbums.length ?? 0,
                  itemBuilder: (BuildContext context, int index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Image.network(
                          user?.totalAlbums[index].artworkUrl100 ?? '',
                          fit: BoxFit.contain,
                          height: 92,
                          width: 92,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 92,
                        child: Text(
                          user?.totalAlbums[index].collectionName ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: VColors.secondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 92,
                        child: Text(
                          user?.totalAlbums[index].artistName ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: VColors.secondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
