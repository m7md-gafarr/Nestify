import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCardWidgetShimmer extends StatelessWidget {
  const CategoryCardWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Theme.of(context).colorScheme.surfaceContainerLow;
    final highlightColor = Theme.of(
      context,
    ).colorScheme.surfaceContainerHighest;

    return SizedBox(
      height: 88.w,
      width: 88.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: baseColor,
              ),
            ),
          ),

          Positioned(
            bottom: 8.h,
            left: 8.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: highlightColor,
                  highlightColor: baseColor,
                  child: Container(
                    height: 10.h,
                    width: randomWidth(50, 75).w,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Shimmer.fromColors(
                  baseColor: highlightColor,
                  highlightColor: baseColor,
                  child: Container(
                    height: 10.h,
                    width: randomWidth(30, 70).w,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
