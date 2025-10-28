import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/features/home/widgets/category_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Living room'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for furniture",
                  prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
                ),
              ),
              SizedBox(height: 15.h),
              CustomSectionHeaderWidget(title: 'categories'),

              Column(
                children: List.generate(
                  15,
                  (index) => CategoryListTileWidget(
                    categoryName: 'Living Room',
                    imageAsset: Assets.assetsImagesPic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
