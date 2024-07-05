class UserModel {
  String? name;
  String? email;
  String? password;
  String? picture;
  String? role;
  String? description;
  String? city;

  List<String>? chats;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.picture,
    this.role,
    this.description,
    this.chats,
    this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String?,
      city: json['city'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      picture: json['picture'] as String?,
      role: json['role'] as String?,
      description: json['description'] as String?,
      chats:
          (json['chats'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'city': city,
        'password': password,
        'picture': picture,
        'role': role,
        'description': description,
        'chats': chats,
      };
}
