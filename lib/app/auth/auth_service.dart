import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proximity/app/firebase/firebase_auth/firebase_auth_service.dart';
import 'package:proximity/app/user/user_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(firebaseAuthServiceProvider),
    ref.watch(userServiceProvider),
  );
});

class AuthService {
  AuthService(
    this._firebaseAuthService,
    this._userService,
  );
  final FirebaseAuthService _firebaseAuthService;
  final UserService _userService;

  Future<void> signUp() async {
    final userId = await _firebaseAuthService.signUpAnonymously();
    await _userService.setUser(userId);
  }

  Future<void> logout() async {
    await _firebaseAuthService.signOut;
  }
}
