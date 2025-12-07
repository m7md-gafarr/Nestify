import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/features/home/view/dashboard/add_best_category_screen.dart';
import 'package:depi_graduation_project/features/home/view/dashboard/add_product_screen.dart';
import 'package:depi_graduation_project/features/home/view/dashboard/add_room_category_screen.dart';
import 'package:depi_graduation_project/features/home/view/dashboard/add_room_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSectionHeaderWidget(title: 'Admin Dashboard'),
              SizedBox(height: 25.h),

              Expanded(
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1.1,
                  ),
                  children: [
                    _DashboardCard(
                      icon: Iconsax.add_square,
                      label: "Add Products",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AddProductScreen()),
                        );
                      },
                    ),
                    _DashboardCard(
                      icon: Iconsax.add_square,
                      label: "Add Best Categories ",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddBestCategoryScreen(),
                          ),
                        );
                      },
                    ),
                    _DashboardCard(
                      icon: Iconsax.add_square,
                      label: "Add Rooms",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AddRoomScreen()),
                        );
                      },
                    ),
                    _DashboardCard(
                      icon: Iconsax.add_square,
                      label: "Add Room Categories",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddRoomCategoryScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 38.sp, color: Theme.of(context).primaryColor),
            SizedBox(height: 12.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
