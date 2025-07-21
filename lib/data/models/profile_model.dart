class ProfileModel {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['data']['id'],
      name: json['data']['name'],
      email: json['data']['email'],
      photoUrl: json['data']['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

}
