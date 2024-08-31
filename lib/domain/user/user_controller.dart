import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:violin/domain/search/search_result_model.dart';
import 'package:violin/domain/user/user_model.dart';
import 'package:violin/domain/user/user_service.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  Future<UserModel?> build() async {
    return _initUser();
  }

  Future<UserModel?> _initUser() async {
    UserModel? user = await UserService.getUser();
    if (user == null) {
      user = UserModel(
        name: 'Alexandre Campos',
      );
      await saveUser(user);
    }
    return user;
  }

  Future<void> saveUser(UserModel user) async {
    await UserService.saveUser(user);
    state = AsyncValue.data(user);
  }

  Future<void> updateUser(UserModel updatedUser) async {
    await saveUser(updatedUser);
    state = AsyncValue.data(updatedUser);
  }

  Future<void> addAlbum(Result album) async {
    final currentUser = state.value;
    if (currentUser != null) {
      final map = <int?, Result>{};
      for (var e in currentUser.totalAlbums) {
        map[e.collectionId] = e;
      }
      map[album.collectionId] = album;

      final updatedUser =
          currentUser.copyWith(totalAlbums: map.values.toList());
      await saveUser(updatedUser);
    }
  }
}
