class AppUser {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoURL;
  final String? role;
  final String? phonenumber;

  AppUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoURL,
    this.role,
    this.phonenumber,
  });

  // Для сохранения данных в Firestore
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'displayName': displayName,
        'photoURL': photoURL,
        'role': role,
        'phonenumber': phonenumber,
      };

  // Для загрузки данных из Firestore
  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
      photoURL: json['photoURL'],
      role: json['role'],
      phonenumber: json['phonenumber']);
}
