class UserModel {
  final DateTime createdAt;
  final String id;
  final DateTime updatedAt;

  UserModel(
    this.createdAt,
    this.id,
    this.updatedAt,
  );

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt.millisecondsSinceEpoch,
      'id': id,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      map['id'],
      DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
    );
  }

  factory UserModel.initialData(String userId) {
    return UserModel(
      DateTime.now(),
      userId,
      DateTime.now(),
    );
  }
}
