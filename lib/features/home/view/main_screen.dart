import 'package:depi_graduation_project/components/custom_bottom_nav_bar_widget.dart';
import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/features/bag/view/bag_screen.dart';
import 'package:depi_graduation_project/features/home/widgets/category_card_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/room_category_card_widget.dart';
import 'package:depi_graduation_project/features/saved%20items/view/saved_items_screen.dart';
import 'package:depi_graduation_project/features/account/view/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animations/animations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const BagScreen(),
    const SavedItemsScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder:
            (
              Widget child,
              Animation<double> primaryAnimation,
              Animation<double> secondaryAnimation,
            ) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: CustomBottomNavBarWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Nestify",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
              ),
            ),
          ),
          SizedBox(height: 15.h),

          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: CategoryCardWidget(
                      text: "best of\n2020",
                      imagePath: Assets.assetsImagesPic,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              6,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: RoomCategoryCardWidget(
                  title: "Living room",
                  imagePath: Assets.assetsImagesPic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
