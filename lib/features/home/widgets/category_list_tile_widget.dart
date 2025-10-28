import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListTileWidget extends StatelessWidget {
  final String categoryName;
  final String? imageAsset;

  const CategoryListTileWidget({
    super.key,
    required this.categoryName,
    this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouteNames.catalogScreenRoute);
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 20.h,
        leading: Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50.r),
            image: DecorationImage(
              image: AssetImage(imageAsset ?? Assets.assetsImagesPic),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          categoryName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
