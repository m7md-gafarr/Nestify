import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/product_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Furniture'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            TextField(
              decoration: InputDecoration(
                hintText: "Search for furniture",
                prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Iconsax.sort),
                    label: const Text("Sort"),
                    style: Theme.of(context).outlinedButtonTheme.style
                        ?.copyWith(
                          fixedSize: WidgetStateProperty.all<Size>(
                            Size(150.w, 30.h),
                          ),
                        ),
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Iconsax.filter),
                    label: const Text("Filter"),
                    style: Theme.of(context).outlinedButtonTheme.style
                        ?.copyWith(
                          fixedSize: WidgetStateProperty.all<Size>(
                            Size(150.w, 30.h),
                          ),
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.w,
                ),
                itemBuilder: (_, index) => ProductGridItem(price: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
