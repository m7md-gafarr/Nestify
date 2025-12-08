import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  final int currentIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor:
          theme.bottomNavigationBarTheme.backgroundColor ?? colorScheme.surface,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: currentIndex == 0
                  ? theme.primaryColor
                  : colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                "N",
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: font,
                ),
              ),
            ),
          ),
          label: "",
        ),
        const BottomNavigationBarItem(icon: Icon(Iconsax.bag_2), label: ""),
        const BottomNavigationBarItem(icon: Icon(Iconsax.heart), label: ""),
        const BottomNavigationBarItem(icon: Icon(Iconsax.user), label: ""),
      ],
      selectedItemColor:
          theme.bottomNavigationBarTheme.selectedItemColor ??
          theme.primaryColor,
      unselectedItemColor:
          theme.bottomNavigationBarTheme.unselectedItemColor ??
          colorScheme.onSurface.withOpacity(.6),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
