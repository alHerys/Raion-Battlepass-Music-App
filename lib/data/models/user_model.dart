class UserModel {
  final String id;

  final String name;

  final String email;

  const UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  @override
  String toString() => 'id: $id, name: $name, email: $email';
}
