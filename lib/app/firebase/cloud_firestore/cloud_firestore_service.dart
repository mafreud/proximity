import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cloudFirestoreServiceProvider = Provider<CloudFirestoreService>((ref) {
  return CloudFirestoreService();
});

class CloudFirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    print('$path: $data');
    await reference.set(data, SetOptions(merge: merge));
  }

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firebaseFirestore.collection(path);
    print('$path: $data');
    await reference.add(data);
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.update(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _firebaseFirestore.doc(path);
    print('delete: $path');
    await reference.delete();
  }

  Query query(String path) {
    return _firebaseFirestore.collection(path);
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Object? data, String documentID) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Future<List<T>> collectionFuture<T>({
    required String path,
    required T Function(Object? data, String documentID) builder,
    Query Function(Query query)? queryBuilder,
  }) async {
    Query query = _firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final querySnapshot = await query.get();
    return querySnapshot.docs
        .map((snapshot) => builder(snapshot.data(), snapshot.id))
        .where((value) => value != null)
        .toList();
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Object? data, String documentID) builder,
  }) {
    final reference = _firebaseFirestore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Future<DocumentSnapshot> fetchDocumentSnapshot({
    required String path,
  }) {
    final reference = _firebaseFirestore.doc(path);
    return reference.get();
  }
}
