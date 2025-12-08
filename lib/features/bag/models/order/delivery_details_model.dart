class DeliveryDetails {
  final String method;
  final String date;
  final String time;
  final String address;

  DeliveryDetails({
    required this.method,
    required this.date,
    required this.time,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {"method": method, "date": date, "time": time, "address": address};
  }

  factory DeliveryDetails.fromMap(Map<String, dynamic> map) {
    return DeliveryDetails(
      method: map['method'],
      date: map['date'],
      time: map['time'],
      address: map['address'],
    );
  }
}
