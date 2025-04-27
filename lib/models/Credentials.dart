class Credentials {
  final String name;
  final String username;

  Credentials({
    required this.name,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
    };
  }

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      name: json['name'],
      username: json['username'],
    );
  }
}
