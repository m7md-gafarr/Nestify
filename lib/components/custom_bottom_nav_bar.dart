import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, this.currentIndex = 0, this.onTap});

  final int currentIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: currentIndex == 0
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).secondaryHeaderColor.withOpacity(.4),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                "N",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
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
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(
        context,
      ).secondaryHeaderColor.withOpacity(.4),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
