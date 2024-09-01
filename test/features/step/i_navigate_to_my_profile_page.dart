import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:violin/app.dart';
import 'package:violin/controllers/user_controller.dart';
import 'package:violin/models/search_result_model.dart';
import 'package:violin/models/user_model.dart';
import 'package:violin/repositories/user_repository_impl.dart';
import 'package:violin/services/user_service.dart';

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpClientRequest extends Mock implements HttpClientRequest {}

class MockHttpClientResponse extends Mock implements HttpClientResponse {}

class MockHttpHeaders extends Mock implements HttpHeaders {}

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
}

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return MockHttpClient();
  }
}

void _registerFallbackValues() {
  registerFallbackValue(Uri());
  registerFallbackValue(UserModel());
}

Future<void> iNavigateToMyProfilePage(WidgetTester tester) async {
  _registerFallbackValues();
  HttpOverrides.global = TestHttpOverrides();

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

  final mockHttpClient = MockHttpClient();
  final mockHttpClientRequest = MockHttpClientRequest();
  final mockHttpClientResponse = MockHttpClientResponse();
  final mockHttpHeaders = MockHttpHeaders();

  when(() => mockHttpClient.getUrl(any()))
      .thenAnswer((_) async => mockHttpClientRequest);
  when(() => mockHttpClientRequest.headers).thenReturn(mockHttpHeaders);
  when(() => mockHttpClientRequest.close())
      .thenAnswer((_) async => mockHttpClientResponse);
  when(() => mockHttpClientResponse.statusCode).thenReturn(200);
  when(() => mockHttpClientResponse.contentLength).thenReturn(0);
  when(() => mockHttpClientResponse.listen(any(), onDone: any(named: 'onDone')))
      .thenAnswer((Invocation invocation) {
    final onData =
        invocation.positionalArguments[0] as void Function(List<int>);
    final onDone = invocation.namedArguments[#onDone] as void Function();
    onData(Uint8List(0));
    onDone();
    return const Stream<List<int>>.empty().listen((_) {});
  });

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
  await tester.pumpAndSettle();
}
