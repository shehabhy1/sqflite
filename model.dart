/* enum TaskCategory { work, meeting, family, me }

class UserModel {
  int? id;
  String username;
  String password;

  UserModel({
    this.id,
    required this.username,
    required this.password,
  });

  // Convert a UserModel into a Map. The keys must correspond to the column names in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  // Convert a Map into a UserModel.
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }
}
 */