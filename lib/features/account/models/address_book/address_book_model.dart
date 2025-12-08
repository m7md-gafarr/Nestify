class AddressBookModel {
  final String street;
  final String city;
  final String country;
  final DateTime createdAt;

  AddressBookModel({
    required this.street,
    required this.city,
    required this.country,

    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "street": street,
      "city": city,
      "country": country,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory AddressBookModel.fromMap(Map<String, dynamic> map) {
    return AddressBookModel(
      street: map['street'],
      city: map['city'],
      country: map['country'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
