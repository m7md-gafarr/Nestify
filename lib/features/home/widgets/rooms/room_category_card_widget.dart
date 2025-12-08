import 'package:depi_graduation_project/components/shimmer_network_image_widget.dart';
import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomCategoryCardWidget extends StatelessWidget {
  const RoomCategoryCardWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.categoryId,
  });

  final String title;
  final String imagePath;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouteNames.categoriesScreenRoute,
          arguments: [categoryId, title],
        );
      },
      child: Card(
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
                    Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(fontSize: 20.sp),
                    ),
                  ],
                ),
              ),

              ShimmerNetworkImage(
                imageUrl: imagePath,
                height: 100.h,
                width: 100.h,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(0),
                  bottomStart: Radius.circular(0),
                  topEnd: Radius.circular(12.r),
                  bottomEnd: Radius.circular(12.r),
                ),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
