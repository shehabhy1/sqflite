class User {
  int? id;
  String username;
  String password;

  User({this.id, required this.username, required this.password});
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }
  /* Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'username': username,
      'password': password,
    };
    if (id != null) {
      map['_id'] = id;
    }
    return map;
  } */

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'],
      username: map['username'],
      password: map['password'],
    );
  }
}
