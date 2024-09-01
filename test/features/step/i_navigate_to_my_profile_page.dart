import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:violin/app.dart';
import 'package:violin/controllers/user_controller.dart';
import 'package:violin/models/search_result_model.dart';
import 'package:violin/models/user_model.dart';
import 'package:violin/repositories/user_repository_impl.dart';
import 'package:violin/services/user_service.dart';
import 'package:violin/widgets/profile/profile_page.dart' as profile_page;

// class MockHttpClient extends Mock implements http.Client {}

// late MockHttpClient mockHttpClient;

// class MockHttpClient extends Mock implements HttpClient {}

// class MockHttpClientRequest extends Mock implements HttpClientRequest {}

// class MockHttpClientResponse extends Mock implements HttpClientResponse {}

// class MockHttpHeaders extends Mock implements HttpHeaders {}

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

Future<void> iNavigateToMyProfilePage(WidgetTester tester) async {
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

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        userRepositoryProvider.overrideWithValue(mockUserRepository),
        userServiceProvider.overrideWithValue(mockUserService),
        userControllerProvider.overrideWith(() => mockUserController),
      ],
      child: const MyApp(),
    ),
  );

  await tester.pump();

  expect(find.byType(profile_page.ProfilePage), findsNothing);

  await tester.tap(find.byIcon(Icons.people));

  await tester.pump();

  expect(find.byType(profile_page.ProfilePage), findsOneWidget);

  await tester.pump();
}
