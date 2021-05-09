import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_model.dart';
import 'user_remote_data_source.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(
    ref.watch(userRemoteDataSourceProvider),
  );
});

class UserRepository {
  UserRepository(this._userRemoteDataSource);
  final UserRemoteDataSource _userRemoteDataSource;

  Future<void> setUser({
    required String userId,
    required UserModel data,
  }) async {
    await _userRemoteDataSource.setUser(userId: userId, data: data.toMap());
  }
}
