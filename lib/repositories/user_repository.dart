import 'package:violin/models/user_model.dart';

abstract class UserRepository {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> updateUser(UserModel updatedUser);
  Future<void> deleteUser();
}
