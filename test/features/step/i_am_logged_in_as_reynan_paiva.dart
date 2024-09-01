import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:violin/app.dart';
import 'package:violin/controllers/search_controller.dart' as violin_search;
import 'package:violin/controllers/user_controller.dart';
import 'package:violin/models/search_result_model.dart';
import 'package:violin/models/user_model.dart';
import 'package:violin/repositories/search_repository_impl.dart';
import 'package:violin/repositories/user_repository_impl.dart';
import 'package:violin/services/search_service.dart';
import 'package:violin/services/user_service.dart';

class MockSearchRepository extends Mock implements SearchRepositoryImpl {}

class MockSearchService extends Mock implements SearchService {}

class MockSearchController extends AutoDisposeAsyncNotifier<SearchResultModel?>
    implements violin_search.SearchController {
  MockSearchController(this._searchService);
  final SearchService _searchService;

  @override
  Future<SearchResultModel?> build() async => null;

  @override
  Future<void> search(String query) async {
    state = const AsyncValue.loading();
    try {
      final results = await _searchService.search(query);
      state = AsyncValue.data(results);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

class MockUserRepository extends Mock implements UserRepositoryImpl {}

class MockUserService extends Mock implements UserService {}

class MockUserController extends AutoDisposeAsyncNotifier<UserModel?>
    implements UserController {
  MockUserController(this._user);

  final UserModel? _user;

  @override
  Future<UserModel?> build() async => _user;

  @override
  Future<void> addAlbum(Result album) async {}

  @override
  Future<void> saveUser(UserModel user) async {}

  @override
  Future<void> updateUser(UserModel updatedUser) async {}

  @override
  bool allowImages() => false;

  @override
  Future<void> addAlbumRating(
      Result album, int rating, bool isFavorite) async {}

  @override
  Future<void> addAlbumReview(Result album, String review) async {}

  @override
  Future<void> deleteAlbumReview(Result album, String review) async {}
}

Future<void> iAmLoggedInAsReynanPaiva(WidgetTester tester) async {
  final mockUserRepository = MockUserRepository();
  final mockUserService = MockUserService();
  final mockUser = UserModel(
    name: 'Reynan Paiva',
    totalAlbums: List.generate(10, (index) => Result()),
    totalAlbumsThisYear: 5,
    lists: 3,
    reviews: 2,
    avatarUrl: 'https://example.com/avatar.jpg',
  );

  when(() => mockUserRepository.getUser()).thenAnswer((_) async => mockUser);
  when(() => mockUserService.getUser()).thenAnswer((_) async => mockUser);

  final mockUserController = MockUserController(mockUser);

  final mockRepository = MockSearchRepository();
  final mockService = MockSearchService();

  final fakeAlbum = Result(
    collectionName: 'Thriller',
    artistName: 'Michael Jackson',
    artworkUrl100: 'https://example.com/teste.jpg',
  );

  final fakeSearchResult = SearchResultModel(
    resultCount: 1,
    results: [fakeAlbum],
  );

  when(() => mockRepository.search(any()))
      .thenAnswer((_) async => fakeSearchResult);
  when(() => mockService.search(any()))
      .thenAnswer((_) async => fakeSearchResult);

  final mockSearchController = MockSearchController(mockService);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        userRepositoryProvider.overrideWithValue(mockUserRepository),
        userServiceProvider.overrideWithValue(mockUserService),
        userControllerProvider.overrideWith(() => mockUserController),
        violin_search.searchControllerProvider
            .overrideWith(() => mockSearchController),
        searchRepositoryProvider.overrideWithValue(mockRepository),
        searchServiceProvider.overrideWithValue(mockService),
      ],
      child: const MyApp(),
    ),
  );
  await tester.pump();

  expect(find.text('Hello, Reynan Paiva!'), findsOneWidget);
}
