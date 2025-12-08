import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/features/home/models/product/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({super.key, required this.review, this.maxLines});
  final ReviewModel review;
  final int? maxLines;

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) {
      return "Just now";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago";
    } else if (diff.inDays == 1) {
      return "Yesterday";
    } else if (diff.inDays < 7) {
      return "${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago";
    } else if (diff.inDays < 30) {
      final weeks = diff.inDays ~/ 7;
      return "$weeks week${weeks == 1 ? '' : 's'} ago";
    } else if (diff.inDays < 365) {
      final months = diff.inDays ~/ 30;
      return "$months month${months == 1 ? '' : 's'} ago";
    } else {
      final years = diff.inDays ~/ 365;
      return "$years year${years == 1 ? '' : 's'} ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.w),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                maxRadius: 23.w,
                backgroundColor: Colors.grey.shade200,
                backgroundImage:
                    review.user.profileImageUrl != null &&
                        review.user.profileImageUrl!.isNotEmpty
                    ? NetworkImage(review.user.profileImageUrl!)
                    : AssetImage(Assets.assetsImagesSmiley) as ImageProvider,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5.w),
                  Row(
                    children: [
                      Text(
                        review.user.fullName,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        timeAgo(review.date),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "(${review.rating})",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(width: 5.w),
                      PannableRatingBar(
                        rate: review.rating,
                        items: List.generate(
                          5,
                          (index) => RatingWidget(
                            selectedColor: Color(0xffffcf4a),
                            unSelectedColor: Colors.grey,
                            child: Icon(Icons.star, size: 15.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              review.comment,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
