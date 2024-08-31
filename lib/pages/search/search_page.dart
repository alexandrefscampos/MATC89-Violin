import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:violin/core/consts.dart';
import 'package:violin/data/search_repository_impl.dart';
import 'package:violin/domain/search/search_result_model.dart';
import 'package:violin/domain/search/search_service.dart';
import 'package:violin/domain/user/user_controller.dart';

final searchServiceProvider =
    Provider((ref) => SearchService(SearchRepositoryImpl()));

final searchResultsProvider = StateProvider<SearchResultModel?>((ref) => null);

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  var selectedFilter = 0;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(searchResultsProvider);

    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'What are you searching for?',
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () async {
                final searchService = ref.read(searchServiceProvider);
                final results = await searchService.search(controller.text);
                ref.read(searchResultsProvider.notifier).state = results;
              },
              child: const Text('Search'),
            ),
            if (searchResults != null)
              ...?searchResults.results?.map(
                (e) => GestureDetector(
                  onTap: () {
                    _showAddAlbum(e);
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.network(e.artworkUrl100 ?? ''),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.collectionName ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                e.artistName ?? '',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  _showAddAlbum(Results result) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('You want to add this album?'),
              TextButton(
                onPressed: () async {
                  final userController =
                      ref.read(userControllerProvider.notifier);
                  await userController.addAlbum(result);
                  if (mounted) Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final filtersList = ['Best results', 'Albums', 'Artists'];

class FilterChip extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const FilterChip({
    super.key,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(label),
        backgroundColor: color,
      ),
    );
  }
}
