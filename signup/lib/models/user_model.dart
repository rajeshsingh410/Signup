class UserModel {
  final String signupType; // Google or Manual
  final String fullName;
  final String? username;
  final String? dob;
  final String? gender;
  final String? instagram;
  final String? youtube;
  final String? email;
  final String? profilePhoto;

  UserModel({
    required this.signupType,
    required this.fullName,
    this.username,
    this.dob,
    this.gender,
    this.instagram,
    this.youtube,
    this.email,
    this.profilePhoto,
  });
}

