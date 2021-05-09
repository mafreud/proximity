import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_service.dart';

final welcomeViewModelProvider = Provider<WelcomeViewModel>((ref) {
  return WelcomeViewModel(
    ref.watch(authServiceProvider),
  );
});

class WelcomeViewModel {
  WelcomeViewModel(this._authService);

  final AuthService _authService;

  Future<void> signUp() async {
    await _authService.signUp();
  }
}
