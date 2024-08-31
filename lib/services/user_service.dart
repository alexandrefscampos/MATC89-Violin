import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:violin/models/user_model.dart';
import 'package:violin/repositories/user_repository_impl.dart';

part 'user_service.g.dart';

class UserService {
  final UserRepositoryImpl repository;

  UserService({required this.repository});

  Future<void> saveUser(UserModel user) async {
    await repository.saveUser(user);
  }

  Future<UserModel?> getUser() async {
    return await repository.getUser();
  }

  Future<void> updateUser(UserModel updatedUser) async {
    await repository.updateUser(updatedUser);
  }

  Future<void> deleteUser() async {
    await repository.deleteUser();
  }
}

@riverpod
UserService userService(UserServiceRef ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UserService(repository: userRepository);
}
