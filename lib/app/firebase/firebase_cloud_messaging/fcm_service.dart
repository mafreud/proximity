import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proximity/app/auth/auth_service.dart';
import 'package:proximity/app/firebase/cloud_firestore/cloud_firestore_service.dart';
import 'package:proximity/app/firebase/cloud_firestore/firestore_path.dart';

final fcmServiceProvider = Provider<FCMService>((ref) {
  return FCMService(
      ref.watch(cloudFirestoreServiceProvider), ref.watch(authServiceProvider));
});

class FCMService {
  FCMService(this._cloudFirestoreService, this._authService);

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final CloudFirestoreService _cloudFirestoreService;
  final AuthService _authService;

  Future<void> requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<String?> get fcmToken async => await _messaging.getToken();

  // Future<void> saveTokenToFirestore() async {
  //   final token = fcmToken;
  //   await _cloudFirestoreService.setData(
  //       path: FirestorePath.fcmTokenPath(_authService.currentUserId),
  //       data: {'token': token});
  // }
}
