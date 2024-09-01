import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:violin/controllers/user_controller.dart';
import 'package:violin/models/search_result_model.dart';
import 'package:violin/models/user_model.dart';
import 'package:violin/repositories/user_repository_impl.dart';
import 'package:violin/services/user_service.dart';
import 'package:violin/widgets/profile/profile_page.dart';

class MockUserRepository extends Mock implements UserRepositoryImpl {}

class MockUserService extends Mock implements UserService {}

class MockUserController extends AutoDisposeAsyncNotifier<UserModel?>
    implements UserController {
  MockUserController(this._user);

  final UserModel? _user;

  @override
  Future<UserModel?> build() async {
    // In a real scenario, you might want to use ref here
    // For the mock, we'll just return the _user
    return _user;
  }

  @override
  Future<void> addAlbum(Result album) async {}

  @override
  Future<void> saveUser(UserModel user) async {}

  @override
  Future<void> updateUser(UserModel updatedUser) async {}
}

void _registerFallbackValues() {
  registerFallbackValue(Uri());
  registerFallbackValue(UserModel());
}

Future<void> iNavigateToMyProfilePage(WidgetTester tester) async {
  _registerFallbackValues();

  final mockUserRepository = MockUserRepository();
  final mockUserService = MockUserService();

  final mockUser = UserModel(
    name: 'Reynan Paiva',
    totalAlbums: List.generate(10, (index) => Result()),
    favoriteAlbums: List.generate(5, (index) => Result()),
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
      child: MaterialApp(
        home: const ProfilePage(),
        builder: (context, child) {
          return child!;
        },
      ),
    ),
  );

  // Mock CachedNetworkImage
  await tester.binding.setSurfaceSize(const Size(400, 800));
  const CachedNetworkImageProvider('').evict();

  await tester.pump();
  await tester.pumpAndSettle();
}
