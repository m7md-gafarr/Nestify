import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class noReviewsWidget extends StatelessWidget {
  const noReviewsWidget({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.rate_review, size: 48.sp),
        SizedBox(height: 10.h),
        Text("No reviews yet!", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 6.h),
        Text(
          "Be the first to write a review.",
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text("Add Your Review"),
        ),
      ],
    );
  }
}
