class FirestorePath {
  /// user/v1/users
  static const String userDomain = 'user/v1/users';

  /// user/v1/users/:uid
  static String userPath(String userId) => '$userDomain/$userId';

  /// user/v1/users/:uid/fcmToken
  static String fcmTokenPath(String userId) =>
      '${userPath(userId)}/fcm_token/fcm_token';
}
