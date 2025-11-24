class UserModel {
  final String userId;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String dateOfBirth;
  final String? profileImageUrl;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.dateOfBirth,
    this.profileImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "dateOfBirth": dateOfBirth,
      "profileImageUrl": profileImageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map["userId"] ?? "",
      fullName: map["fullName"] ?? "",
      email: map["email"] ?? "",
      phoneNumber: map["phoneNumber"] ?? "",
      address: map["address"] ?? "",
      dateOfBirth: map["dateOfBirth"] ?? "",
      profileImageUrl: map["profileImageUrl"] ?? "",
    );
  }

  UserModel copyWith({
    String? userId,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? address,
    String? dateOfBirth,
    String? profileImageUrl,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
