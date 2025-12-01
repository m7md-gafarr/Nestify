import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/features/home/models/product/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({super.key, required this.review});
  final ReviewModel review;

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
                backgroundImage: AssetImage(Assets.assetsImagesPic),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5.w),
                  Row(
                    children: [
                      Text(
                        review.username,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        review.date,
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
          Text(review.comment, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
