import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proximity/app/auth/auth_service.dart';
import 'package:proximity/app/firebase/cloud_firestore/cloud_firestore_service.dart';
import 'package:proximity/app/firebase/cloud_firestore/firestore_path.dart';

final fcmServiceProvider = Provider<FCMService>((ref) {
  return FCMService(
    ref.watch(authServiceProvider),
    ref.watch(cloudFirestoreServiceProvider),
  );
});

class FCMService {
  FCMService(this._authService, this._cloudFirestoreService) {
    Future(() async {
      await Firebase.initializeApp();
    });
  }
  final AuthService _authService;
  final CloudFirestoreService _cloudFirestoreService;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Future<String?> get _fcmToken async => await _firebaseMessaging.getToken();

  Future<void> requestPermission() async {
    final settings = await _firebaseMessaging.requestPermission(
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

  Future<void> saveTokenToDatabase() async {
    final currentUserId = _authService.currentUserId;
    // final token = await _fcmToken;
    // await _cloudFirestoreService.setData(
    //     path: FirestorePath.fcmTokenPath(currentUserId),
    //     data: {'token': token});
  }
}
