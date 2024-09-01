import 'package:violin/models/search_result_model.dart';

class UserModel {
  String? name;
  int followers;
  int following;
  int totalAlbumsThisYear;
  int lists;
  int reviews;
  String? avatarUrl;
  List<Result> totalAlbums;

  UserModel({
    this.name,
    this.followers = 0,
    this.following = 0,
    this.totalAlbumsThisYear = 0,
    this.lists = 0,
    this.reviews = 0,
    this.totalAlbums = const [],
    this.avatarUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        followers = json['followers'],
        following = json['following'],
        totalAlbumsThisYear = json['totalAlbumsThisYear'],
        lists = json['lists'],
        reviews = json['reviews'],
        totalAlbums = (json['totalAlbums'] as List<dynamic>?)
                ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
                .toList() ??
            <Result>[];

  Map<String, dynamic> toJson() => {
        'name': name,
        'followers': followers,
        'following': following,
        'totalAlbumsThisYear': totalAlbumsThisYear,
        'lists': lists,
        'reviews': reviews,
        'totalAlbums': totalAlbums.map((e) => e.toJson()).toList(),
      };

  UserModel copyWith({
    String? name,
    int? followers,
    int? following,
    int? totalAlbumsThisYear,
    int? lists,
    int? reviews,
    List<Result>? totalAlbums,
  }) {
    return UserModel(
      name: name ?? this.name,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      totalAlbumsThisYear: totalAlbumsThisYear ?? this.totalAlbumsThisYear,
      lists: lists ?? this.lists,
      reviews: reviews ?? this.reviews,
      totalAlbums: totalAlbums ?? this.totalAlbums,
    );
  }
}
