class ContactInfo {
  final String fullName;
  final String phone;
  final String email;

  ContactInfo({
    required this.fullName,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {"fullName": fullName, "phone": phone, "email": email};
  }

  factory ContactInfo.fromMap(Map<String, dynamic> map) {
    return ContactInfo(
      fullName: map['fullName'],
      phone: map['phone'],
      email: map['email'],
    );
  }
}
