class PaymentDetails {
  final String method;
  final double amount;

  PaymentDetails({required this.method, required this.amount});

  Map<String, dynamic> toMap() {
    return {"method": method, "amount": amount};
  }

  factory PaymentDetails.fromMap(Map<String, dynamic> map) {
    return PaymentDetails(
      method: map['method'],
      amount: (map['amount'] ?? 0).toDouble(),
    );
  }
}
