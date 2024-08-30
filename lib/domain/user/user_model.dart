import 'package:violin/domain/search/search_result_model.dart';

class UserModel {
  String? name;
  int followers;
  int following;
  int totalAlbumsThisYear;
  int lists;
  int reviews;
  List<Results> favoriteAlbums;
  List<Results> totalAlbums;

  UserModel({
    this.name,
    this.followers = 0,
    this.following = 0,
    this.totalAlbumsThisYear = 0,
    this.lists = 0,
    this.reviews = 0,
    this.totalAlbums = const [],
    this.favoriteAlbums = const [],
  });
}
