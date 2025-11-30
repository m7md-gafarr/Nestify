import 'package:depi_graduation_project/features/home/model/categories/best_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.list,
  });

  final String imagePath;
  final String text;
  final List<BestCategoryModel> list;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle category tap if needed
      },
      child: SizedBox(
        height: 88.w,
        width: 88.w,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 8.h,
              left: 8.w,
              child: SizedBox(
                width: 72.w,
                child: Text(
                  text,

                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
