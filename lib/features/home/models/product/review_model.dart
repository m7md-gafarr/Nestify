import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/features/account/models/user_model.dart';

class ReviewModel {
  final UserModel user;
  final double rating;
  final String comment;
  final DateTime date;

  ReviewModel({
    required this.user,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      user: UserModel.fromMap(json['user']),
      rating: (json['rating'] ?? 0).toDouble(),
      comment: json['comment'] ?? "",
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user": user.toMap(),
      "rating": rating,
      "comment": comment,
      "date": date,
    };
  }
}
