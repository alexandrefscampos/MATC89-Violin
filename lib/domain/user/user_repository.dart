import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:violin/domain/user/user_model.dart';

abstract class UserRepository {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> updateUser(UserModel updatedUser);
  Future<void> deleteUser();
}

class UserRepositoryImpl implements UserRepository {
  static const String _userKey = 'current_user';

  @override
  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = json.encode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  @override
  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      final userMap = json.decode(userJson) as Map<String, dynamic>;
      return UserModel.fromJson(userMap);
    }
    return null;
  }

  @override
  Future<void> updateUser(UserModel updatedUser) async {
    await saveUser(updatedUser);
  }

  @override
  Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
