import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LocationTileWidgetShimmer extends StatelessWidget {
  const LocationTileWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerLow;
    final highlight = Theme.of(context).colorScheme.surfaceContainerHighest;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: base,
          highlightColor: highlight,
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: base,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: base,
                highlightColor: highlight,
                child: Container(
                  width: randomWidth(120, 180).w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: base,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Shimmer.fromColors(
                baseColor: base,
                highlightColor: highlight,
                child: Container(
                  width: randomWidth(180, 240).w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: base,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
