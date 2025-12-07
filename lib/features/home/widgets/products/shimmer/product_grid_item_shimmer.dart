import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridItemShimmer extends StatelessWidget {
  const ProductGridItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerLow;
    final highlight = Theme.of(context).colorScheme.surfaceContainerHighest;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: base,
          highlightColor: highlight,
          child: Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: base,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),

        SizedBox(height: 10.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              baseColor: base,
              highlightColor: highlight,
              child: Container(
                width: randomWidth(50, 90).w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: base,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),

            Shimmer.fromColors(
              baseColor: base,
              highlightColor: highlight,
              child: Icon(Iconsax.heart, size: 24.sp, color: base),
            ),
          ],
        ),

        SizedBox(height: 6.h),

        Shimmer.fromColors(
          baseColor: base,
          highlightColor: highlight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: randomWidth(120, 160).w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: base,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                width: randomWidth(80, 140).w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: base,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
