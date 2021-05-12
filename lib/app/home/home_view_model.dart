import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_service.dart';

final homeViewModelProvider = Provider<HomeViewModel>((ref) {
  return HomeViewModel(
    ref.watch(authServiceProvider),
  );
});

class HomeViewModel {
  HomeViewModel(this._authService);

  final AuthService _authService;

  Future<void> logout() async {
    await _authService.logout();
  }
}
