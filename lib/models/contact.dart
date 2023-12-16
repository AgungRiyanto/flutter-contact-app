class Contact {
  final String id;
  final String name;
  final String email;
  final String gender;
  final String phone;
  final String avatar;

  Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.phone,
    required this.avatar,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }
}
