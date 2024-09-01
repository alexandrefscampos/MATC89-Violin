import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:violin/models/search_result_model.dart';
import 'package:violin/models/user_model.dart';
import 'package:violin/services/user_service.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  late final UserService _userService;
  @override
  Future<UserModel?> build() async {
    _userService = ref.watch(userServiceProvider);

    return _initUser();
  }

  Future<UserModel?> _initUser() async {
    UserModel? user = await _userService.getUser();
    if (user == null) {
      user = UserModel(
        name: 'Alexandre Campos',
      );
      await saveUser(user);
    }
    return user;
  }

  Future<void> saveUser(UserModel user) async {
    await _userService.saveUser(user);
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

  Future<void> addAlbumRating(Result album, int rating, bool isFavorite) async {
    final currentUser = state.value;
    if (currentUser != null) {
      final existingAlbumIndex = currentUser.totalAlbums
          .indexWhere((e) => e.collectionId == album.collectionId);

      final newTotalAlbums = currentUser.totalAlbums;

      if (existingAlbumIndex != -1) {
        newTotalAlbums[existingAlbumIndex] =
            newTotalAlbums[existingAlbumIndex].copyWith(
          rating: rating,
          isFavorite: isFavorite,
        );
      } else {
        newTotalAlbums.add(album.copyWith(
          rating: rating,
          isFavorite: isFavorite,
        ));
      }

      final updatedUser = currentUser.copyWith(totalAlbums: newTotalAlbums);
      await saveUser(updatedUser);
    }
  }

  Future<void> addAlbumReview(Result album, String review) async {
    final currentUser = state.value;
    if (currentUser != null) {
      final newReviews = currentUser.totalAlbums
        ..firstWhere((e) => e.collectionId == album.collectionId)
            .reviews
            .add(review);

      final updatedUser = currentUser.copyWith(totalAlbums: newReviews);
      await saveUser(updatedUser);
    }
  }

  Future<void> deleteAlbumReview(Result album, String review) async {
    final currentUser = state.value;
    if (currentUser != null) {
      final newReviews = currentUser.totalAlbums
        ..firstWhere((e) => e.collectionId == album.collectionId)
            .reviews
            .remove(review);

      final updatedUser = currentUser.copyWith(totalAlbums: newReviews);
      await saveUser(updatedUser);
    }
  }

  bool allowImages() => true;
}
