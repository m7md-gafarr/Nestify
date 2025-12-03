import 'dart:math';

import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RoomCategoryCardWidgetShimmer extends StatelessWidget {
  RoomCategoryCardWidgetShimmer({super.key});

  final random = Random();

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerLow;
    final highlight = Theme.of(context).colorScheme.surfaceContainerHighest;

    return Card(
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          children: [
            SizedBox(width: 15.w),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  Shimmer.fromColors(
                    baseColor: base,
                    highlightColor: highlight,
                    child: Container(
                      width: randomWidth(80, 150).w,
                      height: 18.h,
                      decoration: BoxDecoration(
                        color: base,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Shimmer.fromColors(
              baseColor: base,
              highlightColor: highlight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
                child: Container(height: 100.h, width: 100.h, color: base),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
