import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StreamProvider<dynamic>((_) {
  return FirebaseAuth.instance.authStateChanges();
});

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String get currentUserId => _firebaseAuth.currentUser!.uid;

  Future<void> get signOut async => await _firebaseAuth.signOut();

  Future<bool> get userLoginState async {
    var loginState;
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      loginState = false;
    }
    if (user != null) {
      loginState = true;
    }
    return loginState;
  }

  Future<void> registerEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.currentUser!.updateEmail(email);
    await _firebaseAuth.currentUser!.updatePassword(password);
  }

  Future<void> createNewFirebaseUser({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<String> signUpAnonymously() async {
    var data = await _firebaseAuth.signInAnonymously();
    return data.user!.uid;
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> setDisplayName(String displayName) async {
    await _firebaseAuth.currentUser!.updateProfile(displayName: displayName);
  }
}
