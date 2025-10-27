import 'package:depi_graduation_project/components/custom_bottom_nav_bar.dart';
import 'package:depi_graduation_project/features/bag/view/bag_screen.dart';
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
      bottomNavigationBar: CustomBottomNavBar(
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Text("Nestify", style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height: 30.h),
          TextField(
            decoration: InputDecoration(
              hintText: "Search for furniture",
              prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
