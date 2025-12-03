import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListTileWidgetShimmer extends StatelessWidget {
  const CategoryListTileWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerLow;
    final highlight = Theme.of(context).colorScheme.surfaceContainerHighest;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: base,
            highlightColor: highlight,
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: base,
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
          ),
          SizedBox(width: 12.w),

          Shimmer.fromColors(
            baseColor: base,
            highlightColor: highlight,
            child: SizedBox(
              width: randomWidth(60, 120).w,
              height: 12.h,
              child: Container(
                decoration: BoxDecoration(
                  color: base,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
