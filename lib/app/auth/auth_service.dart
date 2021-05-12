import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proximity/app/firebase/firebase_cloud_messaging/fcm_service.dart';
import '../firebase/firebase_auth/firebase_auth_service.dart';
import '../user/user_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(fcmServiceProvider),
    ref.watch(firebaseAuthServiceProvider),
    ref.watch(userServiceProvider),
  );
});

class AuthService {
  AuthService(
    this._fcmService,
    this._firebaseAuthService,
    this._userService,
  );
  final FCMService _fcmService;
  final FirebaseAuthService _firebaseAuthService;
  final UserService _userService;

  Future<void> signUp() async {
    final userId = await _firebaseAuthService.signUpAnonymously();
    await _userService.setUser(userId);
    await _fcmService.requestPermission();
    final token = await _fcmService.fcmToken;
    await _fcmService.saveTokenToFirestore(userId);
  }

  Future<void> logout() async {
    await _firebaseAuthService.signOut;
  }
}
