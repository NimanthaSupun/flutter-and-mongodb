class User {
  final String id;
  final String name;
  final String email;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  // convert to dart
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      age: json["age"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name":name,
      "email":email,
      "age":age,
    };
  }
}
