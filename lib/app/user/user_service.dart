import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proximity/app/user/user_model.dart';
import 'package:proximity/app/user/user_repository.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(
    ref.watch(userRepositoryProvider),
  );
});

class UserService {
  UserService(this._userRepository);

  final UserRepository _userRepository;

  /// ユーザーデータをFirestoreに保存
  Future<void> setUser(String userId) async {
    final data = UserModel.initialData(userId);
    await _userRepository.setUser(userId: userId, data: data);
  }
}
