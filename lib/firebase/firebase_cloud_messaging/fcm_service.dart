import 'package:flutter_riverpod/flutter_riverpod.dart';

final fcmServiceProvider = Provider<FCMService>((ref) {
  return FCMService();
});

class FCMService {}
