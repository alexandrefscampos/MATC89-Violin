import 'package:violin/models/user_model.dart';
import 'package:violin/repositories/user_repository.dart';
import 'package:violin/repositories/user_repository_impl.dart';

class UserService {
  final UserRepository _repository;

  UserService({UserRepository? repository})
      : _repository = repository ?? UserRepositoryImpl();

  Future<void> saveUser(UserModel user) async {
    await _repository.saveUser(user);
  }

  Future<UserModel?> getUser() async {
    return await _repository.getUser();
  }

  Future<void> updateUser(UserModel updatedUser) async {
    await _repository.updateUser(updatedUser);
  }

  Future<void> deleteUser() async {
    await _repository.deleteUser();
  }
}
