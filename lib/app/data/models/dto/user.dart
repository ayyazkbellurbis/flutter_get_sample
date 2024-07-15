

class User {
  final String firstName;
  final String lastName;
  final String userName;
  final String schoolName;
  final String classValue;
  final String section;
  final String rollNo;
  final String gender;
  final String role;
  String token;
  String refreshToken;

  User({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.schoolName,
    required this.classValue,
    required this.section,
    required this.rollNo,
    required this.gender,
    required this.role,
    required this.token,
    required this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userName: json['userName'] ?? '',
      schoolName: json['schoolName'] ?? '',
      classValue: json['class'] ?? '',
      section: json['section'] ?? '',
      rollNo: json['rollNo'] ?? '',
      gender: json['gender'] ?? '',
      role: json['role'] ?? '',
      token: json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'schoolName': schoolName,
      'class': classValue,
      'section': section,
      'rollNo': rollNo,
      'gender': gender,
      'role': role,
      'token': token,
      'refreshToken': refreshToken,
    };
  }
}
