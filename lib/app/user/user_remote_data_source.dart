import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase/cloud_firestore/cloud_firestore_service.dart';
import '../firebase/cloud_firestore/firestore_path.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSource(
    ref.watch(cloudFirestoreServiceProvider),
  );
});

class UserRemoteDataSource {
  UserRemoteDataSource(this._cloudFirestoreService);
  final CloudFirestoreService _cloudFirestoreService;

  Future<void> setUser(
      {required String userId, required Map<String, dynamic> data}) async {
    await _cloudFirestoreService.setData(
        path: FirestorePath.userPath(userId), data: data);
  }
}
