class ReviewModel {
  final String username;
  final double rating;
  final String comment;
  final String date;

  ReviewModel({
    required this.username,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      username: json['username'] ?? "",
      rating: (json['rating'] ?? 0).toDouble(),
      comment: json['comment'] ?? "",
      date: json['date'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "rating": rating,
      "comment": comment,
      "date": date,
    };
  }
}
